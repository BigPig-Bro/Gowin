// 单路编码器按键：A/B旋转方向检测、ENTER按键输出、5ms消抖
//260824    v1.0.0   初始版本

module Encoder_key #(
    parameter CLK_FRE = 50_000_000
)(
    input           i_clk,          //system clock

    input [2:0]     i_key_in,
    output logic    o_enter,
    output logic    o_roate,
    output logic    o_roate_r
);
/********************************************************************************/
/**************************      消抖          **********************************/
/********************************************************************************/
logic [2:0] key_r;
Encoder_filter  #(
	.CLK_FRE        (CLK_FRE        ) //50MHz
)Encoder_filter_m0(
    .i_clk          (i_clk          ),
    .i_key          (i_key_in[0]    ),//A
    .o_key          (key_r[0]       )
);

Encoder_filter  #(
	.CLK_FRE        (CLK_FRE        ) //50MHz
)Encoder_filter_m1(
    .i_clk          (i_clk          ),
    .i_key          (i_key_in[1]    ),//B
    .o_key          (key_r[1]       )
);

Encoder_filter  #(
	.CLK_FRE        (CLK_FRE        ) //50MHz
)Encoder_filter_m2(
    .i_clk          (i_clk          ),
    .i_key          (i_key_in[2]    ),//enter
    .o_key          (key_r[2]       )
);

/********************************************************************************/
/**************************      user          **********************************/
/********************************************************************************/
assign o_enter = key_r[2];

//上升沿采集
logic A_r, A_negedge;
logic B_r, B_negedge;
always@(posedge i_clk)begin
    A_r     <= key_r[0];
    B_r     <= key_r[1];

    A_negedge   <= (A_r == 1'b1) && (key_r[0] == 1'b0);
    B_negedge   <= (B_r == 1'b1) && (key_r[1] == 1'b0);
end

//脉冲输出
always@(posedge i_clk)begin
    o_roate    <= (A_negedge &&  key_r[1]         ) || (B_negedge && (key_r[0] == 1'b0 ))   ;
    o_roate_r  <= (A_negedge && (key_r[1] == 1'b0)) || (B_negedge &&  key_r[0]          )   ;
end 

endmodule 