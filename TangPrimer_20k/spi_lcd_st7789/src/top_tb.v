`timescale 1ns/1ns
module top_tb;
reg clk,rst_n;
spi_top#(
	.CLK_FRE (20 )
	) m1(
	.clk		(clk		),
	.rst_n		(rst_n		),

	.lcd_bl		(			),	 
	.lcd_rst_n	(			),	
	.spi_cs		(			),   
	.spi_dc		(			),   
	.spi_sck	(			),	  
	.spi_miso	(			),	 
	.spi_mosi	(			)	 
	);
initial begin 

	clk = 0;
	rst_n = 1;

	#100000000 $stop;
end

always#25 clk = ~clk;

endmodule