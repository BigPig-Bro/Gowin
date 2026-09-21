// 标准异步FIFO：读写位宽可配（整数倍），FWFT读输出，格雷码跨时钟域
//260916    v1.0.0   初始版本

module fifo_async #(
    parameter P_WRITE_DEPTH       = 16,
    parameter P_READ_WIDTH        = 8,
    parameter P_WRITE_WIDTH       = 8
)(
    input                            i_rst_n,       //异步复位，低有效

    input                            i_write_clk,   //写时钟
    input                            i_write_en,    //写使能
    input      [P_WRITE_WIDTH-1:0]   i_write_data,  //写数据
    output logic [$clog2(P_WRITE_DEPTH + 1) - 1 : 0] o_write_num, //写端口数据个数（写位宽字）

    input                            i_read_clk,    //读时钟
    input                            i_read_req,    //读请求
    output logic [P_READ_WIDTH-1:0]  o_read_data,   //读数据
    output logic [$clog2(P_WRITE_DEPTH * (P_READ_WIDTH >= P_WRITE_WIDTH ? P_READ_WIDTH / P_WRITE_WIDTH : P_WRITE_WIDTH / P_READ_WIDTH) + 1) - 1 : 0] o_data_num //读端口数据个数
);

//派生参数：由外部可调参数计算，外部不直接调用
localparam P_RATIO  = (P_READ_WIDTH >= P_WRITE_WIDTH) ? (P_READ_WIDTH / P_WRITE_WIDTH) : (P_WRITE_WIDTH / P_READ_WIDTH);
localparam P_ADDR_W = (P_WRITE_DEPTH > 1) ? $clog2(P_WRITE_DEPTH) : 1;
localparam P_CNT_W  = P_ADDR_W + 1;
localparam P_SUB_W  = (P_RATIO > 1) ? $clog2(P_RATIO) : 1;
localparam P_DATA_NUM_W = $clog2(P_WRITE_DEPTH * P_RATIO + 1);
localparam P_BANK_N     = (P_READ_WIDTH > P_WRITE_WIDTH) ? P_RATIO : 1;        //读宽>写宽时按比例交错分bank
localparam P_BANK_LO    = (P_BANK_N > 1) ? $clog2(P_BANK_N) : 0;               //bank选择占低位，高位作bank地址
localparam P_BANK_DEPTH = (P_WRITE_DEPTH + P_BANK_N - 1) / P_BANK_N;         //每bank深度（向上取整）
localparam P_RADDR_W    = P_ADDR_W - P_BANK_LO;                               //RAM地址位宽

/********************************************************************************/
/**************************        内部信号        ******************************/
/********************************************************************************/

logic [P_CNT_W-1:0]       wptr_bin;                  //写指针（写位宽字）
logic [P_CNT_W-1:0]       wptr_gray;                 //写指针格雷码
logic [P_CNT_W-1:0]       rptr_bin;                  //读指针（写位宽字）
logic [P_CNT_W-1:0]       rptr_gray;                 //读指针格雷码
logic [P_CNT_W-1:0]       wq1_rptr, wq2_rptr;        //读指针同步到写时钟域
logic [P_CNT_W-1:0]       rq1_wptr, rq2_wptr;        //写指针同步到读时钟域
logic [P_CNT_W-1:0]       wptr_bin_syn;              //写侧同步后的读指针（二进制）
logic [P_CNT_W-1:0]       rptr_bin_syn;              //读侧同步后的写指针（二进制）
logic [P_SUB_W-1:0]       rd_sub;                    //读窄时的子字偏移
logic [P_DATA_NUM_W-1:0]  read_count;                //读端口可用数据个数
logic                     fifo_full;                 //FIFO满
logic                     rd_enable;                 //实际读使能
logic [P_WRITE_WIDTH-1:0] ram_q [P_BANK_N];          //各bank同步读输出（寄存器）
logic [P_READ_WIDTH-1:0]  rd_data_fwft;              //FWFT读数据
logic [P_RADDR_W-1:0]     ram_raddr;                 //RAM读地址（读时预取下一地址）

/********************************************************************************/
/**************************        指针辅助函数      ****************************/
/********************************************************************************/

function automatic [P_ADDR_W-1:0] ptr_add(input [P_ADDR_W-1:0] ptr, input integer offset);
begin
    if(ptr + offset >= P_WRITE_DEPTH)begin
        ptr_add = ptr + offset - P_WRITE_DEPTH;
    end else begin
        ptr_add = ptr + offset;
    end
end
endfunction

function automatic [P_CNT_W-1:0] bin2gray(input [P_CNT_W-1:0] bin);
begin
    bin2gray = bin ^ (bin >> 1);
end
endfunction

function automatic [P_CNT_W-1:0] gray2bin(input [P_CNT_W-1:0] gray);
    integer i;
    reg [P_CNT_W-1:0] bin;
begin
    bin = gray;
    for(i = P_CNT_W - 2; i >= 0; i = i - 1)begin
        bin[i] = bin[i+1] ^ gray[i];
    end
    gray2bin = bin;
end
endfunction

/********************************************************************************/
/**************************        跨时钟域同步      ****************************/
/********************************************************************************/

always@(posedge i_write_clk or negedge i_rst_n)begin
    if(!i_rst_n)begin
        wq1_rptr <= {P_CNT_W{1'b0}};
        wq2_rptr <= {P_CNT_W{1'b0}};
    end else begin
        wq1_rptr <= rptr_gray;
        wq2_rptr <= wq1_rptr;
    end
end

always@(posedge i_read_clk or negedge i_rst_n)begin
    if(!i_rst_n)begin
        rq1_wptr <= {P_CNT_W{1'b0}};
        rq2_wptr <= {P_CNT_W{1'b0}};
    end else begin
        rq1_wptr <= wptr_gray;
        rq2_wptr <= rq1_wptr;
    end
end

assign wptr_bin_syn = gray2bin(wq2_rptr);
assign rptr_bin_syn = gray2bin(rq2_wptr);

/********************************************************************************/
/**************************        读写计数与状态      **************************/
/********************************************************************************/

wire [P_CNT_W-1:0] wr_cnt    = wptr_bin - wptr_bin_syn;   //写侧可用写位宽字数
wire [P_CNT_W-1:0] wr_cnt_syn = rptr_bin_syn - rptr_bin;  //读侧可用写位宽字数

assign fifo_full  = (wr_cnt == P_WRITE_DEPTH[P_CNT_W-1:0]);
assign o_write_num = wr_cnt;

//读端口数据个数：以读端口宽度为准
always@(*)begin
    if(P_READ_WIDTH > P_WRITE_WIDTH)begin
        read_count = wr_cnt_syn / P_RATIO;
    end else if(P_READ_WIDTH == P_WRITE_WIDTH)begin
        read_count = wr_cnt_syn;
    end else begin
        if(wr_cnt_syn == 0)begin
            read_count = 'd0;
        end else begin
            read_count = (wr_cnt_syn - 1) * P_RATIO + (P_RATIO - rd_sub);
        end
    end
end

assign o_data_num = read_count;
assign rd_enable  = i_read_req && (read_count > 0);

/********************************************************************************/
/**************************        写指针更新        ****************************/
/********************************************************************************/

always@(posedge i_write_clk or negedge i_rst_n)begin
    if(!i_rst_n)begin
        wptr_bin  <= {P_CNT_W{1'b0}};
        wptr_gray <= {P_CNT_W{1'b0}};
    end else if(i_write_en && !fifo_full)begin
        wptr_bin  <= wptr_bin + 1'b1;
        wptr_gray <= bin2gray(wptr_bin + 1'b1);
    end
end

/********************************************************************************/
/**************************        读指针更新        ****************************/
/********************************************************************************/

always@(posedge i_read_clk or negedge i_rst_n)begin
    if(!i_rst_n)begin
        rptr_bin  <= {P_CNT_W{1'b0}};
        rptr_gray <= {P_CNT_W{1'b0}};
        rd_sub    <= {P_SUB_W{1'b0}};
    end else if(rd_enable)begin
        if(P_READ_WIDTH > P_WRITE_WIDTH)begin
            rptr_bin  <= rptr_bin + P_RATIO;
            rptr_gray <= bin2gray(rptr_bin + P_RATIO);
        end else if(P_READ_WIDTH == P_WRITE_WIDTH)begin
            rptr_bin  <= rptr_bin + 1'b1;
            rptr_gray <= bin2gray(rptr_bin + 1'b1);
        end else begin
            if(rd_sub == P_RATIO - 1)begin
                rptr_bin  <= rptr_bin + 1'b1;
                rptr_gray <= bin2gray(rptr_bin + 1'b1);
                rd_sub    <= {P_SUB_W{1'b0}};
            end else begin
                rd_sub    <= rd_sub + 1'b1;
            end
        end
    end
end

/********************************************************************************/
/**************************        存储与FWFT读（BRAM友好）  ********************/
/********************************************************************************/
//多bank交错存储：写按写指针低位选bank、高位作bank地址；读每拍并行读各bank，组合成读位宽字。
//读数据为BRAM寄存器输出（同步读），FWFT由连续读+读指针提前一拍实现；存储不做复位清零。

generate
    for(genvar b = 0; b < P_BANK_N; b++) begin : gen_banks
        logic [P_WRITE_WIDTH-1:0] bank_mem [P_BANK_DEPTH];

        //写端口（同步单端口写）
        always@(posedge i_write_clk)begin
            if(i_write_en && !fifo_full)begin
                if(P_BANK_N > 1)begin
                    if(wptr_bin[P_BANK_LO-1:0] == b)begin
                        bank_mem[wptr_bin[P_ADDR_W-1:P_BANK_LO]] <= i_write_data;
                    end
                end else begin
                    bank_mem[wptr_bin[P_ADDR_W-1:0]] <= i_write_data;
                end
            end
        end

        //读端口（同步读，寄存器输出；发生读时把地址预取到下一字，
        //使 ram_q 始终对应当前读指针，避免FWFT输出滞后一个字）
        always@(posedge i_read_clk)begin
            ram_q[b] <= bank_mem[ram_raddr];
        end
    end
endgenerate

//RAM读地址预取：本拍有读操作时，下一拍地址前进1个字
generate
    if(P_READ_WIDTH >= P_WRITE_WIDTH) begin : gen_raddr_wide
        always@(*)begin
            ram_raddr = rptr_bin[P_ADDR_W-1:P_BANK_LO] + (rd_enable ? 1'b1 : 1'b0);
        end
    end else begin : gen_raddr_narrow
        always@(*)begin
            ram_raddr = rptr_bin[P_ADDR_W-1:P_BANK_LO] +
                        ((rd_enable && (rd_sub == P_RATIO - 1)) ? 1'b1 : 1'b0);
        end
    end
endgenerate

//FWFT读数据组装：宽读按bank顺序拼成读位宽字（bank0为最低字）
generate
    if(P_READ_WIDTH > P_WRITE_WIDTH) begin : gen_out_wide
        for(genvar i = 0; i < P_BANK_N; i++) begin : gen_asm
            assign rd_data_fwft[i * P_WRITE_WIDTH +: P_WRITE_WIDTH] = ram_q[i];
        end
    end else if(P_READ_WIDTH == P_WRITE_WIDTH) begin : gen_out_eq
        assign rd_data_fwft = ram_q[0];
    end else begin : gen_out_narrow
        assign rd_data_fwft = ram_q[0][rd_sub * P_READ_WIDTH +: P_READ_WIDTH];
    end
endgenerate

assign o_read_data = rd_data_fwft;

endmodule
