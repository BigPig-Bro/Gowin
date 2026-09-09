// 双编码器按键顶层：旋转方向检测/ENTER复位/位置寄存器
//260824    v1.0.0   初始版本

module Encoder_top #(
    parameter CLK_FRE = 50_000_000
)(
    input        i_clk,        //系统时钟
    input  [2:0] i_key_A,      //编码器A：[0] A [1] B [2] ENTER，按下为低电平
    input  [2:0] i_key_B,      //编码器B：[0] A [1] B [2] ENTER，按下为低电平

    output logic [7:0] o_reg_A,  //编码器A位置寄存器，ENTER复位到128
    output logic [7:0] o_reg_B   //编码器B位置寄存器，ENTER复位到128
);

/********************************************************************************/
/**************************        内部信号        ******************************/
/********************************************************************************/

logic key_A_enter;      //编码器A ENTER
logic key_A_rotate;     //编码器A顺时针
logic key_A_rotate_r;   //编码器A逆时针
logic key_B_enter;      //编码器B ENTER
logic key_B_rotate;     //编码器B顺时针
logic key_B_rotate_r;   //编码器B逆时针

/********************************************************************************/
/**************************        位置寄存器        ****************************/
/********************************************************************************/

always@(posedge i_clk)begin
    if(key_A_enter)begin
        o_reg_A <= 8'd128;
    end else if(key_A_rotate)begin
        o_reg_A <= o_reg_A + 8'd2;
    end else if(key_A_rotate_r)begin
        o_reg_A <= o_reg_A - 8'd2;
    end

    if(key_B_enter)begin
        o_reg_B <= 8'd128;
    end else if(key_B_rotate)begin
        o_reg_B <= o_reg_B + 8'd1;
    end else if(key_B_rotate_r)begin
        o_reg_B <= o_reg_B - 8'd1;
    end
end

/********************************************************************************/
/**************************        编码器例化        ****************************/
/********************************************************************************/

Encoder_key #(
    .CLK_FRE    (CLK_FRE    )
)Encoder_key_m0(
    .i_clk      (i_clk      ),
    .i_key_in   (i_key_A    ),

    .o_enter    (key_A_enter   ),
    .o_roate    (key_A_rotate  ),
    .o_roate_r  (key_A_rotate_r)
);

Encoder_key #(
    .CLK_FRE    (CLK_FRE    )
)Encoder_key_m1(
    .i_clk      (i_clk      ),
    .i_key_in   (i_key_B    ),

    .o_enter    (key_B_enter   ),
    .o_roate    (key_B_rotate  ),
    .o_roate_r  (key_B_rotate_r)
);

endmodule
