module game_ctrl (
	input 				clk,    // Clock
	input 				rst_n,  // Asynchronous reset active low
	
	input [7:0] 		rx_data,
	input 				rx_data_valid,

	output reg 	 		show = 1'b0,
	output reg [ 3:0] 	hand = 4'hf,
	output reg [ 1:0] 	score = 2'b0
);

enum {WAIT,SHOW}STATE;
reg [1:0] state;

//总状态控制
reg rx_data_valid_r;
always@(posedge clk) rx_data_valid_r <= rx_data_valid;
always@(posedge clk, negedge rst_n)
	if(!rst_n)
		state <= WAIT;
	else
		case (state)
			WAIT: //等待准备完成
				state <= ((hand[3:2] != 2'b11 && hand[1:0] != 2'b11) && rx_data == 8'h39)? SHOW : WAIT;

			SHOW: //等待复位
				state <= state;
		endcase


//猜拳选择
reg card_find_cnt = 0;
always@(posedge clk, negedge rst_n)
	if(!rst_n)begin
		show  <= 'd0;
		hand  <= 'hf;
		score <= 'd0;
	end
	else if(state == WAIT && rx_data_valid && !rx_data_valid_r)
		case(rx_data) // '0' 0X30
			8'h30: //左 剪刀
				hand[1:0] <= 0;
			8'h31: //左 石头
				hand[1:0] <= 1;
			8'h32: //左 布
				hand[1:0] <= 2;
			8'h33: //右 剪刀
				hand[3:2] <= 0;
			8'h34: //右 石头
				hand[3:2] <= 1;
			8'h35: //右 布
				hand[3:2] <= 2;

			8'h39:begin//展示结果
				show 	<= (hand[3:2] != 2'b11 && hand[1:0] != 2'b11);
				case (hand)
					4'b0101,4'b1010,4'b0000: score <= 2'b00;
					4'b0001,4'b0110,4'b1000: score <= 2'b10;
					4'b0100,4'b1001,4'b0010: score <= 2'b11;
					default: score <= 2'b00;
				endcase
			end
		endcase

endmodule