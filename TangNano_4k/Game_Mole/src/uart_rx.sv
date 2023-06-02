// 数据位 8 停止位 1 无奇偶校验
module uart_rx#(
	parameter CLK_FRE 	= 50,
	parameter UART_RATE = 115200
	) (
	input 				clk,    // 
	
	output 	 			recv_en,	
	output reg 	[ 7:0] 	recv_data = 0,	

	input 				rx_pin 
);

parameter  RATE_CNT = (CLK_FRE * 1000_000 / UART_RATE) - 1;
reg [25:0] clk_cnt;

enum {WAIT,START,RECV,STOP}STATE_RX;
reg [1:0] state;

assign recv_en = state == STOP && clk_cnt > 2;

reg [ 7:0] recv_data_r;
reg [ 2:0] recv_cnt;

reg [15:0] rx_pin_r;
always@(posedge clk) rx_pin_r <= {rx_pin_r[14:0],rx_pin};

always@(posedge clk)
	case(state)
		WAIT:
			if(rx_pin_r == 'd0)begin 
				recv_cnt <= 'd0;

				state <= START;
			end

		START:begin 
			if(clk_cnt == RATE_CNT / 2)begin 
				clk_cnt <= 0;
				state <= RECV;
			end
			else
				clk_cnt <= clk_cnt + 1;
		end

		RECV:begin 
			if(clk_cnt == RATE_CNT)begin 
				clk_cnt <= 0;
				recv_data_r[recv_cnt] <= rx_pin;
				recv_cnt <= recv_cnt + 1;
				state <= (recv_cnt == 7 )?STOP : RECV ;
			end
			else
				clk_cnt <= clk_cnt + 1;
		end

		STOP:begin 
			recv_data <= recv_data_r;

			if(clk_cnt == RATE_CNT * 3 / 2)begin 
				clk_cnt <= 0;
				state <= WAIT;
			end
			else 
				clk_cnt <= clk_cnt + 1;
		end
	endcase

endmodule