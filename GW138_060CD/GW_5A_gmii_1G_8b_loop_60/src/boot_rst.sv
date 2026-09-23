// BOOT RST — 上电复位扩展：255→127→0 计数产生复位脉冲，避免RGMII时钟未起时复位锁死
//260822    v1.0.0   初始版本
module boot_rst (
    input   i_clk,
    input   i_rst_n,   // 低有效复位输入
    output  o_rst_n    // 低有效复位输出
);
localparam integer P_CNT_MAX = 255;
logic [7:0] cnt = 8'd255;
logic       boot_rst_n = 1'b1;

always_ff @(posedge i_clk) begin
    if (!i_rst_n) begin
        cnt        <= 8'd255;
        boot_rst_n <= 1'b1;
    end else if (cnt == 8'd0) begin
        boot_rst_n <= 1'b1;
    end else begin
        cnt        <= cnt - 8'd1;
        if (cnt == 8'd127) begin
            boot_rst_n <= 1'b0;
        end
    end
end

assign o_rst_n = i_rst_n & boot_rst_n;

endmodule
