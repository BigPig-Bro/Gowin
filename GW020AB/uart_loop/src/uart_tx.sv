// 数据位 8 停止位 1 无奇偶校验
module uart_tx#(
    parameter P_CLK_FRE  = 27_000_000,
    parameter P_UART_RATE = 115200
) (
    input             i_sys_clk,    //系统时钟
    input             i_rst_n,     //系统复位 
   
    input             i_send_en ,   
    output            o_send_busy ,   
    input      [ 7:0] i_send_data ,   

    output logic      o_tx_pin 
);
localparam P_RATE_CNT = (P_CLK_FRE / P_UART_RATE) - 1;

typedef enum logic [1:0] {TX_WAIT, TX_START, TX_SEND, TX_STOP}STATE_TX;
STATE_TX state;

logic [25:0] clk_cnt;
logic [ 7:0] send_data_r;
logic [ 2:0] send_cnt;

assign o_send_busy = state != TX_WAIT;

always@(posedge i_sys_clk)begin
    if(!i_rst_n)begin
        clk_cnt <= 0;
        send_data_r <= 0;
        send_cnt <= 0;
        o_tx_pin <= 1; // 默认高电平

        state <= TX_WAIT;
    end else begin
        case(state)
            TX_WAIT:
                if(i_send_en)begin 
                    send_data_r <= i_send_data;
                    send_cnt    <= 'd0;

                    state       <= TX_START;
                end

            TX_START:begin 
                o_tx_pin <= 0;

                if(clk_cnt >= P_RATE_CNT)begin 
                    clk_cnt     <= 0;

                    state   <= TX_SEND;
                end
                else
                    clk_cnt <= clk_cnt + 1;
            end

            TX_SEND:begin 
                o_tx_pin <= send_data_r[send_cnt];

                if(clk_cnt >= P_RATE_CNT)begin 
                    clk_cnt     <= 0;
                    send_cnt    <= send_cnt + 1;

                    state       <= (send_cnt >= 7 )?TX_STOP : TX_SEND ;
                end
                else
                    clk_cnt     <= clk_cnt + 1;
            end

            TX_STOP:begin 
                o_tx_pin        <= 1;

                if(clk_cnt >= P_RATE_CNT)begin 
                    clk_cnt     <= 0;
                    state       <= TX_WAIT;
                end
                else
                    clk_cnt     <= clk_cnt + 1;
            end

            default:begin
                clk_cnt     <= 0;
                send_data_r <= 0;
                send_cnt    <= 0;
                o_tx_pin    <= 1; // 默认高电平
                
                state       <= TX_WAIT;
            end
        endcase
    end
end

endmodule