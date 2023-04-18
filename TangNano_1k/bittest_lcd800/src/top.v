module top (
	input clk,    // Clock
	
	output              lcd_dclk,	
	output              lcd_hs,    //lcd horizontal synchronization
	output              lcd_vs,    //lcd vertical synchronization        
	output              lcd_de,    //lcd data enable     
	output 	  [4:0]     lcd_r,     //lcd red
	output 	  [5:0]     lcd_g,     //lcd green
	output 	  [4:0]     lcd_b	   //lcd blue
);

parameter PIXEL_NUM = 800 ;

wire [9:0] lcd_x,lcd_y;

assign {lcd_r,lcd_g,lcd_b} = lcd_de? 
lcd_x < PIXEL_NUM *  1 / 16 ? 16'B10000_000000_00000: 	lcd_x < PIXEL_NUM *  2 / 16 ? 16'B01000_000000_00000:
lcd_x < PIXEL_NUM *  3 / 16 ? 16'B00100_000000_00000:	lcd_x < PIXEL_NUM *  4 / 16 ? 16'B00010_000000_00000:
lcd_x < PIXEL_NUM *  5 / 16 ? 16'B00001_000000_00000:	lcd_x < PIXEL_NUM *  6 / 16 ? 16'B00000_100000_00000:

lcd_x < PIXEL_NUM *  7 / 16 ? 16'B00000_010000_00000:	lcd_x < PIXEL_NUM *  8 / 16 ? 16'B00000_001000_00000:
lcd_x < PIXEL_NUM *  9 / 16 ? 16'B00000_000100_00000:	lcd_x < PIXEL_NUM * 10 / 16 ? 16'B00000_000010_00000:
lcd_x < PIXEL_NUM * 11 / 16 ? 16'B00000_000001_00000:	lcd_x < PIXEL_NUM * 12 / 16 ? 16'B00000_000000_10000:

lcd_x < PIXEL_NUM * 13 / 16 ? 16'B00000_000000_01000:	lcd_x < PIXEL_NUM * 14 / 16 ? 16'B00000_000000_00100:
lcd_x < PIXEL_NUM * 15 / 16 ? 16'B00000_000000_00010:				  			      16'B00000_000000_00001
: 16'H0000;

video_pll video_pll_m0(
	.clkin  	(clk 		),
	.clkout 	(lcd_dclk 	)
	);

rgb_timing rgb_timing_m0(
	.rgb_clk	(lcd_dclk	),	
	.rgb_rst_n	(1'b1		),	
	.rgb_hs		(lcd_hs		),
	.rgb_vs		(lcd_vs		),
	.rgb_de		(lcd_de		),
	.rgb_x		(lcd_x		),
	.rgb_y		(lcd_y		)
	);
endmodule