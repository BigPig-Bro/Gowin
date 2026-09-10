module key_sync#(
    parameter P_CLK_FRE      = 50_000_000,
    parameter P_KEY_IN_MODE  = 0,
    parameter P_KEY_OUT_MODE = 1
)(
    input  logic i_sys_clk,
    input logic i_key_async,
    output logic o_key_sync = ~P_KEY_OUT_MODE
);

logic [15:0] clk_cnt = 16'd0;
logic        key_sample_en = 1'b0;
logic [3:0]  key_cnt = 4'd0;

always_ff @(posedge i_sys_clk) begin
    if (clk_cnt == P_CLK_FRE / 1000 - 1) begin
        clk_cnt       <= 16'd0;
        key_sample_en <= 1'b1;
    end else begin
        clk_cnt       <= clk_cnt + 1'b1;
        key_sample_en <= 1'b0;
    end
end

always_ff @(posedge i_sys_clk) begin
    if (key_sample_en) begin
        if (i_key_async == P_KEY_IN_MODE) begin
            if (key_cnt < 4'd10) begin
                key_cnt <= key_cnt + 1'b1;
                o_key_sync <= ~P_KEY_OUT_MODE;
            end else begin
                o_key_sync <= P_KEY_OUT_MODE;
            end
        end else begin
            key_cnt     <= 4'd0;
            o_key_sync  <= ~P_KEY_OUT_MODE;
        end
    end
end

endmodule