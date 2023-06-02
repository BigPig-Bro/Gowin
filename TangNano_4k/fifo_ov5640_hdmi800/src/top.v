module top(
	input                       clk,
	input                       rst_n,

	output                      cmos_scl,          //cmos i2c clock
	inout                       cmos_sda,          //cmos i2c data
	input                       cmos_vsync,        //cmos vsync
	input                       cmos_href,         //cmos hsync refrence,data valid
	input                       cmos_pclk,         //cmos pxiel clock
    output                      cmos_xclk,         //cmos externl clock 
	input   [7:0]               cmos_db,           //cmos data

	output           			O_tmds_clk_p    ,
    output           			O_tmds_clk_n    ,
    output     [2:0] 			O_tmds_data_p   ,//{r,g,b}
    output     [2:0] 			O_tmds_data_n   
);

//============================= CAMERA =================================================
wire                            lcd_hs;
wire                            lcd_vs;
wire                            lcd_de;
wire[15:0]                      lcd_data;
wire[15:0]                      cmos_16bit_data;
wire[15:0] 						write_data;

assign write_data = {cmos_16bit_data[4:0],cmos_16bit_data[10:5],cmos_16bit_data[15:11]};

//generate the CMOS sensor clock and the video clock
cmos_pll cmos_pll_m0(
	.clkin                     (clk                         ),
	.clkout                    (cmos_xclk 	              	)
	);

//IIC 延时约1s复位

//I2C master controller
iic_ctrl#(
 .CLK_FRE                	(27     					),
 .IIC_FRE                	(100    					),
 .IIC_SLAVE_REG_EX       	(1      					),
 .IIC_SLAVE_ADDR_EX      	(0      					),
 .IIC_SLAVE_ADDR         	(16'h78 					),
 .INIT_CMD_NUM           	(256    					)
 ) iic_ctrl_m0(	
 .clk                        (clk                      ),
 .rst_n                      (rst_n                    ),
 .iic_scl                    (cmos_scl                 ),
 .iic_sda                    (cmos_sda                 )
 );

//CMOS sensor 8bit data is converted to 16bit data
cmos_8_16bit cmos_8_16bit_m0(
	.pclk                       (cmos_pclk                ),
	.pdata_i                    (cmos_db                  ),
	.de_i                       (cmos_href                ),
	.pdata_o                    (cmos_16bit_data          ),
	.de_o                       (cmos_16bit_wr            )
);

//The video output timing generator and generate a frame read data request
video_timing_data video_timing_data_m0
(
	.video_clk                  (lcd_clk                  ),
	.rst                        (~rst_n                   ),

	.fifo_data_in   			(write_data 		  	  ),
	.fifo_data_in_en			(cmos_16bit_wr 			  ),
	.fifo_data_in_clk			(cmos_pclk 			  	  ),
	.fifo_data_vs  				(cmos_vsync 			  ),

	.hs                         (lcd_hs                   ),
	.vs                         (lcd_vs                   ),
	.de                         (lcd_de                   ),
	.vout_data                  (lcd_data                 )
);

//============================= HDMI =================================================
//TMDS TX(HDMI4)
wire serial_clk;
wire TMDS_pll_lock;
wire hdmi4_rst_n;

TMDS_rPLL u_tmds_rpll(
	.clkin     (clk       		),     //input clk 
	.clkout    (serial_clk     	),     //output clk 
	.lock      (TMDS_pll_lock   )     //output lock
);

assign hdmi4_rst_n = TMDS_pll_lock;

CLKDIV u_clkdiv(
	.RESETN(hdmi4_rst_n 	),
	.HCLKIN(serial_clk 		), //clk  x5
	.CLKOUT(lcd_clk 		),    //clk  x1
	.CALIB (1'b1 			)
);
defparam u_clkdiv.DIV_MODE="5";
defparam u_clkdiv.GSREN="false";

DVI_TX_Top DVI_TX_Top_inst
(
    .I_rst_n       (hdmi4_rst_n   				),  //asynchronous reset, low active
    .I_serial_clk  (serial_clk    				),

    .I_rgb_clk     (lcd_clk       				),  //pixel clock
    .I_rgb_vs      (lcd_vs        				), 
    .I_rgb_hs      (lcd_hs        				),    
    .I_rgb_de      (lcd_de        				), 
    .I_rgb_r       ({lcd_data[15:11] ,3'd0}    ),  //tp0_data_r
    .I_rgb_g       ({lcd_data[10: 5] ,2'd0}    ),  
    .I_rgb_b       ({lcd_data[ 4: 0] ,3'd0}    ),  

    .O_tmds_clk_p  (O_tmds_clk_p  				),
    .O_tmds_clk_n  (O_tmds_clk_n  				),
    .O_tmds_data_p (O_tmds_data_p 				),  //{r,g,b}
    .O_tmds_data_n (O_tmds_data_n 				)
);

endmodule