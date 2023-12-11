module top (
	input clk,    // Clock
	
	output              lcd_dclk,	
	output              lcd_hs,    //lcd horizontal synchronization
	output              lcd_vs,    //lcd vertical synchronization        
	output              lcd_de,    //lcd data enable     
	output 	  [7:0]     lcd_r,     //lcd red
	output 	  [7:0]     lcd_g,     //lcd green
	output 	  [7:0]     lcd_b	   //lcd blue
);

parameter PIXEL_NUM = 800 ;

wire [9:0] lcd_x,lcd_y;

assign {lcd_r,lcd_g,lcd_b} = lcd_de? 
lcd_x < PIXEL_NUM *  1 / 24 ? 24'h800000 : lcd_x < PIXEL_NUM *  2 / 24 ? 24'h400000 : 
lcd_x < PIXEL_NUM *  3 / 24 ? 24'h200000 : lcd_x < PIXEL_NUM *  4 / 24 ? 24'h100000 :
lcd_x < PIXEL_NUM *  5 / 24 ? 24'h080000 : lcd_x < PIXEL_NUM *  6 / 24 ? 24'h040000 :
lcd_x < PIXEL_NUM *  7 / 24 ? 24'h020000 : lcd_x < PIXEL_NUM *  8 / 24 ? 24'h010000 :

lcd_x < PIXEL_NUM *  9 / 24 ? 24'h008000 : lcd_x < PIXEL_NUM * 10 / 24 ? 24'h004000 :
lcd_x < PIXEL_NUM * 11 / 24 ? 24'h002000 : lcd_x < PIXEL_NUM * 12 / 24 ? 24'h001000 :
lcd_x < PIXEL_NUM * 13 / 24 ? 24'h000800 : lcd_x < PIXEL_NUM * 14 / 24 ? 24'h000400 :
lcd_x < PIXEL_NUM * 15 / 24 ? 24'h000200 : lcd_x < PIXEL_NUM * 16 / 24 ? 24'h000100 :

lcd_x < PIXEL_NUM * 17 / 24 ? 24'h000080 : lcd_x < PIXEL_NUM * 18 / 24 ? 24'h000040 :
lcd_x < PIXEL_NUM * 19 / 24 ? 24'h000020 : lcd_x < PIXEL_NUM * 20 / 24 ? 24'h000010 :
lcd_x < PIXEL_NUM * 21 / 24 ? 24'h000008 : lcd_x < PIXEL_NUM * 22 / 24 ? 24'h000004 :
lcd_x < PIXEL_NUM * 23 / 24 ? 24'h000002 : 24'h000001
: 16'H0000;

video_pll video_pll_m0(
	.clkin  	(clk 		),
	.clkout 	(lcd_dclk 	)
	);

vga_timing vga_timing_m0(
	.clk  		(lcd_dclk 	),
	.rst  		(0 			),
	.active_x 	(lcd_x 		),
	.active_y 	(lcd_y 		),
	.hs  		(lcd_hs 	),
	.vs  		(lcd_vs 	),
	.de  		(lcd_de 	)
	);

endmodule