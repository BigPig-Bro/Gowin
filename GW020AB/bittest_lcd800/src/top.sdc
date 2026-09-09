# 顶层时序约束
# 系统输入时钟 27MHz
create_clock -name i_clk_27m -period 37.037 [get_ports {i_clk_27m}] -add

# PLL：CLKOUT = 27/3 = 9MHz（LCD 像素时钟）
create_generated_clock -name rgb_clk -source [get_ports {i_clk_27m}] -master_clock i_clk_27m -divide_by 3 -multiply_by 1 [get_pins {video_pll_m0/rpll_inst/CLKOUT}]

# 系统时钟/像素时钟互相异步：
# 按键消抖、模式切换、复位释放按异步处理，避免误报
set_clock_groups -asynchronous -group [get_clocks {i_clk_27m}] -group [get_clocks {rgb_clk}]
