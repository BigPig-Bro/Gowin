// GW138_060CD all_test 工程顶层：按键LED/TF卡/UART/WS2812/外部IO + OV5640→DDR3→HDMI
// 摄像头链路封装在 ov5640_hdmi_top 中；K1选择输入：0=CMOS0，1=CMOS1
//260915    v1.0.0   初始版本

module top (
    input               i_clk_50m,   //系统时钟 50MHz
    input       [3:0]   i_key,       //按键，低有效
    output      [3:0]   o_led,       //LED

    input               i_uart_rx,   //UART接收
    output              o_uart_tx,   //UART发送

    //TF卡槽（SDIO，这里仅测试SPI模式）
    output              o_sd_ncs,    //chip select (SPI mode) SDIO D3
    output              o_sd_mosi,   //controller data output SDIO CMD
    output              o_sd_dclk,   //clock                  SDIO CLK
    input               i_sd_miso,   //controller data input  SDIO D0

    //WS2812
    output              o_ws2812_data,   //WS2812数据输出

    //HDMI
    output              o_hdmi_clk_p, o_hdmi_clk_n,
    output      [2:0]   o_hdmi_d_p, o_hdmi_d_n,

    //外部IO
    output      [33:0]  o_exter_io1, o_exter_io2,

    //CMOS0（当前使用）
    output              o_cmos0_scl,    //IIC时钟
    inout               io_cmos0_sda,   //IIC数据
    input               i_cmos0_vsync,  //场同步
    input               i_cmos0_href,   //行有效
    input               i_cmos0_pclk,   //像素时钟
    output              o_cmos0_rst_n,  //复位
    output              o_cmos0_pwdn,   //掉电
    input       [7:0]   i_cmos0_db,     //像素数据

    //CMOS1
    output              o_cmos1_scl,
    inout               io_cmos1_sda,
    input               i_cmos1_vsync,
    input               i_cmos1_href,
    input               i_cmos1_pclk,
    output              o_cmos1_rst_n,
    output              o_cmos1_pwdn,
    input       [7:0]   i_cmos1_db,

    //DDR3
    inout       [15:0]  ddr_dq,
    inout       [ 1:0]  ddr_dqs, ddr_dqs_n,
    output      [15:0]  ddr_addr,
    output      [ 2:0]  ddr_bank,
    output              ddr_ras,
    output              ddr_cas,
    output              ddr_we,
    output              ddr_reset_n,
    output              ddr_ck, ddr_ck_n,
    output              ddr_cke,
    output              ddr_cs,
    output      [ 1:0]  ddr_dm,
    output              ddr_odt
);

/********************************************************************************/
/**************************        内部信号          ***************************/
/********************************************************************************/

//时钟分频
logic [24:0] blink_cnt;
logic        blink_clk;

//TF卡
logic        sd_init_done;

/********************************************************************************/
/**************************        测试时钟输入        **************************/
/********************************************************************************/
// 50MHz 分频得到约 1.49Hz 方波，用于外部IO/按键LED测试
always@(posedge i_clk_50m)begin
    blink_cnt <= blink_cnt + 25'd1;
end

assign blink_clk = blink_cnt[24];

/********************************************************************************/
/**************************        测试按键LED         *************************/
/********************************************************************************/
//现象：按键按下，对应的LED闪，否则 LED2/3 闪烁，LED0/1 根据TF卡初始化状态闪烁
assign o_led[0] = ~i_key[0] ? blink_cnt[20] : sd_init_done ? blink_cnt[24] : blink_cnt[23];
assign o_led[1] = ~i_key[1] ? blink_cnt[20] : sd_init_done ? blink_cnt[24] : blink_cnt[23];
assign o_led[2] = ~i_key[2] ? blink_cnt[20] :                blink_cnt[24];
assign o_led[3] = ~i_key[3] ? blink_cnt[20] :                blink_cnt[24];

/********************************************************************************/
/**************************        测试TF卡读写        *************************/
/********************************************************************************/
//现象：TF卡初始化成功后，给出信号sd_init_done
sd_card_top sd_card_top_m0(
    .clk                    (i_clk_50m      ),
    .rst                    (~i_key[0]      ),

    .SD_nCS                 (o_sd_ncs       ),
    .SD_DCLK                (o_sd_dclk      ),
    .SD_MOSI                (o_sd_mosi      ),
    .SD_MISO                (i_sd_miso      ),

    .sd_init_done           (sd_init_done   ),
    .sd_sec_read            (1'b0           ),
    .sd_sec_read_addr       (32'd0          ),
    .sd_sec_read_data       (               ),
    .sd_sec_read_data_valid (               ),
    .sd_sec_read_end        (               ),
    .sd_sec_write           (1'b0           ),
    .sd_sec_write_addr      (32'd0          ),
    .sd_sec_write_data      (8'd0           ),
    .sd_sec_write_data_req  (               ),
    .sd_sec_write_end       (               )
);

/********************************************************************************/
/**************************        测试UART           *************************/
/********************************************************************************/
//回环测试
assign o_uart_tx = i_uart_rx;

/********************************************************************************/
/**************************        测试WS2812         *************************/
/********************************************************************************/
ws2812_top ws2812_top_m0(
    .i_sys_clk     (i_clk_50m     ),
    .i_rst_n       (i_key[0]      ),   //按键K0按下时复位
    .o_ws2812_data (o_ws2812_data )
);

/********************************************************************************/
/**************************        测试外部IO          *************************/
/********************************************************************************/
//现象：每个IO口输出方波，相邻IO相位互补
genvar g_i0;
genvar g_i1;

generate
    for(g_i0 = 0; g_i0 < 34; g_i0++)begin : g_exter_io1
        assign o_exter_io1[g_i0] = g_i0[0] ? ~blink_clk : blink_clk;
    end

    for(g_i1 = 0; g_i1 < 34; g_i1++)begin : g_exter_io2
        assign o_exter_io2[g_i1] = g_i1[0] ? ~blink_clk : blink_clk;
    end
endgenerate

/********************************************************************************/
/**************************   OV5640→DDR3→HDMI 链路   *************************/
/********************************************************************************/

ov5640_hdmi_top ov5640_hdmi_top_m0(
    .i_clk_50m     (i_clk_50m      ),
    .i_rst_n       (i_key[0]       ),   //按键K0按下时复位
    .i_key1        (i_key[1]       ),   //按键K1：0用CMOS0，1用CMOS1

    //CMOS0
    .o_cmos0_scl   (o_cmos0_scl    ),
    .io_cmos0_sda  (io_cmos0_sda   ),
    .i_cmos0_vsync (i_cmos0_vsync  ),
    .i_cmos0_href  (i_cmos0_href   ),
    .i_cmos0_pclk  (i_cmos0_pclk   ),
    .o_cmos0_rst_n (o_cmos0_rst_n  ),
    .o_cmos0_pwdn  (o_cmos0_pwdn   ),
    .i_cmos0_db    (i_cmos0_db     ),

    //CMOS1
    .o_cmos1_scl   (o_cmos1_scl    ),
    .io_cmos1_sda  (io_cmos1_sda   ),
    .i_cmos1_vsync (i_cmos1_vsync  ),
    .i_cmos1_href  (i_cmos1_href   ),
    .i_cmos1_pclk  (i_cmos1_pclk   ),
    .o_cmos1_rst_n (o_cmos1_rst_n  ),
    .o_cmos1_pwdn  (o_cmos1_pwdn   ),
    .i_cmos1_db    (i_cmos1_db     ),

    //HDMI
    .o_hdmi_clk_p  (o_hdmi_clk_p   ),
    .o_hdmi_clk_n  (o_hdmi_clk_n   ),
    .o_hdmi_d_p    (o_hdmi_d_p     ),
    .o_hdmi_d_n    (o_hdmi_d_n     ),

    //DDR3
    .ddr_dq        (ddr_dq         ),
    .ddr_dqs       (ddr_dqs        ),
    .ddr_dqs_n     (ddr_dqs_n      ),
    .ddr_addr      (ddr_addr       ),
    .ddr_bank      (ddr_bank       ),
    .ddr_ras       (ddr_ras        ),
    .ddr_cas       (ddr_cas        ),
    .ddr_we        (ddr_we         ),
    .ddr_reset_n   (ddr_reset_n    ),
    .ddr_ck        (ddr_ck         ),
    .ddr_ck_n      (ddr_ck_n       ),
    .ddr_cke       (ddr_cke        ),
    .ddr_cs        (ddr_cs         ),
    .ddr_dm        (ddr_dm         ),
    .ddr_odt       (ddr_odt        )
);

endmodule
