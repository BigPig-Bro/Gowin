module display (
	input 				clk,    // Clock
	
	input				hs_in,
	input				vs_in,
	input				de_in,
	input [11:0]		x_in,
	input [11:0]		y_in,

	input [ 1:0] 		state, 	
	input [11:0]		bird_loc_y,

	//right edge
	input [11:0] 		tube0_x,
	input [11:0] 		tube1_x,
	input [11:0] 		tube2_x,
	input [11:0] 		tube3_x,
	input [11:0] 		tube4_x,
	//up edge
	input [11:0] 		tube0_h,
	input [11:0] 		tube1_h,
	input [11:0] 		tube2_h,
	input [11:0] 		tube3_h,
	input [11:0] 		tube4_h,

	output reg 			hs_out,
	output reg 			vs_out,
	output reg [11:0]	data_out
);
//图片ROM的各个显示左上点
parameter STATE_LOC_Y 	= 176;//节省空间，放大显示
parameter STATE_LOC_X 	= 192;

parameter BIRD_LOC_X 	= 128;
parameter BIRD_SIZE 	= 32;

parameter TUBE_GAP 		= 80;
parameter TUBE_WIDTH 	= 56;
parameter TUBE_HEAD 	= 30;

parameter COLOR_FLAG 	= 0;

//图片ROM寻址 节省空间 长宽放大显示
always@(posedge clk)
	//显示 bird 
	if (x_in >= BIRD_LOC_X && x_in < BIRD_LOC_X + BIRD_SIZE && y_in >= bird_loc_y 	&& y_in < bird_loc_y + BIRD_SIZE )
		rom_bird_addr <= (x_in - BIRD_LOC_X)  +( (y_in - bird_loc_y) << 5) ;//* BIRD_SIZE;

always@(posedge clk)
	//显示 tube 0
	if (x_in >= tube0_x - TUBE_WIDTH && x_in < tube0_x && y_in < tube0_h)
		rom_tube_addr <= (x_in + TUBE_WIDTH - tube0_x ) + (((y_in < tube0_h - TUBE_HEAD)? 'd0 :(y_in + TUBE_HEAD - tube0_h)) * TUBE_WIDTH);
	else if (x_in >= tube0_x - TUBE_WIDTH && x_in < tube0_x && y_in >= tube0_h + TUBE_GAP)
		rom_tube_addr <= (x_in + TUBE_WIDTH - tube0_x ) + (((y_in  > tube0_h + TUBE_GAP + TUBE_HEAD)? 'd0 : (tube0_h + TUBE_GAP + TUBE_HEAD - y_in)) * TUBE_WIDTH);
	//显示 tube 1
	else if (x_in >= tube1_x - TUBE_WIDTH && x_in < tube1_x && y_in < tube1_h)
		rom_tube_addr <= (x_in + TUBE_WIDTH - tube1_x ) + (((y_in < tube1_h - TUBE_HEAD)? 'd0 :(y_in + TUBE_HEAD - tube1_h)) * TUBE_WIDTH);
	else if (x_in >= tube1_x - TUBE_WIDTH && x_in < tube1_x && y_in >= tube1_h + TUBE_GAP)
		rom_tube_addr <= (x_in + TUBE_WIDTH - tube1_x ) + (((y_in  > tube1_h + TUBE_GAP + TUBE_HEAD)? 'd0 : (tube1_h + TUBE_GAP + TUBE_HEAD - y_in)) * TUBE_WIDTH);
	//显示 tube 2
	else if (x_in >= tube2_x - TUBE_WIDTH && x_in < tube2_x && y_in < tube2_h)
		rom_tube_addr <= (x_in + TUBE_WIDTH - tube2_x ) + (((y_in < tube2_h - TUBE_HEAD)? 'd0 :(y_in + TUBE_HEAD - tube2_h)) * TUBE_WIDTH);
	else if (x_in >= tube2_x - TUBE_WIDTH && x_in < tube2_x && y_in >= tube2_h + TUBE_GAP)
		rom_tube_addr <= (x_in + TUBE_WIDTH - tube2_x ) + (((y_in  > tube2_h + TUBE_GAP + TUBE_HEAD)? 'd0 : (tube2_h + TUBE_GAP + TUBE_HEAD - y_in)) * TUBE_WIDTH);
	//显示 tube 3
	else if (x_in >= tube3_x - TUBE_WIDTH && x_in < tube3_x && y_in < tube3_h)
		rom_tube_addr <= (x_in + TUBE_WIDTH - tube3_x ) + (((y_in < tube3_h - TUBE_HEAD)? 'd0 :(y_in + TUBE_HEAD - tube3_h)) * TUBE_WIDTH);
	else if (x_in >= tube3_x - TUBE_WIDTH && x_in < tube3_x && y_in >= tube3_h + TUBE_GAP)
		rom_tube_addr <= (x_in + TUBE_WIDTH - tube3_x ) + (((y_in  > tube3_h + TUBE_GAP + TUBE_HEAD)? 'd0 : (tube3_h + TUBE_GAP + TUBE_HEAD - y_in)) * TUBE_WIDTH);
	//显示 tube 4
	else if (x_in >= tube4_x - TUBE_WIDTH && x_in < tube4_x && y_in < tube4_h)
		rom_tube_addr <= (x_in + TUBE_WIDTH - tube4_x ) + (((y_in < tube4_h - TUBE_HEAD)? 'd0 :(y_in + TUBE_HEAD - tube4_h)) * TUBE_WIDTH);
	else //if (x_in >= tube4_x - TUBE_WIDTH && x_in < tube4_x && y_in >= tube4_h + TUBE_GAP)
		rom_tube_addr <= (x_in + TUBE_WIDTH - tube4_x ) + (((y_in  > tube4_h + TUBE_GAP + TUBE_HEAD)? 'd0 : (tube4_h + TUBE_GAP + TUBE_HEAD - y_in)) * TUBE_WIDTH);

always@(posedge clk)
	//显示“START”0 "END"1 2不显示
	if ((state != 2) && x_in >= STATE_LOC_X && x_in < STATE_LOC_X + 64 * 4 && y_in >= STATE_LOC_Y && y_in < STATE_LOC_Y + 32 * 4) 
		rom_state_addr <= ( state ? 'd2048 : 0 ) + ((x_in - STATE_LOC_X) >> 2) + (( (y_in - STATE_LOC_Y)  >> 2 ) << 6);

always@(posedge clk)
	//显示背景
	rom_back_addr  <= x_in[11:3] + y_in[11:3] * 'd80;

//RGB数据显示 由于寻址时间 拆成流水线
reg [11:0] data_out_r;
always@(posedge clk)
	//显示 tube 0
	if (x_in_r0 >= tube0_x - TUBE_WIDTH && x_in_r0 < tube0_x && y_in_r0 < tube0_h)
		data_out_r <= (rom_tube_data != COLOR_FLAG)? rom_tube_data  : rom_back_data;
	else if (x_in_r0 >= tube0_x - TUBE_WIDTH && x_in_r0 < tube0_x && y_in_r0 >= tube0_h + TUBE_GAP)
		data_out_r <= (rom_tube_data != COLOR_FLAG)? rom_tube_data  : rom_back_data;
	//显示 tube 1
	else if (x_in_r0 >= tube1_x - TUBE_WIDTH && x_in_r0 < tube1_x && y_in_r0 < tube1_h)
		data_out_r <= (rom_tube_data != COLOR_FLAG)? rom_tube_data  : rom_back_data;
	else if (x_in_r0 >= tube1_x - TUBE_WIDTH && x_in_r0 < tube1_x && y_in_r0 >= tube1_h + TUBE_GAP)
		data_out_r <= (rom_tube_data != COLOR_FLAG)? rom_tube_data  : rom_back_data;
	//显示 tube 2
	else if (x_in_r0 >= tube2_x - TUBE_WIDTH && x_in_r0 < tube2_x && y_in_r0 < tube2_h)
		data_out_r <= (rom_tube_data != COLOR_FLAG)? rom_tube_data  : rom_back_data;
	else if (x_in_r0 >= tube2_x - TUBE_WIDTH && x_in_r0 < tube2_x && y_in_r0 >= tube2_h + TUBE_GAP)
		data_out_r <= (rom_tube_data != COLOR_FLAG)? rom_tube_data  : rom_back_data;
	//显示 tube 3
	else if (x_in_r0 >= tube3_x - TUBE_WIDTH && x_in_r0 < tube3_x && y_in_r0 < tube3_h)
		data_out_r <= (rom_tube_data != COLOR_FLAG)? rom_tube_data  : rom_back_data;
	else if (x_in_r0 >= tube3_x - TUBE_WIDTH && x_in_r0 < tube3_x && y_in_r0 >= tube3_h + TUBE_GAP)
		data_out_r <= (rom_tube_data != COLOR_FLAG)? rom_tube_data  : rom_back_data;
	//显示 tube 4
	else if (x_in_r0 >= tube4_x - TUBE_WIDTH && x_in_r0 < tube4_x && y_in_r0 < tube4_h)
		data_out_r <= (rom_tube_data != COLOR_FLAG)? rom_tube_data  : rom_back_data;
	else if (x_in_r0 >= tube4_x - TUBE_WIDTH && x_in_r0 < tube4_x && y_in_r0 >= tube4_h + TUBE_GAP)
		data_out_r <= (rom_tube_data != COLOR_FLAG)? rom_tube_data  : rom_back_data;
	else 
	//显示背景图
		data_out_r <= rom_back_data;


always@(posedge clk)//二级流水线
	if(de_in_r1)
		//绘制边框颜色
		if(x_in_r1 < 5 || x_in_r1 > 635 || y_in_r1 < 5 || y_in_r1 > 475)
			data_out <= 12'h555;
		//显示“START”0 "END"1 2不显示
		else if ((rom_state_data != COLOR_FLAG) && (state != 2) && x_in_r1 >= STATE_LOC_X && x_in_r1 < STATE_LOC_X + 64 * 4 && y_in_r1 >= STATE_LOC_Y && y_in_r1 < STATE_LOC_Y + 32 * 4) 
			data_out <= rom_state_data_r;
		//显示bird
		else if (x_in_r1 >= BIRD_LOC_X && x_in_r1 < BIRD_LOC_X + BIRD_SIZE && y_in_r1 >= bird_loc_y 	&& y_in_r1 < bird_loc_y + BIRD_SIZE )
			data_out <= (rom_bird_data_r != COLOR_FLAG)? rom_bird_data_r  : rom_back_data_r;
		else 
		//显示前一级数据
			data_out <= data_out_r;
	else
		data_out <= 12'h000; //非有效数据区域强制归零

//视频控制信号 延时同步
reg 		hs_in_r0,vs_in_r0,de_in_r0;
reg 		hs_in_r1,vs_in_r1,de_in_r1;
reg [11:0]	x_in_r0,y_in_r0;
reg [11:0]	x_in_r1,y_in_r1;
always@(posedge clk)begin
	x_in_r0 <= x_in;
	y_in_r0 <= y_in;

	x_in_r1 <= x_in_r0;
	y_in_r1 <= y_in_r0;

	de_in_r0  	 <= de_in;
	hs_in_r0	 <= hs_in;
	vs_in_r0	 <= vs_in;

	de_in_r1  	 <= de_in_r0; 
	hs_in_r1	 <= hs_in_r0;
	vs_in_r1	 <= vs_in_r0;

	hs_out 	 <= hs_in_r1;
	vs_out 	 <= vs_in_r1;
end

//使用到的ROM表 
reg [11:0]	rom_back[4799:0];
reg [11:0] 	rom_back_data;
reg [11:0] 	rom_back_data_r;
reg [14:0]  rom_back_addr;
initial $readmemh("background.c",rom_back);
always@(posedge clk) rom_back_data <= rom_back[rom_back_addr];

always@(posedge clk) rom_back_data_r <= rom_back_data;

reg [11:0]	rom_bird[1023:0];
reg [11:0] 	rom_bird_data;
reg [11:0] 	rom_bird_data_r;
reg [ 9:0]  rom_bird_addr;
initial $readmemh("bird.c",rom_bird);
always@(posedge clk) rom_bird_data <= rom_bird[rom_bird_addr];
always@(posedge clk) rom_bird_data_r <= rom_bird_data;
 
reg [11:0]	rom_state[4095:0];
reg [11:0] 	rom_state_data;
reg [11:0] 	rom_state_data_r;
reg [15:0] 	rom_state_addr;
initial $readmemh("state.c",rom_state);
always@(posedge clk) rom_state_data <= rom_state[rom_state_addr];
always@(posedge clk) rom_state_data_r <= rom_state_data;

reg [11:0]	rom_tube[1791:0];
reg [11:0] 	rom_tube_data;
reg [10:0] 	rom_tube_addr;
initial $readmemh("tube.c",rom_tube);
always@(posedge clk) rom_tube_data <= rom_tube[rom_tube_addr];

endmodule