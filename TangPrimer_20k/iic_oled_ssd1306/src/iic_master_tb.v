`timescale 1ns/1ps
/*
	@ File     : spi_master.v
	@ Author 	: User
	@ Date     : 2022 - 10 - 15
	@ Version	:
	@ Brief	:
*/
module iic_master_tb();
//************************Do Not Remove************************//

	reg clk;
/*	reg send_en,send_dc;
	reg [7:0] send_data;
	reg spi_miso;

	wire busy,spi_sck,spi_cs,spi_mosi,spi_dc;
	wire [7:0] recv_data;

	spi_master m0(
		.clk (clk),

		.send_en(send_en),
		.send_dc(send_dc),
		.send_data(send_data),

		.recv_data(recv_data),

		.busy(busy),

		.spi_cs(spi_cs),
		.spi_dc(spi_dc),
		.spi_sck(spi_sck),
		.spi_miso(spi_miso),
		.spi_mosi(spi_mosi)
		);

	initial begin
		clk = 0;
		send_data = 8'b01011010;
		send_en   = 1;
		send_dc  = 1;

		spi_miso <= 0;
		#20000 $stop();
	end*/


	top mo(
		.clk(clk),    //
		.iic_sda (),
		.iic_scl ()
		);
	initial begin
		clk = 0;

		#100000000 $stop;
	end
	always begin
		#10 clk = ~clk; 	// clk freq : 50 MHz
	end
//*************************************************************//
endmodule
