// 标准同步FIFO：读写位宽可配（整数倍），读输出流水线可配
//260909    v1.0.0   初始版本

module fifo_sync #(
    parameter P_DEPTH       = 16,
    parameter P_READ_WIDTH  = 8,
    parameter P_WRITE_WIDTH = 8,
    parameter P_READ_DELAY  = 0,

    localparam P_RATIO     = (P_READ_WIDTH >= P_WRITE_WIDTH) ? (P_READ_WIDTH / P_WRITE_WIDTH) : (P_WRITE_WIDTH / P_READ_WIDTH),
    localparam P_ADDR_W    = (P_DEPTH > 1) ? $clog2(P_DEPTH) : 1,
    localparam P_CNT_W     = P_ADDR_W + 1,
    localparam P_SUB_W     = (P_RATIO > 1) ? $clog2(P_RATIO) : 1,
    localparam P_DATA_NUM_W = $clog2(P_DEPTH * P_RATIO + 1)
)(
    input                            i_sys_clk,    //系统时钟
    input                            i_rst_n,      //系统复位，低有效

    input                            i_read_req,   //读请求
    output logic [P_READ_WIDTH-1:0]  o_read_data,  //读数据

    input                            i_write_en,   //写使能
    input      [P_WRITE_WIDTH-1:0]   i_write_data, //写数据

    output logic [P_DATA_NUM_W-1:0]  o_data_num    //读端口数据个数
);

/********************************************************************************/
/**************************        内部信号        ******************************/
/********************************************************************************/

logic [P_WRITE_WIDTH-1:0] fifo_mem [0:P_DEPTH - 1];  //写位宽存储
logic [P_ADDR_W-1:0]      wr_ptr;                    //写指针
logic [P_ADDR_W-1:0]      rd_ptr;                    //读指针
logic [P_CNT_W-1:0]       wr_cnt;                    //已写入的写位宽字数
logic [P_SUB_W-1:0]       rd_sub;                    //读窄时的子字偏移

logic [P_DATA_NUM_W-1:0]  read_count;                //读端口可用数据个数
logic                     fifo_full;                 //FIFO满
logic                     wr_enable;                 //实际写使能
logic                     rd_enable;                 //实际读使能
logic                     rd_last;                   //读窄时当前写字最后一段
logic                     rd_dec_en;                 //读操作是否减少wr_cnt

logic [P_READ_WIDTH-1:0]  rd_data_fwft;              //FWFT读数据
logic [P_READ_WIDTH-1:0]  rd_data_pipe [0:2];        //读流水线寄存器

/********************************************************************************/
/**************************        指针辅助函数      ****************************/
/********************************************************************************/

function automatic [P_ADDR_W-1:0] ptr_next(input [P_ADDR_W-1:0] ptr);
begin
    if(ptr == P_DEPTH[P_ADDR_W-1:0] - 1)begin
        ptr_next = {P_ADDR_W{1'b0}};
    end else begin
        ptr_next = ptr + 1'b1;
    end
end
endfunction

function automatic [P_ADDR_W-1:0] ptr_add(input [P_ADDR_W-1:0] ptr, input integer offset);
begin
    if(ptr + offset >= P_DEPTH)begin
        ptr_add = ptr + offset - P_DEPTH;
    end else begin
        ptr_add = ptr + offset;
    end
end
endfunction

/********************************************************************************/
/**************************        读写计数与状态      **************************/
/********************************************************************************/

assign fifo_full  = (wr_cnt == P_DEPTH);
assign wr_enable  = i_write_en && !fifo_full;
assign rd_enable  = i_read_req && (read_count > 0);
assign rd_last    = (rd_sub == P_RATIO - 1);
assign rd_dec_en  = rd_enable && (P_READ_WIDTH > P_WRITE_WIDTH ? 1'b1 :
                                  P_READ_WIDTH == P_WRITE_WIDTH ? 1'b1 : rd_last);

//读端口数据个数：以读端口宽度为准
always@(*)begin
    if(P_READ_WIDTH > P_WRITE_WIDTH)begin
        read_count = wr_cnt / P_RATIO;
    end else if(P_READ_WIDTH == P_WRITE_WIDTH)begin
        read_count = wr_cnt;
    end else begin
        if(wr_cnt == 0)begin
            read_count = 'd0;
        end else begin
            read_count = (wr_cnt - 1) * P_RATIO + (P_RATIO - rd_sub);
        end
    end
end

assign o_data_num = read_count;

/********************************************************************************/
/**************************        读写指针更新        **************************/
/********************************************************************************/

always@(posedge i_sys_clk)begin
    if(!i_rst_n)begin
        wr_ptr <= {P_ADDR_W{1'b0}};
        rd_ptr <= {P_ADDR_W{1'b0}};
        rd_sub <= {P_SUB_W{1'b0}};
    end else begin
        if(wr_enable)begin
            wr_ptr <= ptr_next(wr_ptr);
        end

        if(rd_enable)begin
            if(P_READ_WIDTH > P_WRITE_WIDTH)begin
                rd_ptr <= ptr_add(rd_ptr, P_RATIO);
            end else if(P_READ_WIDTH == P_WRITE_WIDTH)begin
                rd_ptr <= ptr_next(rd_ptr);
            end else begin
                if(rd_last)begin
                    rd_ptr <= ptr_next(rd_ptr);
                    rd_sub <= {P_SUB_W{1'b0}};
                end else begin
                    rd_sub <= rd_sub + 1'b1;
                end
            end
        end
    end
end

/********************************************************************************/
/**************************        存储写入与字数更新    ************************/
/********************************************************************************/

always@(posedge i_sys_clk)begin
    if(!i_rst_n)begin
        wr_cnt <= {P_CNT_W{1'b0}};
    end else begin
        if(wr_enable && rd_dec_en)begin
            if(P_READ_WIDTH > P_WRITE_WIDTH)begin
                wr_cnt <= wr_cnt - P_RATIO + 1'b1;
            end else begin
                wr_cnt <= wr_cnt;
            end
        end else if(wr_enable)begin
            wr_cnt <= wr_cnt + 1'b1;
        end else if(rd_dec_en)begin
            if(P_READ_WIDTH > P_WRITE_WIDTH)begin
                wr_cnt <= wr_cnt - P_RATIO;
            end else begin
                wr_cnt <= wr_cnt - 1'b1;
            end
        end
    end
end

always@(posedge i_sys_clk)begin
    if(!i_rst_n)begin
        for(int i = 0; i < P_DEPTH; i++)begin
            fifo_mem[i] <= {P_WRITE_WIDTH{1'b0}};
        end
    end else if(wr_enable)begin
        fifo_mem[wr_ptr] <= i_write_data;
    end
end

/********************************************************************************/
/**************************        FWFT读数据          **************************/
/********************************************************************************/

always@(*)begin
    if(P_READ_WIDTH > P_WRITE_WIDTH)begin
        case(P_RATIO)
            2: rd_data_fwft = {fifo_mem[ptr_add(rd_ptr, 1)], fifo_mem[rd_ptr]};
            3: rd_data_fwft = {fifo_mem[ptr_add(rd_ptr, 2)],
                               fifo_mem[ptr_add(rd_ptr, 1)],
                               fifo_mem[rd_ptr]};
            4: rd_data_fwft = {fifo_mem[ptr_add(rd_ptr, 3)],
                               fifo_mem[ptr_add(rd_ptr, 2)],
                               fifo_mem[ptr_add(rd_ptr, 1)],
                               fifo_mem[rd_ptr]};
            default: rd_data_fwft = fifo_mem[rd_ptr];
        endcase
    end else if(P_READ_WIDTH == P_WRITE_WIDTH)begin
        rd_data_fwft = fifo_mem[rd_ptr];
    end else begin
        rd_data_fwft = fifo_mem[rd_ptr][rd_sub * P_READ_WIDTH +: P_READ_WIDTH];
    end
end

/********************************************************************************/
/**************************        读输出流水线        **************************/
/********************************************************************************/

always@(posedge i_sys_clk)begin
    if(!i_rst_n)begin
        rd_data_pipe[0] <= {P_READ_WIDTH{1'b0}};
        rd_data_pipe[1] <= {P_READ_WIDTH{1'b0}};
        rd_data_pipe[2] <= {P_READ_WIDTH{1'b0}};
    end else begin
        rd_data_pipe[0] <= rd_data_fwft;
        rd_data_pipe[1] <= rd_data_pipe[0];
        rd_data_pipe[2] <= rd_data_pipe[1];
    end
end

always@(*)begin
    case(P_READ_DELAY)
        0: o_read_data = rd_data_fwft;
        1: o_read_data = rd_data_pipe[0];
        2: o_read_data = rd_data_pipe[1];
        default: o_read_data = rd_data_pipe[2];
    endcase
end

endmodule
