//WM8731 音频回环测试顶层：ADC采集数据经DAC回放，WS2812指示I2C初始化状态
//260912    v1.0.0   初始版本

module top (
    //时钟与复位
    input               i_clk_27m,         //系统时钟27MHz
    input               i_rst_n,           //复位按键，低有效

    //WM8731 I2C 配置接口
    inout               io_wm8731_sda,     //I2C数据
    output              o_wm8731_scl,      //I2C时钟

    //WM8731 音频接口
    inout               io_wm8731_adclrck, //ADC左右声道时钟
    input               i_wm8731_adcdat,   //ADC串行数据
    output              o_wm8731_daclrck,  //DAC左右声道时钟
    output              o_wm8731_dacdat,   //DAC串行数据
    inout               io_wm8731_bclk,    //位时钟

    //WS2812 状态指示
    output              o_ws2812_di        //WS2812数据输出
);

localparam P_CLK_FRE = 27_000_000; //系统时钟频率 Hz

//复位链信号
logic        sys_rst_n;   //boot_rst上电复位输出

//音频时钟与状态信号
logic        clk_12m;     //12MHz音频主时钟
logic        iic_done;    //IIC初始化完成
logic        iic_error;   //IIC初始化错误
logic [23:0] rgb888;      //WS2812颜色数据
logic        ws2812_ready;//WS2812空闲
logic        ws2812_data_en;//WS2812发送使能

/********************************************************************************/
/**************************    时钟复位（i_clk_27m）    *************************/
/********************************************************************************/

boot_rst boot_rst_m0(
    .i_clk   (i_clk_27m  ),
    .i_rst_n (i_rst_n    ),
    .o_rst_n (sys_rst_n  )
);

/********************************************************************************/
/**************************       音频PLL例化           *************************/
/********************************************************************************/

audio_pll audio_pll_m0(
    .clkin  (i_clk_27m    ),
    .clkout (clk_12m      )
);

/********************************************************************************/
/**************************      WM8731 IIC初始化       *************************/
/********************************************************************************/

iic_top #(
    .P_CLK_FRE (P_CLK_FRE  ),
    .P_IIC_FRE (100_000    )
)iic_top_m0(
    .i_sys_clk   (i_clk_27m      ),
    .i_rst_n     (sys_rst_n      ),

    .o_iic_scl   (o_wm8731_scl   ),
    .io_iic_sda  (io_wm8731_sda  ),

    .o_iic_done  (iic_done       ),
    .o_iic_error (iic_error      )
);

/********************************************************************************/
/**************************       WM8731 音频回环       *************************/
/********************************************************************************/

assign o_wm8731_daclrck = io_wm8731_adclrck;

audio_dac_fifo #(
    .P_REF_CLK      (12_000_000  ),
    .P_SAMPLE_RATE  (48_000      ),
    .P_DATA_WIDTH   (16          ),
    .P_CHANNEL_NUM  (2           )
)audio_dac_fifo_m0(
    .i_sys_clk    (clk_12m           ),
    .i_rst_n      (sys_rst_n         ),

    .i_aud_data   (i_wm8731_adcdat   ),
    .o_aud_bck    (io_wm8731_bclk    ),
    .o_aud_data   (o_wm8731_dacdat   ),
    .o_aud_lrck   (io_wm8731_adclrck ),
    .o_aud_xck    (                  )
);

/********************************************************************************/
/**************************       WS2812状态指示        *************************/
/********************************************************************************/

//颜色选择：IIC错误红色优先，IIC完成绿色，其他蓝色
always@(posedge i_clk_27m)begin
    if(!sys_rst_n)begin
        rgb888 <= 24'h000001; //蓝
    end else if(iic_error)begin
        rgb888 <= 24'h010000; //红
    end else if(iic_done)begin
        rgb888 <= 24'h000100; //绿
    end else begin
        rgb888 <= 24'h000001; //蓝
    end
end

assign ws2812_data_en = ws2812_ready; //空闲后自动发送当前颜色

ws2812 #(
    .P_LED_NUM (1           ),
    .P_CLK_FRE (P_CLK_FRE   )
)ws2812_m0(
    .i_sys_clk   (i_clk_27m      ),
    .i_rst_n     (1'b1           ), //不复位，避免复位后颜色闪烁

    .i_rgb888    (rgb888         ),
    .i_data_en   (ws2812_data_en ),

    .o_ready     (ws2812_ready   ),
    .o_done      (               ),
    .o_ws2812_di (o_ws2812_di    )
);

endmodule
