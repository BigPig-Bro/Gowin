//按键计数模块：消抖并统计按键按下次数
//260906    v1.0.0   按coder风格重构：统一i_sys_clk，打拍捕捉上升沿
module key_cnt #(
    parameter P_CLK_FRE  = 50_000_000,  //输入的时钟 Hz
    parameter P_CNT      = 1,           //计数位宽
    parameter P_CNT_MAX  = 2           //最大计数值，达到后清零
)(
    input                          i_sys_clk,   //系统时钟
    input                          i_rst_n,     //系统复位，低有效
    input                          i_key_in,    //按键输入，按下为低电平

    output logic [P_CNT - 1:0] o_key_cnt        //按键计数输出
);

//************ 参数/常量 ************
localparam DELAY_MS     = 20; //消抖延时 Ms
localparam DEBOUNCE_CNT = (P_CLK_FRE / 1024) * DELAY_MS / 1000; //消抖采样次数（采样频率=P_CLK_FRE/1024）

//************ 内部信号 ************
//分频采样节拍
logic [9:0]  clk_delay;    //分频计数器
logic        clk_delay_d0; //分频时钟打拍
logic        clk_delay_d1;
logic        clk_delay_rise;//分频时钟上升沿

//消抖确认
logic [15:0] cnt;          //延时计数
logic        key_clk;      //消抖确认后的按键高电平信号

//按键上升沿捕捉
logic        key_clk_d0;   //按键信号打拍
logic        key_clk_d1;
logic        key_clk_rise; //按键上升沿

//************ 逻辑 ************
//分频计数器
always@(posedge i_sys_clk)begin
    if(!i_rst_n)begin
        clk_delay <= 'd0;
    end else begin
        clk_delay <= clk_delay + 'd1;
    end
end

//打拍捕捉分频时钟上升沿，作为消抖采样节拍
always@(posedge i_sys_clk)begin
    if(!i_rst_n)begin
        clk_delay_d0 <= 1'b0;
        clk_delay_d1 <= 1'b0;
    end else begin
        clk_delay_d0 <= clk_delay[9];
        clk_delay_d1 <= clk_delay_d0;
    end
end

assign clk_delay_rise = clk_delay_d0 && !clk_delay_d1;

//按键消抖
always@(posedge i_sys_clk)begin
    if(!i_rst_n)begin
        cnt     <= 'd0;
        key_clk <= 1'b0;
    end else if(clk_delay_rise)begin//分频时钟上升沿时采样
        if(!i_key_in)begin//如果按键按下或者抖动导致按下
            if(cnt == DEBOUNCE_CNT)begin//持续消抖延时后仍为按下，确定按下
                key_clk <= 1'b1;//输出按下的高电平信号
            end else begin//计数器不到上限，输出为0
                cnt     <= cnt + 'd1;//计数器开始计数
                key_clk <= 1'b0;
            end
        end else begin//按键松开或者抖动导致的按下信号不够长
            key_clk <= 1'b0;
            cnt     <= 'd0;//计数器重置
        end
    end
end

//打拍捕捉按键高电平上升沿，作为计数触发
always@(posedge i_sys_clk)begin
    if(!i_rst_n)begin
        key_clk_d0 <= 1'b0;
        key_clk_d1 <= 1'b0;
    end else begin
        key_clk_d0 <= key_clk;
        key_clk_d1 <= key_clk_d0;
    end
end

assign key_clk_rise = key_clk_d0 && !key_clk_d1;

//按键计数
always@(posedge i_sys_clk)begin
    if(!i_rst_n)begin
        o_key_cnt <= 'd0;
    end else if(key_clk_rise)begin//捕捉到按键上升沿，计数加1
        if(o_key_cnt == P_CNT_MAX)begin//达到最大计数值后清零
            o_key_cnt <= 'd0;
        end else begin
            o_key_cnt <= o_key_cnt + 'd1;
        end
    end
end

endmodule
