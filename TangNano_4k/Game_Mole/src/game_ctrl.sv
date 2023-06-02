module game_ctrl#(
	parameter CLK_FRE = 27
) (
	input clk,    // Clock
	input rst_n,  // Asynchronous reset active low
	
	input 		vs_in,
	input [7:0] rx_data,
	input 		rx_data_en,

	output reg [ 1:0] state = WAIT,

	output reg [ 7:0] mole_score,//分数
	output reg [ 3:0] mole_find,//具体某个位置
	output reg [11:0] left_time //剩余时间
);
enum {WAIT,SHOW,GAME,END}STATE;

//剩余时间定时器
reg [3:0] clk_cnt;
always@(posedge vs_in)
	clk_cnt <= clk_cnt + 'd1;

always@(posedge clk_cnt[3]) 
	if(state == WAIT)
		left_time <= 12'd300;
	else if(state == GAME)
		left_time <= (left_time == 0)? 0 : left_time - 2;

//总状态控制
reg rx_data_en_r;
always@(posedge clk) rx_data_en_r <= rx_data_en;
reg [31:0] clk_cnt_s;
always@(posedge clk, negedge rst_n)
	if(!rst_n)begin
		state <= WAIT;
	end
	else
		case (state)
			WAIT:begin //等待按键开始
				state <= (rx_data_en && !rx_data_en_r)? SHOW : WAIT;
				clk_cnt_s <= 'd0;
			end

			SHOW://给1秒的准备时间
				if (clk_cnt_s == CLK_FRE * 1_000_000) 
					state <= GAME; 
				else 
					clk_cnt_s <= clk_cnt_s + 1;

			GAME://游戏时间 直至时间结束 or 找到所有匹配牌
				if (left_time == 0 || mole_left)
					state <= END;

			END://等待复位
				state <= state;
		endcase


//按键控制 分数控制 随机数控制
reg [3:0] radom_cnt;
always@(posedge clk) radom_cnt <= radom_cnt + 1;

reg mole_left = 0;
reg [31:0] wait_cnt = 0;
reg [31:0]	mole_speed = 0;
always@(posedge clk)begin
	if(!rst_n)begin
		mole_find <= 'd0;
		mole_score <= 'd0;
		mole_left <= 'd0;

		wait_cnt <= 'd0;
	end
	else if(state == WAIT && rx_data_en && !rx_data_en_r )
		case(rx_data[1:0])
			'd0: mole_speed <= CLK_FRE * 1000_000;
			'd1: mole_speed <= CLK_FRE *  800_000;
			'd2: mole_speed <= CLK_FRE *  600_000;
			'd3: mole_speed <= CLK_FRE *  400_000;
		endcase
	else if(state == GAME)
		if(rx_data[3:0]== mole_find  && rx_data_en && !rx_data_en_r )begin //0~8 即打到了地鼠
			mole_score <= mole_score + 1;
			wait_cnt <= 32'd0;
		end
		else if(wait_cnt == mole_speed) //没打到地鼠
			wait_cnt <= 32'd0;
		else
			wait_cnt <= wait_cnt + 1;
	else
		wait_cnt <= 'd0;

	//伪随机
	if(wait_cnt == 'd1) 
		mole_find <= radom_cnt % 9;
	else 			  
		mole_find <= mole_find;
end
endmodule