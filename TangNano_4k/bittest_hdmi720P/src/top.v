module top (
	input clk,    // Clock

	output            O_tmds_clk_p    ,
    output            O_tmds_clk_n    ,
    output     [2:0]  O_tmds_data_p   ,//{r,g,b}
    output     [2:0]  O_tmds_data_n   
);
parameter PIXEL_NUM = 32'd1280 ;

wire       lcd_hs,lcd_vs,lcd_de,lcd_clk;
wire [10:0] lcd_x,lcd_y;
wire [7:0] lcd_r,lcd_b,lcd_g;

assign {lcd_r,lcd_g,lcd_b} = lcd_de? 
lcd_x < (PIXEL_NUM / 24  *  1)? 24'h800000 : lcd_x < (PIXEL_NUM / 24  *  2)? 24'h400000 : 
lcd_x < (PIXEL_NUM / 24  *  3)? 24'h200000 : lcd_x < (PIXEL_NUM / 24  *  4)? 24'h100000 :
lcd_x < (PIXEL_NUM / 24  *  5)? 24'h080000 : lcd_x < (PIXEL_NUM / 24  *  6)? 24'h040000 :
lcd_x < (PIXEL_NUM / 24  *  7)? 24'h020000 : lcd_x < (PIXEL_NUM / 24  *  8)? 24'h010000 :
lcd_x < (PIXEL_NUM / 24  *  9)? 24'h008000 : lcd_x < (PIXEL_NUM / 24  * 10)? 24'h004000 :
lcd_x < (PIXEL_NUM / 24  * 11)? 24'h002000 : lcd_x < (PIXEL_NUM / 24  * 12)? 24'h001000 :
lcd_x < (PIXEL_NUM / 24  * 13)? 24'h000800 : lcd_x < (PIXEL_NUM / 24  * 14)? 24'h000400 :
lcd_x < (PIXEL_NUM / 24  * 15)? 24'h000200 : lcd_x < (PIXEL_NUM / 24  * 16)? 24'h000100 :
lcd_x < (PIXEL_NUM / 24  * 17)? 24'h000080 : lcd_x < (PIXEL_NUM / 24  * 18)? 24'h000040 :
lcd_x < (PIXEL_NUM / 24  * 19)? 24'h000020 : lcd_x < (PIXEL_NUM / 24  * 20)? 24'h000010 :
lcd_x < (PIXEL_NUM / 24  * 21)? 24'h000008 : lcd_x < (PIXEL_NUM / 24  * 22)? 24'h000004 :
lcd_x < (PIXEL_NUM / 24  * 23)? 24'h000002 : 24'h000001 : 24'h000000;

vga_timing vga_timing_m0(
	.clk  		(lcd_clk 	),
	.rst  		(0 			),
	.active_x 	(lcd_x 		),
	.active_y 	(lcd_y 		),
	.hs  		(lcd_hs 	),
	.vs  		(lcd_vs 	),
	.de  		(lcd_de 	)
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
,.CLKOUT(lcd_clk)    //clk  x1
,.CALIB (1'b1)
);
defparam u_clkdiv.DIV_MODE="5";
defparam u_clkdiv.GSREN="false";

DVI_TX_Top DVI_TX_Top_inst
(
    .I_rst_n       (hdmi4_rst_n   ),  //asynchronous reset, low active
    .I_serial_clk  (serial_clk    ),

    .I_rgb_clk     (lcd_clk       ),  //pixel clock
    .I_rgb_vs      (lcd_vs        ), 
    .I_rgb_hs      (lcd_hs        ),    
    .I_rgb_de      (lcd_de        ), 
    .I_rgb_r       (lcd_r         ),  //tp0_data_r
    .I_rgb_g       (lcd_g         ),  
    .I_rgb_b       (lcd_b         ),  

    .O_tmds_clk_p  (O_tmds_clk_p  ),
    .O_tmds_clk_n  (O_tmds_clk_n  ),
    .O_tmds_data_p (O_tmds_data_p ),  //{r,g,b}
    .O_tmds_data_n (O_tmds_data_n )
);

endmodule