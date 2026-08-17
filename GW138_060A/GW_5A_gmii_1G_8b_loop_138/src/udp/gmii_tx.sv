// GMII TX — 流水线打拍 + 前导/SFD/数据/CRC32（无RAM）
// 260812 V1.0.0 初始版本
//        V1.0.1 修正数据计数器data_cnt位宽，导致最小帧填充错误
//        V1.0.2 更新data_cnt逻辑，使其支持巨型帧
module gmii_tx (
    input                               i_sys_clk,
    input                               i_rst_n,
    input                       [ 7:0]  i_tx_data,
    input                               i_tx_wr,
    input                               i_tx_last,
    output      logic                   o_tx_busy,
    output      logic           [ 7:0]  o_tx_data,
    output      logic                   o_tx_en
);
typedef enum logic [2:0] {
    S_IDLE      = 3'b000,
    S_PREAMBLE  = 3'b001,
    S_DATA      = 3'b010,
    S_ZERO      = 3'b011,
    S_FCS       = 3'b100
} state_t;

state_t state;
logic [ 9:0][7:0]               pipe_d;         // 10级数据流水线
logic [ 9:0]                    pipe_v;         // 有效位流水线
logic [ 9:0]                    pipe_l;         // last位流水线
logic [ 3:0]                    pre_cnt;
logic [ 3:0]                    fcs_cnt;
logic [31:0]                    crc_reg;
logic [31:0]                    fcs_val;
logic [ 5:0]                    data_cnt;  //注意最小帧填充, 数据低于18个字符的填0

function automatic [31:0] crc32(input [31:0] crc, input [7:0] d);
    logic [31:0] c;
    integer i;
    begin
        c = crc ^ {24'd0, d};
        for (i = 0; i < 8; i = i + 1) begin
            if (c[0]) begin c = (c >> 1) ^ 32'hEDB88320; end
            else      begin c = c >> 1; end
        end
        crc32 = c;
    end
endfunction

assign o_tx_busy = (state != S_IDLE);

always_ff @(posedge i_sys_clk) begin
    if (!i_rst_n) begin
        state     <= S_IDLE;
        o_tx_data <= 8'h00;
        o_tx_en   <= 1'b0;
    end else begin
        // === 流水线持续移位 ===
        pipe_d <= {pipe_d[8:0], i_tx_data};
        pipe_v <= {pipe_v[8:0], i_tx_wr};
        pipe_l <= {pipe_l[8:0], i_tx_wr && i_tx_last};

        case (state)
            S_IDLE: begin
                if (i_tx_wr) begin
                    pre_cnt <= 4'd0;
                    crc_reg <= 32'hFFFFFFFF;
                    state   <= S_PREAMBLE;
                end
            end

            S_PREAMBLE: begin
                o_tx_en <= 1'b1;
                if (pre_cnt < 4'd7) begin
                    o_tx_data <= 8'h55;
                end else begin
                    o_tx_data <= 8'hD5;         // SFD
                end
                pre_cnt <= pre_cnt + 4'd1;
                if (pre_cnt == 4'd7) begin
                    // 下一拍进入数据阶段
                    data_cnt <= 6'd0;
                    state <= S_DATA;
                end
            end

            S_DATA: begin
                crc_reg  <= crc32(crc_reg, pipe_d[8]);
                data_cnt <= (data_cnt == 6'h3f) ? data_cnt : data_cnt + 6'd1;

                if (pipe_v[8]) begin
                    o_tx_en   <= 1'b1;
                    o_tx_data <= pipe_d[8];
                end

                if (pipe_l[8]) begin
                    fcs_val <= ~crc32(crc_reg, pipe_d[8]);
                    fcs_cnt <= 4'd0;
                    state   <= (data_cnt < 6'd59) ? S_ZERO : S_FCS;
                end
            end

            S_ZERO: begin
                crc_reg  <= crc32(crc_reg, 8'h00);
                data_cnt <= data_cnt + 6'd1;

                o_tx_en   <= 1'b1;
                o_tx_data <= 8'h00;

                if (data_cnt == 6'd59) begin
                    fcs_val <= ~crc32(crc_reg, 8'h00);
                    fcs_cnt <= 4'd0;
                    state   <= S_FCS;
                end
            end

            S_FCS: begin
                case (fcs_cnt)
                    4'd0: begin o_tx_en <= 1'b1; o_tx_data <= fcs_val[7:0];  end
                    4'd1: begin o_tx_en <= 1'b1; o_tx_data <= fcs_val[15:8]; end
                    4'd2: begin o_tx_en <= 1'b1; o_tx_data <= fcs_val[23:16];end
                    4'd3: begin o_tx_en <= 1'b1; o_tx_data <= fcs_val[31:24];end
                    4'd4: begin o_tx_en <= 1'b0; state <= S_IDLE; end
                    default: begin state <= S_IDLE; end
                endcase
                fcs_cnt <= fcs_cnt + 4'd1;
            end

            default: begin state <= S_IDLE; end
        endcase
    end
end

endmodule
