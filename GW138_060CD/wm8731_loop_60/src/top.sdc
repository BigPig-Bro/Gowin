# 时序约束：iic_master 内部由逻辑分频产生的 scl_x2 时钟
# 实际频率 100kHz（周期 10000ns），需显式声明，否则被 -global_freq 按 100MHz 约束
create_clock -name scl_x2 -period 10000 -waveform {0 5000} [get_nets {iic_top_m0/iic_master_m0/scl_x2}]
