module hdmi_top (
	input clk,    // Clock
    input rst_n,

    inout               cmos_scl,          //cmos i2c clock
    inout               cmos_sda,          //cmos i2c data
    input               cmos_vsync,        //cmos vsync
    input               cmos_href,         //cmos hsync refrence,data valid
    input               cmos_pclk,         //cmos pxiel clock
  //output              cmos_xclk,         //cmos externl clock 
    input   [7:0]       cmos_db,           //cmos data
    output              cmos_rst_n,        //cmos reset 
    output              cmos_pwdn,         //cmos power down

    output [14-1:0]             ddr_addr,       //ROW_WIDTH=14
    output [3-1:0]              ddr_bank,       //BANK_WIDTH=3
    output                      ddr_cs,
    output                      ddr_ras,
    output                      ddr_cas,
    output                      ddr_we,
    output                      ddr_ck,
    output                      ddr_ck_n,
    output                      ddr_cke,
    output                      ddr_odt,
    output                      ddr_reset_n,
    output [2-1:0]              ddr_dm,         //DM_WIDTH=2
    inout [16-1:0]              ddr_dq,         //DQ_WIDTH=16
    inout [2-1:0]               ddr_dqs,        //DQS_WIDTH=2
    inout [2-1:0]               ddr_dqs_n,      //DQS_WIDTH=2

	output            hdmi_clk_p    ,
    output            hdmi_clk_n    ,
    output     [2:0]  hdmi_data_p   ,//{r,g,b}
    output     [2:0]  hdmi_data_n   
);
wire       lcd_hs,lcd_vs,lcd_de,lcd_dclk;

/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
////////////////////                摄像头驱动            /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
wire [4:0] cmos_r,cmos_b;
wire [5:0] cmos_g;
assign cmos_pwdn = 1'b0;
cmos_top cmos_top_m0(
    .clk        (clk         ),
    .rst_n      (rst_n       ),

    .cmos_scl    (cmos_scl   ),   
    .cmos_sda    (cmos_sda   ),   
    .cmos_vsync  (cmos_vsync ),   
    .cmos_href   (cmos_href  ),   
    .cmos_pclk   (cmos_pclk  ),   
    .cmos_db     (cmos_db    ),   
    .cmos_rst_n  (cmos_rst_n ),   

    .ddr_addr      (ddr_addr       ),
    .ddr_bank      (ddr_bank       ),
    .ddr_cs        (ddr_cs         ),
    .ddr_ras       (ddr_ras        ),
    .ddr_cas       (ddr_cas        ),
    .ddr_we        (ddr_we         ),
    .ddr_ck        (ddr_ck         ),
    .ddr_ck_n      (ddr_ck_n       ),
    .ddr_cke       (ddr_cke        ),
    .ddr_odt       (ddr_odt        ),
    .ddr_reset_n   (ddr_reset_n    ),    
    .ddr_dm        (ddr_dm         ),
    .ddr_dq        (ddr_dq         ),
    .ddr_dqs       (ddr_dqs        ),
    .ddr_dqs_n     (ddr_dqs_n      ),

    .video_clk      (lcd_dclk       ),
    .video_vs       (lcd_vs         ),
    .video_de       (lcd_de         ),
    .cmos_r         (cmos_r         ),
    .cmos_g         (cmos_g         ),
    .cmos_b         (cmos_b         )

);


/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
////////////////////                测试色条             /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
parameter PIXEL_NUM = 32'd1280 ;

wire [10:0] lcd_x,lcd_y;
wire [23:0] lcd_rgb;

assign lcd_rgb = lcd_de? 
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
lcd_x < (PIXEL_NUM / 24  * 23)? 24'h000002 : 24'h000001 
: 16'H0000;

vga_timing vga_timing_m0(
	.clk  		(lcd_dclk 	),
	.rst  		(0 			),
	.active_x 	(lcd_x 		),
	.active_y 	(lcd_y 		),
	.hs  		(lcd_hs 	),
	.vs  		(lcd_vs 	),
	.de  		(lcd_de 	)
	);

/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
////////////////////                画面合成                /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
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

wire [7:0] hdmi_r,hdmi_g,hdmi_b;

assign hdmi_r = ~lcd_de ? 0 : lcd_y > 360 ? {cmos_r,3'd0} : lcd_rgb[23:16];
assign hdmi_g = ~lcd_de ? 0 : lcd_y > 360 ? {cmos_g,2'd0} : lcd_rgb[15:8];
assign hdmi_b = ~lcd_de ? 0 : lcd_y > 360 ? {cmos_b,3'd0} : lcd_rgb[7:0];

DVI_TX_Top DVI_TX_Top_inst
(
    .I_rst_n       (hdmi4_rst_n   ),  //asynchronous reset, low active
    .I_serial_clk  (serial_clk    ),

    .I_rgb_clk     (lcd_dclk       ),  //pixel clock
    .I_rgb_vs      (lcd_vs        ), 
    .I_rgb_hs      (lcd_hs        ),    
    .I_rgb_de      (lcd_de        ), 
    .I_rgb_r       ( hdmi_r         ),  //tp0_data_r
    .I_rgb_g       ( hdmi_g         ),  
    .I_rgb_b       ( hdmi_b         ),  

    .O_tmds_clk_p  (hdmi_clk_p  ),
    .O_tmds_clk_n  (hdmi_clk_n  ),
    .O_tmds_data_p (hdmi_data_p ),  //{r,g,b}
    .O_tmds_data_n (hdmi_data_n )
);

endmodule