// 单路编码器按键：A/B旋转方向检测、ENTER按键输出，key_sync消抖
//260824    v1.0.0   初始版本

module Encoder_key #(
    parameter CLK_FRE = 50_000_000
)(
    input        i_clk,       //系统时钟
    input  [2:0] i_key_in,    //[0] A [1] B [2] ENTER，按下为低电平

    output logic o_enter,     //ENTER按下输出
    output logic o_roate,     //顺时针旋转脉冲
    output logic o_roate_r    //逆时针旋转脉冲
);

/********************************************************************************/
/**************************        按键消抖        *****************************/
/********************************************************************************/

logic [2:0] key_r;    //消抖后的按键电平，按下为高

//key_sync 替代原 Encoder_filter：P_KEY_IN_MODE=0（按下为低），
//P_KEY_OUT_MODE=1（消抖确认按下后输出高，与原 Encoder_filter 语义一致）
key_sync #(
    .P_CLK_FRE      (CLK_FRE    ),
    .P_KEY_IN_MODE  (1'b0       ),
    .P_KEY_OUT_MODE (1'b1       )
)key_sync_m0(
    .i_sys_clk      (i_clk      ),
    .i_key_async    (i_key_in[0]),  //A
    .o_key_sync     (key_r[0]   )
);

key_sync #(
    .P_CLK_FRE      (CLK_FRE    ),
    .P_KEY_IN_MODE  (1'b0       ),
    .P_KEY_OUT_MODE (1'b1       )
)key_sync_m1(
    .i_sys_clk      (i_clk      ),
    .i_key_async    (i_key_in[1]),  //B
    .o_key_sync     (key_r[1]   )
);

key_sync #(
    .P_CLK_FRE      (CLK_FRE    ),
    .P_KEY_IN_MODE  (1'b0       ),
    .P_KEY_OUT_MODE (1'b1       )
)key_sync_m2(
    .i_sys_clk      (i_clk      ),
    .i_key_async    (i_key_in[2]),  //ENTER
    .o_key_sync     (key_r[2]   )
);

/********************************************************************************/
/**************************        旋转方向检测      ****************************/
/********************************************************************************/

assign o_enter = key_r[2];

logic A_r;        //A消抖信号打拍
logic B_r;        //B消抖信号打拍
logic A_negedge;  //A释放下降沿
logic B_negedge;  //B释放下降沿

always@(posedge i_clk)begin
    A_r       <= key_r[0];
    B_r       <= key_r[1];

    A_negedge <= (A_r == 1'b1) && (key_r[0] == 1'b0);
    B_negedge <= (B_r == 1'b1) && (key_r[1] == 1'b0);
end

always@(posedge i_clk)begin
    o_roate   <= (A_negedge &&  key_r[1]         ) ||
                 (B_negedge && (key_r[0] == 1'b0));
    o_roate_r <= (A_negedge && (key_r[1] == 1'b0)) ||
                 (B_negedge &&  key_r[0]         );
end

endmodule
