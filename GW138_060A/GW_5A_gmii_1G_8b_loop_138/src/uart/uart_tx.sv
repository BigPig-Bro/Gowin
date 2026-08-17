// UART TX — 8N1, 115200bps
// V1.0.0
//
module uart_tx #(
    parameter P_CLK_FREQ = 125_000_000,
    parameter P_BAUD     = 115200
    ) (
    input                               i_sys_clk,
    input                               i_rst_n,
    input                       [ 7:0]  i_tx_data,
    input                               i_tx_send,
    output      logic                   o_tx_busy,
    output      logic                   o_uart_tx
    );
localparam P_BAUD_DIV = P_CLK_FREQ / P_BAUD;
/////////////////////////////////////////////////////////////////////////////////////////
////////////////////                 状态定义                /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
typedef enum logic [1:0] {
    S_IDLE  = 2'b00,
    S_START = 2'b01,
    S_DATA  = 2'b10,
    S_STOP  = 2'b11
} state_t;

state_t state, state_next;

/////////////////////////////////////////////////////////////////////////////////////////
////////////////////                 内部信号                /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
logic [15:0]                    baud_cnt, baud_cnt_next;
logic [ 2:0]                    bit_cnt, bit_cnt_next;
logic [ 7:0]                    tx_latch, tx_latch_next;

/////////////////////////////////////////////////////////////////////////////////////////
////////////////////                 主状态机                /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
always_comb begin
    state_next      = state;
    baud_cnt_next   = baud_cnt;
    bit_cnt_next    = bit_cnt;
    tx_latch_next   = tx_latch;
    o_uart_tx       = 1'b1;
    o_tx_busy       = 1'b0;

    case (state)
        S_IDLE: begin
            if (i_tx_send) begin
                tx_latch_next   = i_tx_data;
                baud_cnt_next   = 16'd0;
                state_next      = S_START;
            end
        end

        S_START: begin
            o_tx_busy   = 1'b1;
            o_uart_tx   = 1'b0;
            if (baud_cnt < P_BAUD_DIV - 1) begin
                    baud_cnt_next = baud_cnt + 16'd1;
end
            else begin
                baud_cnt_next = 16'd0;
                bit_cnt_next  = 3'd0;
                state_next    = S_DATA;
            end
        end

        S_DATA: begin
            o_tx_busy   = 1'b1;
            o_uart_tx   = tx_latch[bit_cnt];
            if (baud_cnt < P_BAUD_DIV - 1) begin
                    baud_cnt_next = baud_cnt + 16'd1;
end
            else begin
                baud_cnt_next = 16'd0;
                if (bit_cnt == 3'd7) begin
                        state_next = S_STOP;
end
                else
                    bit_cnt_next = bit_cnt + 3'd1;
            end
        end

        S_STOP: begin
            o_tx_busy   = 1'b1;
            o_uart_tx   = 1'b1;
            if (baud_cnt < P_BAUD_DIV - 1) begin
                    baud_cnt_next = baud_cnt + 16'd1;
end
            else begin
                baud_cnt_next = 16'd0;
                state_next    = S_IDLE;
            end
        end

        default: state_next = S_IDLE;
    endcase
end

/////////////////////////////////////////////////////////////////////////////////////////
////////////////////                 寄存器                 /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
always_ff @(posedge i_sys_clk) begin
    if (!i_rst_n) begin
        state       <= S_IDLE;
        baud_cnt    <= 16'd0;
        bit_cnt     <= 3'd0;
        tx_latch    <= 8'd0;
    end else begin
        state       <= state_next;
        baud_cnt    <= baud_cnt_next;
        bit_cnt     <= bit_cnt_next;
        tx_latch    <= tx_latch_next;
    end
end

endmodule
