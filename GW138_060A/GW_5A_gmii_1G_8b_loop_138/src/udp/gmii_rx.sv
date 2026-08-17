// GMII RX 帧解码 — 检测SFD，输出数据字节流（o_rx_last与最后字节对齐）
// V1.0.0
//
module gmii_rx (
    input                               i_sys_clk,
    input                               i_rst_n,
    input                       [ 7:0]  i_rx_data,
    input                               i_rx_dv,
    output      logic           [ 7:0]  o_rx_data,
    output      logic                   o_rx_valid,
    output      logic                   o_rx_last
    );
typedef enum logic [1:0] {
    S_IDLE     = 2'b00,
    S_PREAMBLE = 2'b01,
    S_DATA     = 2'b10
} state_t;

state_t state;
logic [7:0] prev_byte;
logic       prev_valid;

always_ff @(posedge i_sys_clk) begin
    if (!i_rst_n) begin
        state     <= S_IDLE;
        o_rx_data <= 8'h00;
        o_rx_valid<= 1'b0;
        o_rx_last <= 1'b0;
        prev_byte <= 8'h00;
        prev_valid<= 1'b0;
    end else begin
        o_rx_valid <= 1'b0;
        o_rx_last  <= 1'b0;

        case (state)
            S_IDLE: begin
                prev_valid <= 1'b0;
                if (i_rx_dv) begin
                    state <= S_PREAMBLE;
                end
            end

            S_PREAMBLE: begin
                if (!i_rx_dv) begin
                    state <= S_IDLE;
                end else if (i_rx_data[7:4] == 4'hD) begin
                    state <= S_DATA;
                end
            end

            S_DATA: begin
                if (i_rx_dv) begin
                    // 输出上一拍锁存的数据，当前数据存到prev
                    o_rx_data  <= prev_byte;
                    o_rx_valid <= prev_valid;
                    prev_byte  <= i_rx_data;
                    prev_valid <= 1'b1;
                end else begin
                    // 输出最后一字节 + last
                    o_rx_data  <= prev_byte;
                    o_rx_valid <= prev_valid;
                    o_rx_last  <= prev_valid;
                    prev_valid <= 1'b0;
                    state      <= S_IDLE;
                end
            end

            default: state <= S_IDLE;
        endcase
    end
end

endmodule
