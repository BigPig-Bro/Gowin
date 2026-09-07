# 顶层时序约束
# 系统输入时钟 27MHz
create_clock -name i_clk_27m -period 37.037 [get_ports {i_clk_27m}] -add

# PLL：CLKOUT = 27 * 55/4 = 371.25MHz（串行x5）
create_generated_clock -name rgb_clk_x5 -source [get_ports {i_clk_27m}] -master_clock i_clk_27m -divide_by 4 -multiply_by 55 [get_pins {rgb_clk_gen_m0/u_tmds_rpll/rpll_inst/CLKOUT}]

# CLKDIV：像素时钟 = 371.25/5 = 74.25MHz
create_generated_clock -name rgb_clk -source [get_pins {rgb_clk_gen_m0/u_tmds_rpll/rpll_inst/CLKOUT}] -master_clock rgb_clk_x5 -divide_by 5 -multiply_by 1 [get_pins {rgb_clk_gen_m0/u_clkdiv/CLKOUT}]

# 系统时钟/串行时钟/像素时钟互相异步：
# 复位释放、按键/模式切换、DVI_TX 内部 CDC 均按异步处理，避免误报
set_clock_groups -asynchronous -group [get_clocks {i_clk_27m}] -group [get_clocks {rgb_clk_x5}] -group [get_clocks {rgb_clk}]

# 异步复位释放路径不检查（recovery/removal）：
# o_hdmi4_rst_n 在串行域打拍后送 DVI_TX OSER10 复位端
set_false_path -from [get_pins {rgb_clk_gen_m0/o_hdmi4_rst_n_s0/Q}] -to [get_pins {DVI_TX_Top_inst/rgb2dvi_inst/u_OSER10_*/RESET}]
