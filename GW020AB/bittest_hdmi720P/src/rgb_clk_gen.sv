// RGB 时钟生成模块：TMDS PLL x5 + CLKDIV x1，输出像素时钟与串行时钟
//260906    v1.0.0   初始版本
module rgb_clk_gen (
    input        i_clk,         //系统时钟 27MHz
    input        i_rst_n,       //低有效复位

    output       o_rgb_clk,     //像素时钟 x1
    output       o_rgb_clk_x5,  //串行时钟 x5
    output logic o_hdmi4_rst_n  //HDMI 复位（PLL 锁定后有效）
);

logic pll_lock;   //PLL锁定信号

TMDS_rPLL u_tmds_rpll(
    .clkin  (i_clk            ),
    .clkout (o_rgb_clk_x5     ),
    .lock   (pll_lock         )
);

//HDMI复位：PLL锁定后有效（在串行域打拍，复位释放路径由SDC false_path处理）
always@(posedge o_rgb_clk_x5)begin
    o_hdmi4_rst_n = i_rst_n & pll_lock;
end

CLKDIV u_clkdiv(
    .RESETN (o_hdmi4_rst_n    ),
    .HCLKIN (o_rgb_clk_x5     ), //clk x5
    .CLKOUT (o_rgb_clk        ), //clk x1
    .CALIB  (1'b1             )
);
defparam u_clkdiv.DIV_MODE = "5";
defparam u_clkdiv.GSREN   = "false";

endmodule
