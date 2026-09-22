// LCD 彩条显示顶层模块，RGB输出改为时序逻辑（嵌套if）
// 更新日志
//260730 V1.0.0 deepseek 初始版本（基于top.v重构，按code_style风格重写，RGB改为时序逻辑）

module top #(
    parameter PIXEL_NUM = 800               // 水平像素数
) (
    input                               i_clk,              // 系统时钟
    output                              o_lcd_clk,          // LCD时钟
    output                              o_lcd_hs,           // LCD水平同步
    output                              o_lcd_vs,           // LCD垂直同步
    output                              o_lcd_de,           // LCD数据使能
    output      logic           [23:0]  o_lcd_rgb           // LCD RGB数据（时序输出）
);

/////////////////////////////////////////////////////////////////////////////////////////
////////////////////                 内部信号                /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
logic [9:0] lcd_x, lcd_y;
logic       rgb_clk;

/////////////////////////////////////////////////////////////////////////////////////////
////////////////////                 PLL例化                 /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
video_pll video_pll_m0(
    .clk_in1                     (i_clk                      ),
    .clk_out1                    (rgb_clk                    )
);

assign o_lcd_clk = ~rgb_clk;

/////////////////////////////////////////////////////////////////////////////////////////
////////////////////               rgb_timing例化            /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
rgb_timing rgb_timing_m0(
    .i_rgb_clk                  (rgb_clk                    ),
    .i_rgb_rst_n                (1'b1                       ),
    .o_rgb_hs                   (o_lcd_hs                   ),
    .o_rgb_vs                   (o_lcd_vs                   ),
    .o_rgb_de                   (o_lcd_de                   ),
    .o_rgb_x                    (lcd_x                      ),
    .o_rgb_y                    (lcd_y                      )
);

/////////////////////////////////////////////////////////////////////////////////////////
////////////////////              RGB时序逻辑                /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
always@(posedge rgb_clk)begin
    if (o_lcd_de) begin
        if (lcd_x < PIXEL_NUM *  1 / 24)
            o_lcd_rgb <= 24'H800000;
        else if (lcd_x < PIXEL_NUM *  2 / 24)
            o_lcd_rgb <= 24'H400000;
        else if (lcd_x < PIXEL_NUM *  3 / 24)
            o_lcd_rgb <= 24'H200000;
        else if (lcd_x < PIXEL_NUM *  4 / 24)
            o_lcd_rgb <= 24'H100000;
        else if (lcd_x < PIXEL_NUM *  5 / 24)
            o_lcd_rgb <= 24'H080000;
        else if (lcd_x < PIXEL_NUM *  6 / 24)
            o_lcd_rgb <= 24'H040000;
        else if (lcd_x < PIXEL_NUM *  7 / 24)
            o_lcd_rgb <= 24'H020000;
        else if (lcd_x < PIXEL_NUM *  8 / 24)
            o_lcd_rgb <= 24'H010000;
        else if (lcd_x < PIXEL_NUM *  9 / 24)
            o_lcd_rgb <= 24'H008000;
        else if (lcd_x < PIXEL_NUM * 10 / 24)
            o_lcd_rgb <= 24'H004000;
        else if (lcd_x < PIXEL_NUM * 11 / 24)
            o_lcd_rgb <= 24'H002000;
        else if (lcd_x < PIXEL_NUM * 12 / 24)
            o_lcd_rgb <= 24'H001000;
        else if (lcd_x < PIXEL_NUM * 13 / 24)
            o_lcd_rgb <= 24'H000800;
        else if (lcd_x < PIXEL_NUM * 14 / 24)
            o_lcd_rgb <= 24'H000400;
        else if (lcd_x < PIXEL_NUM * 15 / 24)
            o_lcd_rgb <= 24'H000200;
        else if (lcd_x < PIXEL_NUM * 16 / 24)
            o_lcd_rgb <= 24'H000100;
        else if (lcd_x < PIXEL_NUM * 17 / 24)
            o_lcd_rgb <= 24'H000080;
        else if (lcd_x < PIXEL_NUM * 18 / 24)
            o_lcd_rgb <= 24'H000040;
        else if (lcd_x < PIXEL_NUM * 19 / 24)
            o_lcd_rgb <= 24'H000020;
        else if (lcd_x < PIXEL_NUM * 20 / 24)
            o_lcd_rgb <= 24'H000010;
        else if (lcd_x < PIXEL_NUM * 21 / 24)
            o_lcd_rgb <= 24'H000008;
        else if (lcd_x < PIXEL_NUM * 22 / 24)
            o_lcd_rgb <= 24'H000004;
        else if (lcd_x < PIXEL_NUM * 23 / 24)
            o_lcd_rgb <= 24'H000002;
        else
            o_lcd_rgb <= 24'H000001;
    end else begin
        o_lcd_rgb <= 24'H000000;
    end
end

endmodule
