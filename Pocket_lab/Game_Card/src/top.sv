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
display m2(
	.clk 		(rgb_clk 			),
	
	.hs_in 		(rgb_hs				),
	.vs_in 		(rgb_vs				),
	.de_in 		(rgb_de				),
	.x_in 		(rgb_x				),
	.y_in 		(rgb_y				),
	
	.game_state (game_state 	  	),
	.card_show	(card_show		  	),
	.card_find 	(card_find 		  	),
	.card_select(card_select	  	),
	.card_loc 	(card_loc		  	),
	.left_time	(left_time		  	),
		
	.hs_out 	(vga_hs				),
	.vs_out 	(vga_vs				),
	.data_out 	(vga_data			)
	);

//串口指令解码
//字符 1上 2下 3左 4右 5确定
wire [7:0] 	rx_data;
wire 		rx_data_valid;
uart_rx#(
	.CLK_FRE(CLK_FRE),
	.BAUD_RATE(BAUD_RATE)
) uart_rx_inst(
	.clk            (rgb_clk          ),
	.rst_n          (rst_n            ),
	.rx_data        (rx_data          ),
	.rx_data_ready 	(1'b1 			  ),
	.rx_data_valid  (rx_data_valid    ),
	.rx_pin         (hc01_rx          )
);

//游戏状态控制
wire [11:0] left_time;
wire [15:0] card_find;
wire [63:0] card_loc;
wire [ 4:0] card_show;
wire [ 3:0] card_select;
wire [ 1:0] game_state;
game_ctrl m4(
	.clk            (rgb_clk 	        ),
	.vs_in 			(rgb_vs			  	),
	.rst_n          (rst_n            	),
	
	.rx_data        (rx_data          	),
	.rx_data_valid  (rx_data_valid    	),

	.state 			(game_state 	 	),
	.card_show		(card_show		 	),
	.card_find 		(card_find 		 	),
	.card_select	(card_select	 	),
	.card_loc 		(card_loc		 	),
	.left_time		(left_time		 	)
	);

endmodule