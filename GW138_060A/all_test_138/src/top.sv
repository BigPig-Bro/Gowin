module top(
    input               i_clk,

    input       [3:0]   i_key,
    output      [3:0]   o_led,

    input               i_uart_rx,
    output              o_uart_tx,

    //TF卡槽（SDIO，这里仅测试SPI模式）
	output              sd_ncs,    //chip select (SPI mode) SDIO D3
    output              sd_mosi,   //controller data output SDIO CMD
    output              sd_dclk,   //clock                  SDIO CLK
    input               sd_miso,   //controller data input  SDIO D0

    output              o_hdmi_clk_p,
    output              o_hdmi_clk_n,
    output      [2:0]   o_hdmi_d_p,
    output      [2:0]   o_hdmi_d_n,

    output      [33:0]  exter_io1,exter_io2,
    output      [35:0]  exter_io3,exter_io4
);
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//////////////////// 			    测试时钟输入 	         /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
// 降低到hz，生成分频信号1hz A
logic [24:0] cnt;
always@(posedge i_clk)
    cnt <= cnt + 1;

logic clk_A ;
assign clk_A = cnt[24];

/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//////////////////// 		        测试按键LED	            /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//现象：按键按下，对应的LED灭，否则 23闪烁 01如果TF卡初始化成功，闪烁，未成功常亮

assign   o_led[0] = i_key[0] ? 1'd1 : sd_init_done? cnt[24] : cnt[23];
assign   o_led[1] = i_key[1] ? 1'd1 : sd_init_done? cnt[24] : cnt[23];
assign   o_led[2] = i_key[2] ? 1'd1 :                      	  cnt[24];
assign   o_led[3] = i_key[3] ? 1'd1 :                      	  cnt[24];


/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//////////////////// 		        测试TF卡读写	         /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//现象：TF卡初始化成功后，给出信号sd_init_done
logic sd_init_done;
sd_card_top  sd_card_top_m0(
	.clk                       (sys_clk                    ),
	.rst                       (~rst_n                     ),

	.SD_nCS                    (sd_ncs                     ),
	.SD_DCLK                   (sd_dclk                    ),
	.SD_MOSI                   (sd_mosi                    ),
	.SD_MISO                   (sd_miso                    ),

	.sd_init_done              (sd_init_done               ),
	.sd_sec_read               (                           ),
	.sd_sec_read_addr          (                           ),
	.sd_sec_read_data          (                           ),
	.sd_sec_read_data_valid    (                           ),
	.sd_sec_read_end           (                           ),
	.sd_sec_write              (                           ),
	.sd_sec_write_addr         (                           ),
	.sd_sec_write_data         (                           ),
	.sd_sec_write_data_req     (                           ),
	.sd_sec_write_end          (                           )
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
assign o_uart_tx = i_uart_rx;

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

assign exter_io3[0] = clk_A ;
assign exter_io3[1] = ~clk_A ;
assign exter_io3[2] = clk_A ;
assign exter_io3[3] = ~clk_A ;
assign exter_io3[4] = clk_A ;
assign exter_io3[5] = ~clk_A ;
assign exter_io3[6] = clk_A ;
assign exter_io3[7] = ~clk_A ;
assign exter_io3[8] = clk_A ;
assign exter_io3[9] = ~clk_A ;
assign exter_io3[10] = clk_A ;
assign exter_io3[11] = ~clk_A ;
assign exter_io3[12] = clk_A ;
assign exter_io3[13] = ~clk_A ;
assign exter_io3[14] = clk_A ;
assign exter_io3[15] = ~clk_A ;
assign exter_io3[16] = clk_A ;
assign exter_io3[17] = ~clk_A ;
assign exter_io3[18] = clk_A ;
assign exter_io3[19] = ~clk_A ;
assign exter_io3[20] = clk_A ;
assign exter_io3[21] = ~clk_A ;
assign exter_io3[22] = clk_A ;
assign exter_io3[23] = ~clk_A ;
assign exter_io3[24] = clk_A ;
assign exter_io3[25] = ~clk_A ;
assign exter_io3[26] = clk_A ;
assign exter_io3[27] = ~clk_A ;
assign exter_io3[28] = clk_A ;
assign exter_io3[29] = ~clk_A ;
assign exter_io3[30] = clk_A ;
assign exter_io3[31] = ~clk_A ;
assign exter_io3[32] = clk_A ;
assign exter_io3[33] = ~clk_A ;
assign exter_io3[34] = clk_A ;
assign exter_io3[35] = ~clk_A ;

assign exter_io4[0] = clk_A ;
assign exter_io4[1] = ~clk_A ;
assign exter_io4[2] = clk_A ;
assign exter_io4[3] = ~clk_A ;
assign exter_io4[4] = clk_A ;
assign exter_io4[5] = ~clk_A ;
assign exter_io4[6] = clk_A ;
assign exter_io4[7] = ~clk_A ;
assign exter_io4[8] = clk_A ;
assign exter_io4[9] = ~clk_A ;
assign exter_io4[10] = clk_A ;
assign exter_io4[11] = ~clk_A ;
assign exter_io4[12] = clk_A ;
assign exter_io4[13] = ~clk_A ;
assign exter_io4[14] = clk_A ;
assign exter_io4[15] = ~clk_A ;
assign exter_io4[16] = clk_A ;
assign exter_io4[17] = ~clk_A ;
assign exter_io4[18] = clk_A ;
assign exter_io4[19] = ~clk_A ;
assign exter_io4[20] = clk_A ;
assign exter_io4[21] = ~clk_A ;
assign exter_io4[22] = clk_A ;
assign exter_io4[23] = ~clk_A ;
assign exter_io4[24] = clk_A ;
assign exter_io4[25] = ~clk_A ;
assign exter_io4[26] = clk_A ;
assign exter_io4[27] = ~clk_A ;
assign exter_io4[28] = clk_A ;
assign exter_io4[29] = ~clk_A ;
assign exter_io4[30] = clk_A ;
assign exter_io4[31] = ~clk_A ;
assign exter_io4[32] = clk_A ;
assign exter_io4[33] = ~clk_A ;
assign exter_io4[34] = clk_A ;
assign exter_io4[35] = ~clk_A ;
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//////////////////// 			    测试HDMI	            /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
logic video_clk_lock;
logic video_clk_x5,video_clk;

Gowin_PLL Gowin_PLL_inst(
    .lock       (video_clk_lock     ), //output lock
    .clkout0    (video_clk_x5       ), //output clkout0
    .clkin      (i_clk              ) //input clkin
);

Gowin_CLKDIV Gowin_CLKDIV_inst(
    .clkout     (video_clk           ), //output clkout
    .hclkin     (video_clk_x5        ), //input hclkin
    .resetn     (video_clk_lock      ) //input resetn
);

svo_hdmi svo_hdmi_inst_0 (
	.clk            (video_clk          ),
	.resetn         (1'b1               ),

	// video clocks
	.clk_pixel      (video_clk          ),
	.clk_5x_pixel   (video_clk_x5       ),
	.locked         (video_clk_lock     ),

	// output signals
	.tmds_clk_n     (o_hdmi_clk_n         ),
	.tmds_clk_p     (o_hdmi_clk_p         ),
	.tmds_d_n       (o_hdmi_d_n           ),
	.tmds_d_p       (o_hdmi_d_p           )
);

endmodule 