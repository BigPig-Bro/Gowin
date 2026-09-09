// 800x480 LCD RGB 位检测 + 双编码器按键移动方块测试工程（顶层）
//260909    v1.0.0   初始版本

module top (
    input         i_clk_27m,   //系统时钟 27MHz
    input         i_rst_n,     //系统复位，低有效

    input  [2:0]  i_key_A,     //编码器A按键：[0] A [1] B [2] ENTER，按下为低电平
    input  [2:0]  i_key_B,     //编码器B按键：[0] A [1] B [2] ENTER，按下为低电平

    output        o_lcd_clk,   //LCD像素时钟
    output        o_lcd_hs,    //LCD水平同步
    output        o_lcd_vs,    //LCD垂直同步
    output        o_lcd_de,    //LCD数据有效
    output [23:0] o_lcd_data   //LCD RGB888数据
);

localparam P_CLK_FRE = 27_000_000;  //输入时钟频率 Hz
localparam PIXEL_NUM = 800;          //水平有效像素

/********************************************************************************/
/**************************    时钟复位与编码器（i_clk_27m）  *******************/
/********************************************************************************/

logic        rgb_clk;     //像素时钟
logic        sys_rst_n;   //系统复位，低有效
logic [ 7:0] reg_A;       //编码器A位置寄存器
logic [ 7:0] reg_B;       //编码器B位置寄存器

boot_rst boot_rst_m0(
    .i_clk   (i_clk_27m  ),
    .i_rst_n (i_rst_n    ),
    .o_rst_n (sys_rst_n  )
);

video_pll video_pll_m0(
    .clkin   (i_clk_27m  ),
    .clkout  (rgb_clk    )
);

//编码器属于用户逻辑，放在用户功能区域
Encoder_top #(
    .CLK_FRE (P_CLK_FRE      )
)Encoder_top_m0(
    .i_clk   (i_clk_27m      ),
    .i_key_A (i_key_A        ),
    .i_key_B (i_key_B        ),

    .o_reg_A (reg_A          ),
    .o_reg_B (reg_B          )
);

/********************************************************************************/
/**************************    视频时序与RGB输出（rgb_clk）  ********************/
/********************************************************************************/

logic        rgb_hs;      //水平同步
logic        rgb_vs;      //垂直同步
logic        rgb_de;      //数据有效
logic [15:0] rgb_x;       //视频X坐标
logic [15:0] rgb_y;       //视频Y坐标
logic [23:0] lcd_rgb;     //LCD RGB数据

rgb_timing #(
    .P_RGB_MODE (4'd2           )  //2: 800x480
)rgb_timing_m0(
    .i_sys_clk  (rgb_clk        ),
    .i_rst_n    (sys_rst_n      ),

    .o_rgb_hs   (rgb_hs         ),
    .o_rgb_vs   (rgb_vs         ),
    .o_rgb_de   (rgb_de         ),
    .o_rgb_x    (rgb_x          ),
    .o_rgb_y    (rgb_y          )
);

//RGB888 按位检测色条 + 编码器控制的红/绿方块，直接时序输出
always@(posedge rgb_clk)begin
    if(!sys_rst_n)begin
        lcd_rgb <= 24'd0;
    end else if(rgb_de)begin
        if((rgb_y >= 16'd100) && (rgb_y < 16'd140) &&
           (rgb_x > (reg_A + 16'd100)) && (rgb_x < (reg_A + 16'd140)))begin
            lcd_rgb <= 24'hFF0000;  //编码器A红色方块
        end else if((rgb_y >= 16'd200) && (rgb_y < 16'd240) &&
                    (rgb_x > (reg_B + 16'd100)) && (rgb_x < (reg_B + 16'd140)))begin
            lcd_rgb <= 24'h00FF00;  //编码器B绿色方块
        end else if(rgb_x < PIXEL_NUM *  1 / 24)begin
            lcd_rgb <= 24'h800000;
        end else if(rgb_x < PIXEL_NUM *  2 / 24)begin
            lcd_rgb <= 24'h400000;
        end else if(rgb_x < PIXEL_NUM *  3 / 24)begin
            lcd_rgb <= 24'h200000;
        end else if(rgb_x < PIXEL_NUM *  4 / 24)begin
            lcd_rgb <= 24'h100000;
        end else if(rgb_x < PIXEL_NUM *  5 / 24)begin
            lcd_rgb <= 24'h080000;
        end else if(rgb_x < PIXEL_NUM *  6 / 24)begin
            lcd_rgb <= 24'h040000;
        end else if(rgb_x < PIXEL_NUM *  7 / 24)begin
            lcd_rgb <= 24'h020000;
        end else if(rgb_x < PIXEL_NUM *  8 / 24)begin
            lcd_rgb <= 24'h010000;
        end else if(rgb_x < PIXEL_NUM *  9 / 24)begin
            lcd_rgb <= 24'h008000;
        end else if(rgb_x < PIXEL_NUM * 10 / 24)begin
            lcd_rgb <= 24'h004000;
        end else if(rgb_x < PIXEL_NUM * 11 / 24)begin
            lcd_rgb <= 24'h002000;
        end else if(rgb_x < PIXEL_NUM * 12 / 24)begin
            lcd_rgb <= 24'h001000;
        end else if(rgb_x < PIXEL_NUM * 13 / 24)begin
            lcd_rgb <= 24'h000800;
        end else if(rgb_x < PIXEL_NUM * 14 / 24)begin
            lcd_rgb <= 24'h000400;
        end else if(rgb_x < PIXEL_NUM * 15 / 24)begin
            lcd_rgb <= 24'h000200;
        end else if(rgb_x < PIXEL_NUM * 16 / 24)begin
            lcd_rgb <= 24'h000100;
        end else if(rgb_x < PIXEL_NUM * 17 / 24)begin
            lcd_rgb <= 24'h000080;
        end else if(rgb_x < PIXEL_NUM * 18 / 24)begin
            lcd_rgb <= 24'h000040;
        end else if(rgb_x < PIXEL_NUM * 19 / 24)begin
            lcd_rgb <= 24'h000020;
        end else if(rgb_x < PIXEL_NUM * 20 / 24)begin
            lcd_rgb <= 24'h000010;
        end else if(rgb_x < PIXEL_NUM * 21 / 24)begin
            lcd_rgb <= 24'h000008;
        end else if(rgb_x < PIXEL_NUM * 22 / 24)begin
            lcd_rgb <= 24'h000004;
        end else if(rgb_x < PIXEL_NUM * 23 / 24)begin
            lcd_rgb <= 24'h000002;
        end else begin
            lcd_rgb <= 24'h000001;
        end
    end else begin
        lcd_rgb <= 24'd0;
    end
end

/********************************************************************************/
/**************************        LCD 输出         *****************************/
/********************************************************************************/

assign o_lcd_clk  = ~rgb_clk;         //LCD像素时钟，反相后数据在DCLK上升沿稳定
assign o_lcd_hs   = rgb_hs;
assign o_lcd_vs   = rgb_vs;
assign o_lcd_de   = rgb_de;
assign o_lcd_data = lcd_rgb;

endmodule
