create_clock -name i_clk_27m    -period 37.037 [get_ports {i_clk_27m}] -add
create_clock -name i_cmos_pclk  -period 10 [get_ports {i_cmos_pclk}] -add
create_clock -name i_cmos_vsync -period 1000 [get_ports {i_cmos_vsync}] -add

create_clock -name mem_clk -period 2.5 -waveform {0 1.25} [get_nets {memory_clk}]
report_timing -hold -from_clock [get_clocks {i_clk_27m*}] -to_clock [get_clocks {i_clk_27m*}] -max_paths 25 -max_common_paths 1
report_timing -setup -from_clock [get_clocks {i_clk_27m*}] -to_clock [get_clocks {i_clk_27m*}] -max_paths 25 -max_common_paths 1

