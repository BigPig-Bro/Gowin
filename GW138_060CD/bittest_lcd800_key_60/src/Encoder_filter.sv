// 按键消抖滤波器：低有效按键持续约5ms后输出有效
//260824    v1.0.0   初始版本

module Encoder_filter #(
    parameter CLK_FRE = 50_000_000
)(
    input           i_clk,          //system clock

    input           i_key,
    output logic    o_key
);

localparam CLK_5MS = CLK_FRE / 200;

logic [31:0] clk_cnt;

always@(posedge i_clk)begin
    if((i_key == 1'b0) && (clk_cnt == CLK_5MS))begin
        o_key       <= 1'b1;
    end else if(i_key == 1'b0) begin
        clk_cnt     <= clk_cnt + 32'd1;
        o_key       <= 1'b0;
    end else begin
        clk_cnt     <= 32'd0;
        o_key       <= 1'b0;
    end
end

endmodule 