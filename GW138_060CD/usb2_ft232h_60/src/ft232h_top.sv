// FT232H 高速USB 物理接口：把 FT232H 的 FIFO 接口转换为用户侧 8bit 数据流
// 用户侧接口：rx（数据/有效/末字节）+ tx（数据/写/末字节/忙）
//260923    v1.0.0   初始版本
module ft232h_top (
    input               i_rst_n,        //复位，低有效
    input               i_ft_clk,       //FT232H时钟
    input               i_ft_rxf_n,     //FT232H数据有效，低有效
    input               i_ft_txe_n,     //FT232H可写，低有效
    output logic        o_ft_oe_n,      //FT232H输出使能，低有效
    output logic        o_ft_rd_n,      //FT232H读，低有效
    output logic        o_ft_wr_n,      //FT232H写，低有效
    output logic        o_ft_siwu_n,    //FT232H唤醒，低有效
    inout  [7:0]        io_ft_data,     //FT232H数据总线

    //用户侧接口
    output              o_usr_clk,      //用户侧时钟（= FT232H时钟）
    output logic [7:0]  o_usr_rx_data,  //接收数据
    output logic        o_usr_rx_valid, //接收数据有效
    output logic        o_usr_rx_last,  //接收末字节（一次传输的最后一个字节）
    input       [7:0]   i_usr_tx_data,  //发送数据
    input               i_usr_tx_wr,    //发送写使能
    input               i_usr_tx_last,  //发送末字节
    output logic        o_tx_busy       //发送忙（FIFO中还有数据）
);

/////////////////////////////////////////////////////////////////////////////////////////
////////////////////                 内部信号                /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
typedef enum logic [1:0] {
    IDLE,
    READ,
    WRITE
} state_ft_t;
state_ft_t state;

logic [12:0] buf_data_num; //FIFO数据个数
logic        buf_rd;       //FIFO读请求
logic        buf_empty;    //FIFO空
logic [7:0]  ft_data_out;  //FIFO读数据
logic        rx_valid;     //接收数据有效

assign io_ft_data  = (o_ft_oe_n == 1'b0) ? 8'hzz : ft_data_out;
assign o_ft_siwu_n = 1'b1; //FT232H唤醒信号，低有效，暂时不使用
assign buf_empty   = (buf_data_num == 'd0); //FIFO空
assign o_usr_clk   = i_ft_clk;
assign o_tx_busy   = !buf_empty;

/////////////////////////////////////////////////////////////////////////////////////////
////////////////////              fifo_sync FIFO例化         /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
fifo_sync #(
    .P_DEPTH       (4096          ),
    .P_READ_WIDTH  (8             ),
    .P_WRITE_WIDTH (8             ),
    .P_READ_DELAY  (0             )
)fifo_sync_m0(
    .i_sys_clk    (i_ft_clk     ),
    .i_rst_n      (i_rst_n      ),

    .i_read_req   (buf_rd       ),
    .o_read_data  (ft_data_out  ),

    .i_write_en   (i_usr_tx_wr  ),
    .i_write_data (i_usr_tx_data),

    .o_data_num   (buf_data_num )
);

/////////////////////////////////////////////////////////////////////////////////////////
////////////////////       接收：把 FT232H 读到的字节送用户侧           ///////////////////
/////////////////////////////////////////////////////////////////////////////////////////
always@(posedge i_ft_clk)begin
    if(!i_rst_n)begin
        rx_valid     <= 1'b0;
        o_usr_rx_data<= 8'd0;
    end else begin
        rx_valid <= 1'b0;
        if(state == READ)begin
            if(!i_ft_rxf_n && !o_ft_rd_n)begin
                o_usr_rx_data <= io_ft_data;   //捕获接收字节
                rx_valid      <= 1'b1;
            end else if(o_ft_rd_n)begin
                o_usr_rx_data <= io_ft_data;
            end
        end
    end
end

//接收末字节：rxf_n 拉高（一次传输结束）时输出一拍
always@(posedge i_ft_clk)begin
    if(!i_rst_n)begin
        o_usr_rx_last <= 1'b0;
    end else begin
        o_usr_rx_last <= (state == READ) && i_ft_rxf_n;
    end
end

assign o_usr_rx_valid = rx_valid;

/////////////////////////////////////////////////////////////////////////////////////////
////////////////////              USB收发时序状态机           /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
always@(posedge i_ft_clk)begin
    if(!i_rst_n)begin
        state     <= IDLE;
        buf_rd    <= 1'b0;
        o_ft_oe_n <= 1'b1;
        o_ft_rd_n <= 1'b1;
        o_ft_wr_n <= 1'b1;
    end else begin
        case(state)
            IDLE:begin
                if(!i_ft_rxf_n)begin //接收到数据时，rxf_n为低电平
                    o_ft_oe_n <= 1'b0; //接收数据时，oe_n为低允许接收
                    state     <= READ;
                end else if(!i_ft_txe_n && !buf_empty)begin //发送FIFO不空且可发送
                    buf_rd    <= 1'b1; //读FIFO
                    o_ft_wr_n <= 1'b0; //写使能，与FIFO首字对齐
                    state     <= WRITE;
                end else begin
                    buf_rd    <= 1'b0;
                    o_ft_oe_n <= 1'b1;
                    o_ft_rd_n <= 1'b1;
                    o_ft_wr_n <= 1'b1;
                    state     <= IDLE;
                end
            end

            READ:begin
                if(!i_ft_rxf_n && !o_ft_rd_n)begin
                    o_ft_rd_n <= 1'b1;
                end else if(o_ft_rd_n)begin
                    o_ft_rd_n <= 1'b0; //rd_n比oe_n慢一拍拉低
                end else begin
                    o_ft_oe_n <= 1'b1;
                    o_ft_rd_n <= 1'b1;
                    state     <= IDLE;
                end
            end

            WRITE:begin
                if(!i_ft_txe_n && !buf_empty && (buf_data_num > 13'd1))begin
                    o_ft_wr_n <= 1'b0; //写数据时，wr_n为低有效
                    state     <= WRITE;
                end else begin
                    o_ft_wr_n <= 1'b1; //最后一个字节写完后拉高，避免多余数据被写入
                    buf_rd    <= 1'b0;
                    state     <= IDLE;
                end
            end

            default:begin
                state <= IDLE;
            end
        endcase
    end
end

endmodule
