// 数据位 8 停止位 1 无奇偶校验
module uart_rx#(
    parameter P_CLK_FRE     = 27_000_000,
    parameter P_UART_RATE   = 115200
) (
    input                 i_sys_clk,    //系统时钟
    input                 i_rst_n,     //系统复位
    
    output                o_recv_en,    
    output logic [ 7:0]   o_recv_data,    

    input                 i_rx_pin 
);

/*******************************  RX BUF  ****************************************/
logic  i_rx_pin_d0, i_rx_pin_d1;
always@(posedge i_sys_clk)begin
    if(!i_rst_n)begin
        i_rx_pin_d0 <= 1;
        i_rx_pin_d1 <= 1;
    end else begin
        i_rx_pin_d0 <= i_rx_pin;
        i_rx_pin_d1 <= i_rx_pin_d0;
    end
end

/*******************************  RX MAIN  ****************************************/
localparam P_RATE_CNT = (P_CLK_FRE / P_UART_RATE) - 1;

typedef enum logic [1:0] {RX_WAIT, RX_START, RX_RECV, RX_STOP} STATE_RX;
STATE_RX state;

logic [25:0] clk_cnt;
logic [ 7:0] recv_data_r;
logic [ 2:0] recv_cnt;

assign o_recv_en = (clk_cnt >= P_RATE_CNT * 3 / 2);

always@(posedge i_sys_clk)begin
    if(!i_rst_n)begin
        clk_cnt         <= 0;
        recv_data_r     <= 0;
        recv_cnt        <= 0;
        o_recv_data     <= 0;

        state           <= RX_WAIT;
    end else begin
        case(state)
            RX_WAIT:
                if(!i_rx_pin_d1)begin 
                    recv_cnt    <= 'd0;

                    state       <= RX_START;
                end

            RX_START:begin 
                if(clk_cnt >= P_RATE_CNT / 2)begin 
                    clk_cnt     <= 0;

                    state       <= RX_RECV;
                end else begin
                    clk_cnt     <= clk_cnt + 1;
                end
            end

            RX_RECV:begin 
                if(clk_cnt >= P_RATE_CNT)begin 
                    clk_cnt     <= 0;
                    recv_data_r[recv_cnt] <= i_rx_pin_d1;
                    recv_cnt   <= recv_cnt + 1;
    
                    state      <= (recv_cnt >= 7 )? RX_STOP : RX_RECV ;
                end else begin
                    clk_cnt     <= clk_cnt + 1;
                end
            end

            RX_STOP:begin 
                o_recv_data <= recv_data_r;

                if(clk_cnt >= P_RATE_CNT * 3 / 2)begin 
                    clk_cnt     <= 0;

                    state       <= RX_WAIT;
                end else begin 
                    clk_cnt     <= clk_cnt + 1;
                end
            end

            default:begin
                clk_cnt     <= 0;
                recv_data_r <= 0;
                recv_cnt    <= 0;
                o_recv_data <= 0;

                state       <= RX_WAIT;
            end
        endcase
    end
end

endmodule