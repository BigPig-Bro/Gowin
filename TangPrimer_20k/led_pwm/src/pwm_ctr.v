
module pwm_ctr(clk,pwm_out,duty,rate,cnt);
	input 		 clk;//输入的50M时钟
	input [31:0]  duty;//占空比0-100%整数
	input [31:0] rate;//频率0-500K（太大精度不够）
	output reg   pwm_out;//输出的PWM
	input [31:0] cnt;
	wire [31:0] RATE_CNT,PWM_CNT;
	
	assign RATE_CNT = 32'd27_000_000 / rate - 32'd1;//一个波计数上限
	assign PWM_CNT  = (RATE_CNT + 32'd1) * duty / 32'd100;//在一个波内PWM上限计数器
	
	// reg [31:0] cnt;
	
	// initial cnt = 32'd0;
	
	always@(posedge clk)
	begin
		if(cnt < RATE_CNT)
		begin
			// cnt = cnt + 32'd1;
			
			if(cnt < PWM_CNT)
			begin
				pwm_out = 1'b0;
			end
			else
			begin
				pwm_out = 1'b1;
			end
		end
		else
		begin
			// cnt = 32'd0;
			pwm_out = 1'b1;
		end
	end
	
endmodule 