// UART RX — 115200bps 单字节接收
// V1.0.0
//
module uart_rx #(
    parameter P_CLK_FREQ = 125_000_000,
    parameter P_BAUD     = 115200
    ) (
    input                               i_sys_clk,
    input                               i_rst_n,
    input                               i_uart_rx,
    output      logic           [ 7:0]  o_data,
    output      logic                   o_valid
    );
localparam P_BAUD_DIV = P_CLK_FREQ / P_BAUD;
localparam P_HALF_DIV = P_BAUD_DIV / 2;

/////////////////////////////////////////////////////////////////////////////////////////
////////////////////                 状态定义                /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
typedef enum logic [1:0] {
    R_IDLE  = 2'b00,
    R_START = 2'b01,
    R_DATA  = 2'b10,
    R_STOP  = 2'b11
} state_t;

state_t st, st_next;

/////////////////////////////////////////////////////////////////////////////////////////
////////////////////                 内部信号                /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
logic [15:0]                    cnt, cnt_next;
logic [ 2:0]                    bit_idx, bit_idx_next;
logic [ 7:0]                    shift, shift_next;

/////////////////////////////////////////////////////////////////////////////////////////
////////////////////                 主状态机                /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
always_comb begin
    st_next      = st;
    cnt_next     = cnt;
    bit_idx_next = bit_idx;
    shift_next   = shift;
    o_data       = shift;
    o_valid      = 1'b0;

    case (st)
        R_IDLE: begin
            if (!i_uart_rx) begin
                cnt_next = 16'd0;
                st_next  = R_START;
            end
        end

        R_START: begin
            if (cnt < P_HALF_DIV - 1) begin
                    cnt_next = cnt + 1;
end
            else begin
                cnt_next      = 16'd0;
                bit_idx_next  = 3'd0;
                st_next       = R_DATA;
            end
        end

        R_DATA: begin
            if (cnt < P_BAUD_DIV - 1) begin
                    cnt_next = cnt + 1;
end
            else begin
                cnt_next    = 16'd0;
                shift_next  = {i_uart_rx, shift[7:1]};
                if (bit_idx == 3'd7) begin
                        st_next = R_STOP;
end
                else
                    bit_idx_next = bit_idx + 3'd1;
            end
        end

        R_STOP: begin
            if (cnt < P_BAUD_DIV - 1) begin
                    cnt_next = cnt + 1;
end
            else begin
                o_valid = 1'b1;
                st_next = R_IDLE;
            end
        end

        default: st_next = R_IDLE;
    endcase
end

/////////////////////////////////////////////////////////////////////////////////////////
////////////////////                 寄存器                 /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
always_ff @(posedge i_sys_clk) begin
    if (!i_rst_n) begin
        st      <= R_IDLE;
        cnt     <= 0;
        bit_idx <= 0;
        shift   <= 0;
    end else begin
        st      <= st_next;
        cnt     <= cnt_next;
        bit_idx <= bit_idx_next;
        shift   <= shift_next;
    end
end

endmodule
