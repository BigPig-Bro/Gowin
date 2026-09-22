# 顶层时序约束
# 系统输入时钟 50MHz
create_clock -name i_clk_50m -period 20.000 [get_ports {i_clk_50m}] -add

# PLL(串行x5) 与 CLKDIV(像素x1) 的生成时钟，请按综合后的实际内部路径补充：
# create_generated_clock -name rgb_clk_x5 -source [get_ports {i_clk_50m}] -master_clock i_clk_50m [get_pins {rgb_clk_gen_m0/u_gowin_pll/PLLA_inst/CLKOUT0}]
# create_generated_clock -name rgb_clk -source [get_pins {rgb_clk_gen_m0/u_gowin_pll/PLLA_inst/CLKOUT0}] -master_clock rgb_clk_x5 -divide_by 5 -multiply_by 1 [get_pins {rgb_clk_gen_m0/u_clkdiv/clkdiv_inst/CLKOUT}]

# 如需约束多时钟异步，可在上述生成时钟创建后添加：
# set_clock_groups -asynchronous -group [get_clocks {i_clk_50m}] -group [get_clocks {rgb_clk_x5}] -group [get_clocks {rgb_clk}]
