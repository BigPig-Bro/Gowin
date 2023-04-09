module display (
	input 				clk,    // Clock
	
	input				hs_in,
	input				vs_in,
	input				de_in,
	input [11:0]		x_in,
	input [11:0]		y_in,

	input 				show,
	input [ 3:0]		hand,
	input [ 1:0] 		score,

	output reg 			hs_out,
	output reg 			vs_out,
	output reg [11:0]	data_out
);
//图片ROM的各个显示左上点
parameter SELECT_LOC_Y 	= 5 * 4; // 96 x 32 x 12 节省空间，放大显示
parameter SELECT_LOC_X 	= 32 * 4 ;

parameter HANDL_LOC_Y 	= 9 	* 4; // 32 x 32 x 1 节省空间，放大显示
parameter HANDL_LOC_X 	= 38 	* 4;

parameter HANDR_LOC_Y 	= 9 	* 4; // 32 x 32 x 1 节省空间，放大显示
parameter HANDR_LOC_X 	= 94 	* 4;

//得分点显示
parameter SCOREL0_LOC_Y = 100 	* 4; //10 x 10
parameter SCOREL0_LOC_X = 50 	* 4;

parameter SCORER0_LOC_Y = 100 	* 4; 
parameter SCORER0_LOC_X = 105 	* 4;

//显示颜色定义
parameter COLOR_SELECT_CHAR 	= 12'H888;
parameter COLOR_SELECT_BACK 	= 12'H333;
parameter COLOR_SELECT_IDLE 	= 12'H666;
parameter COLOR_SELECT_FINISH 	= 12'HFFF;

parameter COLOR_SOCRE_IDLE		= 12'H000;
parameter COLOR_SOCRE_WIN		= 12'H070;
parameter COLOR_SOCRE_LOSE		= 12'H700;

parameter COLOR_HAND_CHAR 		= 12'H000;
parameter COLOR_HAND_BACK 		= 12'HFFF;

//图片ROM寻址 节省空间 长宽放大显示
always@(posedge clk)
	//显示“SELECT” 
	if (!show && x_in >= SELECT_LOC_X && x_in < SELECT_LOC_X + 96 * 4 && y_in >= SELECT_LOC_Y && y_in < SELECT_LOC_Y + 32 * 4) 
		rom_select_addr <=  (y_in - SELECT_LOC_Y) / 4 ;
	//显示 左出手 
	else if (x_in >= HANDL_LOC_X && x_in < HANDL_LOC_X + 32 * 4 && y_in >= HANDL_LOC_Y 	&& y_in < HANDL_LOC_Y + 32 * 4)
		rom_hand_addr <= hand[1:0] + (y_in[11:2] - HANDL_LOC_Y / 4) * 3;
	//显示 右出手 
	else if (x_in >= HANDR_LOC_X && x_in < HANDR_LOC_X + 32 * 4 && y_in >= HANDR_LOC_Y 	&& y_in < HANDR_LOC_Y + 32 * 4)
		rom_hand_addr <= hand[3:2] + (y_in[11:2] - HANDR_LOC_Y / 4) * 3;
	else
		rom_back_addr  <= x_in[11:2] + y_in[11:2] * 160;

//RGB数据显示 由于寻址时间 拆成流水线
always@(posedge clk)
	if (de_in_r) begin
		//绘制边框颜色
		if(x_in_r < 5 || x_in_r > 635 || y_in_r < 5 || y_in_r > 475)
			data_out <= 12'h555;
		//显示“SELECT” 
		else if (!show && x_in >= SELECT_LOC_X && x_in < SELECT_LOC_X + 96 * 4 && y_in >= SELECT_LOC_Y && y_in < SELECT_LOC_Y + 32 * 4) 
			data_out <= rom_select_data[95 - (x_in_r - SELECT_LOC_X) / 4]?COLOR_SELECT_BACK : COLOR_SELECT_CHAR;
		else if (!show && x_in >= SELECT_LOC_X && x_in < SELECT_LOC_X + 96 * 2 && y_in >= SELECT_LOC_Y + 32 * 4  && y_in < SELECT_LOC_Y + 32 * 5) 
			data_out <=( hand[1:0] != 2'b11)?COLOR_SELECT_FINISH :  COLOR_SELECT_IDLE;
		else if (!show && x_in >= SELECT_LOC_X + 96 * 2 && x_in < SELECT_LOC_X + 96 * 4 && y_in >= SELECT_LOC_Y + 32 * 4  && y_in < SELECT_LOC_Y + 32 * 5) 
			data_out <=( hand[3:2] != 2'b11)?COLOR_SELECT_FINISH :  COLOR_SELECT_IDLE;
		//显示 左出手 
		else if (x_in_r >= HANDL_LOC_X && x_in_r < HANDL_LOC_X + 32 * 4 && y_in_r >= HANDL_LOC_Y 	&& y_in_r < HANDL_LOC_Y + 32 * 4)
			data_out <= rom_hand_data[31 - (x_in_r - HANDL_LOC_X) / 4]? COLOR_HAND_CHAR : COLOR_HAND_BACK;
		//显示 右出手 
		else if (x_in_r >= HANDR_LOC_X && x_in_r < HANDR_LOC_X + 32 * 4 && y_in_r >= HANDR_LOC_Y 	&& y_in_r < HANDR_LOC_Y + 32 * 4)
			data_out <= rom_hand_data[31 - (x_in_r - HANDR_LOC_X) / 4]? COLOR_HAND_CHAR : COLOR_HAND_BACK;
		//显示得分
		else if (x_in_r >= SCORER0_LOC_X && x_in_r < SCORER0_LOC_X + 40 && y_in_r >= SCORER0_LOC_Y 	&& y_in_r < SCORER0_LOC_Y + 20)
			data_out <= score[1]? score[0]?COLOR_SOCRE_WIN : COLOR_SOCRE_LOSE : COLOR_SOCRE_IDLE;
		else if (x_in_r >= SCOREL0_LOC_X && x_in_r < SCOREL0_LOC_X + 40 && y_in_r >= SCOREL0_LOC_Y 	&& y_in_r < SCOREL0_LOC_Y + 20)
			data_out <= score[1]?~score[0]?COLOR_SOCRE_WIN : COLOR_SOCRE_LOSE : COLOR_SOCRE_IDLE;
		else 
		//显示背景图
			data_out <= rom_back_data;
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

//使用到的ROM表 
reg [11:0]	rom_back[19199:0];
reg [11:0] 	rom_back_data;
reg [14:0]  rom_back_addr;
initial $readmemh("background.c",rom_back);
always@(posedge clk) rom_back_data <= rom_back[rom_back_addr];
 
reg [95:0]	rom_select[31:0];
reg [95:0] 	rom_select_data;
reg [ 5:0]  rom_select_addr;
initial $readmemh("select.c",rom_select);
always@(posedge clk) rom_select_data <= rom_select[rom_select_addr];
 
reg [31:0]	rom_hand[95:0];
reg [31:0] 	rom_hand_data;
reg [ 7:0] 	rom_hand_addr;
initial $readmemh("hand.c",rom_hand);
always@(posedge clk) rom_hand_data <= rom_hand[rom_hand_addr];

endmodule