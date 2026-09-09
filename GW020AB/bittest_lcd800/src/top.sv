// 480x272 LCD RGB 位检测测试工程（顶层）
//260909    v1.0.0   按Coder规范重构：引入boot_rst/rgb_timing/rgb_test/key_sync/key_cnt，替换vga_timing
module top (
    input         i_clk_27m,   //系统时钟 27MHz
    input         i_rst_n,     //系统复位，低有效

    input         i_key,       //模式切换按键，按下为低电平

    output        o_lcd_clk,   //LCD像素时钟
    output        o_lcd_hs,    //LCD水平同步
    output        o_lcd_vs,    //LCD垂直同步
    output        o_lcd_de,    //LCD数据有效
    output [23:0] o_lcd_data   //LCD RGB888数据
);

localparam P_CLK_FRE = 27_000_000;  //输入时钟频率 Hz

/********************************************************************************/
/**************************    时钟复位与按键（i_clk_27m）  **********************/
/********************************************************************************/

logic        rgb_clk;     //像素时钟 9MHz
logic        sys_rst_n;   //系统复位，低有效
logic        key_deb;     //消抖后的按键信号，按下为低电平

//key_sync 与 boot_rst 紧挨放在最上面，中间不插入其他模块例化
key_sync #(
    .P_CLK_FRE       (P_CLK_FRE      ),
    .P_KEY_IN_MODE   (1'd0           ),
    .P_KEY_OUT_MODE  (1'd0           )
)key_sync_m0(
    .i_sys_clk       (i_clk_27m      ),
    .i_key_async     (i_key          ),
    .o_key_sync      (key_deb        )
);

boot_rst boot_rst_m0(
    .i_clk   (i_clk_27m  ),
    .i_rst_n (i_rst_n    ),
    .o_rst_n (sys_rst_n  )
);

video_pll video_pll_m0(
    .clkin   (i_clk_27m  ),
    .clkout  (rgb_clk    )
);

/********************************************************************************/
/**************************    视频时序与测试图形（rgb_clk）  ********************/
/********************************************************************************/

logic [ 1:0] mode_sel;    //测试模式选择
logic        rgb_hs;      //水平同步
logic        rgb_vs;      //垂直同步
logic        rgb_de;      //数据有效
logic        lcd_hs;      //LCD水平同步
logic        lcd_vs;      //LCD垂直同步
logic        lcd_de;      //LCD数据有效
logic [23:0] lcd_rgb;     //LCD RGB数据

//key_cnt 属于用户逻辑，放在用户功能区域，不与时钟复位按键基础模块放在一起
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
    .P_RGB_MODE (4'd2           )  //2: 800x480
)rgb_timing_m0(
    .i_sys_clk  (rgb_clk        ),
    .i_rst_n    (sys_rst_n      ),

    .o_rgb_hs   (rgb_hs         ),
    .o_rgb_vs   (rgb_vs         ),
    .o_rgb_de   (rgb_de         ),
    .o_rgb_x    (               ),
    .o_rgb_y    (               )
);

rgb_test #(
    .P_RGB_MODE (4'd2           )  //2: 800x480，与rgb_timing一致
)rgb_test_m0(
    .i_sys_clk  (rgb_clk        ),
    .i_rst_n    (sys_rst_n      ),
    .i_sel      (mode_sel       ),

    .i_rgb_hs   (rgb_hs         ),
    .i_rgb_vs   (rgb_vs         ),
    .i_rgb_de   (rgb_de         ),
    .i_rgb_data (24'd0          ),

    .o_rgb_hs   (lcd_hs         ),
    .o_rgb_vs   (lcd_vs         ),
    .o_rgb_de   (lcd_de         ),
    .o_rgb_data (lcd_rgb        )
);

/********************************************************************************/
/**************************        LCD 输出         *****************************/
/********************************************************************************/

assign o_lcd_clk = ~rgb_clk;         //LCD像素时钟，反相后数据在DCLK上升沿稳定
assign o_lcd_hs  = lcd_hs;
assign o_lcd_vs  = lcd_vs;
assign o_lcd_de  = lcd_de;

//RGB888 合并为单总线：{R[7:0], G[7:0], B[7:0]}
assign o_lcd_data = lcd_rgb;

endmodule
