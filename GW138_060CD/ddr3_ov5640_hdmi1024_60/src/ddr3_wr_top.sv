//DDR3 读写桥：fifo_async 跨时钟域，连续突发P_BURST_LEN个P_MEM_WIDTH数据读写
//260916    v1.1.0   改为连续突发64个128bit数据，提高顺序读写效率
//260917    v1.2.0   FIFO深度按位宽比自动匹配；去掉i_ui_rst；位宽参数化，像素侧RGB565
module ddr3_wr_top #(
    parameter P_MEM_WIDTH  = 128,  //DDR3侧数据位宽
    parameter P_PIX_WIDTH  = 16,   //像素侧数据位宽（RGB565）
    parameter P_MEM_DEPTH  = 128,  //FIFO深度，以P_MEM_WIDTH字为单位
    parameter P_BURST_LEN  = 64,   //每次连续突发的P_MEM_WIDTH数据个数
    parameter P_ADDR_WIDTH = 29    //DDR3地址位宽
)(
    //写侧：像素时钟域
    input                            i_wr_clk,
    input                            i_wr_rst_n,
    input                            i_wr_hs,
    input                            i_wr_vs,
    input                            i_wr_de,
    input      [P_PIX_WIDTH-1:0]     i_wr_rgb,

    //DDR3 APP接口（ui_clk域）
    input                            i_ui_clk,
    input                            i_init_calib_complete,
    output logic [P_ADDR_WIDTH-1:0]  o_app_addr,
    output logic [2:0]               o_app_cmd,
    output logic                     o_app_en,
    output logic [P_MEM_WIDTH-1:0]   o_app_wdf_data,
    output logic                     o_app_wdf_end,
    output logic                     o_app_wdf_wren,
    input      [P_MEM_WIDTH-1:0]     i_app_rd_data,
    input                            i_app_rd_data_valid,
    input                            i_app_rdy,
    input                            i_app_wdf_rdy,

    //读侧：像素时钟域
    input                            i_rd_clk,
    input                            i_rd_rst_n,
    input                            i_rd_hs,
    input                            i_rd_vs,
    input                            i_rd_de,
    output logic                     o_rd_hs,
    output logic                     o_rd_vs,
    output logic                     o_rd_de,
    output logic [P_PIX_WIDTH-1:0]   o_rd_rgb
);

localparam CMD_WRITE     = 3'b000;
localparam CMD_READ      = 3'b001;
localparam WIDTH_RATIO   = P_MEM_WIDTH / P_PIX_WIDTH;   //读写位宽比
localparam ADDR_INC      = 8;                           //DDR3 BL8地址增量

//FIFO深度：以P_MEM_WIDTH字为单位定义，读写FIFO按位宽比自动换算，总容量一致
localparam WR_FIFO_DEPTH = P_MEM_DEPTH * WIDTH_RATIO;   //写FIFO深度（像素字）
localparam RD_FIFO_DEPTH = P_MEM_DEPTH;                 //读FIFO深度（MEM字）

//FIFO数据计数位宽，按各自深度自动计算
localparam WR_WNUM_W     = $clog2(WR_FIFO_DEPTH + 1);                 //写FIFO写端口计数位宽
localparam WR_RNUM_W     = $clog2(WR_FIFO_DEPTH / WIDTH_RATIO + 1);   //写FIFO读端口计数位宽
localparam RD_WNUM_W     = $clog2(RD_FIFO_DEPTH + 1);                 //读FIFO写端口计数位宽
localparam RD_RNUM_W     = $clog2(RD_FIFO_DEPTH * WIDTH_RATIO + 1);   //读FIFO读端口计数位宽

//突发计数位宽，按P_BURST_LEN自动计算
localparam BURST_CNT_W   = $clog2(P_BURST_LEN);

/********************************************************************************/
/**************************    写侧异步FIFO（像素→ui）  *************************/
/********************************************************************************/

logic [P_MEM_WIDTH-1:0]  wr_fifo_rdata;
logic                    wr_fifo_rd_en;
logic [WR_WNUM_W-1:0]    wr_fifo_wr_num;
logic [WR_RNUM_W-1:0]    wr_fifo_num;

//写FIFO复位：相机VS上升沿清空写FIFO，避免跨帧残留数据造成画面左右偏移
//（复位保持若干pclk，保证异步FIFO两侧指针都被清干净）
localparam [3:0] P_WR_FIFO_RST_CNT = 4'd8;

logic [3:0] wr_fifo_rst_cnt;
logic       wr_fifo_rst_n;
logic       wr_fifo_vs_d;

always@(posedge i_wr_clk)begin
    if(!i_wr_rst_n)begin
        wr_fifo_vs_d    <= 1'b0;
        wr_fifo_rst_cnt <= 4'd0;
        wr_fifo_rst_n   <= 1'b0;
    end else begin
        wr_fifo_vs_d <= i_wr_vs;

        if(i_wr_vs && (!wr_fifo_vs_d))begin
            wr_fifo_rst_cnt <= P_WR_FIFO_RST_CNT;
            wr_fifo_rst_n   <= 1'b0;
        end else if(wr_fifo_rst_cnt != 4'd0)begin
            wr_fifo_rst_cnt <= wr_fifo_rst_cnt - 4'd1;
            wr_fifo_rst_n   <= 1'b0;
        end else begin
            wr_fifo_rst_n   <= 1'b1;
        end
    end
end

fifo_async #(
    .P_WRITE_DEPTH (WR_FIFO_DEPTH ),
    .P_WRITE_WIDTH (P_PIX_WIDTH   ),
    .P_READ_WIDTH  (P_MEM_WIDTH   )
)u_wr_fifo(
    .i_rst_n       (wr_fifo_rst_n),

    .i_write_clk   (i_wr_clk   ),
    .i_write_en    (i_wr_de    ),
    .i_write_data  (i_wr_rgb   ),
    .o_write_num   (wr_fifo_wr_num),

    .i_read_clk    (i_ui_clk   ),
    .i_read_req    (wr_fifo_rd_en),
    .o_read_data   (wr_fifo_rdata),
    .o_data_num    (wr_fifo_num )
);

/********************************************************************************/
/**************************    读侧异步FIFO（ui→像素）  *************************/
/********************************************************************************/

logic [P_MEM_WIDTH-1:0]  rd_fifo_wdata;
logic                    rd_fifo_wr_en;
logic [RD_WNUM_W-1:0]    rd_fifo_wr_num;
logic [RD_RNUM_W-1:0]    rd_fifo_num;
logic [P_PIX_WIDTH-1:0]  rd_fifo_rdata;
logic                    rd_fifo_rden;

//读FIFO复位：读侧VS上升沿清空读FIFO，避免跨帧残留数据造成画面左右偏移
//（复位保持若干rd_clk，保证异步FIFO两侧指针都被清干净）
localparam [3:0] P_RD_FIFO_RST_CNT = 4'd8;

logic [3:0] rd_fifo_rst_cnt;
logic       rd_fifo_rst_n;
logic       rd_fifo_vs_d;

always@(posedge i_rd_clk)begin
    if(!i_rd_rst_n)begin
        rd_fifo_vs_d    <= 1'b0;
        rd_fifo_rst_cnt <= 4'd0;
        rd_fifo_rst_n   <= 1'b0;
    end else begin
        rd_fifo_vs_d <= i_rd_vs;

        if(i_rd_vs && (!rd_fifo_vs_d))begin
            rd_fifo_rst_cnt <= P_RD_FIFO_RST_CNT;
            rd_fifo_rst_n   <= 1'b0;
        end else if(rd_fifo_rst_cnt != 4'd0)begin
            rd_fifo_rst_cnt <= rd_fifo_rst_cnt - 4'd1;
            rd_fifo_rst_n   <= 1'b0;
        end else begin
            rd_fifo_rst_n   <= 1'b1;
        end
    end
end

fifo_async #(
    .P_WRITE_DEPTH (RD_FIFO_DEPTH ),
    .P_WRITE_WIDTH (P_MEM_WIDTH   ),
    .P_READ_WIDTH  (P_PIX_WIDTH   )
)u_rd_fifo(
    .i_rst_n       (rd_fifo_rst_n),

    .i_write_clk   (i_ui_clk   ),
    .i_write_en    (rd_fifo_wr_en),
    .i_write_data  (rd_fifo_wdata),
    .o_write_num   (rd_fifo_wr_num),

    .i_read_clk    (i_rd_clk   ),
    .i_read_req    (rd_fifo_rden),
    .o_read_data   (rd_fifo_rdata),
    .o_data_num    (rd_fifo_num )
);

/********************************************************************************/
/**************************    VS上升沿同步到ui_clk域  **************************/
/********************************************************************************/

logic wr_vs_d0, wr_vs_d1, wr_vs_rise;
logic rd_vs_d0, rd_vs_d1, rd_vs_rise;

always @(posedge i_ui_clk or negedge i_wr_rst_n) begin
    if (!i_wr_rst_n) begin
        wr_vs_d0 <= 1'b0;
        wr_vs_d1 <= 1'b0;
    end else begin
        wr_vs_d0 <= i_wr_vs;
        wr_vs_d1 <= wr_vs_d0;
    end
end

always @(posedge i_ui_clk or negedge i_rd_rst_n) begin
    if (!i_rd_rst_n) begin
        rd_vs_d0 <= 1'b0;
        rd_vs_d1 <= 1'b0;
    end else begin
        rd_vs_d0 <= i_rd_vs;
        rd_vs_d1 <= rd_vs_d0;
    end
end

assign wr_vs_rise = wr_vs_d1 && (!wr_vs_d0);
assign rd_vs_rise = rd_vs_d1 && (!rd_vs_d0);

/********************************************************************************/
/**************************    DDR3 写控制（ui_clk）  ***************************/
/********************************************************************************/

typedef enum logic [1:0] {WR_IDLE, WR_BURST} WR_STATE_t;
WR_STATE_t wr_state;

logic [P_ADDR_WIDTH-1:0] write_addr;
logic [BURST_CNT_W-1:0]  wr_burst_cnt;   //写突发计数

//写FIFO读使能：组合输出
//FIFO为FWFT，读使能当拍弹出、读数据下一拍更新；
//写数据寄存器与读使能同拍采样，故读使能必须组合产生，否则同一字会被读两次
assign wr_fifo_rd_en = (wr_state == WR_BURST) && i_app_rdy && i_app_wdf_rdy && (wr_fifo_num > 0);

always @(posedge i_ui_clk or negedge i_wr_rst_n) begin
    if (!i_wr_rst_n) begin
        wr_state     <= WR_IDLE;
        write_addr   <= 'd0;
        wr_burst_cnt <= 'd0;
    end else begin
        case (wr_state)
            WR_IDLE: begin
                if (i_init_calib_complete && (wr_fifo_num >= P_BURST_LEN)) begin
                    wr_burst_cnt <= 'd0;
                    wr_state     <= WR_BURST;
                end
            end

            WR_BURST: begin
                if (i_app_rdy && i_app_wdf_rdy && (wr_fifo_num > 0)) begin
                    write_addr <= write_addr + ADDR_INC;
                    if (wr_burst_cnt == P_BURST_LEN - 1) begin
                        wr_burst_cnt <= 'd0;
                        wr_state     <= WR_IDLE;
                    end else begin
                        wr_burst_cnt <= wr_burst_cnt + 1'b1;
                    end
                end
            end

            default: begin
                wr_state <= WR_IDLE;
            end
        endcase

        //写VS上升沿：写地址归零
        if (wr_vs_rise) begin
            write_addr <= 'd0;
        end
    end
end

//写数据输出
always @(posedge i_ui_clk or negedge i_wr_rst_n) begin
    if (!i_wr_rst_n) begin
        o_app_wdf_data <= 'd0;
        o_app_wdf_wren <= 1'b0;
        o_app_wdf_end  <= 1'b0;
    end else begin
        o_app_wdf_data <= wr_fifo_rdata;
        if (wr_state == WR_BURST && i_app_rdy && i_app_wdf_rdy && (wr_fifo_num > 0)) begin
            o_app_wdf_wren <= 1'b1;
            o_app_wdf_end  <= 1'b1;
        end else begin
            o_app_wdf_wren <= 1'b0;
            o_app_wdf_end  <= 1'b0;
        end
    end
end

/********************************************************************************/
/**************************    DDR3 读控制（ui_clk）  ***************************/
/********************************************************************************/

//读数据相对读命令有若干拍延迟，且突发期间数据会连续返回，
//因此发命令与收数据必须并行：RD_ISSUE 连发命令并同时收数据，RD_DRAIN 只收剩余数据
typedef enum logic [1:0] {RD_IDLE, RD_ISSUE, RD_DRAIN} RD_STATE_t;
RD_STATE_t rd_state;

logic [P_ADDR_WIDTH-1:0] read_addr;
logic [BURST_CNT_W-1:0]  rd_cmd_cnt;     //已发出的读命令数
logic [BURST_CNT_W-1:0]  rd_recv_cnt;    //已接收的读数据数
logic                    rd_busy;        //读突发进行中，用于数据接收使能

//读数据接收：突发进行中且数据有效时写入读FIFO
wire rd_cap_en = i_app_rd_data_valid && rd_busy;

always @(posedge i_ui_clk or negedge i_rd_rst_n) begin
    if (!i_rd_rst_n) begin
        rd_fifo_wr_en <= 1'b0;
        rd_fifo_wdata <= 'd0;
    end else begin
        rd_fifo_wr_en <= rd_cap_en;
        if (rd_cap_en) begin
            rd_fifo_wdata <= i_app_rd_data;
        end
    end
end

always @(posedge i_ui_clk or negedge i_rd_rst_n) begin
    if (!i_rd_rst_n) begin
        rd_state     <= RD_IDLE;
        read_addr    <= 'd0;
        rd_cmd_cnt   <= 'd0;
        rd_recv_cnt  <= 'd0;
        rd_busy      <= 1'b0;
    end else begin
        case (rd_state)
            RD_IDLE: begin
                rd_busy <= 1'b0;
                //读FIFO至少空出P_BURST_LEN个位置，且写不在突发时发起读
                if (i_init_calib_complete && ((RD_FIFO_DEPTH - rd_fifo_wr_num) >= P_BURST_LEN)
                    && i_app_rdy && (wr_state != WR_BURST)) begin
                    rd_cmd_cnt  <= 'd0;
                    rd_recv_cnt <= 'd0;
                    rd_busy     <= 1'b1;
                    rd_state    <= RD_ISSUE;
                end
            end

            RD_ISSUE: begin
                //连续发读命令，同时接收返回的数据
                if (i_app_rdy && (wr_state != WR_BURST)) begin
                    read_addr <= read_addr + ADDR_INC;
                    if (rd_cmd_cnt == P_BURST_LEN - 1) begin
                        rd_cmd_cnt <= 'd0;
                        rd_state   <= RD_DRAIN;
                    end else begin
                        rd_cmd_cnt <= rd_cmd_cnt + 1'b1;
                    end
                end

                if (rd_cap_en) begin
                    rd_recv_cnt <= rd_recv_cnt + 1'b1;
                end
            end

            RD_DRAIN: begin
                //只等剩余读数据返回
                if (rd_cap_en) begin
                    if (rd_recv_cnt == P_BURST_LEN - 1) begin
                        rd_recv_cnt <= 'd0;
                        rd_busy     <= 1'b0;
                        rd_state    <= RD_IDLE;
                    end else begin
                        rd_recv_cnt <= rd_recv_cnt + 1'b1;
                    end
                end
            end

            default: begin
                rd_busy  <= 1'b0;
                rd_state <= RD_IDLE;
            end
        endcase

        //读VS上升沿：读地址归零
        if (rd_vs_rise) begin
            read_addr <= 'd0;
        end
    end
end

/********************************************************************************/
/**************************    命令输出（写/读共用）  ***************************/
/********************************************************************************/

always @(posedge i_ui_clk or negedge i_wr_rst_n) begin
    if (!i_wr_rst_n) begin
        o_app_en   <= 1'b0;
        o_app_cmd  <= 3'd0;
        o_app_addr <= 'd0;
    end else begin
        o_app_en   <= 1'b0;
        if (wr_state == WR_BURST && i_app_rdy && i_app_wdf_rdy && (wr_fifo_num > 0)) begin
            o_app_en   <= 1'b1;
            o_app_cmd  <= CMD_WRITE;
            o_app_addr <= write_addr;
        end else if (rd_state == RD_ISSUE && i_app_rdy && (wr_state != WR_BURST)) begin
            o_app_en   <= 1'b1;
            o_app_cmd  <= CMD_READ;
            o_app_addr <= read_addr;
        end
    end
end

/********************************************************************************/
/**************************    读侧输出（像素时钟域）  **************************/
/********************************************************************************/

assign rd_fifo_rden = i_rd_de && (rd_fifo_num > 0);

always @(posedge i_rd_clk or negedge i_rd_rst_n) begin
    if (!i_rd_rst_n) begin
        o_rd_hs  <= 1'b0;
        o_rd_vs  <= 1'b0;
        o_rd_de  <= 1'b0;
        o_rd_rgb <= 'd0;
    end else begin
        o_rd_hs  <= i_rd_hs;
        o_rd_vs  <= i_rd_vs;
        o_rd_de  <= i_rd_de;
        if (rd_fifo_rden) begin
            o_rd_rgb <= rd_fifo_rdata;
        end
    end
end

/********************************************************************************/
endmodule
