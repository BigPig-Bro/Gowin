// HDMI 720P RGB 位检测测试工程（顶层）
//260906    v1.0.0   按Coder规范重构：引入boot_rst/rgb_timing/rgb_test/key_sync/key_cnt，替换vga_timing
module top (
    input        i_clk_50m,   //系统时钟 50MHz
    input        i_rst_n,     //系统复位（按键K0），低有效

    input        i_key,       //按键输入（按键K1），按下为低电平

    output [1:0] o_led,       //LED0/1显示测试模式

    output       o_tmds_clk_p,  o_tmds_clk_n,//TMDS时钟
    output [2:0] o_tmds_data_p, o_tmds_data_n//TMDS数据 {r,g,b}
);

localparam P_CLK_FRE = 50_000_000;  //输入时钟频率 Hz
/********************************************************************************/
/**************************    时钟复位与按键（i_clk_50m）  **********************/
/********************************************************************************/

logic        rgb_clk;      //像素时钟
logic        rgb_clk_x5;   //TMDS串行时钟 x5
logic        hdmi4_rst_n;  //HDMI复位，低有效
logic        sys_rst_n;    //系统复位，低有效
logic [ 1:0] mode_sel;     //测试模式选择

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
    .o_pll_lock    (              )
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
    .P_CNT_MAX (2'd3          )
)key_cnt_m0(
    .i_sys_clk (i_clk_50m     ),
    .i_rst_n   (sys_rst_n     ),
    .i_key_in  (i_key         ),
    .o_key_cnt (mode_sel      )
);

//模式选择输出到LED0/LED1
assign o_led = mode_sel;

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
/**************************        HDMI 输出         ***************************/
/********************************************************************************/

svo_hdmi svo_hdmi_m0(
    .i_clk          (rgb_clk       ),
    .i_clk_5x       (rgb_clk_x5    ),
    .i_rst_n        (hdmi4_rst_n   ),

    .i_data         (hdmi_rgb      ),
    .i_hs           (hdmi_hs       ),
    .i_vs           (hdmi_vs       ),
    .i_de           (hdmi_de       ),

    .o_tmds_clk_n   (o_tmds_clk_n  ),
    .o_tmds_clk_p   (o_tmds_clk_p  ),
    .o_tmds_d_n     (o_tmds_data_n ),
    .o_tmds_d_p     (o_tmds_data_p )
);

endmodule
