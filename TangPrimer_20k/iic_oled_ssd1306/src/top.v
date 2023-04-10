module top (
	input  clk,    // Clock
	input  rst_n,

	output [3:0] iic_vcc,iic_gnd,
	output [3:0] iic_scl,
	inout  [3:0] iic_sda
);
parameter 	CLK_FRE = 27; //输入的时钟频率 Mhz
parameter 	IIC_FRE = 100; //IIC SCK工作时钟频率 步进xKhz

parameter   IIC_OLED_SLAVE_ADDR_EX 	= 0;
parameter   IIC_OLED_SLAVE_ADDR 	= 16'h78;

assign iic_vcc = 4'HF;
assign iic_gnd = 4'd0;

//OLED 显存 
wire [3:0][9:0] read_addr;
wire [3:0][7:0] read_data;
oled_ram1 oled1_ram_m0(
	.clk 	 	(clk			),

	.write_addr (				),
	.write_data (				),

	.read_addr 	(read_addr[0]	),
	.read_data 	(read_data[0]	)
	);

oled_ram2 oled2_ram_m0(
	.clk 	 	(clk			),

	.write_addr (				),
	.write_data (				),

	.read_addr 	(read_addr[1]	),
	.read_data 	(read_data[1]	)
	);

oled_ram3 oled3_ram_m0(
	.clk 	 	(clk			),

	.write_addr (				),
	.write_data (				),

	.read_addr 	(read_addr[2]	),
	.read_data 	(read_data[2]	)
	);

oled_ram4 oled4_ram_m0(
	.clk 	 	(clk			),

	.write_addr (				),
	.write_data (				),

	.read_addr 	(read_addr[3]	),
	.read_data 	(read_data[3]	)
	);

//OLED控制机
wire [3:0] 		send_busy,send_en;
wire [3:0] [ 7:0] send_data,send_addr;
wire [3:0] 		brust_ready,brust_vaild;

genvar i;
generate
	for ( i = 0; i < 4; i++) begin	
		oled_ctrl#(
			.CLK_FRE (CLK_FRE	 )
			) oled_ctrl_m0(
			.clk 	  		(clk 			),
			.rst_n 			(rst_n 			),

			.read_addr 		(read_addr[i]		),
			.read_data 		(read_data[i]		),

			.brust_ready	(brust_ready[i]	),		
			.brust_vaild	(brust_vaild[i]	),

			.send_busy	  	(send_busy[i] 		),
			.send_en   		(send_en[i] 		),
			.send_addr   	(send_addr[i] 		),
			.send_data 		(send_data[i] 		)
			);

		//IIC 底层驱动
		iic_master#(
			.CLK_FRE (CLK_FRE	 ),
			.IIC_FRE (IIC_FRE 	 )
			) iic_master_m0(
			.clk			(clk					),

			.slave_addr_ex	(IIC_OLED_SLAVE_ADDR_EX	),		
			.slave_addr		(IIC_OLED_SLAVE_ADDR	),	
			.send_rw		(1'b0 					),//OLED 只有写没有读	
			.reg_addr		(send_addr[i]				),	
			.send_en		(send_en[i]				),	
			.brust_ready	(brust_ready[i]			),		
			.brust_vaild	(brust_vaild[i]			),		
			.send_data		(send_data[i]			),	
			.recv_data		(						),//OLED 只有写没有读	
			.send_busy		(send_busy[i]			),
				
			.iic_scl		(iic_scl[i]				),	
			.iic_sda		(iic_sda[i]				)	
			);
			end
endgenerate

endmodule