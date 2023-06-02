module display (
	input 				clk,    // Clock
	
	input				hs_in,
	input				vs_in,
	input				de_in,
	input [11:0]		x_in,
	input [11:0]		y_in,

	input [ 3:0] 		mole_find,
	input [ 7:0] 		mole_score,
	input [ 1:0] 		game_state,
	input [11:0] 		left_time,

	output reg 			hs_out,
	output reg 			vs_out,
	output reg 			de_out,

	output reg [23:0]	data_out
);
//图片ROM的各个显示左上点
parameter SCORE_LOC_X = 450;//64 x 64 x 2
parameter SCORE_LOC_Y = 380;

parameter TIME_LOC_Y = 8 ; // 64 x 64 x 4
parameter TIME_LOC_X = 0 ;

parameter GAME_LOC_Y = 100 ; // 64 x 64 x 4
parameter GAME_LOC_X = 450 ;

parameter CARD_LOC_Y = 96; // 384 X 384 （每个显示100 X 100 实际64x64）
parameter CARD_LOC_X = 64;

//各个卡面具体位置
parameter CARD0_LOC_Y = GAME_LOC_Y;
parameter CARD0_LOC_X = CARD_LOC_X;

parameter CARD1_LOC_Y = GAME_LOC_Y;
parameter CARD1_LOC_X = CARD_LOC_X + 96;

parameter CARD2_LOC_Y = GAME_LOC_Y;
parameter CARD2_LOC_X = CARD_LOC_X + 96 * 2;

parameter CARD3_LOC_Y = GAME_LOC_Y + 96;
parameter CARD3_LOC_X = CARD_LOC_X;

parameter CARD4_LOC_Y = GAME_LOC_Y + 96;
parameter CARD4_LOC_X = CARD_LOC_X + 96;

parameter CARD5_LOC_Y = GAME_LOC_Y + 96;
parameter CARD5_LOC_X = CARD_LOC_X + 96 * 2;

parameter CARD6_LOC_Y = GAME_LOC_Y + 96 * 2;
parameter CARD6_LOC_X = CARD_LOC_X ;

parameter CARD7_LOC_Y = GAME_LOC_Y + 96 * 2;
parameter CARD7_LOC_X = CARD_LOC_X + 96;

parameter CARD8_LOC_Y = GAME_LOC_Y + 96 * 2;
parameter CARD8_LOC_X = CARD_LOC_X + 96 * 2;

//进度条位置
parameter BAR_X = 290;//64 x 300 1ms
parameter BAR_Y = 9;

//显示颜色定义
parameter COLOR_BACKGROUND 			= 24'H000000;
parameter COLOR_CARD_BACKGROUND 	= 24'H404040;
parameter COLOR_SCORE 				= 24'H777777;
parameter COLOR_TIME 				= 24'H777777;
parameter COLOR_GAME 				= 24'H777777;
parameter COLOR_BAR 				= 24'H007000;
parameter COLOR_BAR_LINE 			= 24'HFFFFFF;

//图片ROM寻址 节省空间 长宽放大显示
reg [11:0] rom_score_addr;
reg [11:0] rom_time_addr;
reg [11:0] rom_state_addr;
reg [11:0] rom_card_addr;
wire addr_x = x_in % 96 <= 32;
wire addr_y = y_in % 96 >= 32;

always@(posedge clk)
	//显示“剩余时间” 及其进度条 
	if (y_in >= TIME_LOC_Y &&  y_in < TIME_LOC_Y + 64) 
		if(x_in >= TIME_LOC_X && x_in < TIME_LOC_X + 256)
			rom_time_addr <= y_in[11:2] - TIME_LOC_Y / 4;
		else
			rom_time_addr <= 12'd0;
	//显示分数
	else if (x_in >= SCORE_LOC_X && x_in < SCORE_LOC_X + 64 && y_in >= SCORE_LOC_Y 		&& y_in < SCORE_LOC_Y + 32 )
		rom_score_addr <= y_in[11:1] - SCORE_LOC_Y / 2;
	//显示“游戏状态” 
	else if (x_in >= GAME_LOC_X && x_in < GAME_LOC_X + 64 && y_in >= GAME_LOC_Y 		&& y_in < GAME_LOC_Y + 64  && game_state == 0)
		rom_state_addr <= y_in[11:1] - GAME_LOC_Y / 2;
	else if (x_in >= GAME_LOC_X && x_in < GAME_LOC_X + 64 && y_in >= GAME_LOC_Y + 64 	&& y_in < GAME_LOC_Y + 128 && game_state == 1)
		rom_state_addr <= y_in[11:1] - GAME_LOC_Y / 2;
	else if (x_in >= GAME_LOC_X && x_in < GAME_LOC_X + 64 && y_in >= GAME_LOC_Y + 128	&& y_in < GAME_LOC_Y + 192 && game_state == 2)
		rom_state_addr <= y_in[11:1] - GAME_LOC_Y / 2;
	else if (x_in >= GAME_LOC_X && x_in < GAME_LOC_X + 64 && y_in >= GAME_LOC_Y + 192	&& y_in < GAME_LOC_Y + 256 && game_state == 3)
		rom_state_addr <= y_in[11:1] - GAME_LOC_Y / 2;
	//显示翻牌
	else if(y_in >= CARD_LOC_Y && y_in < CARD_LOC_Y + 384 && x_in >= CARD_LOC_X && x_in < CARD_LOC_X + 384)
		rom_card_addr <= {addr_y,y_in[4:1],addr_x,x_in[4:1]};
	else
		rom_card_addr  <= 12'd0;

//RGB数据显示 由于寻址时间 拆成流水线
always@(posedge clk)
	if (de_in_r) begin
		//绘制边框颜色
		if(x_in_r < 5 || x_in_r > 635 || y_in_r < 5 || y_in_r > 475)
			data_out <= 24'h555555;
		//显示“剩余时间” 及其进度条
		else if ((y_in_r >= TIME_LOC_Y &&  y_in_r < TIME_LOC_Y + 64) && (x_in_r >= TIME_LOC_X && x_in_r < TIME_LOC_X + 256))
			data_out <= rom_time_data[63 - (x_in_r - TIME_LOC_X) / 4]?COLOR_BACKGROUND : COLOR_TIME;
		else if (((x_in_r == BAR_X + 300 || x_in_r == BAR_X ) && (y_in_r >= TIME_LOC_Y &&  y_in_r < TIME_LOC_Y + 63)) || ((y_in_r == TIME_LOC_Y ||  y_in_r == TIME_LOC_Y + 63) && (x_in_r > BAR_X && x_in_r < BAR_X + 300)))
			data_out <= COLOR_BAR_LINE;
		else if ((x_in_r >= BAR_X && x_in_r < BAR_X + 300) && (y_in_r >= BAR_Y && y_in_r < BAR_Y + 62))
			data_out <= (( x_in_r - BAR_X) < left_time)? COLOR_BAR : COLOR_BACKGROUND;
		//显示“游戏状态”
		else if ((y_in_r >= GAME_LOC_Y &&  y_in_r < GAME_LOC_Y + 256) && (x_in_r >= GAME_LOC_X && x_in_r < GAME_LOC_X + 128))
			data_out <= rom_state_data[63 - (x_in_r - GAME_LOC_X) / 2]?COLOR_BACKGROUND : COLOR_GAME;
		//显示分数
		else if ((y_in_r >= SCORE_LOC_Y &&  y_in_r < SCORE_LOC_Y + 32) && (x_in_r >= SCORE_LOC_X + 32 && x_in_r < SCORE_LOC_X + 64))
			data_out <= rom_score_data[159 - (x_in_r - SCORE_LOC_X - 32) / 2 - mole_score % 10 * 16]?COLOR_BACKGROUND : COLOR_SCORE; // 个位
		else if ((y_in_r >= SCORE_LOC_Y &&  y_in_r < SCORE_LOC_Y + 32) && (x_in_r >= SCORE_LOC_X && x_in_r < SCORE_LOC_X + 32))
			data_out <= rom_score_data[159 - (x_in_r - SCORE_LOC_X     ) / 2 - mole_score / 10 * 16]?COLOR_BACKGROUND : COLOR_SCORE; // 十位
		//显示翻牌
		else if ((y_in_r >= CARD0_LOC_Y &&  y_in_r < CARD0_LOC_Y + 64) && (x_in_r >= CARD0_LOC_X && x_in_r < CARD0_LOC_X + 64))
			data_out <=  (game_state == 2 && mole_find == 'd0 )? card_data :  COLOR_CARD_BACKGROUND;
		else if ((y_in_r >= CARD1_LOC_Y &&  y_in_r < CARD1_LOC_Y + 64) && (x_in_r >= CARD1_LOC_X && x_in_r < CARD1_LOC_X + 64))
			data_out <=  (game_state == 2 && mole_find == 'd1 )? card_data :  COLOR_CARD_BACKGROUND;
		else if ((y_in_r >= CARD2_LOC_Y &&  y_in_r < CARD2_LOC_Y + 64) && (x_in_r >= CARD2_LOC_X && x_in_r < CARD2_LOC_X + 64))
			data_out <=  (game_state == 2 && mole_find == 'd2 )? card_data :  COLOR_CARD_BACKGROUND;
		else if ((y_in_r >= CARD3_LOC_Y &&  y_in_r < CARD3_LOC_Y + 64) && (x_in_r >= CARD3_LOC_X && x_in_r < CARD3_LOC_X + 64))
			data_out <=  (game_state == 2 && mole_find == 'd3 )? card_data :  COLOR_CARD_BACKGROUND;
		else if ((y_in_r >= CARD4_LOC_Y &&  y_in_r < CARD4_LOC_Y + 64) && (x_in_r >= CARD4_LOC_X && x_in_r < CARD4_LOC_X + 64))
			data_out <=  (game_state == 2 && mole_find == 'd4 )? card_data :  COLOR_CARD_BACKGROUND;
		else if ((y_in_r >= CARD5_LOC_Y &&  y_in_r < CARD5_LOC_Y + 64) && (x_in_r >= CARD5_LOC_X && x_in_r < CARD5_LOC_X + 64))
			data_out <=  (game_state == 2 && mole_find == 'd5 )? card_data :  COLOR_CARD_BACKGROUND;
		else if ((y_in_r >= CARD6_LOC_Y &&  y_in_r < CARD6_LOC_Y + 64) && (x_in_r >= CARD6_LOC_X && x_in_r < CARD6_LOC_X + 64))
			data_out <=  (game_state == 2 && mole_find == 'd6 )? card_data :  COLOR_CARD_BACKGROUND;
		else if ((y_in_r >= CARD7_LOC_Y &&  y_in_r < CARD7_LOC_Y + 64) && (x_in_r >= CARD7_LOC_X && x_in_r < CARD7_LOC_X + 64))
			data_out <=  (game_state == 2 && mole_find == 'd7 )? card_data :  COLOR_CARD_BACKGROUND;
		else if ((y_in_r >= CARD8_LOC_Y &&  y_in_r < CARD8_LOC_Y + 64) && (x_in_r >= CARD8_LOC_X && x_in_r < CARD8_LOC_X + 64))
			data_out <=  (game_state == 2 && mole_find == 'd8 )? card_data :  COLOR_CARD_BACKGROUND;
		else
			data_out <= COLOR_BACKGROUND;
	end
	else
		data_out <= 24'h000000; //非有效数据区域强制归零

//视频控制信号 延时同步
reg 		hs_in_r,vs_in_r,de_in_r;
reg [11:0]	x_in_r,y_in_r;
always@(posedge clk)begin
	x_in_r <= x_in;
	y_in_r <= y_in;

	de_in_r  <= de_in;
	hs_in_r	 <= hs_in;
	vs_in_r	 <= vs_in;

	de_out 	 <= de_in_r;
	hs_out 	 <= hs_in_r;
	vs_out 	 <= vs_in_r;
end


//按照随机表同步图片输出
//存储数据BGR
reg[23:0] card_data;
always@(*)
	for (int i = 0; i < 16; i++) 
		card_data <= {rom_card_data[3:0],rom_card_data[3:0],rom_card_data[7:4],rom_card_data[7:4],rom_card_data[11:8],rom_card_data[11:8]};

//使用到的ROM表
reg [63:0]	rom_time[15:0];
reg [63:0] 	rom_time_data;
initial $readmemh("time_test.c",rom_time);
always@(posedge clk) rom_time_data <= rom_time[rom_time_addr];
 
reg [63:0]	rom_state[127:0];
reg [63:0] 	rom_state_data;
initial $readmemh("state.c",rom_state);
always@(posedge clk) rom_state_data <= rom_state[rom_state_addr];

//翻牌ROM
reg [11:0] 	rom_card_data;
reg [11:0]	rom_card0[1023:0];
initial $readmemh("card0.c",rom_card0);
always@(posedge clk) rom_card_data <= rom_card0[rom_card_addr];

reg [159:0] rom_score_data;
reg [159:0]	rom_score[15:0];
initial $readmemh("score.c",rom_score);
always@(posedge clk) rom_score_data <= rom_score[rom_score_addr];

endmodule