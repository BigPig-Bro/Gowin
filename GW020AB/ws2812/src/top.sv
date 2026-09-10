// WS2812 按键切换颜色测试工程（顶层）
//260910    v1.0.0   按Coder规范重构

module top (
    input        i_clk_27m,   //系统时钟 27MHz
    input        i_rst_n,     //T6复位按键，低有效
    input        i_key_c6,    //C6切换颜色按键，低有效

    output       o_ws2812_di  //WS2812数据输出
);

localparam P_CLK_FRE     = 27_000_000;  //系统时钟频率 Hz
localparam P_KEY_CNT_W   = 3;           //按键计数位宽
localparam P_KEY_CNT_MAX = 7;           //按键最大计数值，0~7循环

//复位链信号
logic        rst_deb;      //T6消抖后的复位，按下为低电平
logic        sys_rst_n;    //系统复位，低有效

//C6按键计数信号
logic        key_c6_sync;  //C6消抖输出，按下为低电平
logic [P_KEY_CNT_W-1:0] key_count;  //按键计数

//WS2812接口信号
logic [23:0] rgb888;       //当前颜色
logic        ws2812_ready; //ws2812空闲
logic        ws2812_data_en;  //ws2812发送使能
logic        ws2812_done;     //ws2812一帧完成

assign ws2812_data_en = ws2812_ready;  //空闲后自动重新发送当前颜色

/********************************************************************************/
/**************************        颜色选择          ***************************/
/********************************************************************************/

always@(*)begin
    case(key_count)
        3'd0: rgb888 = 24'h020000;  //红，低亮度
        3'd1: rgb888 = 24'h000200;  //绿，低亮度
        3'd2: rgb888 = 24'h000002;  //蓝，低亮度
        3'd3: rgb888 = 24'h020202;  //白，低亮度
        3'd4: rgb888 = 24'h020200;  //黄，低亮度
        3'd5: rgb888 = 24'h000202;  //青，低亮度
        3'd6: rgb888 = 24'h020002;  //紫，低亮度
        default: rgb888 = 24'h020200;  //橙，低亮度
    endcase
end

/********************************************************************************/
/**************************    时钟复位（T6）         **************************/
/********************************************************************************/

key_sync #(
    .P_CLK_FRE      (P_CLK_FRE      ),
    .P_KEY_IN_MODE  (1'b0           ),
    .P_KEY_OUT_MODE (1'b0           )
)key_sync_rst_m0(
    .i_sys_clk      (i_clk_27m      ),
    .i_key_async    (i_rst_n        ),
    .o_key_sync     (rst_deb        )
);

boot_rst boot_rst_m0(
    .i_clk   (i_clk_27m  ),
    .i_rst_n (rst_deb    ),
    .o_rst_n (sys_rst_n  )
);

/********************************************************************************/
/**************************    C6按键消抖与计数        *************************/
/********************************************************************************/

key_sync #(
    .P_CLK_FRE      (P_CLK_FRE      ),
    .P_KEY_IN_MODE  (1'b0           ),
    .P_KEY_OUT_MODE (1'b0           )
)key_sync_c6_m0(
    .i_sys_clk      (i_clk_27m      ),
    .i_key_async    (i_key_c6       ),
    .o_key_sync     (key_c6_sync    )
);

key_cnt #(
    .P_CLK_FRE (P_CLK_FRE     ),
    .P_CNT     (P_KEY_CNT_W   ),
    .P_CNT_MAX (P_KEY_CNT_MAX )
)key_cnt_m0(
    .i_sys_clk  (i_clk_27m   ),
    .i_rst_n    (sys_rst_n   ),
    .i_key_in   (key_c6_sync ),

    .o_key_cnt  (key_count   )
);

/********************************************************************************/
/**************************        WS2812 例化         *************************/
/********************************************************************************/

ws2812 #(
    .P_LED_NUM (1            ),
    .P_CLK_FRE (P_CLK_FRE    )
)ws2812_m0(
    .i_sys_clk   (i_clk_27m      ),
    .i_rst_n     (sys_rst_n      ),

    .i_rgb888    (rgb888         ),
    .i_data_en   (ws2812_data_en ),

    .o_ready     (ws2812_ready   ),
    .o_done      (ws2812_done    ),
    .o_ws2812_di (o_ws2812_di    )
);

endmodule
