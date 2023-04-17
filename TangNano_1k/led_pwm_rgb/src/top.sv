module top (
    input   clk,rst_n,

    output  led_r,led_g,led_b
);

parameter CLK_FRE = 27_000_000; 

assign led_r = pwm_out[2];
assign led_g = pwm_out[1];
assign led_b = pwm_out[0];

logic [2:0] pwm_out;
logic [2:0][9:0] pwm_duty;
//RGB 三色PWM 占空比控制
pwm_rgb#(
    .CLK_FRE (CLK_FRE    )    
) pwm_rgb_m0(
    .clk      (clk           ), 
    .rst_n    (rst_n         ), 

    .pwm_duty (pwm_duty      )  
);

//RGB 三色PWM 控制
pwm_ctr #(
    .CLK_FRE (CLK_FRE    )    
)pwm_ctr_m0(
    .clk      (clk         ),
    .pwm_duty (pwm_duty[0] ),
    .pwm_rate (10_000      ),
    .pwm_out  (pwm_out[0]  )
);

pwm_ctr #(
    .CLK_FRE (CLK_FRE    )    
)pwm_ctr_m1(
    .clk      (clk         ),
    .pwm_duty (pwm_duty[1] ),
    .pwm_rate (10_000      ),
    .pwm_out  (pwm_out[1]  )
);
    
pwm_ctr #(
    .CLK_FRE (CLK_FRE    )    
)pwm_ctr_m2(
    .clk      (clk         ),
    .pwm_duty (pwm_duty[2] ),
    .pwm_rate (10_000      ),
    .pwm_out  (pwm_out[2]  )
);
endmodule