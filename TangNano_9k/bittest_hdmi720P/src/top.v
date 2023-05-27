module top (
	input clk,    // Clock

	output            tmds_clk_p    ,
    output            tmds_clk_n    ,
    output     [2:0]  tmds_data_p   ,//{r,g,b}
    output     [2:0]  tmds_data_n   
);
parameter PIXEL_NUM = 32'd1280 ;

wire       lcd_hs,lcd_vs,lcd_de,lcd_dclk;
wire [10:0] lcd_x,lcd_y;
wire [4:0] lcd_r,lcd_b;
wire [5:0] lcd_g;

assign {lcd_r,lcd_g,lcd_b} = lcd_de? 
lcd_x < (PIXEL_NUM / 16  *  1)? 16'B10000_000000_00000: lcd_x < (PIXEL_NUM / 16  *  2)? 16'B01000_000000_00000:
lcd_x < (PIXEL_NUM / 16  *  3)? 16'B00100_000000_00000:	lcd_x < (PIXEL_NUM / 16  *  4)? 16'B00010_000000_00000:
lcd_x < (PIXEL_NUM / 16  *  5)? 16'B00001_000000_00000:	lcd_x < (PIXEL_NUM / 16  *  6)? 16'B00000_100000_00000:

lcd_x < (PIXEL_NUM / 16  *  7)? 16'B00000_010000_00000:	lcd_x < (PIXEL_NUM / 16  *  8)? 16'B00000_001000_00000:
lcd_x < (PIXEL_NUM / 16  *  9)? 16'B00000_000100_00000:	lcd_x < (PIXEL_NUM / 16  * 10)? 16'B00000_000010_00000:
lcd_x < (PIXEL_NUM / 16  * 11)? 16'B00000_000001_00000:	lcd_x < (PIXEL_NUM / 16  * 12)? 16'B00000_000000_10000:

lcd_x < (PIXEL_NUM / 16  * 13)? 16'B00000_000000_01000:	lcd_x < (PIXEL_NUM / 16  * 14)? 16'B00000_000000_00100:
lcd_x < (PIXEL_NUM / 16  * 15)? 16'B00000_000000_00010:				  			        16'B00000_000000_00001
: 16'H0000;

rgb_timing rgb_timing_m0(
	.rgb_clk  		(lcd_dclk 	),
	.rgb_rst_n  	(1 			),
	.rgb_x 	        (lcd_x 		),
	.rgb_y 	        (lcd_y 		),
	.rgb_hs  		(lcd_hs 	),
	.rgb_vs  		(lcd_vs 	),
	.rgb_de  		(lcd_de 	)
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
,.CLKOUT(lcd_dclk)    //clk  x1
,.CALIB (1'b1)
);
defparam u_clkdiv.DIV_MODE="5";
defparam u_clkdiv.GSREN="false";

DVI_TX_Top DVI_TX_Top_inst
(
    .I_rst_n       (hdmi4_rst_n   ),  //asynchronous reset, low active
    .I_serial_clk  (serial_clk    ),

    .I_rgb_clk     (lcd_dclk       ),  //pixel clock
    .I_rgb_vs      (lcd_vs        ), 
    .I_rgb_hs      (lcd_hs        ),    
    .I_rgb_de      (lcd_de        ), 
    .I_rgb_r       ( {lcd_r,3'd0} ),  //tp0_data_r
    .I_rgb_g       ( {lcd_g,2'd0} ),  
    .I_rgb_b       ( {lcd_b,3'd0} ),  

    .O_tmds_clk_p  (tmds_clk_p  ),
    .O_tmds_clk_n  (tmds_clk_n  ),
    .O_tmds_data_p (tmds_data_p ),  //{r,g,b}
    .O_tmds_data_n (tmds_data_n )
);

endmodule