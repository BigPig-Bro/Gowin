// RGB 时钟生成模块：TMDS PLL x5 + CLKDIV x1，输出像素时钟与串行时钟
//260906    v1.0.0   初始版本
module rgb_clk_gen (
    input        i_clk,         //系统时钟 50MHz
    input        i_rst_n,       //低有效复位

    output       o_rgb_clk,     //像素时钟 x1
    output       o_rgb_clk_x5,  //串行时钟 x5
    output logic o_hdmi4_rst_n, //HDMI 复位（PLL 锁定后有效）
    output logic o_pll_lock     //PLL锁定信号
);

Gowin_PLL u_gowin_pll(
    .clkin   (i_clk         ),
    .clkout0 (o_rgb_clk_x5  ),
    .lock    (o_pll_lock    ),
    .mdclk   (i_clk         )
);

assign o_hdmi4_rst_n = i_rst_n & o_pll_lock;

Gowin_CLKDIV u_clkdiv(
    .clkout (o_rgb_clk     ),
    .hclkin (o_rgb_clk_x5  ),
    .resetn (o_hdmi4_rst_n )
);

endmodule
