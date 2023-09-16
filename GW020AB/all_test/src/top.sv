module top(
    input               clk,

    input               key,

    input               uart_rx,
    output              uart_tx,
    
    inout               cmos_scl,          //cmos i2c clock
    inout               cmos_sda,          //cmos i2c data
    input               cmos_vsync,        //cmos vsync
    input               cmos_href,         //cmos hsync refrence,data valid
    input               cmos_pclk,         //cmos pxiel clock
  //output              cmos_xclk,         //cmos externl clock 
    input   [7:0]       cmos_db,           //cmos data
    output              cmos_rst_n,        //cmos reset 
//  output              cmos_pwdn,         //cmos power down

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

    output  [2:0]       hdmi_data_p,
    output  [2:0]       hdmi_data_n,
    output              hdmi_clk_p,
    output              hdmi_clk_n,

    output      	  	ws2812_io,

    output      [33:0]  exter_io1,
    output      [35:0]  exter_io2
);

/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//////////////////// 			    测试时钟输入 	         /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
// 降低到hz，生成分频信号1hz A
reg [24:0] cnt;
always@(posedge clk)
    cnt <= cnt + 1;

logic clk_A ;
assign clk_A = cnt[24];
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//////////////////// 			    测试按键与WS2812 	     /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//不同按键显示不同颜色
ws2812_top ws2812_top_m0(
    .clk    (clk            ),
    .key    (key            ),
    .WS2812_Di (ws2812_io   )
);

/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//////////////////// 			    测试FLASH 	            /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//测试固化代码是否成功

/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//////////////////// 			    测试UART	            /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//回环测试
assign uart_tx = uart_rx;

/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//////////////////// 			    测试外部IO	            /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
assign exter_io1[0] = clk_A ;
assign exter_io1[1] = ~clk_A ;
assign exter_io1[2] = clk_A ;
assign exter_io1[3] = ~clk_A ;
assign exter_io1[4] = clk_A ;
assign exter_io1[5] = ~clk_A ;
assign exter_io1[6] = clk_A ;
assign exter_io1[7] = ~clk_A ;
assign exter_io1[8] = clk_A ;
assign exter_io1[9] = ~clk_A ;
assign exter_io1[10] = clk_A ;
assign exter_io1[11] = ~clk_A ;
assign exter_io1[12] = clk_A ;
assign exter_io1[13] = ~clk_A ;
assign exter_io1[14] = clk_A ;
assign exter_io1[15] = ~clk_A ;
assign exter_io1[16] = clk_A ;
assign exter_io1[17] = ~clk_A ;
assign exter_io1[18] = clk_A ;
assign exter_io1[19] = ~clk_A ;
assign exter_io1[20] = clk_A ;
assign exter_io1[21] = ~clk_A ;
assign exter_io1[22] = clk_A ;
assign exter_io1[23] = ~clk_A ;
assign exter_io1[24] = clk_A ;
assign exter_io1[25] = ~clk_A ;
assign exter_io1[26] = clk_A ;
assign exter_io1[27] = ~clk_A ;
assign exter_io1[28] = clk_A ;
assign exter_io1[29] = ~clk_A ;
assign exter_io1[30] = clk_A ;
assign exter_io1[31] = ~clk_A ;
assign exter_io1[32] = clk_A ;
assign exter_io1[33] = ~clk_A ;

assign exter_io2[0] = clk_A ;
assign exter_io2[1] = ~clk_A ;
assign exter_io2[2] = clk_A ;
assign exter_io2[3] = ~clk_A ;
assign exter_io2[4] = clk_A ;
assign exter_io2[5] = ~clk_A ;
assign exter_io2[6] = clk_A ;
assign exter_io2[7] = ~clk_A ;
assign exter_io2[8] = clk_A ;
assign exter_io2[9] = ~clk_A ;
assign exter_io2[10] = clk_A ;
assign exter_io2[11] = ~clk_A ;
assign exter_io2[12] = clk_A ;
assign exter_io2[13] = ~clk_A ;
assign exter_io2[14] = clk_A ;
assign exter_io2[15] = ~clk_A ;
assign exter_io2[16] = clk_A ;
assign exter_io2[17] = ~clk_A ;
assign exter_io2[18] = clk_A ;
assign exter_io2[19] = ~clk_A ;
assign exter_io2[20] = clk_A ;
assign exter_io2[21] = ~clk_A ;
assign exter_io2[22] = clk_A ;
assign exter_io2[23] = ~clk_A ;
assign exter_io2[24] = clk_A ;
assign exter_io2[25] = ~clk_A ;
assign exter_io2[26] = clk_A ;
assign exter_io2[27] = ~clk_A ;
assign exter_io2[28] = clk_A ;
assign exter_io2[29] = ~clk_A ;
assign exter_io2[30] = clk_A ;
assign exter_io2[31] = ~clk_A ;
assign exter_io2[32] = clk_A ;
assign exter_io2[33] = ~clk_A ;
assign exter_io2[34] = clk_A ;
assign exter_io2[35] = ~clk_A ;
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//////////////////// 			    测试HDMI	 （DVP）       /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
 hdmi_top hdmi_top_m0(
    .clk        (clk        ),
    .rst_n      (key        ),
    
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

     .hdmi_clk_p    (hdmi_clk_p     ),
     .hdmi_clk_n    (hdmi_clk_n     ),
     .hdmi_data_p   (hdmi_data_p    ),
     .hdmi_data_n   (hdmi_data_n    )
 );


endmodule 