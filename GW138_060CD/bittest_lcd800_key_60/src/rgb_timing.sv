//  LCD 时序生成模块，输出DE/HS/VS均打一拍寄存器输出
// 更新日志
//260730 V1.0.0 deepseek 初始版本（基于rgb_timing.v重构，按code_style风格重写，DE/HS/VS打一拍输出）

module rgb_timing (
    input                               i_rgb_clk,          // 像素时钟
    input                               i_rgb_rst_n,        // 复位信号，低有效
    output      logic                   o_rgb_hs,           // 水平同步输出（打一拍）
    output      logic                   o_rgb_vs,           // 垂直同步输出（打一拍）
    output      logic                   o_rgb_de,           // 数据使能输出（打一拍）
    output      logic           [10:0]  o_rgb_x,            // 视频X坐标（打一拍）
    output      logic           [10:0]  o_rgb_y             // 视频Y坐标（打一拍）
);

//800*480@60Hz 33Mhz             //480*2720@60Hz 9Mhz        
parameter H_ACTIVE = 16'd800;    // 16'd480; 
parameter H_FP     = 16'd40;     // 16'd2; 
parameter H_SYNC   = 16'd128;    // 16'd41; 
parameter H_BP     = 16'd88;     // 16'd2; 
parameter V_ACTIVE = 16'd480;    // 16'd272; 
parameter V_FP     = 16'd1;      // 16'd2; 
parameter V_SYNC   = 16'd3;      // 16'd10; 
parameter V_BP     = 16'd21;     // 16'd2; 
parameter HS_POL   = 'b0;        // 1'b0; 
parameter VS_POL   = 'b0;        // 1'b0; 

/////////////////////////////////////////////////////////////////////////////////////////
////////////////////                 内部信号                /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
localparam H_TOTAL = H_ACTIVE + H_FP + H_SYNC + H_BP;
localparam V_TOTAL = V_ACTIVE + V_FP + V_SYNC + V_BP;

logic [11:0] h_cnt;
logic [11:0] v_cnt;

logic        hs_pre;
logic        vs_pre;
logic        h_active;
logic        v_active;
logic        de_pre;
logic [10:0] x_pre;
logic [10:0] y_pre;

/////////////////////////////////////////////////////////////////////////////////////////
////////////////////           行场计数 + HS/VS/DE/XY生成     /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
always@(posedge i_rgb_clk)begin
    if (!i_rgb_rst_n) begin
        h_cnt    <= 12'd0;
        v_cnt    <= 12'd0;
        hs_pre   <= 1'b0;
        vs_pre   <= 1'b0;
        h_active <= 1'b0;
        v_active <= 1'b0;
        x_pre    <= 11'd0;
        y_pre    <= 11'd0;
    end else begin
        // 列计数
        if (h_cnt == H_TOTAL - 1)
            h_cnt <= 12'd0;
        else
            h_cnt <= h_cnt + 12'd1;

        // 行计数
        if (h_cnt == H_FP - 1) begin
            if (v_cnt == V_TOTAL - 1)
                v_cnt <= 12'd0;
            else
                v_cnt <= v_cnt + 12'd1;
        end

        // HS生成
        if (h_cnt == H_FP - 1)
            hs_pre <= HS_POL;
        else if (h_cnt == H_FP + H_SYNC - 1)
            hs_pre <= ~hs_pre;

        // 列有效
        if (h_cnt == H_FP + H_SYNC + H_BP - 1)
            h_active <= 1'b1;
        else if (h_cnt == H_TOTAL - 1)
            h_active <= 1'b0;

        // VS生成
        if ((v_cnt == V_FP - 1) && (h_cnt == H_FP - 1))
            vs_pre <= VS_POL;
        else if ((v_cnt == V_FP + V_SYNC - 1) && (h_cnt == H_FP - 1))
            vs_pre <= ~vs_pre;

        // 行有效
        if ((v_cnt == V_FP + V_SYNC + V_BP - 1) && (h_cnt == H_FP - 1))
            v_active <= 1'b1;
        else if ((v_cnt == V_TOTAL - 1) && (h_cnt == H_FP - 1))
            v_active <= 1'b0;

        // XY坐标
        if (h_cnt >= H_FP + H_SYNC + H_BP)
            x_pre <= h_cnt - (H_FP[11:0] + H_SYNC[11:0] + H_BP[11:0]);
        else
            x_pre <= x_pre;

        if (v_cnt >= V_FP + V_SYNC + V_BP)
            y_pre <= v_cnt - (V_FP[11:0] + V_SYNC[11:0] + V_BP[11:0]);
        else
            y_pre <= y_pre;
    end
end

assign de_pre = h_active & v_active;

/////////////////////////////////////////////////////////////////////////////////////////
////////////////////           输出打一拍（寄存器）          /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
always@(posedge i_rgb_clk)begin
    if (!i_rgb_rst_n) begin
        o_rgb_hs <= 1'b0;
        o_rgb_vs <= 1'b0;
        o_rgb_de <= 1'b0;
        o_rgb_x  <= 11'd0;
        o_rgb_y  <= 11'd0;
    end else begin
        o_rgb_hs <= hs_pre;
        o_rgb_vs <= vs_pre;
        o_rgb_de <= de_pre;
        o_rgb_x  <= x_pre;
        o_rgb_y  <= y_pre;
    end
end

endmodule
