//OV5640 摄像头 DDR3 帧缓存 1024x768 HDMI 显示（GW138_060CD）
//260915    v1.0.0   初始版本
module top (
    input        i_clk_50m,   //系统时钟 50MHz
    input        i_rst_n,     //系统复位（按键K0），低有效

    output [ 3:0] o_led,      //状态指示灯

    //CMOS 接口
    output       o_cmos_scl,    //OV5640 IIC时钟
    inout        io_cmos_sda,   //OV5640 IIC数据
    input        i_cmos_vsync,  //OV5640 场同步
    input        i_cmos_href,   //OV5640 行有效
    input        i_cmos_pclk,   //OV5640 像素时钟
    input  [ 7:0] i_cmos_db,    //OV5640 像素数据
    output       o_cmos_rst_n,  //OV5640 复位
    output       o_cmos_pwdn,   //OV5640 掉电

    //HDMI 输出
    output       o_tmds_clk_p,  o_tmds_clk_n,//TMDS时钟
    output [2:0] o_tmds_data_p, o_tmds_data_n,//TMDS数据 {r,g,b}

    //DDR3 接口
    inout  [15:0] ddr_dq,
    inout  [ 1:0] ddr_dqs, ddr_dqs_n,
    output [15:0] ddr_addr,
    output [ 2:0] ddr_bank,
    output        ddr_ras,
    output        ddr_cas,
    output        ddr_we,
    output        ddr_reset_n,
    output        ddr_ck, ddr_ck_n,
    output        ddr_cke,
    output        ddr_cs,
    output [ 1:0] ddr_dm,
    output        ddr_odt
);

localparam P_MEM_ADDR_BITS = 29;          //DDR3地址位宽
localparam P_CLK_FRE   = 50_000_000;  //输入时钟频率 Hz
localparam P_RGB_MODE  = 4'd3;        //分辨率，3: 1024x768 @60Hz 65MHz
localparam P_IIC_FRE   = 100_000;     //OV5640 IIC 时钟 Hz

//时钟与复位
logic        rgb_clk;      //像素时钟
logic        rgb_clk_x5;   //TMDS串行时钟 x5
logic        hdmi4_rst_n;  //HDMI复位，低有效
logic        sys_rst_n;    //系统复位，低有效
logic        pll_lock;     //TMDS PLL锁定

//IIC 初始化状态
logic        iic_done;     //寄存器配置完成
logic        iic_error;    //IIC 无应答


//CMOS 采集（i_cmos_pclk 域）
logic [15:0] cam_rgb565;   //摄像头 RGB565 数据
logic        cam_pix_raw;  //8→16bit 模块的像素选通（自由振荡，需与行有效相与）
logic        cam_line_de;  //行有效（HREF 打拍）
logic        cam_pix_en;   //摄像头像素有效（行有效期内才写）

//显示时序（rgb_clk 域）
logic        rd_hs,   rd_vs,   rd_de;
logic        rd_hs_d, rd_vs_d, rd_de_d;
logic [15:0] rd_rgb565;    //读回 RGB565
logic [23:0] rd_rgb;       //读回 RGB888

//DDR3 APP 接口
logic [P_MEM_ADDR_BITS-1:0] app_addr;
logic [ 2:0]  app_cmd;
logic         app_en;
logic [127:0] app_wdf_data;
logic         app_wdf_end;
logic         app_wdf_wren;
logic [127:0] app_rd_data;
logic         app_rd_data_valid;
logic         app_rdy;
logic         app_wdf_rdy;
logic         ui_clk;
logic         init_calib_complete;
logic         memory_clk;
logic         memory_clk_lock;

/********************************************************************************/
/**************************        时钟与复位        ***************************/
/********************************************************************************/

boot_rst boot_rst_m0(
    .i_clk   (i_clk_50m     ),
    .i_rst_n (i_rst_n       ),
    .o_rst_n (sys_rst_n     )
);

rgb_clk_gen rgb_clk_gen_m0(
    .i_clk         (i_clk_50m     ),
    .i_rst_n       (sys_rst_n     ),
    .o_rgb_clk     (rgb_clk       ),
    .o_rgb_clk_x5  (rgb_clk_x5    ),
    .o_hdmi4_rst_n (hdmi4_rst_n   ),
    .o_pll_lock    (pll_lock      )
);

/********************************************************************************/
/**************************     OV5640 IIC 初始化    ***************************/
/********************************************************************************/

iic_top #(
    .P_CLK_FRE  (P_CLK_FRE    ),
    .P_IIC_FRE  (P_IIC_FRE    )
)iic_top_m0(
    .i_sys_clk   (i_clk_50m    ),
    .i_rst_n     (sys_rst_n    ),

    .o_iic_scl   (o_cmos_scl  ),
    .io_iic_sda  (io_cmos_sda ),

    .o_iic_done  (iic_done     ),
    .o_iic_error (iic_error    )
);

//OV5640 控制：掉电脚拉低、复位脚释放
assign o_cmos_pwdn  = 1'b0;
assign o_cmos_rst_n = 1'b1;

/********************************************************************************/
/**************************    CMOS 数据 8bit→16bit  ***************************/
/********************************************************************************/

//8bit 数据按字节相位合并为 16bit 像素；o_de 每 2 个 pclk 输出 1 个像素，作为写使能
cmos_8_16bit cmos_8_16bit_m0(
    .i_sys_clk (i_cmos_pclk  ),
    .i_rst_n   (sys_rst_n     ),
    .i_pdata   (i_cmos_db    ),
    .i_de      (i_cmos_href  ),

    .o_pdata   (cam_rgb565    ),
    .o_hblank  (cam_line_de   ),
    .o_de      (cam_pix_raw   )
);

//o_de 在消隐期也会翻转，必须与行有效相与，否则消隐期会误写像素冲乱整帧
assign cam_pix_en = cam_pix_raw & cam_line_de;

/********************************************************************************/
/**************************     读侧：显示时序       ***************************/
/********************************************************************************/

rgb_timing #(
    .P_RGB_MODE (P_RGB_MODE   )
)rgb_timing_rd_m0(
    .i_sys_clk  (rgb_clk      ),
    .i_rst_n    (sys_rst_n    ),

    .o_rgb_hs   (rd_hs        ),
    .o_rgb_vs   (rd_vs        ),
    .o_rgb_de   (rd_de        ),
    .o_rgb_x    (             ),
    .o_rgb_y    (             )
);

/********************************************************************************/
/**************************        DDR3 读写桥       ***************************/
/********************************************************************************/

ddr3_wr_top #(
    .P_MEM_WIDTH  (128             ),
    .P_PIX_WIDTH  (16              ),
    .P_MEM_DEPTH  (128             ),
    .P_BURST_LEN  (64              ),
    .P_ADDR_WIDTH (P_MEM_ADDR_BITS )
)ddr3_wr_top_m0(
    //写侧：摄像头像素时钟域
    .i_wr_clk               (i_cmos_pclk       ),
    .i_wr_rst_n             (sys_rst_n          ),
    .i_wr_hs                (i_cmos_vsync      ),
    .i_wr_vs                (i_cmos_vsync      ),
    .i_wr_de                (cam_pix_en         ),
    .i_wr_rgb               (cam_rgb565         ),

    //DDR3 APP 接口（ui_clk 域）
    .i_ui_clk               (ui_clk             ),
    .i_init_calib_complete  (init_calib_complete),
    .o_app_addr             (app_addr           ),
    .o_app_cmd              (app_cmd            ),
    .o_app_en               (app_en             ),
    .o_app_wdf_data         (app_wdf_data       ),
    .o_app_wdf_end          (app_wdf_end        ),
    .o_app_wdf_wren         (app_wdf_wren       ),
    .i_app_rd_data          (app_rd_data        ),
    .i_app_rd_data_valid    (app_rd_data_valid  ),
    .i_app_rdy              (app_rdy            ),
    .i_app_wdf_rdy          (app_wdf_rdy        ),

    //读侧：像素时钟域
    .i_rd_clk               (rgb_clk            ),
    .i_rd_rst_n             (hdmi4_rst_n        ),
    .i_rd_hs                (rd_hs              ),
    .i_rd_vs                (rd_vs              ),
    .i_rd_de                (rd_de              ),
    .o_rd_hs                (rd_hs_d            ),
    .o_rd_vs                (rd_vs_d            ),
    .o_rd_de                (rd_de_d            ),
    .o_rd_rgb               (rd_rgb565          )
);

//DDR3 PLL：50MHz→400MHz
ddr_pll ddr_pll_m0(
    .clk_in   (i_clk_50m      ),
    .clk_out0 (memory_clk     ),
    .locked   (memory_clk_lock)
);

//RGB565转RGB888：高位补低位
assign rd_rgb = {rd_rgb565[15:11], rd_rgb565[15:13],
                 rd_rgb565[10: 5], rd_rgb565[10: 9],
                 rd_rgb565[ 4: 0], rd_rgb565[ 4: 2]};

DDR3MI u_ddr3 (
    .clk                    (i_clk_50m           ),
    .pll_stop               (                    ),
    .memory_clk             (memory_clk          ),
    .pll_lock               (memory_clk_lock     ),
    .rst_n                  (i_rst_n             ),
    .clk_out                (ui_clk              ),
    .ddr_rst                (                    ),

    .init_calib_complete    (init_calib_complete ),
    .cmd_ready              (app_rdy             ),
    .cmd                    (app_cmd             ),
    .cmd_en                 (app_en              ),
    .addr                   (app_addr            ),
    .wr_data_rdy            (app_wdf_rdy         ),
    .wr_data                (app_wdf_data        ),
    .wr_data_en             (app_wdf_wren        ),
    .wr_data_end            (app_wdf_end         ),
    .wr_data_mask           (16'd0               ),
    .rd_data                (app_rd_data         ),
    .rd_data_valid          (app_rd_data_valid   ),
    .rd_data_end            (                    ),
    .burst                  (1'b1                ),
    .sr_req                 (1'b0                ),
    .ref_req                (1'b0                ),
    .sr_ack                 (                    ),
    .ref_ack                (                    ),

    .O_ddr_addr             (ddr_addr[14:0]      ),
    .O_ddr_ba               (ddr_bank            ),
    .O_ddr_cs_n             (ddr_cs              ),
    .O_ddr_ras_n            (ddr_ras             ),
    .O_ddr_cas_n            (ddr_cas             ),
    .O_ddr_we_n             (ddr_we              ),
    .O_ddr_clk              (ddr_ck              ),
    .O_ddr_clk_n            (ddr_ck_n            ),
    .O_ddr_cke              (ddr_cke             ),
    .O_ddr_odt              (ddr_odt             ),
    .O_ddr_reset_n          (ddr_reset_n         ),
    .O_ddr_dqm              (ddr_dm              ),
    .IO_ddr_dq              (ddr_dq              ),
    .IO_ddr_dqs             (ddr_dqs             ),
    .IO_ddr_dqs_n           (ddr_dqs_n           )
);

//DDR3MI 只输出 15 位地址，最高位固定为 0
assign ddr_addr[15] = 1'b0;

/********************************************************************************/
/**************************         HDMI 输出        ***************************/
/********************************************************************************/

svo_hdmi svo_hdmi_m0(
    .i_clk          (rgb_clk       ),
    .i_clk_5x       (rgb_clk_x5    ),
    .i_rst_n        (hdmi4_rst_n   ),

    .i_hs           (rd_hs_d       ),
    .i_vs           (rd_vs_d       ),
    .i_de           (rd_de_d       ),
    .i_data         (rd_rgb        ),

    .o_tmds_clk_n   (o_tmds_clk_n  ),
    .o_tmds_clk_p   (o_tmds_clk_p  ),
    .o_tmds_d_n     (o_tmds_data_n ),
    .o_tmds_d_p     (o_tmds_data_p )
);

/********************************************************************************/
/**************************        状态指示          ***************************/
/********************************************************************************/

assign o_led[0] = init_calib_complete;         //DDR3 初始化完成
assign o_led[1] = pll_lock & memory_clk_lock;  //两个 PLL 均锁定
assign o_led[2] = iic_done;                    //OV5640 寄存器配置完成
assign o_led[3] = iic_error;                   //IIC 无应答

endmodule
