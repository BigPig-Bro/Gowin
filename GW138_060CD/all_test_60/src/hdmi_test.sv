//HDMI 输出测试图案：上半屏24色条（逐位点灯，同 rgb_test mode0），下半屏透传摄像头原画
//260915    v1.0.0   初始版本
module hdmi_test #(
    parameter [15:0] P_H_ACTIVE = 16'd1024,   //水平有效像素
    parameter [15:0] P_V_ACTIVE = 16'd768,    //垂直有效行数
    parameter [15:0] P_STEP_24  = 16'd42      //24色条每根宽度 = H_ACTIVE/24
)(
    input        i_sys_clk,     //像素时钟
    input        i_rst_n,       //复位，低有效

    input        i_hs,          //输入水平同步（已与 i_rgb 对齐）
    input        i_vs,          //输入垂直同步
    input        i_de,          //输入数据有效
    input  [23:0] i_rgb,        //输入摄像头画面 RGB888

    output logic        o_hs,   //输出水平同步
    output logic        o_vs,   //输出垂直同步
    output logic        o_de,   //输出数据有效
    output logic [23:0] o_rgb   //输出RGB888
);

//半屏分界
localparam [15:0] P_V_HALF = P_V_ACTIVE >> 1;

logic [15:0] px_cnt;        //行内有效像素计数
logic [15:0] ln_cnt;        //有效行计数
logic        de_seen;       //本行出现过有效数据

//行内像素与有效行计数：hs 换行、vs 归零
//注意：rgb_timing 输出的 hs/vs 为低有效（hs_pol=0/vs_pol=0），故按 !i_hs / !i_vs 判断
always@(posedge i_sys_clk)begin
    if(!i_rst_n)begin
        px_cnt  <= 16'd0;
        ln_cnt  <= 16'd0;
        de_seen <= 1'b0;
    end else begin
        if(!i_vs)begin                       //场同步有效（低）
            px_cnt  <= 16'd0;
            ln_cnt  <= 16'd0;
            de_seen <= 1'b0;
        end else if(!i_hs)begin              //行同步有效（低）
            px_cnt  <= 16'd0;
            if(de_seen)begin
                ln_cnt <= ln_cnt + 16'd1;    //该行有有效数据才计一行
            end
            de_seen <= 1'b0;
        end else if(i_de)begin
            px_cnt  <= px_cnt + 16'd1;
            de_seen <= 1'b1;
        end
    end
end

/********************************************************************************/
/**************************     24色条（上半屏）      **************************/
/********************************************************************************/

logic [4:0]  bar_idx;
logic [23:0] bar_rgb;

//逐位点灯：第k根只点亮一位（与参考工程 rgb_test mode0 一致）
//末尾不足一根的余量归入第24根，避免索引越界
always@(*)begin
    if(px_cnt >= (P_STEP_24 * 16'd24))begin
        bar_idx = 5'd23;
    end else begin
        bar_idx = px_cnt / P_STEP_24;
    end
end

always@(*)begin
    bar_rgb = 24'd0;
    bar_rgb[bar_idx] = 1'b1;
end

/********************************************************************************/
/**************************     画面合成与输出       **************************/
/********************************************************************************/

always@(posedge i_sys_clk)begin
    if(!i_rst_n)begin
        o_hs  <= 1'b0;
        o_vs  <= 1'b0;
        o_de  <= 1'b0;
        o_rgb <= 24'd0;
    end else begin
        o_hs <= i_hs;
        o_vs <= i_vs;
        o_de <= i_de;

        if(ln_cnt < P_V_HALF)begin
            o_rgb <= bar_rgb;      //上半屏：24色条
        end else begin
            o_rgb <= i_rgb;        //下半屏：摄像头原画
        end
    end
end

endmodule
