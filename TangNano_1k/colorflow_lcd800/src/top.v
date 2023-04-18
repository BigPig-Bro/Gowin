module top (
	input clk,    // Clock
	
	output              lcd_clk,	
	output              lcd_hs,    //lcd horizontal synchronization
	output              lcd_vs,    //lcd vertical synchronization        
	output              lcd_de,    //lcd data enable     
	output 	  [4:0]     lcd_r,     //lcd red
	output 	  [5:0]     lcd_g,     //lcd green
	output 	  [4:0]     lcd_b	   //lcd blue
);

parameter PIXEL_NUM = 800 ;

wire 		rgb_vs,rgb_hs,rgb_de;
wire [ 9:0] rgb_x,rgb_y;
video_pll video_pll_m0(
	.clkin  	(clk 		),
	.clkout 	(lcd_clk 	)
	);

rgb_timing rgb_timing_m0(
	.rgb_clk	(lcd_clk	),	
	.rgb_rst_n	(1'b1		),	
	.rgb_hs		(rgb_hs		),
	.rgb_vs		(rgb_vs		),
	.rgb_de		(rgb_de		),
	.rgb_x		(rgb_x		),
	.rgb_y		(rgb_y		)
	);

//在标准RGB视频流中显示
display display_m0(
	.clk 		(lcd_clk 	),

	.in_hs 		(rgb_hs		),
	.in_vs 		(rgb_vs		),
	.in_de 		(rgb_de		),
	.x_in 		(rgb_x		),
	.y_in 		(rgb_y		),

	.out_hs 	(lcd_hs		),
	.out_vs 	(lcd_vs		),
	.out_de 	(lcd_de		),
	.out_data 	({lcd_r,lcd_g,lcd_b}	)
	);
endmodule