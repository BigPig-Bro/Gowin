// HDMI 720P RGB 位检测测试工程（顶层）
//260906    v1.0.0   按Coder规范重构：引入boot_rst/rgb_timing/rgb_test/key_sync/key_cnt，替换vga_timing
module top (
    input        i_clk_27m,   //系统时钟 27MHz
    input        i_rst_n,     //系统复位，低有效

    input        i_key,       //按键输入，按下为低电平

    output       o_tmds_clk_p, //TMDS时钟正
    output       o_tmds_clk_n, //TMDS时钟负
    output [2:0] o_tmds_data_p,//TMDS数据正 {r,g,b}
    output [2:0] o_tmds_data_n //TMDS数据负
);

localparam P_CLK_FRE = 27_000_000;  //输入时钟频率 Hz
/********************************************************************************/
/**************************    时钟复位与按键（i_clk_27m）  **********************/
/********************************************************************************/

logic        rgb_clk;      //像素时钟
logic        rgb_clk_x5;   //TMDS串行时钟 x5
logic        hdmi4_rst_n;  //HDMI复位，低有效
logic        sys_rst_n;    //系统复位，低有效
logic        key_deb;      //消抖后的按键信号，按下为低电平
logic [ 1:0] mode_sel;     //测试模式选择

key_sync #(
    .P_CLK_FRE       (P_CLK_FRE      ),
    .P_KEY_IN_MODE   (1'd0           ),
    .P_KEY_OUT_MODE  (1'd0           )
)key_sync_m1(
    .i_sys_clk       (i_clk_27m      ),
    .i_key_async     (i_key          ),
    .o_key_sync      (key_deb        )
);

rgb_clk_gen rgb_clk_gen_m0(
    .i_clk         (i_clk_27m     ),
    .i_rst_n       (i_rst_n       ),
    .o_rgb_clk     (rgb_clk       ),
    .o_rgb_clk_x5  (rgb_clk_x5    ),
    .o_hdmi4_rst_n (hdmi4_rst_n    )
);

boot_rst boot_rst_m0(
    .i_clk   (i_clk_27m     ),
    .i_rst_n (hdmi4_rst_n    ),
    .o_rst_n (sys_rst_n     )
);


/********************************************************************************/
/**************************    视频时序与测试图形（rgb_clk） *********************/
/********************************************************************************/

logic        rgb_hs;     //水平同步
logic        rgb_vs;     //垂直同步
logic        rgb_de;     //数据有效
logic        hdmi_hs;    //HDMI水平同步
logic        hdmi_vs;    //HDMI垂直同步
logic        hdmi_de;    //HDMI数据有效
logic [23:0] hdmi_rgb;   //HDMI RGB数据

key_cnt #(
    .P_CLK_FRE (P_CLK_FRE     ),
    .P_CNT     (2'd2          ),
    .P_CNT_MAX (2'd3          )
)key_cnt_m0(
    .i_sys_clk (i_clk_27m     ),
    .i_rst_n   (sys_rst_n     ),
    .i_key_in  (key_deb       ),
    .o_key_cnt (mode_sel      )
);

rgb_timing #(
    .P_RGB_MODE (4'd4          )  //4: 1280x720
)rgb_timing_m0(
    .i_sys_clk  (rgb_clk       ),
    .i_rst_n    (sys_rst_n     ),

    .o_rgb_hs   (rgb_hs        ),
    .o_rgb_vs   (rgb_vs        ),
    .o_rgb_de   (rgb_de        ),
    .o_rgb_x    (              ),
    .o_rgb_y    (              )
);

rgb_test #(
    .P_RGB_MODE (4'd4          )  //4: 1280x720，与rgb_timing一致
)rgb_test_m0(
    .i_sys_clk  (rgb_clk       ),
    .i_rst_n    (sys_rst_n     ),
    .i_sel      (mode_sel      ),

    .i_rgb_hs   (rgb_hs        ),
    .i_rgb_vs   (rgb_vs        ),
    .i_rgb_de   (rgb_de        ),
    .i_rgb_data (24'd0         ),

    .o_rgb_hs   (hdmi_hs       ),
    .o_rgb_vs   (hdmi_vs       ),
    .o_rgb_de   (hdmi_de       ),
    .o_rgb_data (hdmi_rgb      )
);

/********************************************************************************/
/**************************        DVI TX 输出         ***************************/
/********************************************************************************/

DVI_TX_Top DVI_TX_Top_inst(
    .I_rst_n       (hdmi4_rst_n        ),  //异步复位，低有效
    .I_serial_clk  (rgb_clk_x5         ),

    .I_rgb_clk     (rgb_clk            ),  //像素时钟
    .I_rgb_vs      (hdmi_vs            ),
    .I_rgb_hs      (hdmi_hs            ),
    .I_rgb_de      (hdmi_de            ),
    .I_rgb_r       (hdmi_rgb[23:16]    ),
    .I_rgb_g       (hdmi_rgb[15:8]     ),
    .I_rgb_b       (hdmi_rgb[7:0]      ),

    .O_tmds_clk_p  (o_tmds_clk_p       ),
    .O_tmds_clk_n  (o_tmds_clk_n       ),
    .O_tmds_data_p (o_tmds_data_p      ),
    .O_tmds_data_n (o_tmds_data_n      )
);

endmodule
