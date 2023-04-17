module pwm_rgb #(
    parameter CLK_FRE = 50_000_000
) (
    input                       clk,rst_n,

    output reg [2:0][9:0]     pwm_duty
);

//将输入时钟 CLK * 1MHz 分频为 100Hz
reg [17:0] pwm_clk_cnt = 0;
always@(posedge clk) pwm_clk_cnt <= pwm_clk_cnt + 1;

//根据时钟计数值，输出PWM占空比
logic clk_100hz;
assign clk_100hz = pwm_clk_cnt [17];

logic [2:0] state = 0;
always@(posedge clk_100hz)
    if(!rst_n)begin
        state = 0;

        pwm_duty[0] <= 99;
        pwm_duty[1] <= 0;
        pwm_duty[2] <= 0;
    end
    else
        case(state)
            //red - yellow
            3'd0:begin
                if(pwm_duty[1] <= 99)
                    pwm_duty[1] <= pwm_duty[1] + 1;
                else
                    state <= 3'd1;
            end

            //yellow - green
            3'd1:begin
                if(pwm_duty[0] >= 1)
                    pwm_duty[0] <= pwm_duty[0] - 1;
                else
                    state <= 3'd2;
            end 

            //green - cyan
            3'd2:begin
                if(pwm_duty[2] <= 99)
                    pwm_duty[2] <= pwm_duty[2] + 1;
                else
                    state <= 3'd3;
            end

            //cyan - blue   
            3'd3:begin
                if(pwm_duty[1] >= 1)
                    pwm_duty[1] <= pwm_duty[1] - 1;
                else
                    state <= 3'd4;
            end
            
            //blue - magenta
            3'd4:begin
                if(pwm_duty[0] <= 99)
                    pwm_duty[0] <= pwm_duty[2] + 1;
                else
                    state <= 3'd5;
            end

            //magenta - red
            3'd5:begin
                if(pwm_duty[2] >= 1)
                    pwm_duty[2] <= pwm_duty[2] - 1;
                else
                    state <= 3'd0;
            end

            default:begin
                state <= 3'd0;
            end
        endcase

endmodule