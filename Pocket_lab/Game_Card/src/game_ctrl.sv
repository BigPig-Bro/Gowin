module game_ctrl (
	input clk,    // Clock
	input rst_n,  // Asynchronous reset active low
	
	input 		vs_in,
	input [7:0] rx_data,
	input 		rx_data_valid,

	output reg [ 4:0] card_show,
	output reg [ 3:0] card_select,
	output reg [ 1:0] state = WAIT,
	output reg [15:0] card_find,//找到的各个卡
	output reg [63:0] card_loc, //不同卡面位置
	output reg [11:0] left_time //剩余时间
);

//每个BCD代表其对应CARD
parameter INIT_CARD_LOC = 64'h0714_2061_4352_3657;

enum {WAIT,SHOW,GAME,END}STATE;

//剩余时间定时器
reg [3:0] clk_cnt;
always@(posedge vs_in)
	clk_cnt <= clk_cnt + 'd1;

always@(posedge clk_cnt[3]) 
	if(state == WAIT)
		left_time <= 12'd300;
	else if(state == GAME)
		left_time <= (left_time == 0)? 0 : left_time - 1;

//总状态控制
reg rx_data_valid_r;
always@(posedge clk) rx_data_valid_r <= rx_data_valid;
reg [31:0] clk_cnt_s;
always@(posedge clk, negedge rst_n)
	if(!rst_n)begin
		state <= WAIT;
	end
	else
		case (state)
			WAIT:begin //等待按键开始
				//位置随机初始化
				case (clk_cnt[2:0])
					0: card_loc <= INIT_CARD_LOC;
					1: card_loc <= {INIT_CARD_LOC[ 7:0],INIT_CARD_LOC[63: 8]};
					2: card_loc <= {INIT_CARD_LOC[15:0],INIT_CARD_LOC[63:16]};
					3: card_loc <= {INIT_CARD_LOC[23:0],INIT_CARD_LOC[63:24]};
					4: card_loc <= {INIT_CARD_LOC[31:0],INIT_CARD_LOC[63:32]};
					5: card_loc <= {INIT_CARD_LOC[39:0],INIT_CARD_LOC[63:40]};
					6: card_loc <= {INIT_CARD_LOC[47:0],INIT_CARD_LOC[63:48]};
					7: card_loc <= {INIT_CARD_LOC[55:0],INIT_CARD_LOC[63:56]};
				endcase
				clk_cnt_s <= 0;
				state <= (rx_data_valid && !rx_data_valid_r)? SHOW : WAIT;
			end

			SHOW://给5秒的记忆时间
				if (clk_cnt_s == 125_000_000) 
					state <= GAME; 
				else 
					clk_cnt_s <= clk_cnt_s + 1;

			GAME://游戏时间 直至时间结束 or 找到所有匹配牌
				if (left_time == 0 || card_find == 16'hffff)
					state <= END;

			END://等待复位
				state <= state;
		endcase


//卡面寻找控制
reg card_find_cnt = 0;
always@(posedge clk, negedge rst_n)
	if(!rst_n)begin
		card_find <= 'd0;
		card_show <= 'd0;
	end
	else if(state == GAME && rx_data_valid && !rx_data_valid_r)
		case(rx_data) // '0' 0X30
			8'h31: //上
				if(card_select > 3		) card_select  <= card_select - 4;
			8'h32: //下
				if(card_select < 12		) card_select  <= card_select + 4;
			8'h33: //左
				if(card_select[1:0] != 0) card_select  <= card_select - 1;
			8'h34: //右
				if(card_select[1:0] != 3) card_select  <= card_select + 1;
			8'h35:begin//打开选定牌
				card_find_cnt <= card_find_cnt + 1;

				if (card_find_cnt && card_select != card_show[ 3:0]) begin
					//选定另张卡
					if(card_loc[card_show[3:0] * 4 +: 4] == card_loc[card_select * 4 +: 4])begin 
						card_find[card_show[3:0]] 	= 1'b1;
						card_find[card_select] 		= 1'b1;
					end

					card_show <= 5'd0;
				end
				else begin 
					//选定一张卡
					card_show[ 4] 	<= 1;
					card_show[ 3:0] <= card_select;
				end
			end
		endcase

endmodule