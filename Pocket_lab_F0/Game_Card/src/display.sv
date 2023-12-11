module display (
	input 				clk,    // Clock
	
	input				hs_in,
	input				vs_in,
	input				de_in,
	input [11:0]		x_in,
	input [11:0]		y_in,

	input [ 4:0] 	 	card_show,
	input [15:0] 		card_find,
	input [ 3:0] 		card_select,
	input [ 1:0] 		game_state,
	input [63:0] 		card_loc,
	input [11:0] 		left_time,

	output reg 			hs_out,
	output reg 			vs_out,
	output reg [11:0]	data_out
);
//图片ROM的各个显示左上点
parameter TIME_LOC_Y = 8 ; // 64 x 64 x 4
parameter TIME_LOC_X = 0 ;

parameter GAME_LOC_Y = 100 ; // 64 x 64 x 4
parameter GAME_LOC_X = 450 ;

parameter CARD_LOC_Y = 96; // 384 X 384 （每个显示100 X 100 实际64x64）
parameter CARD_LOC_X = 64;

`define CARD_BACK_IDLE {1'b0,x_in_r[2:0],1'b0,y_in_r[2:0],1'b0,y_in_r[2:0]}
`define CARD_BACK_SEL  {1'b1,x_in_r[2:0],1'b1,y_in_r[2:0],1'b1,y_in_r[2:0]}

//各个卡面具体位置
parameter CARD0_LOC_Y = GAME_LOC_Y;
parameter CARD0_LOC_X = CARD_LOC_X;

parameter CARD1_LOC_Y = GAME_LOC_Y;
parameter CARD1_LOC_X = CARD_LOC_X + 96;

parameter CARD2_LOC_Y = GAME_LOC_Y;
parameter CARD2_LOC_X = CARD_LOC_X + 96 * 2;

parameter CARD3_LOC_Y = GAME_LOC_Y;
parameter CARD3_LOC_X = CARD_LOC_X + 96 * 3;

parameter CARD4_LOC_Y = GAME_LOC_Y + 96;
parameter CARD4_LOC_X = CARD_LOC_X;

parameter CARD5_LOC_Y = GAME_LOC_Y + 96;
parameter CARD5_LOC_X = CARD_LOC_X + 96;

parameter CARD6_LOC_Y = GAME_LOC_Y + 96;
parameter CARD6_LOC_X = CARD_LOC_X + 96 * 2;

parameter CARD7_LOC_Y = GAME_LOC_Y + 96;
parameter CARD7_LOC_X = CARD_LOC_X + 96 * 3;

parameter CARD8_LOC_Y = GAME_LOC_Y + 96 * 2;
parameter CARD8_LOC_X = CARD_LOC_X;

parameter CARD9_LOC_Y = GAME_LOC_Y + 96 * 2;
parameter CARD9_LOC_X = CARD_LOC_X + 96;

parameter CARD10_LOC_Y = GAME_LOC_Y + 96 * 2;
parameter CARD10_LOC_X = CARD_LOC_X + 96 * 2;

parameter CARD11_LOC_Y = GAME_LOC_Y + 96 * 2;
parameter CARD11_LOC_X = CARD_LOC_X + 96 * 3;

parameter CARD12_LOC_Y = GAME_LOC_Y + 96 * 3;
parameter CARD12_LOC_X = CARD_LOC_X;

parameter CARD13_LOC_Y = GAME_LOC_Y + 96 * 3;
parameter CARD13_LOC_X = CARD_LOC_X + 96;

parameter CARD14_LOC_Y = GAME_LOC_Y + 96 * 3;
parameter CARD14_LOC_X = CARD_LOC_X + 96 * 2;

parameter CARD15_LOC_Y = GAME_LOC_Y + 96 * 3;
parameter CARD15_LOC_X = CARD_LOC_X + 96 * 3;

//进度条位置
parameter BAR_X = 290;//64 x 300 1ms
parameter BAR_Y = 9;

//显示颜色定义
parameter COLOR_BACKGROUND 	= 12'H000;
parameter COLOR_TIME 		= 12'H777;
parameter COLOR_GAME 		= 12'H777;
parameter COLOR_BAR 		= 12'H070;
parameter COLOR_BAR_LINE 	= 12'HFFF;
parameter COLOR_SELECT 		= 12'H888;

//图片ROM寻址 节省空间 长宽放大显示
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
			data_out <= 12'h555;
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
		//显示翻牌
		else if ((y_in_r >= CARD0_LOC_Y &&  y_in_r < CARD0_LOC_Y + 64) && (x_in_r >= CARD0_LOC_X && x_in_r < CARD0_LOC_X + 64))
			data_out <=  (game_state == 1 || card_find[0] || (card_show[4] && card_show[3:0] == 0))? card_data[ 0] :(card_select == 0)?`CARD_BACK_SEL : `CARD_BACK_IDLE;
		else if ((y_in_r >= CARD1_LOC_Y &&  y_in_r < CARD1_LOC_Y + 64) && (x_in_r >= CARD1_LOC_X && x_in_r < CARD1_LOC_X + 64))
			data_out <=  (game_state == 1 || card_find[1] || (card_show[4] && card_show[3:0] == 1))? card_data[ 1] :(card_select == 1)?`CARD_BACK_SEL : `CARD_BACK_IDLE;
		else if ((y_in_r >= CARD2_LOC_Y &&  y_in_r < CARD2_LOC_Y + 64) && (x_in_r >= CARD2_LOC_X && x_in_r < CARD2_LOC_X + 64))
			data_out <=  (game_state == 1 || card_find[2] || (card_show[4] && card_show[3:0] == 2))? card_data[ 2] :(card_select == 2)?`CARD_BACK_SEL : `CARD_BACK_IDLE;
		else if ((y_in_r >= CARD3_LOC_Y &&  y_in_r < CARD3_LOC_Y + 64) && (x_in_r >= CARD3_LOC_X && x_in_r < CARD3_LOC_X + 64))
			data_out <=  (game_state == 1 || card_find[3] || (card_show[4] && card_show[3:0] == 3))? card_data[ 3] :(card_select == 3)?`CARD_BACK_SEL : `CARD_BACK_IDLE;
		else if ((y_in_r >= CARD4_LOC_Y &&  y_in_r < CARD4_LOC_Y + 64) && (x_in_r >= CARD4_LOC_X && x_in_r < CARD4_LOC_X + 64))
			data_out <=  (game_state == 1 || card_find[4] || (card_show[4] && card_show[3:0] == 4))? card_data[ 4] :(card_select == 4)?`CARD_BACK_SEL : `CARD_BACK_IDLE;
		else if ((y_in_r >= CARD5_LOC_Y &&  y_in_r < CARD5_LOC_Y + 64) && (x_in_r >= CARD5_LOC_X && x_in_r < CARD5_LOC_X + 64))
			data_out <=  (game_state == 1 || card_find[5] || (card_show[4] && card_show[3:0] == 5))? card_data[ 5] :(card_select == 5)?`CARD_BACK_SEL : `CARD_BACK_IDLE;
		else if ((y_in_r >= CARD6_LOC_Y &&  y_in_r < CARD6_LOC_Y + 64) && (x_in_r >= CARD6_LOC_X && x_in_r < CARD6_LOC_X + 64))
			data_out <=  (game_state == 1 || card_find[6] || (card_show[4] && card_show[3:0] == 6))? card_data[ 6] :(card_select == 6)?`CARD_BACK_SEL : `CARD_BACK_IDLE;
		else if ((y_in_r >= CARD7_LOC_Y &&  y_in_r < CARD7_LOC_Y + 64) && (x_in_r >= CARD7_LOC_X && x_in_r < CARD7_LOC_X + 64))
			data_out <=  (game_state == 1 || card_find[7] || (card_show[4] && card_show[3:0] == 7))? card_data[ 7] :(card_select == 7)?`CARD_BACK_SEL : `CARD_BACK_IDLE;
		else if ((y_in_r >= CARD8_LOC_Y &&  y_in_r < CARD8_LOC_Y + 64) && (x_in_r >= CARD8_LOC_X && x_in_r < CARD8_LOC_X + 64))
			data_out <=  (game_state == 1 || card_find[8] || (card_show[4] && card_show[3:0] == 8))? card_data[ 8] :(card_select == 8)?`CARD_BACK_SEL : `CARD_BACK_IDLE;
		else if ((y_in_r >= CARD9_LOC_Y &&  y_in_r < CARD9_LOC_Y + 64) && (x_in_r >= CARD9_LOC_X && x_in_r < CARD9_LOC_X + 64))
			data_out <=  (game_state == 1 || card_find[9] || (card_show[4] && card_show[3:0] == 9))? card_data[ 9] :(card_select == 9)?`CARD_BACK_SEL : `CARD_BACK_IDLE;
		else if ((y_in_r >= CARD10_LOC_Y &&  y_in_r < CARD10_LOC_Y + 64) && (x_in_r >= CARD10_LOC_X && x_in_r < CARD10_LOC_X + 64))
			data_out <=  (game_state == 1 || card_find[10] || (card_show[4] && card_show[3:0] == 10))? card_data[10] :(card_select == 10)?`CARD_BACK_SEL : `CARD_BACK_IDLE;
		else if ((y_in_r >= CARD11_LOC_Y &&  y_in_r < CARD11_LOC_Y + 64) && (x_in_r >= CARD11_LOC_X && x_in_r < CARD11_LOC_X + 64))
			data_out <=  (game_state == 1 || card_find[11] || (card_show[4] && card_show[3:0] == 11))? card_data[11] :(card_select == 11)?`CARD_BACK_SEL : `CARD_BACK_IDLE;
		else if ((y_in_r >= CARD12_LOC_Y &&  y_in_r < CARD12_LOC_Y + 64) && (x_in_r >= CARD12_LOC_X && x_in_r < CARD12_LOC_X + 64))
			data_out <=  (game_state == 1 || card_find[12] || (card_show[4] && card_show[3:0] == 12))? card_data[12] :(card_select == 12)?`CARD_BACK_SEL : `CARD_BACK_IDLE;
		else if ((y_in_r >= CARD13_LOC_Y &&  y_in_r < CARD13_LOC_Y + 64) && (x_in_r >= CARD13_LOC_X && x_in_r < CARD13_LOC_X + 64))
			data_out <=  (game_state == 1 || card_find[13] || (card_show[4] && card_show[3:0] == 13))? card_data[13] :(card_select == 13)?`CARD_BACK_SEL : `CARD_BACK_IDLE;
		else if ((y_in_r >= CARD14_LOC_Y &&  y_in_r < CARD14_LOC_Y + 64) && (x_in_r >= CARD14_LOC_X && x_in_r < CARD14_LOC_X + 64))
			data_out <=  (game_state == 1 || card_find[14] || (card_show[4] && card_show[3:0] == 14))? card_data[14] :(card_select == 14)?`CARD_BACK_SEL : `CARD_BACK_IDLE;
		else if ((y_in_r >= CARD15_LOC_Y &&  y_in_r < CARD15_LOC_Y + 64) && (x_in_r >= CARD15_LOC_X && x_in_r < CARD15_LOC_X + 64))
			data_out <=  (game_state == 1 || card_find[15] || (card_show[4] && card_show[3:0] == 15))? card_data[15] :(card_select == 15)?`CARD_BACK_SEL : `CARD_BACK_IDLE;
		else
			data_out <= COLOR_BACKGROUND;
	end
	else
		data_out <= 12'h000; //非有效数据区域强制归零

//视频控制信号 延时同步
reg 		hs_in_r,vs_in_r,de_in_r;
reg [11:0]	x_in_r,y_in_r;
always@(posedge clk)begin
	x_in_r <= x_in;
	y_in_r <= y_in;

	de_in_r  <= de_in;
	hs_in_r	 <= hs_in;
	vs_in_r	 <= vs_in;

	hs_out 	 <= hs_in_r;
	vs_out 	 <= vs_in_r;
end


//按照随机表同步图片输出
//存储数据BGR
reg[11:0] card_data[15:0];
always@(*)
	for (int i = 0; i < 16; i++) 
		card_data[i] <= {rom_card_data[card_loc[i * 4 +: 4]][3:0],rom_card_data[card_loc[i * 4 +: 4]][7:4],rom_card_data[card_loc[i * 4 +: 4]][11:8]};

//使用到的ROM表
reg [63:0]	rom_time[15:0];
reg [63:0] 	rom_time_data;
initial $readmemh("time_test.c",rom_time);
always@(posedge clk) rom_time_data <= rom_time[rom_time_addr];
 
reg [63:0]	rom_state[127:0];
reg [63:0] 	rom_state_data;
initial $readmemh("state.c",rom_state);
always@(posedge clk) rom_state_data <= rom_state[rom_state_addr];

// 8个翻牌ROM
reg [11:0] 	rom_card_data[7:0];
reg [11:0]	rom_card0[1023:0];
initial $readmemh("card0.c",rom_card0);
always@(posedge clk) rom_card_data[0] <= rom_card0[rom_card_addr];

reg [11:0]	rom_card1[1023:0];
initial $readmemh("card1.c",rom_card1);
always@(posedge clk) rom_card_data[1] <= rom_card1[rom_card_addr];

reg [11:0]	rom_card2[1023:0];
initial $readmemh("card2.c",rom_card2);
always@(posedge clk) rom_card_data[2] <= rom_card2[rom_card_addr];

reg [11:0]	rom_card3[1023:0];
initial $readmemh("card3.c",rom_card3);
always@(posedge clk) rom_card_data[3] <= rom_card3[rom_card_addr];

reg [11:0]	rom_card4[1023:0];
initial $readmemh("card4.c",rom_card4);
always@(posedge clk) rom_card_data[4] <= rom_card4[rom_card_addr];

reg [11:0]	rom_card5[1023:0];
initial $readmemh("card5.c",rom_card5);
always@(posedge clk) rom_card_data[5] <= rom_card5[rom_card_addr];

reg [11:0]	rom_card6[1023:0];
initial $readmemh("card6.c",rom_card6);
always@(posedge clk) rom_card_data[6] <= rom_card6[rom_card_addr];

reg [11:0]	rom_card7[1023:0];
initial $readmemh("card7.c",rom_card7);
always@(posedge clk) rom_card_data[7] <= rom_card7[rom_card_addr];

endmodule