module game_ctrl (
	input 					clk,    // Clock
	input 					rst_n,  // Asynchronous reset active low
	
	input 					vs_in,
	input [7:0] 			rx_data,
	input 					rx_data_valid,

	output reg [ 1:0] 		state 		= 'd3, 	
	output reg [11:0]		bird_loc_y	= 'd240,

	output reg [11:0] 		tube0_x		= 'd700,
	output reg [11:0] 		tube1_x		= 'd700,
	output reg [11:0] 		tube2_x		= 'd700,
	output reg [11:0] 		tube3_x		= 'd700,
	output reg [11:0] 		tube4_x		= 'd700,

	output reg [11:0] 		tube0_h		= 'd100,
	output reg [11:0] 		tube1_h		= 'd100,
	output reg [11:0] 		tube2_h		= 'd100,
	output reg [11:0] 		tube3_h		= 'd100,
	output reg [11:0] 		tube4_h		= 'd100
);

enum {START,END,GAME}STATE;

//伪随机计数器
reg	[	3:0] cnt;

//总状态控制
reg rx_data_valid_r;
always@(posedge clk) rx_data_valid_r <= rx_data_valid;
always@(posedge clk, negedge rst_n)
	if(!rst_n)
		state <= START;
	else
		case (state)
			START: //等待准备完成
				state <= (rx_data_valid && !rx_data_valid_r)? GAME : START;

			GAME:
				state <= (( (tube1_x < 128 + 56 + 32) && (bird_loc_y > tube1_h + 64 || bird_loc_y < tube1_h)) || bird_loc_y < 5 || bird_loc_y > 475)? END : GAME;

			END: //等待复位
				state <= state;
		endcase

//跳动选择
reg vs_in_r;
reg flash;
always@(posedge clk) vs_in_r <= vs_in;
always@(posedge clk, negedge rst_n)
	if(!rst_n)begin
		bird_loc_y <= 11'd240;
	end
	else if(state == GAME && rx_data_valid && !rx_data_valid_r)
		case(rx_data) // '0' 0X30
			8'h30:
				bird_loc_y <= bird_loc_y - 20;
		endcase
	else if(state == GAME && vs_in_r && !vs_in)begin
		flash <= ~flash;

		bird_loc_y <=  flash? bird_loc_y + 1 : bird_loc_y;
	end

//管子移动设置
parameter TUBE_H = 64'h1234_6586_7686_5324;
always@(posedge clk)
	if(state == GAME && vs_in_r && !vs_in)
		if(tube4_x >=  512)begin//128 * 4) 
			tube4_x <= tube4_x - 1;
			tube3_x <= tube3_x - 1;
			tube2_x <= tube2_x - 1;
			tube1_x <= tube1_x - 1;
			tube0_x <= tube0_x - 1;
		end
		else begin
			cnt <= cnt + 1;

			tube4_x <= 640;
			tube4_h <= 100 +(( cnt[3]? 7 - cnt : cnt )<< 4);

			tube3_x <= tube4_x;
			tube3_h <= tube4_h;

			tube2_x <= tube3_x;
			tube2_h <= tube3_h;

			tube1_x <= tube2_x;
			tube1_h <= tube2_h;

			tube0_x <= tube1_x;
			tube0_h <= tube1_h;
		end
	else if(state == START) begin
		cnt <= 'd1;
		tube0_h	<= 'd0;
		tube1_h	<= 'd0;
		tube2_h	<= 'd0;
		tube3_h	<= 'd0;
		tube4_h	<= 100;

		tube0_x	<= 'd1600;
		tube1_x	<= 'd1600;
		tube2_x	<= 'd1600;
		tube3_x	<= 'd1600;
		tube4_x	<= 'd700;
	end
		
endmodule