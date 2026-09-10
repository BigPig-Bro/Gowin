// all_test 工程顶层：WS2812 + DDR3/OV5640/HDMI 1024x768 + UART回环 + 外部IO闪烁
//260910    v1.0.0   按Coder规范重构

module top (
    input        i_clk_27m,   //系统时钟 27MHz
    input        i_rst_n,     //T6复位按键，低有效
    input        i_key_c6,    //C6切换颜色按键，低有效

    input        i_uart_rx,   //UART接收
    output       o_uart_tx,   //UART发送

    output                o_cmos_scl,    //cmos i2c clock
    inout                 io_cmos_sda,   //cmos i2c data
    input                 i_cmos_vsync,  //cmos vsync
    input                 i_cmos_href,   //cmos hsync reference, data valid
    input                 i_cmos_pclk,   //cmos pixel clock
    input        [ 7:0]   i_cmos_db,     //cmos data
    output                o_cmos_rst_n,  //cmos reset
    output                o_cmos_pwdn,   //cmos power down

    output       [13:0]   o_ddr_addr,    //DDR3地址
    output       [ 2:0]   o_ddr_bank,    //DDR3 bank
    output                o_ddr_cs,
    output                o_ddr_ras,
    output                o_ddr_cas,
    output                o_ddr_we,
    output                o_ddr_ck,
    output                o_ddr_ck_n,
    output                o_ddr_cke,
    output                o_ddr_odt,
    output                o_ddr_reset_n,
    output       [ 1:0]   o_ddr_dm,      //DDR3 DQM
    inout        [15:0]   io_ddr_dq,     //DDR3 DQ
    inout        [ 1:0]   io_ddr_dqs,    //DDR3 DQS
    inout        [ 1:0]   io_ddr_dqs_n,  //DDR3 DQS_N

    output                o_tmds_clk_p,  //TMDS时钟+
    output                o_tmds_clk_n,  //TMDS时钟-
    output       [ 2:0]   o_tmds_data_p, //TMDS数据+ {r,g,b}
    output       [ 2:0]   o_tmds_data_n, //TMDS数据- {r,g,b}

    output                o_ws2812_io,   //WS2812数据输出
    output       [33:0]   o_exter_io1,   //外部IO1
    output       [35:0]   o_exter_io2    //外部IO2
);

`define USE_THREE_FRAME_BUFFER

localparam P_CLK_FRE       = 27_000_000;   //系统时钟频率 Hz
localparam P_KEY_CNT_W     = 3;            //按键计数位宽
localparam P_KEY_CNT_MAX   = 7;            //按键最大计数值，0~7循环
localparam P_ADDR_WIDTH    = 28;           //DDR3地址位宽
localparam P_DATA_WIDTH    = 128;          //DDR3数据位宽
localparam P_RD_VIDEO_WIDTH = 16;          //视频读出数据位宽
localparam P_PIXEL_NUM     = 1024;         //彩条像素宽度
localparam P_BAR_THRESHOLD = 384;          //彩条/摄像头分界行号
localparam P_DELAY_N       = 5;            //显示输出实际延时拍数

/********************************************************************************/
/**************************        内部信号          ***************************/
/********************************************************************************/

//复位链
logic        rst_deb;
logic        sys_rst_n;

//C6按键
logic        key_c6_sync;
logic [P_KEY_CNT_W-1:0] key_count;

//WS2812
logic [23:0] rgb888;
logic        ws2812_ready;
logic        ws2812_data_en;
logic        ws2812_done;

//外部IO闪烁
logic [24:0] blink_cnt;
logic        blink_clk;

//DDR3/视频
logic                    memory_clk;
logic                    dma_clk;
logic                    DDR_pll_lock;
logic                    cmd_ready;
logic        [2:0]       cmd;
logic                    cmd_en;
logic        [5:0]       app_burst_number;
logic        [P_ADDR_WIDTH-1:0] addr;
logic                    wr_data_rdy;
logic                    wr_data_en;
logic                    wr_data_end;
logic        [P_DATA_WIDTH-1:0] wr_data;
logic        [P_DATA_WIDTH/8-1:0] wr_data_mask;
logic                    rd_data_valid;
logic                    rd_data_end;
logic        [P_DATA_WIDTH-1:0] rd_data;
logic                    init_calib_complete;

logic                    rgb_clk;
logic                    rgb_clk_x5;
logic                    hdmi4_rst_n;

logic                    rgb_vs;
logic                    rgb_hs;
logic                    off0_syn_de;
logic [P_RD_VIDEO_WIDTH-1:0] off0_syn_data;

logic        [15:0]      cmos_16bit_data;
logic                    cmos_16bit_clk;
logic                    cmos_16bit_wr;
logic        [15:0]      write_data;

logic                    rgb_de;
logic        [10:0]      rgb_x;
logic        [10:0]      rgb_y;
logic        [10:0]      hdmi_x;
logic        [10:0]      hdmi_y;
logic        [10:0]      rgb_x_dn [0:P_DELAY_N-1];
logic        [10:0]      rgb_y_dn [0:P_DELAY_N-1];

logic        [P_DELAY_N-1:0] Pout_hs_dn;
logic        [P_DELAY_N-1:0] Pout_vs_dn;
logic        [P_DELAY_N-1:0] Pout_de_dn;

//HDMI同步数据流
logic                       hdmi_hs;
logic                       hdmi_vs;
logic                       hdmi_de;
logic        [23:0]         hdmi_data;
logic        [23:0]         bar_rgb;   //彩条颜色，rgb_clk时序逻辑输出

/********************************************************************************/
/**************************        复位链（T6）        **************************/
/********************************************************************************/

key_sync #(
    .P_CLK_FRE      (P_CLK_FRE      ),
    .P_KEY_IN_MODE  (1'b0           ),
    .P_KEY_OUT_MODE (1'b0           )
)key_sync_rst_m0(
    .i_sys_clk      (i_clk_27m      ),
    .i_key_async    (i_rst_n        ),
    .o_key_sync     (rst_deb        )
);

boot_rst boot_rst_m0(
    .i_clk   (i_clk_27m  ),
    .i_rst_n (rst_deb    ),
    .o_rst_n (sys_rst_n  )
);

/********************************************************************************/
/**************************        WS2812（C6）        **************************/
/********************************************************************************/

key_sync #(
    .P_CLK_FRE      (P_CLK_FRE      ),
    .P_KEY_IN_MODE  (1'b0           ),
    .P_KEY_OUT_MODE (1'b0           )
)key_sync_c6_m0(
    .i_sys_clk      (i_clk_27m      ),
    .i_key_async    (i_key_c6       ),
    .o_key_sync     (key_c6_sync    )
);

key_cnt #(
    .P_CLK_FRE (P_CLK_FRE     ),
    .P_CNT     (P_KEY_CNT_W   ),
    .P_CNT_MAX (P_KEY_CNT_MAX )
)key_cnt_m0(
    .i_sys_clk  (i_clk_27m   ),
    .i_rst_n    (sys_rst_n   ),
    .i_key_in   (key_c6_sync ),

    .o_key_cnt  (key_count   )
);

always@(*)begin
    case(key_count)
        3'd0: rgb888 = 24'h020000;  //红，低亮度
        3'd1: rgb888 = 24'h000200;  //绿，低亮度
        3'd2: rgb888 = 24'h000002;  //蓝，低亮度
        3'd3: rgb888 = 24'h020202;  //白，低亮度
        3'd4: rgb888 = 24'h020200;  //黄，低亮度
        3'd5: rgb888 = 24'h000202;  //青，低亮度
        3'd6: rgb888 = 24'h020002;  //紫，低亮度
        default: rgb888 = 24'h020200;  //橙，低亮度
    endcase
end

assign ws2812_data_en = ws2812_ready;

ws2812 #(
    .P_LED_NUM (1            ),
    .P_CLK_FRE (P_CLK_FRE    )
)ws2812_m0(
    .i_sys_clk   (i_clk_27m      ),
    .i_rst_n     (sys_rst_n      ),

    .i_rgb888    (rgb888         ),
    .i_data_en   (ws2812_data_en ),

    .o_ready     (ws2812_ready   ),
    .o_done      (ws2812_done    ),
    .o_ws2812_di (o_ws2812_io    )
);

/********************************************************************************/
/**************************        UART 回环           **************************/
/********************************************************************************/

assign o_uart_tx = i_uart_rx;

/********************************************************************************/
/**************************        外部IO闪烁          **************************/
/********************************************************************************/

always@(posedge i_clk_27m)begin
    if(!sys_rst_n)begin
        blink_cnt <= 25'd0;
    end else begin
        blink_cnt <= blink_cnt + 25'd1;
    end
end

assign blink_clk = blink_cnt[24];

assign o_exter_io1[0] = blink_clk;
assign o_exter_io1[1] = ~blink_clk;
assign o_exter_io1[2] = blink_clk;
assign o_exter_io1[3] = ~blink_clk;
assign o_exter_io1[4] = blink_clk;
assign o_exter_io1[5] = ~blink_clk;
assign o_exter_io1[6] = blink_clk;
assign o_exter_io1[7] = ~blink_clk;
assign o_exter_io1[8] = blink_clk;
assign o_exter_io1[9] = ~blink_clk;
assign o_exter_io1[10] = blink_clk;
assign o_exter_io1[11] = ~blink_clk;
assign o_exter_io1[12] = blink_clk;
assign o_exter_io1[13] = ~blink_clk;
assign o_exter_io1[14] = blink_clk;
assign o_exter_io1[15] = ~blink_clk;
assign o_exter_io1[16] = blink_clk;
assign o_exter_io1[17] = ~blink_clk;
assign o_exter_io1[18] = blink_clk;
assign o_exter_io1[19] = ~blink_clk;
assign o_exter_io1[20] = blink_clk;
assign o_exter_io1[21] = ~blink_clk;
assign o_exter_io1[22] = blink_clk;
assign o_exter_io1[23] = ~blink_clk;
assign o_exter_io1[24] = blink_clk;
assign o_exter_io1[25] = ~blink_clk;
assign o_exter_io1[26] = blink_clk;
assign o_exter_io1[27] = ~blink_clk;
assign o_exter_io1[28] = blink_clk;
assign o_exter_io1[29] = ~blink_clk;
assign o_exter_io1[30] = blink_clk;
assign o_exter_io1[31] = ~blink_clk;
assign o_exter_io1[32] = blink_clk;
assign o_exter_io1[33] = ~blink_clk;

assign o_exter_io2[0] = blink_clk;
assign o_exter_io2[1] = ~blink_clk;
assign o_exter_io2[2] = blink_clk;
assign o_exter_io2[3] = ~blink_clk;
assign o_exter_io2[4] = blink_clk;
assign o_exter_io2[5] = ~blink_clk;
assign o_exter_io2[6] = blink_clk;
assign o_exter_io2[7] = ~blink_clk;
assign o_exter_io2[8] = blink_clk;
assign o_exter_io2[9] = ~blink_clk;
assign o_exter_io2[10] = blink_clk;
assign o_exter_io2[11] = ~blink_clk;
assign o_exter_io2[12] = blink_clk;
assign o_exter_io2[13] = ~blink_clk;
assign o_exter_io2[14] = blink_clk;
assign o_exter_io2[15] = ~blink_clk;
assign o_exter_io2[16] = blink_clk;
assign o_exter_io2[17] = ~blink_clk;
assign o_exter_io2[18] = blink_clk;
assign o_exter_io2[19] = ~blink_clk;
assign o_exter_io2[20] = blink_clk;
assign o_exter_io2[21] = ~blink_clk;
assign o_exter_io2[22] = blink_clk;
assign o_exter_io2[23] = ~blink_clk;
assign o_exter_io2[24] = blink_clk;
assign o_exter_io2[25] = ~blink_clk;
assign o_exter_io2[26] = blink_clk;
assign o_exter_io2[27] = ~blink_clk;
assign o_exter_io2[28] = blink_clk;
assign o_exter_io2[29] = ~blink_clk;
assign o_exter_io2[30] = blink_clk;
assign o_exter_io2[31] = ~blink_clk;
assign o_exter_io2[32] = blink_clk;
assign o_exter_io2[33] = ~blink_clk;
assign o_exter_io2[34] = blink_clk;
assign o_exter_io2[35] = ~blink_clk;

/********************************************************************************/
/**************************        画面合成（彩条+摄像头） ***********************/
/********************************************************************************/

function automatic logic [23:0] bar_color(input integer k);
begin
    case(k)
        0:  bar_color = 24'h800000;
        1:  bar_color = 24'h400000;
        2:  bar_color = 24'h200000;
        3:  bar_color = 24'h100000;
        4:  bar_color = 24'h080000;
        5:  bar_color = 24'h040000;
        6:  bar_color = 24'h020000;
        7:  bar_color = 24'h010000;
        8:  bar_color = 24'h008000;
        9:  bar_color = 24'h004000;
        10: bar_color = 24'h002000;
        11: bar_color = 24'h001000;
        12: bar_color = 24'h000800;
        13: bar_color = 24'h000400;
        14: bar_color = 24'h000200;
        15: bar_color = 24'h000100;
        16: bar_color = 24'h000080;
        17: bar_color = 24'h000040;
        18: bar_color = 24'h000020;
        19: bar_color = 24'h000010;
        20: bar_color = 24'h000008;
        21: bar_color = 24'h000004;
        22: bar_color = 24'h000002;
        default: bar_color = 24'h000001;
    endcase
end
endfunction

/********************************************************************************/
/**************************        显示输出延时          *************************/
/********************************************************************************/

assign hdmi_x = rgb_x_dn[P_DELAY_N-1];
assign hdmi_y = rgb_y_dn[P_DELAY_N-1];

//彩条颜色：rgb_clk 时序逻辑，根据 hdmi_x 选择颜色
always@(posedge rgb_clk)begin
    if(!sys_rst_n)begin
        bar_rgb <= 24'h000001;
    end else if(hdmi_x < (P_PIXEL_NUM / 24) * 1)begin
        bar_rgb <= bar_color(0);
    end else if(hdmi_x < (P_PIXEL_NUM / 24) * 2)begin
        bar_rgb <= bar_color(1);
    end else if(hdmi_x < (P_PIXEL_NUM / 24) * 3)begin
        bar_rgb <= bar_color(2);
    end else if(hdmi_x < (P_PIXEL_NUM / 24) * 4)begin
        bar_rgb <= bar_color(3);
    end else if(hdmi_x < (P_PIXEL_NUM / 24) * 5)begin
        bar_rgb <= bar_color(4);
    end else if(hdmi_x < (P_PIXEL_NUM / 24) * 6)begin
        bar_rgb <= bar_color(5);
    end else if(hdmi_x < (P_PIXEL_NUM / 24) * 7)begin
        bar_rgb <= bar_color(6);
    end else if(hdmi_x < (P_PIXEL_NUM / 24) * 8)begin
        bar_rgb <= bar_color(7);
    end else if(hdmi_x < (P_PIXEL_NUM / 24) * 9)begin
        bar_rgb <= bar_color(8);
    end else if(hdmi_x < (P_PIXEL_NUM / 24) * 10)begin
        bar_rgb <= bar_color(9);
    end else if(hdmi_x < (P_PIXEL_NUM / 24) * 11)begin
        bar_rgb <= bar_color(10);
    end else if(hdmi_x < (P_PIXEL_NUM / 24) * 12)begin
        bar_rgb <= bar_color(11);
    end else if(hdmi_x < (P_PIXEL_NUM / 24) * 13)begin
        bar_rgb <= bar_color(12);
    end else if(hdmi_x < (P_PIXEL_NUM / 24) * 14)begin
        bar_rgb <= bar_color(13);
    end else if(hdmi_x < (P_PIXEL_NUM / 24) * 15)begin
        bar_rgb <= bar_color(14);
    end else if(hdmi_x < (P_PIXEL_NUM / 24) * 16)begin
        bar_rgb <= bar_color(15);
    end else if(hdmi_x < (P_PIXEL_NUM / 24) * 17)begin
        bar_rgb <= bar_color(16);
    end else if(hdmi_x < (P_PIXEL_NUM / 24) * 18)begin
        bar_rgb <= bar_color(17);
    end else if(hdmi_x < (P_PIXEL_NUM / 24) * 19)begin
        bar_rgb <= bar_color(18);
    end else if(hdmi_x < (P_PIXEL_NUM / 24) * 20)begin
        bar_rgb <= bar_color(19);
    end else if(hdmi_x < (P_PIXEL_NUM / 24) * 21)begin
        bar_rgb <= bar_color(20);
    end else if(hdmi_x < (P_PIXEL_NUM / 24) * 22)begin
        bar_rgb <= bar_color(21);
    end else if(hdmi_x < (P_PIXEL_NUM / 24) * 23)begin
        bar_rgb <= bar_color(22);
    end else begin
        bar_rgb <= bar_color(23);
    end
end

//时序合成：彩条/摄像头/DE/数据统一在 rgb_clk 时钟域打拍输出
always@(posedge rgb_clk)begin
    if(!sys_rst_n)begin
        hdmi_hs   <= 1'b1;
        hdmi_vs   <= 1'b1;
        hdmi_de   <= 1'b0;
        hdmi_data <= 24'd0;
    end else begin
        hdmi_hs   <= Pout_hs_dn[P_DELAY_N-1];
        hdmi_vs   <= Pout_vs_dn[P_DELAY_N-1];
        hdmi_de   <= Pout_de_dn[P_DELAY_N-1];

        if(Pout_de_dn[P_DELAY_N-1])begin
            if(hdmi_y < P_BAR_THRESHOLD)begin
                hdmi_data <= bar_rgb;
            end else if(off0_syn_de)begin
                hdmi_data <= {off0_syn_data[15:11], 3'd0,
                              off0_syn_data[10:5], 2'd0,
                              off0_syn_data[4:0], 3'd0};
            end else begin
                hdmi_data <= 24'd0;
            end
        end else begin
            hdmi_data <= 24'd0;
        end
    end
end

always@(posedge rgb_clk)begin
    if(!sys_rst_n)begin
        Pout_hs_dn <= {P_DELAY_N{1'b1}};
        Pout_vs_dn <= {P_DELAY_N{1'b1}};
        Pout_de_dn <= {P_DELAY_N{1'b0}};
        for(int i = 0; i < P_DELAY_N; i++)begin
            rgb_x_dn[i] <= 'd0;
            rgb_y_dn[i] <= 'd0;
        end
    end else begin
        Pout_hs_dn <= {Pout_hs_dn[P_DELAY_N-2:0], rgb_hs};
        Pout_vs_dn <= {Pout_vs_dn[P_DELAY_N-2:0], rgb_vs};
        Pout_de_dn <= {Pout_de_dn[P_DELAY_N-2:0], rgb_de};
        rgb_x_dn[0] <= rgb_x;
        rgb_y_dn[0] <= rgb_y;
        for(int i = 1; i < P_DELAY_N; i++)begin
            rgb_x_dn[i] <= rgb_x_dn[i-1];
            rgb_y_dn[i] <= rgb_y_dn[i-1];
        end
    end
end

/********************************************************************************/
/**************************     DRAM 控制器时钟          *************************/
/********************************************************************************/

mem_pll mem_pll_m0(
    .clkin  (i_clk_27m   ),
    .clkout (memory_clk  ),
    .lock   (DDR_pll_lock)
);

/********************************************************************************/
/**************************        RGB 时钟生成         **************************/
/********************************************************************************/

rgb_clk_gen rgb_clk_gen_m0(
    .i_clk         (i_clk_27m    ),
    .i_rst_n       (sys_rst_n    ),
    .o_rgb_clk     (rgb_clk    ),
    .o_rgb_clk_x5  (rgb_clk_x5   ),
    .o_hdmi4_rst_n (hdmi4_rst_n  )
);

/********************************************************************************/
/**************************    IIC 初始化(OV5640)        *************************/
/********************************************************************************/

assign o_cmos_pwdn  = 1'b0;
assign o_cmos_rst_n = 1'b1;

iic_top #(
    .CLK_FRE           (27        ),
    .IIC_FRE           (100       ),
    .IIC_SLAVE_REG_EX  (1         ),
    .IIC_SLAVE_ADDR_EX (0         ),
    .IIC_SLAVE_ADDR    (16'h78    )
)iic_top_m0(
    .i_sys_clk   (i_clk_27m     ),
    .i_rst_n     (sys_rst_n     ),
    .o_iic_scl   (o_cmos_scl    ),
    .io_iic_sda  (io_cmos_sda   ),
    .o_iic_done  (              ),
    .o_iic_error (              )
);

/********************************************************************************/
/**************************    CMOS 8bit->16bit          *************************/
/********************************************************************************/

cmos_8_16bit cmos_8_16bit_m0(
    .i_sys_clk (i_cmos_pclk     ),
    .i_rst_n   (sys_rst_n       ),
    .i_pdata   (i_cmos_db       ),
    .i_de      (i_cmos_href     ),
    .o_pdata   (cmos_16bit_data ),
    .o_hblank  (cmos_16bit_wr   ),
    .o_de      (cmos_16bit_clk  )
);

/********************************************************************************/
/**************************    显示时序 rgb_timing       *************************/
/********************************************************************************/

rgb_timing #(
    .P_RGB_MODE (3)   //3: 1024x768 @60Hz
)rgb_timing_m0(
    .i_sys_clk (rgb_clk   ),
    .i_rst_n   (sys_rst_n ),
    .o_rgb_hs  (rgb_hs    ),
    .o_rgb_vs  (rgb_vs    ),
    .o_rgb_de  (rgb_de    ),
    .o_rgb_x   (rgb_x     ),
    .o_rgb_y   (rgb_y     )
);

/********************************************************************************/
/**************************    DDR3 视频帧缓存          *************************/
/********************************************************************************/

assign write_data = {cmos_16bit_data[4:0], cmos_16bit_data[10:5], cmos_16bit_data[15:11]};

Video_Frame_Buffer_Top Video_Frame_Buffer_Top_m0(
    .I_rst_n               (init_calib_complete    ),
    .I_dma_clk             (dma_clk                ),
`ifdef USE_THREE_FRAME_BUFFER
    .I_wr_halt             (1'd0                   ),
    .I_rd_halt             (1'd0                   ),
`endif
    .I_vin0_clk            (cmos_16bit_clk         ),
    .I_vin0_vs_n           (~i_cmos_vsync          ),
    .I_vin0_de             (cmos_16bit_wr          ),
    .I_vin0_data           (write_data             ),
    .O_vin0_fifo_full      (                       ),

    .I_vout0_clk           (rgb_clk              ),
    .I_vout0_vs_n          (rgb_vs            ),
    .I_vout0_de            (rgb_de                 ),
    .O_vout0_den           (off0_syn_de            ),
    .O_vout0_data          (off0_syn_data          ),
    .O_vout0_fifo_empty    (                       ),

    .I_cmd_ready           (cmd_ready              ),
    .O_cmd                 (cmd                    ),
    .O_cmd_en              (cmd_en                 ),
    .O_app_burst_number    (app_burst_number       ),
    .O_addr                (addr                   ),
    .I_wr_data_rdy         (wr_data_rdy            ),
    .O_wr_data_en          (wr_data_en             ),
    .O_wr_data_end         (wr_data_end            ),
    .O_wr_data             (wr_data                ),
    .O_wr_data_mask        (wr_data_mask           ),
    .I_rd_data_valid       (rd_data_valid          ),
    .I_rd_data_end         (rd_data_end            ),
    .I_rd_data             (rd_data                ),
    .I_init_calib_complete (init_calib_complete    )
);

/********************************************************************************/
/**************************    DDR3 内存接口            *************************/
/********************************************************************************/

DDR3MI DDR3MI_m0(
    .clk                 (rgb_clk              ),
    .memory_clk          (memory_clk             ),
    .pll_lock            (DDR_pll_lock           ),
    .rst_n               (sys_rst_n              ),
    .app_burst_number    (app_burst_number       ),
    .cmd_ready           (cmd_ready              ),
    .cmd                 (cmd                    ),
    .cmd_en              (cmd_en                 ),
    .addr                (addr                   ),
    .wr_data_rdy         (wr_data_rdy            ),
    .wr_data             (wr_data                ),
    .wr_data_en          (wr_data_en             ),
    .wr_data_end         (wr_data_end            ),
    .wr_data_mask        (wr_data_mask           ),
    .rd_data             (rd_data                ),
    .rd_data_valid       (rd_data_valid          ),
    .rd_data_end         (rd_data_end            ),
    .sr_req              (1'b0                   ),
    .ref_req             (1'b0                   ),
    .sr_ack              (                       ),
    .ref_ack             (                       ),
    .init_calib_complete (init_calib_complete    ),
    .clk_out             (dma_clk                ),
    .burst               (1'b1                   ),
    .ddr_rst             (                       ),
    .O_ddr_addr          (o_ddr_addr             ),
    .O_ddr_ba            (o_ddr_bank             ),
    .O_ddr_cs_n          (o_ddr_cs               ),
    .O_ddr_ras_n         (o_ddr_ras              ),
    .O_ddr_cas_n         (o_ddr_cas              ),
    .O_ddr_we_n          (o_ddr_we               ),
    .O_ddr_clk           (o_ddr_ck               ),
    .O_ddr_clk_n         (o_ddr_ck_n             ),
    .O_ddr_cke           (o_ddr_cke              ),
    .O_ddr_odt           (o_ddr_odt              ),
    .O_ddr_reset_n       (o_ddr_reset_n          ),
    .O_ddr_dqm           (o_ddr_dm               ),
    .IO_ddr_dq           (io_ddr_dq              ),
    .IO_ddr_dqs          (io_ddr_dqs             ),
    .IO_ddr_dqs_n        (io_ddr_dqs_n           )
);

/********************************************************************************/
/**************************    TMDS TX(HDMI)            *************************/
/********************************************************************************/

DVI_TX_Top DVI_TX_Top_m0(
    .I_rst_n       (hdmi4_rst_n    ),
    .I_serial_clk  (rgb_clk_x5     ),
    .I_rgb_clk     (rgb_clk      ),
    .I_rgb_vs      (hdmi_vs        ),
    .I_rgb_hs      (hdmi_hs        ),
    .I_rgb_de      (hdmi_de        ),
    .I_rgb_r       (hdmi_data[23:16]),
    .I_rgb_g       (hdmi_data[15:8] ),
    .I_rgb_b       (hdmi_data[7:0]  ),
    .O_tmds_clk_p  (o_tmds_clk_p   ),
    .O_tmds_clk_n  (o_tmds_clk_n   ),
    .O_tmds_data_p (o_tmds_data_p  ),
    .O_tmds_data_n (o_tmds_data_n  )
);

endmodule
