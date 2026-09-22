// WS2812 顶层测试：1s定时循环切换 RGB 颜色
//260915    v1.0.0   初始版本

module ws2812_top #(
    parameter P_CLK_FRE = 50_000_000   //系统时钟频率 Hz
)(
    input        i_sys_clk,     //系统时钟
    input        i_rst_n,       //系统复位，低有效

    output       o_ws2812_data  //WS2812数据输出
);

logic [31:0] sec_cnt;          //1s定时计数
logic [ 1:0] color_idx;        //颜色索引
logic [23:0] rgb_color;        //当前RGB颜色
logic        ws2812_ready;     //驱动空闲可接收
logic        ws2812_data_en;   //开始发送使能

//1s定时器：每秒切换一次颜色
always@(posedge i_sys_clk)begin
    if(!i_rst_n)begin
        sec_cnt   <= 32'd0;
        color_idx <= 2'd0;
    end else begin
        if(sec_cnt >= P_CLK_FRE - 1)begin
            sec_cnt <= 32'd0;

            if(color_idx == 2'd2)begin
                color_idx <= 2'd0;
            end else begin
                color_idx <= color_idx + 2'd1;
            end
        end else begin
            sec_cnt <= sec_cnt + 32'd1;
        end
    end
end

//颜色切换：000001(蓝) -> 000100(绿) -> 010000(红)
always@(*)begin
    case(color_idx)
        2'd0:    rgb_color = 24'h000001;
        2'd1:    rgb_color = 24'h000100;
        2'd2:    rgb_color = 24'h010000;
        default: rgb_color = 24'h000001;
    endcase
end

assign ws2812_data_en = ws2812_ready;

ws2812_driver #(
    .P_LED_NUM (1          ),
    .P_CLK_FRE (P_CLK_FRE  )
)ws2812_driver_m0(
    .i_sys_clk   (i_sys_clk       ),
    .i_rst_n     (i_rst_n         ),
    .i_rgb888    (rgb_color       ),
    .i_data_en   (ws2812_data_en  ),
    .o_ready     (ws2812_ready    ),
    .o_done      (                ),
    .o_ws2812_di (o_ws2812_data   )
);

endmodule
