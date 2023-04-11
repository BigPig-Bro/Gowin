module top(
	input clk,
	output [7:0] led
	);

parameter RATE  = 32'D1024;
parameter RATE_CNT_MAX = 32'd27_000_000 / RATE - 32'd1;//一个波计数上限

reg [31:0] clk_update;
always@(posedge clk) clk_update <= clk_update + 1;

reg [7:0][31:0] d = {32'd70,32'd18,32'd9,32'd3, 32'd2,32'd1,32'd0,32'd0};

always@(posedge clk_update[20]) begin
	d[0] <= d[7];
	d[1] <= d[0];
	d[2] <= d[1];
	d[3] <= d[2];
	d[4] <= d[3];
	d[5] <= d[4];
	d[6] <= d[5];
	d[7] <= d[6];
end
	

reg [31:0] rate_cnt;
always@(posedge clk)
	if(rate_cnt < RATE_CNT_MAX)
		rate_cnt <= rate_cnt + 32'd1;
	else
		rate_cnt <= 32'd0;


pwm_ctr m0(
.clk 	 (clk	),
.cnt 	 (rate_cnt),
.duty 	 (d[0]),
.rate    (RATE),
.pwm_out (led[0])
);


pwm_ctr m1(
.clk 	 (clk	),
.cnt 	 (rate_cnt),
.duty 	 (d[1]),
.rate    (RATE),
.pwm_out (led[1])
);



pwm_ctr m2(
.clk 	 (clk	),
.cnt 	 (rate_cnt),
.duty 	 (d[2]),
.rate    (RATE),
.pwm_out (led[2])
);



pwm_ctr m3(
.clk 	 (clk	),
.cnt 	 (rate_cnt),
.duty 	 (d[3]),
.rate    (RATE),
.pwm_out (led[3])
);


pwm_ctr m4(
.clk 	 (clk	),
.cnt 	 (rate_cnt),
.duty 	 (d[4]),
.rate    (RATE),
.pwm_out (led[4])
);


pwm_ctr m5(
.clk 	 (clk	),
.cnt 	 (rate_cnt),
.duty 	 (d[5]),
.rate    (RATE),
.pwm_out (led[5])
);



pwm_ctr m6(
.clk 	 (clk	),
.cnt 	 (rate_cnt),
.duty 	 (d[6]),
.rate    (RATE),
.pwm_out (led[6])
);



pwm_ctr m7(
.clk 	 (clk	),
.cnt 	 (rate_cnt),
.duty 	 (d[7]),
.rate    (RATE),
.pwm_out (led[7])
);	


endmodule 
