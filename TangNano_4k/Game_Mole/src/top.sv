module top (
	input 			clk,    // Clock
	input 			rst_n,

	input  			uart_rx,
	
	output            O_tmds_clk_p    ,
    output            O_tmds_clk_n    ,
    output     [2:0]  O_tmds_data_p   ,//{r,g,b}
    output     [2:0]  O_tmds_data_n   
);
parameter CLK_FRE 	= 27;
parameter UART_RATE = 9600;

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
wire [23:0] 	hdmi_data;
wire 		hdmi_hs,hdmi_vs,hdmi_de;

display m2(
	.clk 		(rgb_clk 			),
	
	.hs_in 		(rgb_hs				),
	.vs_in 		(rgb_vs				),
	.de_in 		(rgb_de				),
	.x_in 		(rgb_x				),
	.y_in 		(rgb_y				),
	
	.game_state (game_state 	  	),
	.mole_score (mole_score 		),
	.mole_find 	(mole_find 		  	),
	.left_time	(left_time		  	),
		
	.hs_out 	(hdmi_hs			),
	.vs_out 	(hdmi_vs			),
	.de_out 	(hdmi_de			),
	.data_out 	(hdmi_data			)
	);

//串口指令解码
//字符 ABCD EFGH IJKL MNOP
wire [7:0] 	rx_data;
wire 		rx_data_en;
uart_rx#(
	.CLK_FRE(CLK_FRE),
	.UART_RATE(UART_RATE)
) uart_rx_inst(
	.clk            (clk          	  ),
	.recv_data      (rx_data          ),
	.recv_en 		(rx_data_en    	  ),
	.rx_pin         (uart_rx          )
);

//游戏状态控制
wire [11:0] left_time;
wire [ 3:0] mole_find;
wire [ 7:0] mole_score;
wire [ 1:0] game_state;
game_ctrl #(
	.CLK_FRE 		(CLK_FRE 			)
)m4(
	.clk            (rgb_clk 	        ),
	.vs_in 			(rgb_vs			  	),
	.rst_n          (rst_n            	),
	
	.rx_data        (rx_data          	),
	.rx_data_en  	(rx_data_en    	),

	.state 			(game_state 	 	),
	.mole_find 		(mole_find 		 	),
	.mole_score 	(mole_score 		),
	.left_time		(left_time		 	)
	);
//==============================================================================
//TMDS TX(HDMI4)
wire serial_clk;
wire TMDS_pll_lock;
wire hdmi4_rst_n;

TMDS_rPLL u_tmds_rpll
(.clkin     (clk       )     //input clk 
,.clkout    (serial_clk     )     //output clk 
,.lock      (TMDS_pll_lock       )     //output lock
);

assign hdmi4_rst_n = TMDS_pll_lock;

CLKDIV u_clkdiv
(.RESETN(hdmi4_rst_n)
,.HCLKIN(serial_clk) //clk  x5
,.CLKOUT(rgb_clk)    //clk  x1
,.CALIB (1'b1)
);
defparam u_clkdiv.DIV_MODE="5";
defparam u_clkdiv.GSREN="false";

DVI_TX_Top DVI_TX_Top_inst
(
    .I_rst_n       (hdmi4_rst_n   ),  //asynchronous reset, low active
    .I_serial_clk  (serial_clk    ),

    .I_rgb_clk     (rgb_clk        ),  //pixel clock
    .I_rgb_vs      (hdmi_vs        ), 
    .I_rgb_hs      (hdmi_hs        ),    
    .I_rgb_de      (hdmi_de        ), 
    .I_rgb_r       (hdmi_data[23:16]),  //tp0_data_r
    .I_rgb_g       (hdmi_data[15: 8]),  
    .I_rgb_b       (hdmi_data[ 7: 0]),  

    .O_tmds_clk_p  (O_tmds_clk_p  ),
    .O_tmds_clk_n  (O_tmds_clk_n  ),
    .O_tmds_data_p (O_tmds_data_p ),  //{r,g,b}
    .O_tmds_data_n (O_tmds_data_n )
);
endmodule