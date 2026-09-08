//RGB 时钟生成模块：TMDS PLL x5 + CLKDIV x1，输出像素时钟与串行时钟
//220901    v1.0.0   初始版本
//260908    v1.1.0   按 Coder 规范整理：实例名 _m0、非阻塞赋值、同步复位
module rgb_clk_gen(
    input        i_clk,        //系统时钟 27MHz
    input        i_rst_n,      //低有效复位

    output       o_rgb_clk,    //像素时钟 x1
    output       o_rgb_clk_x5, //串行时钟 x5
    output logic o_hdmi4_rst_n //HDMI 复位（PLL 锁定后有效）
);

logic pll_lock;//PLL 锁定信号

TMDS_rPLL TMDS_rPLL_m0(
    .clkin  (i_clk            ),
    .clkout (o_rgb_clk_x5     ),
    .lock   (pll_lock         )
);

//HDMI 复位在 x5 时钟域打一拍输出
always@(posedge o_rgb_clk_x5)begin
    if(!i_rst_n)begin
        o_hdmi4_rst_n <= 1'b0;
    end else begin
        o_hdmi4_rst_n <= i_rst_n & pll_lock;
    end
end

CLKDIV CLKDIV_m0(
    .RESETN (o_hdmi4_rst_n    ),
    .HCLKIN (o_rgb_clk_x5     ),//clk x5
    .CLKOUT (o_rgb_clk        ),//clk x1
    .CALIB  (1'b1             )
);
defparam CLKDIV_m0.DIV_MODE = "5";
defparam CLKDIV_m0.GSREN   = "false";

endmodule
