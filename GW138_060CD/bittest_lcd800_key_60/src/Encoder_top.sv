// 双编码器按键顶层：旋转方向检测/ENTER复位/位置寄存器
//260824    v1.0.0   初始版本

module Encoder_top #(
    parameter CLK_FRE = 50_000_000
)(
    input           i_clk,          //system clock
    input   [2:0]   i_key_A,        //[1:0] A B [2] Enter
    input   [2:0]   i_key_B,        //[1:0]

    output  logic   [7:0]   o_reg_A,
    output  logic   [7:0]   o_reg_B
);
/********************************************************************************/
/**************************      user          **********************************/
/********************************************************************************/
always@(posedge i_clk)begin
	if(key_A_enter)begin
		o_reg_A <= 8'd128;
	end else if (key_A_rotate)begin
		o_reg_A <= o_reg_A + 8'd2;
	end else if (key_A_rotate_r)begin
		o_reg_A <= o_reg_A - 8'd2;
	end

    if(key_B_enter)begin
		o_reg_B <= 8'd128;
	end else if (key_B_rotate)begin
		o_reg_B <= o_reg_B + 8'd1;
	end else if (key_B_rotate_r)begin
		o_reg_B <= o_reg_B - 8'd1;
	end
end


/********************************************************************************/
/**************************      driver        **********************************/
/********************************************************************************/
logic key_A_enter, key_A_rotate, key_A_rotate_r;
logic key_B_enter, key_B_rotate, key_B_rotate_r;

Encoder_key #(
	.CLK_FRE        (CLK_FRE        ) //由顶层传入系统时钟频率
)Encoder_key_A(
	.i_clk          (i_clk          ),
	.i_key_in       (i_key_A        ), //[1:0] A B [2] Enter

	.o_enter        (key_A_enter    ),
	.o_roate        (key_A_rotate   ),
	.o_roate_r      (key_A_rotate_r )
);

Encoder_key #(
	.CLK_FRE        (CLK_FRE        ) //由顶层传入系统时钟频率
)Encoder_key_B(
	.i_clk          (i_clk          ),
	.i_key_in       (i_key_B        ), //[1:0] A B [2] Enter

	.o_enter        (key_B_enter    ),
	.o_roate        (key_B_rotate   ),
	.o_roate_r      (key_B_rotate_r )
);

endmodule