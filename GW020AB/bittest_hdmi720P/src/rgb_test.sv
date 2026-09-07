// RGB 测试模块：24色条/八色/电视测试卡/透传 四模式切换（模式2图形流水线）
//260906    v1.0.0   初始版本
module rgb_test #(
    parameter P_RGB_MODE = 4'd4    //分辨率选择，0~7，同rgb_timing
)(
    input               i_sys_clk,     //像素时钟
    input               i_rst_n,       //复位信号，低有效
    input        [1:0]  i_sel,         //模式选择：0 24色条 1 八色 2 电视测试卡 3 透传

    input               i_rgb_hs,      //输入水平同步
    input               i_rgb_vs,      //输入垂直同步
    input               i_rgb_de,      //输入数据有效
    input        [23:0] i_rgb_data,    //输入RGB数据

    output logic        o_rgb_hs,      //输出水平同步
    output logic        o_rgb_vs,      //输出垂直同步
    output logic        o_rgb_de,      //输出数据有效
    output logic [23:0] o_rgb_data     //输出RGB数据
);

/********************************************************************************/
/**************************        参数与常量        *****************************/
/********************************************************************************/

//分辨率有效像素（同rgb_timing_cfg的0~7）
localparam H_ACTIVE = (P_RGB_MODE == 4'd0) ? 16'd480  :
                      (P_RGB_MODE == 4'd1) ? 16'd640  :
                      (P_RGB_MODE == 4'd2) ? 16'd800  :
                      (P_RGB_MODE == 4'd3) ? 16'd1024 :
                      (P_RGB_MODE == 4'd4) ? 16'd1280 :
                      (P_RGB_MODE == 4'd5) ? 16'd1920 :
                      (P_RGB_MODE == 4'd6) ? 16'd2560 : 16'd3840;
localparam V_ACTIVE = (P_RGB_MODE == 4'd0) ? 16'd272  :
                      (P_RGB_MODE == 4'd1) ? 16'd480  :
                      (P_RGB_MODE == 4'd2) ? 16'd480  :
                      (P_RGB_MODE == 4'd3) ? 16'd768  :
                      (P_RGB_MODE == 4'd4) ? 16'd720  :
                      (P_RGB_MODE == 4'd5) ? 16'd1080 :
                      (P_RGB_MODE == 4'd6) ? 16'd1440 : 16'd2160;

//色条步进宽度（编译期常量，N等分）
localparam STEP_8  = H_ACTIVE / 8;
localparam STEP_24 = H_ACTIVE / 24;
localparam STEP_6  = H_ACTIVE / 6;

//棋盘格
localparam TB_W   = 24'hFFFFFF;  //棋盘白
localparam TB_G   = 24'hC0C0C0;  //棋盘灰
localparam TB_IN  = 24'h404040;  //中央方块底色

//中央大方块：宽=3/8屏宽，高=2/3屏高（1280x720时为480x480，居中）
localparam MAIN_W  = (H_ACTIVE * 3) >> 3;
localparam MAIN_H  = (V_ACTIVE * 2) / 3;
localparam MAIN_X0 = (H_ACTIVE - MAIN_W) >> 1;
localparam MAIN_Y0 = (V_ACTIVE - MAIN_H) >> 1;
localparam MAIN_X1 = MAIN_X0 + MAIN_W;
localparam MAIN_Y1 = MAIN_Y0 + MAIN_H;
localparam MAIN_CX = (MAIN_X0 + MAIN_X1) >> 1;
localparam MAIN_CY = (MAIN_Y0 + MAIN_Y1) >> 1;

//中心十字半宽
localparam CROSS_HW = 16'd3;

//彩条带/灰阶带/竖条区/底部6色块行（中央大块内，比例定位）
localparam BAR_Y0  = MAIN_Y0 + (MAIN_H >> 2);
localparam BAR_Y1  = BAR_Y0 + (MAIN_H >> 3);
localparam GRAY_Y0 = MAIN_Y0 + ((MAIN_H * 5) >> 3);
localparam GRAY_Y1 = GRAY_Y0 + (MAIN_H >> 3);
localparam STR_X0  = MAIN_X0;
localparam STR_X1  = MAIN_X0 + (MAIN_W / 3);
localparam STR_Y0  = MAIN_Y0 + (MAIN_H >> 1);
localparam STR_Y1  = STR_Y0 + (MAIN_H >> 3);
localparam R6_Y0   = MAIN_Y0 + ((MAIN_H * 3) >> 2);
localparam R6_Y1   = R6_Y0 + (MAIN_H >> 3);
localparam R6_W    = MAIN_W / 6;

//横向RGB渐变色带（位于彩条带与竖条区之间，左R100→中G010→右B001）
localparam GRAD_Y0 = MAIN_Y0 + ((MAIN_H * 3) >> 3);
localparam GRAD_Y1 = GRAD_Y0 + (MAIN_H >> 4);
localparam GRAD_W  = MAIN_W;
localparam GRAD_H  = GRAD_W / 2;
localparam GRAD_SC = (255 * 256) / GRAD_H;

//四角方块（按屏高比例）
localparam COR_SIZE  = V_ACTIVE >> 3;
localparam COR_X1    = H_ACTIVE - COR_SIZE;
localparam COR_Y1    = V_ACTIVE - COR_SIZE;
localparam COR_SQ_HW = COR_SIZE >> 2;
localparam COR_CX0   = COR_SIZE >> 1;
localparam COR_CY0   = COR_SIZE >> 1;
localparam COR_CX1   = H_ACTIVE - (COR_SIZE >> 1);
localparam COR_CY1   = COR_SIZE >> 1;
localparam COR_CX2   = COR_SIZE >> 1;
localparam COR_CY2   = V_ACTIVE - (COR_SIZE >> 1);
localparam COR_CX3   = H_ACTIVE - (COR_SIZE >> 1);
localparam COR_CY3   = V_ACTIVE - (COR_SIZE >> 1);

//彩条颜色（黄 青 绿 品红 红 蓝）
localparam BAR0_RGB = 24'hFFFF00;
localparam BAR1_RGB = 24'h00FFFF;
localparam BAR2_RGB = 24'h00FF00;
localparam BAR3_RGB = 24'hFF00FF;
localparam BAR4_RGB = 24'hFF0000;
localparam BAR5_RGB = 24'h0000FF;

//扩展色块颜色
localparam EXT_R   = 24'hFF0000;  //红
localparam EXT_OR  = 24'hFF8000;  //橙
localparam EXT_Y   = 24'hFFFF00;  //黄
localparam EXT_G   = 24'h00FF00;  //绿
localparam EXT_C   = 24'h00FFFF;  //青
localparam EXT_B   = 24'h0000FF;  //蓝
localparam EXT_M   = 24'hFF00FF;  //品红
localparam EXT_W   = 24'hFFFFFF;  //白
localparam EXT_GY  = 24'h808080;  //灰
localparam EXT_BK  = 24'h000000;  //黑

//顶部/底部色块行（比例定位）
localparam TOP_Y0 = 16'd0;
localparam TOP_Y1 = V_ACTIVE >> 5;
localparam BOT_Y0 = V_ACTIVE - (V_ACTIVE >> 5);
localparam BOT_Y1 = V_ACTIVE;

//左右彩色竖列（比例定位）
localparam SIDE_W  = H_ACTIVE >> 6;
localparam SIDE_X0 = 16'd0;
localparam SIDE_X1 = SIDE_W;
localparam SIDE_X2 = H_ACTIVE - SIDE_W;
localparam SIDE_X3 = H_ACTIVE;
localparam SIDE_Y0 = TOP_Y1;
localparam SIDE_Y1 = BOT_Y0;
localparam SIDE_QH = (SIDE_Y1 - SIDE_Y0) >> 2;

//四象限大色块（比例定位）
localparam Q_X0 = COR_SIZE + 16'd40;
localparam Q_X1 = Q_X0 + (H_ACTIVE >> 3);
localparam Q_X2 = H_ACTIVE - Q_X1;
localparam Q_X3 = H_ACTIVE - Q_X0;
localparam Q_Y0 = COR_SIZE + 16'd40;
localparam Q_Y1 = Q_Y0 + (V_ACTIVE >> 3);
localparam Q_Y2 = V_ACTIVE - Q_Y1;
localparam Q_Y3 = V_ACTIVE - Q_Y0;

/********************************************************************************/
/**************************        内部信号        *******************************/
/********************************************************************************/

logic [15:0] x_cnt;      //当前行有效像素坐标，从0开始
logic [15:0] y_cnt;      //当前帧有效行坐标，从0开始
logic        de_d;       //de延迟一拍，用于下降沿检测
logic        vs_d;       //vs延迟一拍，用于边沿检测

//色条步进计数器（与x_cnt同步，编译期常量步长）
logic [15:0] cnt_8;      //八色条步进计数
logic [15:0] cnt_24;     //24色条步进计数
logic [15:0] cnt_6;      //彩条步进计数
logic [ 4:0] idx_8;      //八色条索引0~7
logic [ 4:0] idx_24;     //24色条索引0~23
logic [ 4:0] idx_6;      //彩条索引0~5

//流水线A
logic [15:0] x_a;
logic [15:0] y_a;
logic [ 1:0] sel_a;
logic        hs_a;
logic        vs_a;
logic        de_a;
logic [23:0] data_a;
logic [ 4:0] idx_8_a;    //八色条索引A级打拍
logic [ 4:0] idx_24_a;   //24色条索引A级打拍
logic [ 4:0] idx_6_a;    //彩条索引A级打拍

//流水线B
logic [15:0] x_b;
logic [15:0] y_b;
logic [ 1:0] sel_b;
logic        hs_b;
logic        vs_b;
logic        de_b;
logic [23:0] data_b;
logic [ 4:0] bar_idx_8_b;   //八色条索引B级打拍0~7
logic [ 4:0] bar_idx_24_b;  //24色条索引B级打拍0~23
logic [ 4:0] bar_idx_6_b;   //彩条索引B级打拍0~5

//测试图形生成
logic [ 7:0] gray_val;      //灰阶值
logic        main_hit;      //像素是否在中央方块内
logic [23:0] mode2_color;   //电视测试卡颜色
logic [23:0] rgb_pattern;   //测试图形RGB

//横向RGB渐变色带中间量
logic [15:0] grad_base_b;   //渐变定点基值（B级打拍）
logic [ 7:0] grad_r;        //渐变R
logic [ 7:0] grad_g;        //渐变G
logic [ 7:0] grad_b;        //渐变B

//流水线C：图形打拍
logic [23:0] rgb_pattern_r;
logic [ 1:0] sel_c;
logic        hs_c;
logic        vs_c;
logic        de_c;
logic [23:0] data_c;

/********************************************************************************/
/**************************        行场坐标计数        ***************************/
/********************************************************************************/

always@(posedge i_sys_clk)begin
    if(!i_rst_n)begin
        x_cnt  <= 16'd0;
        y_cnt  <= 16'd0;
        de_d   <= 1'b0;
        vs_d   <= 1'b0;
        cnt_8  <= 16'd0;  idx_8  <= 5'd0;
        cnt_24 <= 16'd0;  idx_24 <= 5'd0;
        cnt_6  <= 16'd0;  idx_6  <= 5'd0;
    end else begin
        de_d <= i_rgb_de;
        vs_d <= i_rgb_vs;

        //X坐标：有效区内从0递增，消隐区清零；同时做色条步进计数
        if(i_rgb_de)begin
            x_cnt <= x_cnt + 16'd1;

            //八色条步进（每格STEP_8）
            if(cnt_8 == STEP_8 - 16'd1)begin
                cnt_8 <= 16'd0;
                if(idx_8 < 5'd7)begin
                    idx_8 <= idx_8 + 5'd1;
                end
            end else begin
                cnt_8 <= cnt_8 + 16'd1;
            end

            //24色条步进（每格STEP_24）
            if(cnt_24 == STEP_24 - 16'd1)begin
                cnt_24 <= 16'd0;
                if(idx_24 < 5'd23)begin
                    idx_24 <= idx_24 + 5'd1;
                end
            end else begin
                cnt_24 <= cnt_24 + 16'd1;
            end

            //彩条6段步进（每格STEP_6）
            if(cnt_6 == STEP_6 - 16'd1)begin
                cnt_6 <= 16'd0;
                if(idx_6 < 5'd5)begin
                    idx_6 <= idx_6 + 5'd1;
                end
            end else begin
                cnt_6 <= cnt_6 + 16'd1;
            end
        end else begin
            x_cnt  <= 16'd0;
            cnt_8  <= 16'd0;  idx_8  <= 5'd0;
            cnt_24 <= 16'd0;  idx_24 <= 5'd0;
            cnt_6  <= 16'd0;  idx_6  <= 5'd0;
        end

        //Y坐标：de下降沿换行+1，vs任意边沿回到首行
        if(i_rgb_vs != vs_d)begin
            y_cnt <= 16'd0;
        end else if(!i_rgb_de && de_d)begin
            y_cnt <= y_cnt + 16'd1;
        end
    end
end

/********************************************************************************/
/**************************        图形流水线A        ****************************/
/********************************************************************************/

always@(posedge i_sys_clk)begin
    if(!i_rst_n)begin
        x_a     <= 16'd0;
        y_a     <= 16'd0;
        sel_a   <= 2'd0;
        idx_8_a <= 5'd0;
        idx_24_a<= 5'd0;
        idx_6_a <= 5'd0;
        hs_a    <= 1'b0;
        vs_a    <= 1'b0;
        de_a    <= 1'b0;
        data_a  <= 24'd0;
    end else begin
        x_a     <= x_cnt;
        y_a     <= y_cnt;
        sel_a   <= i_sel;
        idx_8_a <= idx_8;
        idx_24_a<= idx_24;
        idx_6_a <= idx_6;
        hs_a    <= i_rgb_hs;
        vs_a    <= i_rgb_vs;
        de_a    <= i_rgb_de;
        data_a  <= i_rgb_data;
    end
end

/********************************************************************************/
/**************************        图形流水线B        ****************************/
/********************************************************************************/

always@(posedge i_sys_clk)begin
    if(!i_rst_n)begin
        x_b        <= 16'd0;
        y_b        <= 16'd0;
        sel_b      <= 2'd0;
        bar_idx_8_b  <= 5'd0;
        bar_idx_24_b <= 5'd0;
        bar_idx_6_b  <= 5'd0;
        grad_base_b  <= 16'd0;
        hs_b       <= 1'b0;
        vs_b       <= 1'b0;
        de_b       <= 1'b0;
        data_b     <= 24'd0;
    end else begin
        x_b        <= x_a;
        y_b        <= y_a;
        sel_b      <= sel_a;
        bar_idx_8_b  <= idx_8_a;
        bar_idx_24_b <= idx_24_a;
        bar_idx_6_b  <= idx_6_a;
        grad_base_b  <= ((x_a - MAIN_X0) * GRAD_SC) >> 8;
        hs_b       <= hs_a;
        vs_b       <= vs_a;
        de_b       <= de_a;
        data_b     <= data_a;
    end
end

/********************************************************************************/
/**************************        测试图形生成        ***************************/
/********************************************************************************/

assign gray_val     = bar_idx_8_b * 8'd36;  //灰阶0~252
assign main_hit     = (x_b >= MAIN_X0) && (x_b < MAIN_X1) &&
                      (y_b >= MAIN_Y0) && (y_b < MAIN_Y1);

//四角测试图：黑方块+白方块+黑十字
function automatic logic [23:0] get_corner(input [15:0] x, input [15:0] y,
                                           input [15:0] cx, input [15:0] cy);
begin
    if((x >= cx - COR_SQ_HW) && (x < cx + COR_SQ_HW) &&
       (y >= cy - COR_SQ_HW) && (y < cy + COR_SQ_HW))begin
        get_corner = 24'hFFFFFF;
    end else begin
        get_corner = 24'h000000;
    end
    if((x >= cx - 16'd3) && (x < cx + 16'd3))begin
        get_corner = 24'h000000;
    end else if((y >= cy - 16'd3) && (y < cy + 16'd3))begin
        get_corner = 24'h000000;
    end
end
endfunction

//电视测试卡：棋盘格+中央方块+彩条+灰阶+竖条+十字+四角+多组色块（全部方块实现）
always@(*)begin
    grad_r = 8'd0;
    grad_g = 8'd0;
    grad_b = 8'd0;

    if(x_b[4] ^ y_b[4])begin
        mode2_color = TB_G;
    end else begin
        mode2_color = TB_W;
    end

    if(main_hit)begin
        mode2_color = TB_IN;
    end

    if((y_b >= BAR_Y0) && (y_b < BAR_Y1) && main_hit)begin
        case(bar_idx_6_b)
            5'd0: mode2_color = BAR0_RGB;
            5'd1: mode2_color = BAR1_RGB;
            5'd2: mode2_color = BAR2_RGB;
            5'd3: mode2_color = BAR3_RGB;
            5'd4: mode2_color = BAR4_RGB;
            default: mode2_color = BAR5_RGB;
        endcase
    end

    if((y_b >= GRAY_Y0) && (y_b < GRAY_Y1) && main_hit)begin
        mode2_color = {gray_val, gray_val, gray_val};
    end

    if((x_b >= STR_X0) && (x_b < STR_X1) &&
       (y_b >= STR_Y0) && (y_b < STR_Y1) && main_hit)begin
        if(x_b[2] == 1'b0)begin
            mode2_color = 24'hFFFFFF;
        end else begin
            mode2_color = 24'h000000;
        end
    end

    //顶部8色块横排
    if((y_b >= TOP_Y0) && (y_b < TOP_Y1))begin
        case(bar_idx_8_b)
            5'd0: mode2_color = EXT_R;
            5'd1: mode2_color = EXT_OR;
            5'd2: mode2_color = EXT_Y;
            5'd3: mode2_color = EXT_G;
            5'd4: mode2_color = EXT_C;
            5'd5: mode2_color = EXT_B;
            5'd6: mode2_color = EXT_M;
            default: mode2_color = EXT_W;
        endcase
    end

    //底部8色块横排
    if((y_b >= BOT_Y0) && (y_b < BOT_Y1))begin
        case(bar_idx_8_b)
            5'd0: mode2_color = EXT_BK;
            5'd1: mode2_color = EXT_GY;
            5'd2: mode2_color = EXT_W;
            5'd3: mode2_color = EXT_Y;
            5'd4: mode2_color = EXT_C;
            5'd5: mode2_color = EXT_M;
            5'd6: mode2_color = EXT_R;
            default: mode2_color = EXT_B;
        endcase
    end

    //左侧彩色竖列（4段）
    if((x_b >= SIDE_X0) && (x_b < SIDE_X1) &&
       (y_b >= SIDE_Y0) && (y_b < SIDE_Y1))begin
        if(y_b < SIDE_Y0 + SIDE_QH)begin
            mode2_color = EXT_R;
        end else if(y_b < SIDE_Y0 + 2 * SIDE_QH)begin
            mode2_color = EXT_G;
        end else if(y_b < SIDE_Y0 + 3 * SIDE_QH)begin
            mode2_color = EXT_B;
        end else begin
            mode2_color = EXT_Y;
        end
    end

    //右侧彩色竖列（4段）
    if((x_b >= SIDE_X2) && (x_b < SIDE_X3) &&
       (y_b >= SIDE_Y0) && (y_b < SIDE_Y1))begin
        if(y_b < SIDE_Y0 + SIDE_QH)begin
            mode2_color = EXT_W;
        end else if(y_b < SIDE_Y0 + 2 * SIDE_QH)begin
            mode2_color = EXT_GY;
        end else if(y_b < SIDE_Y0 + 3 * SIDE_QH)begin
            mode2_color = EXT_C;
        end else begin
            mode2_color = EXT_M;
        end
    end

    //中央大块内底部6色块横排
    if((y_b >= R6_Y0) && (y_b < R6_Y1) && main_hit)begin
        if((x_b >= MAIN_X0) && (x_b < MAIN_X0 + R6_W))begin
            mode2_color = EXT_R;
        end else if((x_b >= MAIN_X0 + R6_W) && (x_b < MAIN_X0 + 2 * R6_W))begin
            mode2_color = EXT_OR;
        end else if((x_b >= MAIN_X0 + 2 * R6_W) && (x_b < MAIN_X0 + 3 * R6_W))begin
            mode2_color = EXT_Y;
        end else if((x_b >= MAIN_X0 + 3 * R6_W) && (x_b < MAIN_X0 + 4 * R6_W))begin
            mode2_color = EXT_G;
        end else if((x_b >= MAIN_X0 + 4 * R6_W) && (x_b < MAIN_X0 + 5 * R6_W))begin
            mode2_color = EXT_B;
        end else if((x_b >= MAIN_X0 + 5 * R6_W) && (x_b < MAIN_X1))begin
            mode2_color = EXT_M;
        end
    end

    //四象限大色块（棋盘上）
    if((x_b >= Q_X0) && (x_b < Q_X1) && (y_b >= Q_Y0) && (y_b < Q_Y1))begin
        mode2_color = EXT_R;
    end else if((x_b >= Q_X2) && (x_b < Q_X3) && (y_b >= Q_Y0) && (y_b < Q_Y1))begin
        mode2_color = EXT_G;
    end else if((x_b >= Q_X0) && (x_b < Q_X1) && (y_b >= Q_Y2) && (y_b < Q_Y3))begin
        mode2_color = EXT_B;
    end else if((x_b >= Q_X2) && (x_b < Q_X3) && (y_b >= Q_Y2) && (y_b < Q_Y3))begin
        mode2_color = EXT_Y;
    end

    //横向RGB渐变色带：左R100→中G010→右B001（一段连续渐变）
    if((y_b >= GRAD_Y0) && (y_b < GRAD_Y1) && main_hit)begin
        if(x_b < MAIN_X0 + GRAD_H)begin
            grad_r = 8'd255 - grad_base_b[7:0];
            grad_g = grad_base_b[7:0];
            grad_b = 8'd0;
        end else begin
            grad_g = 8'd255 - (grad_base_b - 8'd255);
            grad_r = 8'd0;
            grad_b = grad_base_b - 8'd255;
        end
        mode2_color = {grad_r, grad_g, grad_b};
    end

    if(((x_b >= MAIN_CX - CROSS_HW) && (x_b < MAIN_CX + CROSS_HW)) ||
       ((y_b >= MAIN_CY - CROSS_HW) && (y_b < MAIN_CY + CROSS_HW)))begin
        mode2_color = 24'h000000;
    end

    if((x_b < COR_SIZE) && (y_b < COR_SIZE))begin
        mode2_color = get_corner(x_b, y_b, COR_CX0, COR_CY0);
    end else if((x_b >= COR_X1) && (y_b < COR_SIZE))begin
        mode2_color = get_corner(x_b, y_b, COR_CX1, COR_CY1);
    end else if((x_b < COR_SIZE) && (y_b >= COR_Y1))begin
        mode2_color = get_corner(x_b, y_b, COR_CX2, COR_CY2);
    end else if((x_b >= COR_X1) && (y_b >= COR_Y1))begin
        mode2_color = get_corner(x_b, y_b, COR_CX3, COR_CY3);
    end
end

//按模式生成测试RGB
always@(*)begin
    case(sel_b)
        2'd0:begin
            //24色条：RGB888各位单独点亮（case译码替代移位，避免长移位/乘法路径）
            case(bar_idx_24_b)
                5'd0:  rgb_pattern = 24'h000001;
                5'd1:  rgb_pattern = 24'h000002;
                5'd2:  rgb_pattern = 24'h000004;
                5'd3:  rgb_pattern = 24'h000008;
                5'd4:  rgb_pattern = 24'h000010;
                5'd5:  rgb_pattern = 24'h000020;
                5'd6:  rgb_pattern = 24'h000040;
                5'd7:  rgb_pattern = 24'h000080;
                5'd8:  rgb_pattern = 24'h000100;
                5'd9:  rgb_pattern = 24'h000200;
                5'd10: rgb_pattern = 24'h000400;
                5'd11: rgb_pattern = 24'h000800;
                5'd12: rgb_pattern = 24'h001000;
                5'd13: rgb_pattern = 24'h002000;
                5'd14: rgb_pattern = 24'h004000;
                5'd15: rgb_pattern = 24'h008000;
                5'd16: rgb_pattern = 24'h010000;
                5'd17: rgb_pattern = 24'h020000;
                5'd18: rgb_pattern = 24'h040000;
                5'd19: rgb_pattern = 24'h080000;
                5'd20: rgb_pattern = 24'h100000;
                5'd21: rgb_pattern = 24'h200000;
                5'd22: rgb_pattern = 24'h400000;
                default: rgb_pattern = 24'h800000;
            endcase
        end

        2'd1:begin
            //八色：RGB位宽展开为000~111
            rgb_pattern = {{8{bar_idx_8_b[2]}}, {8{bar_idx_8_b[1]}}, {8{bar_idx_8_b[0]}}};
        end

        2'd2:begin
            //电视测试卡：棋盘格+中央方块+彩条+灰阶+竖条+十字+四角+多组色块
            rgb_pattern = mode2_color;
        end

        default:begin
            //透传在输出级单独处理
            rgb_pattern = 24'd0;
        end
    endcase
end

/********************************************************************************/
/**************************        图形流水线C        ****************************/
/********************************************************************************/

always@(posedge i_sys_clk)begin
    if(!i_rst_n)begin
        rgb_pattern_r <= 24'd0;
        sel_c         <= 2'd0;
        hs_c          <= 1'b0;
        vs_c          <= 1'b0;
        de_c          <= 1'b0;
        data_c        <= 24'd0;
    end else begin
        rgb_pattern_r <= rgb_pattern;
        sel_c         <= sel_b;
        hs_c          <= hs_b;
        vs_c          <= vs_b;
        de_c          <= de_b;
        data_c        <= data_b;
    end
end

/********************************************************************************/
/**************************        输出打拍        *******************************/
/********************************************************************************/

always@(posedge i_sys_clk)begin
    if(!i_rst_n)begin
        o_rgb_hs   <= 1'b0;
        o_rgb_vs   <= 1'b0;
        o_rgb_de   <= 1'b0;
        o_rgb_data <= 24'd0;
    end else begin
        o_rgb_hs <= hs_c;
        o_rgb_vs <= vs_c;
        o_rgb_de <= de_c;

        //透传模式保留消隐区数据，测试图形模式消隐区输出黑
        if(sel_c == 2'd3)begin
            o_rgb_data <= data_c;
        end else if(de_c)begin
            o_rgb_data <= rgb_pattern_r;
        end else begin
            o_rgb_data <= 24'd0;
        end
    end
end

endmodule
