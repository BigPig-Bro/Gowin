// UART 回环测试工程（顶层），周期发送“你好GOWIN”并回显串口接收数据
//260909    v1.0.0   按Coder规范整理

module top (
    input        i_clk_27m,   //系统时钟 27MHz
    input        i_rst_n,     //系统复位，低有效

    input        i_uart_rx,   //UART接收
    output       o_uart_tx    //UART发送
);

localparam P_CLK_FRE     = 27_000_000;  //时钟频率 Hz，与uart_rx/uart_tx参数一致
localparam P_UART_RATE   = 115200;      //UART波特率
localparam P_SEND_1S_CNT = P_CLK_FRE;   //空闲1秒计数
localparam P_FIFO_DEPTH  = 8;           //回环FIFO深度
localparam P_FIFO_NUM_W  = $clog2(P_FIFO_DEPTH + 1);  //FIFO数据个数位宽

//发送字符串：2个中文字符(UTF8占3字节/个)+9个非中文字符(含\r\n)
localparam P_ENG_NUM  = 9;
localparam P_CHE_NUM  = 2;
localparam P_DATA_NUM = P_CHE_NUM * 3 + P_ENG_NUM;

wire [P_DATA_NUM * 8 - 1:0] char_data = {"你好  GOWIN", 16'h0d0a};  //周期发送内容

typedef enum logic [1:0] {TOP_IDLE, TOP_SEND, TOP_LOOP} STATE_TOP;
STATE_TOP state;

logic [31:0] wait_cnt;    //空闲等待计数
logic [ 7:0] send_cnt;    //周期发送字节计数
logic [ 7:0] send_data;   //待发送数据
logic        send_en;     //发送启动脉冲
logic        send_busy;   //发送忙标志
logic        send_busy_d; //发送忙打拍
logic        send_busy_rise;  //发送忙上升沿
logic [ 7:0] recv_data;   //接收数据
logic        recv_en;     //接收有效脉冲

//回环FIFO信号
logic [P_FIFO_NUM_W-1:0] fifo_num;      //FIFO内数据个数
logic [ 7:0]             fifo_rd_data;  //FIFO读数据
logic                    fifo_rd_req;   //FIFO读请求
logic                    fifo_empty;    //FIFO空

assign fifo_empty = (fifo_num == 0);

/********************************************************************************/
/**************************        send_busy上升沿      *************************/
/********************************************************************************/

always@(posedge i_clk_27m)begin
    if(!i_rst_n)begin
        send_busy_d <= 1'b0;
    end else begin
        send_busy_d <= send_busy;
    end
end

assign send_busy_rise = send_busy && !send_busy_d;

/********************************************************************************/
/**************************        发送/回环状态机      *************************/
/********************************************************************************/

always@(posedge i_clk_27m)begin
    if(!i_rst_n)begin
        wait_cnt    <= 32'd0;
        send_cnt    <= 8'd0;
        send_data   <= 8'd0;
        send_en     <= 1'b0;
        fifo_rd_req <= 1'b0;

        state       <= TOP_IDLE;
    end else begin
        case(state)
            TOP_IDLE:begin
                //FIFO有数据时优先回显
                if(!fifo_empty && !send_busy && !send_en)begin
                    send_data   <= fifo_rd_data;
                    send_en     <= 1'b1;
                    fifo_rd_req <= 1'b1;

                    state <= TOP_LOOP;
                end else begin
                    send_en     <= 1'b0;
                    fifo_rd_req <= 1'b0;

                    if(wait_cnt >= P_SEND_1S_CNT)begin
                        //空闲满1秒，周期发送一次问候
                        wait_cnt <= 32'd0;
                        send_cnt <= 8'd0;

                        state <= TOP_SEND;
                    end else begin
                        wait_cnt <= wait_cnt + 32'd1;
                    end
                end
            end

            TOP_SEND:begin
                fifo_rd_req <= 1'b0;

                if(send_cnt >= P_DATA_NUM)begin
                    send_en  <= 1'b0;
                    send_cnt <= 8'd0;

                    state <= TOP_IDLE;
                end else if(send_cnt == 8'd0 && !send_busy && !send_en)begin
                    //启动第一个字节
                    send_en   <= 1'b1;
                    send_data <= char_data[(P_DATA_NUM - 1) * 8 +: 8];
                    send_cnt  <= 8'd1;
                end else if(send_busy_rise)begin
                    //上一个字节已开始发送，准备下一个字节
                    send_data <= char_data[(P_DATA_NUM - 1 - send_cnt) * 8 +: 8];
                    send_cnt  <= send_cnt + 8'd1;
                end else begin
                    //保持使能，当前字节结束后自动连续发送下一字节
                    send_en <= 1'b1;
                end
            end

            TOP_LOOP:begin
                send_en     <= 1'b0;
                fifo_rd_req <= 1'b0;

                //回显字节发送完成后回到空闲
                if(!send_busy && !send_en)begin
                    state <= TOP_IDLE;
                end
            end

            default:begin
                wait_cnt    <= 32'd0;
                send_cnt    <= 8'd0;
                send_en     <= 1'b0;
                fifo_rd_req <= 1'b0;

                state       <= TOP_IDLE;
            end
        endcase
    end
end

/********************************************************************************/
/**************************        FIFO 例化           *************************/
/********************************************************************************/

fifo_sync #(
    .P_DEPTH       (P_FIFO_DEPTH  ),
    .P_READ_WIDTH  (8             ),
    .P_WRITE_WIDTH (8             ),
    .P_READ_DELAY  (0             )
)fifo_sync_m0(
    .i_sys_clk    (i_clk_27m   ),
    .i_rst_n      (i_rst_n     ),

    .i_read_req   (fifo_rd_req ),
    .o_read_data  (fifo_rd_data),

    .i_write_en   (recv_en     ),
    .i_write_data (recv_data   ),

    .o_data_num   (fifo_num    )
);

/********************************************************************************/
/**************************        UART 模块例化        *************************/
/********************************************************************************/

uart_tx #(
    .P_CLK_FRE   (P_CLK_FRE   ),
    .P_UART_RATE (P_UART_RATE )
)uart_tx_m0(
    .i_sys_clk   (i_clk_27m  ),
    .i_rst_n     (i_rst_n    ),

    .i_send_en   (send_en    ),
    .o_send_busy (send_busy  ),
    .i_send_data (send_data  ),

    .o_tx_pin    (o_uart_tx  )
);

uart_rx #(
    .P_CLK_FRE   (P_CLK_FRE   ),
    .P_UART_RATE (P_UART_RATE )
)uart_rx_m0(
    .i_sys_clk   (i_clk_27m  ),
    .i_rst_n     (i_rst_n    ),

    .o_recv_en   (recv_en    ),
    .o_recv_data (recv_data  ),

    .i_rx_pin    (i_uart_rx  )
);

endmodule
