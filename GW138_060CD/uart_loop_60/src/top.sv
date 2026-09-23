// UART 回环测试工程（顶层），周期发送“你好GOWIN”并回显串口接收数据
//260909    v1.0.0   按Coder规范整理

module top (
    input               i_clk_50m,   //系统时钟 50MHz
    input               i_rst_n,     //系统复位，低有效

    input               i_uart_rx,   //UART接收
    output              o_uart_tx    //UART发送
);

localparam P_CLK_FRE     = 50_000_000;  //时钟频率 Hz，与uart_rx/uart_tx参数一致
localparam P_UART_RATE   = 115200;      //UART波特率
localparam P_SEND_1S_CNT = P_CLK_FRE;   //空闲1秒计数
localparam P_FIFO_DEPTH  = 256;         //回环FIFO深度
localparam P_FIFO_NUM_W  = $clog2(P_FIFO_DEPTH + 1);  //FIFO数据个数位宽

//发送字符串：2个中文字符(UTF8占3字节/个)+9个非中文字符(含\r\n)
localparam P_ENG_NUM  = 9;
localparam P_CHE_NUM  = 2;
localparam P_DATA_NUM = P_CHE_NUM * 3 + P_ENG_NUM;
localparam [P_DATA_NUM * 8 - 1:0] P_CHAR_DATA = {"你好  GOWIN", 16'h0d0a};  //周期发送内容

typedef enum logic [1:0] {TOP_IDLE, TOP_SEND, TOP_LOOP} STATE_TOP;
STATE_TOP state;

logic [31:0] wait_cnt;     //空闲等待计数
logic [ 7:0] send_cnt;     //周期发送字节计数
logic [ 7:0] send_data;    //待发送数据
logic        send_en;      //发送使能（保持到uart_tx应答）
logic        send_busy;    //发送忙标志
logic        send_en_ack;  //发送使能应答（uart_tx收到使能时拉高1拍）
logic [ 7:0] recv_data;    //接收数据
logic        recv_valid;   //接收数据有效（uart_rx输出，仅1拍）
logic        sys_rst_n;    //系统复位，低有效

//回环FIFO信号
logic [P_FIFO_NUM_W - 1:0] fifo_num;      //FIFO内数据个数
logic [ 7:0]               fifo_rd_data;  //FIFO读数据
logic                      fifo_rd_req;   //FIFO读请求
logic                      fifo_empty;    //FIFO空

assign fifo_empty = (!fifo_num);

/********************************************************************************/
/**************************    时钟复位（i_clk_50m）    *************************/
/********************************************************************************/
boot_rst boot_rst_m0(
    .i_clk   (i_clk_50m     ),
    .i_rst_n (i_rst_n       ),
    .o_rst_n (sys_rst_n     )
);

/********************************************************************************/
/**************************        发送/回环状态机      *************************/
/********************************************************************************/

always@(posedge i_clk_50m)begin
    if(!sys_rst_n)begin
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

                    state       <= TOP_LOOP;
                end else begin
                    send_en     <= 1'b0;
                    fifo_rd_req <= 1'b0;

                    //空闲满1秒，周期发送一次问候
                    if(wait_cnt >= P_SEND_1S_CNT)begin
                        wait_cnt <= 32'd0;
                        send_cnt <= 8'd0;

                        state    <= TOP_SEND;
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

                    state    <= TOP_IDLE;
                end else if(send_cnt == 8'd0 && !send_busy && !send_en)begin
                    //启动第一个字节
                    send_en   <= 1'b1;
                    send_data <= P_CHAR_DATA[(P_DATA_NUM - 1) * 8 +: 8];
                    send_cnt  <= 8'd1;
                end else if(send_en_ack)begin
                    //本字节已被uart_tx接收，准备下一个字节
                    send_data <= P_CHAR_DATA[(P_DATA_NUM - 1 - send_cnt) * 8 +: 8];
                    send_cnt  <= send_cnt + 8'd1;
                end else begin
                    //保持使能，当前字节结束后自动连续发送下一字节
                    send_en   <= 1'b1;
                end
            end

            TOP_LOOP:begin
                fifo_rd_req <= 1'b0;

                //send_en保持到uart_tx应答（ack）为止：即使TX当时不在TX_WAIT
                //也不会丢字节；ack表示本字节已被接收，即可回IDLE，IDLE里的
                //!send_busy会挡住下一次发送，直到本字节发完
                if(send_en_ack)begin
                    state   <= TOP_IDLE;
                    send_en <= 1'b0;
                end else begin
                    send_en <= 1'b1;
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
    .P_DEPTH       (P_FIFO_DEPTH    ),
    .P_READ_WIDTH  (8               ),
    .P_WRITE_WIDTH (8               ),
    .P_READ_DELAY  (0               )
)fifo_sync_m0(
    .i_sys_clk     (i_clk_50m       ),
    .i_rst_n       (sys_rst_n       ),

    .i_read_req    (fifo_rd_req     ),
    .o_read_data   (fifo_rd_data    ),

    .i_write_en    (recv_valid      ),
    .i_write_data  (recv_data       ),

    .o_data_num    (fifo_num        )
);

/********************************************************************************/
/**************************        UART 模块例化        *************************/
/********************************************************************************/

uart_tx #(
    .P_CLK_FRE     (P_CLK_FRE       ),
    .P_UART_RATE   (P_UART_RATE     )
)uart_tx_m0(
    .i_sys_clk     (i_clk_50m       ),
    .i_rst_n       (sys_rst_n       ),

    .i_send_en     (send_en         ),
    .o_send_busy   (send_busy       ),
    .o_send_en_ack (send_en_ack     ),
    .i_send_data   (send_data       ),

    .o_tx_pin      (o_uart_tx       )
);

uart_rx #(
    .P_CLK_FRE         (P_CLK_FRE       ),
    .P_UART_RATE       (P_UART_RATE     )
)uart_rx_m0(
    .i_sys_clk         (i_clk_50m       ),
    .i_rst_n           (sys_rst_n       ),

    .o_recv_data_valid (recv_valid      ),
    .o_recv_data       (recv_data       ),

    .i_rx_pin          (i_uart_rx       )
);

endmodule
