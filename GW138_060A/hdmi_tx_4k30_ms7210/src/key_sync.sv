module key_sync#(
    parameter CLK_FRE      = 50,  //输入的时钟 Mhz
    parameter KEY_IN_MODE  = 0,   //按键按下时的电平 0 or 1
    parameter KEY_OUT_MODE = 1    //消抖后按下电平 0 or 1
)( 
    input                   i_sys_clk,
    input                   i_key_async,
    output logic            o_key_sync
);

//对于消抖来说，按键没必要那么大，浪费资源，这里降1K
logic [23:0] clk_delay = 0;
always@(posedge i_sys_clk) clk_delay <= (clk_delay == CLK_FRE * 1000) ? 'd0 : clk_delay + 'd1;

logic [ 3:0] key_cnt = 0;//延时的计数器

always@(posedge i_sys_clk)begin
    if(i_key_async == KEY_IN_MODE)begin//如果按键按下或者抖动导致按下
        if(key_cnt == 4'd10)begin//持续计数10ms后如果仍为按下状态，确定按下 
            //key_cnt <= key_cnt;//计时器保持使输出信号持续为高
            o_key_sync <= KEY_OUT_MODE;//输出按下的高电平信号
        end else if (clk_delay == 24'd0) begin//计数器不到上限\
            o_key_sync <= ~KEY_OUT_MODE;
            key_cnt <= key_cnt + 4'd1;//计数器开始计数
        end
    end else begin//按键松开或者抖动导致的按键按下信号不够长
        o_key_sync  <= ~KEY_OUT_MODE;
        key_cnt     <=  4'd0;//计数器重置
    end
end 

endmodule