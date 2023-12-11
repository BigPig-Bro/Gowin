module top (
	input 			clk,    // Clock
	input 			rst_n,
	
	input 			ble_rx,
	output 			ble_cmd,
	output 			ble_rst,
	output 			ble_cnt,

    input           hc01_rx,

	output 			vga_hs,
	output 			vga_vs,
	output [11:0] 	vga_data
);

assign ble_cmd = 0;
assign ble_rst = 1;
assign ble_cnt = 0;

parameter CLK_FRE 	= 25;
parameter BAUD_RATE = 9600;

//PLL 生成视频流时钟
video_pll m0(
	.clkin      (clk		),
	.clkout		(rgb_clk	)
	);

//RGB视频流生成时序 (无数据)
wire 		rgb_clk;
wire 		rgb_vs,rgb_hs,rgb_de;
wire [11:0] rgb_x,rgb_y;
rgb_timing m1(
	.rgb_clk	(rgb_clk			),	
	.rgb_rst_n	(rst_n				),	
	.rgb_hs		(rgb_hs				),
	.rgb_vs		(rgb_vs				),
	.rgb_de		(rgb_de				),
	.rgb_x		(rgb_x				),
	.rgb_y		(rgb_y				)
	);

//RGB视频数据显示
wire [ 1:0] 		state; 	
wire [11:0]			bird_loc_y;

wire [11:0] 		tube0_x;
wire [11:0] 		tube1_x;
wire [11:0] 		tube2_x;
wire [11:0] 		tube3_x;
wire [11:0] 		tube4_x;

wire [11:0] 		tube0_h;
wire [11:0] 		tube1_h;
wire [11:0] 		tube2_h;
wire [11:0] 		tube3_h;
wire [11:0] 		tube4_h;
display m2(
	.clk 		(rgb_clk 			),
	
	.hs_in 		(rgb_hs				),
	.vs_in 		(rgb_vs				),
	.de_in 		(rgb_de				),
	.x_in 		(rgb_x				),
	.y_in 		(rgb_y				),
	
	.state		(state				),
	.bird_loc_y	(bird_loc_y			),	
	.tube0_x		(tube0_x			),	
	.tube1_x		(tube1_x			),	
	.tube2_x		(tube2_x			),	
	.tube3_x		(tube3_x			),	
	.tube4_x		(tube4_x			),	
	.tube0_h		(tube0_h			),	
	.tube1_h		(tube1_h			),	
	.tube2_h		(tube2_h			),	
	.tube3_h		(tube3_h			),	
	.tube4_h		(tube4_h			),	

	.hs_out 	(vga_hs				),
	.vs_out 	(vga_vs				),
	.data_out 	(vga_data			)
	);

//串口指令解码
wire [7:0] 	rx_data;
wire 		rx_data_valid;
uart_rx#(
	.CLK_FRE(CLK_FRE),
	.BAUD_RATE(BAUD_RATE)
) uart_rx_inst(
	.clk            (rgb_clk           ),
	.rst_n          (rst_n            ),
	.rx_data        (rx_data          ),
	.rx_data_ready 	(1'b1 			  ),
	.rx_data_valid  (rx_data_valid    ),
	.rx_pin         (hc01_rx           )
);

//游戏状态控制

game_ctrl m4(
	.clk            (rgb_clk 	        ),
	.rst_n          (rst_n            	),
	.vs_in 			(rgb_vs				),

	.state			(state				),
	.bird_loc_y		(bird_loc_y			),	
	.tube0_x		(tube0_x			),	
	.tube1_x		(tube1_x			),	
	.tube2_x		(tube2_x			),	
	.tube3_x		(tube3_x			),	
	.tube4_x		(tube4_x			),	
	.tube0_h		(tube0_h			),	
	.tube1_h		(tube1_h			),	
	.tube2_h		(tube2_h			),	
	.tube3_h		(tube3_h			),	
	.tube4_h		(tube4_h			),	

	.rx_data        (rx_data          	),
	.rx_data_valid  (rx_data_valid    	)
	);

endmodule