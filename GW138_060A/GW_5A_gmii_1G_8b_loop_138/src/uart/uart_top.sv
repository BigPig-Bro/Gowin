// UART TOP — 命令解析 + 模式切换
// V1.0.0
//
module uart_top #(
    parameter P_CLK_FREQ = 25_000_000,
    parameter P_BAUD     = 115200
    ) (
    input                               i_sys_clk,
    input                               i_rst_n,
    input                               i_uart_rx,
    output                              o_uart_tx,
    output      logic           [ 1:0]  o_mode
    );
/////////////////////////////////////////////////////////////////////////////////////////
////////////////////                 内部信号                /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
logic [7:0]                     urx_data;
logic                           urx_valid;
logic [7:0]                     utx_data;
logic                           utx_send, utx_busy;

typedef enum logic [1:0] {
    C_IDLE  = 2'b00,
    C_REPLY = 2'b01
} cmd_state_t;

cmd_state_t cmd_st, cmd_st_next;
logic [3:0] reply_cnt, reply_cnt_next;

/////////////////////////////////////////////////////////////////////////////////////////
////////////////////              UART RX / TX              /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
uart_rx #(
    .P_CLK_FREQ                 (P_CLK_FREQ                 ),
    .P_BAUD                     (P_BAUD                     )
) uart_rx_m0 (
    .i_sys_clk                  (i_sys_clk                  ),
    .i_rst_n                    (i_rst_n                    ),
    .i_uart_rx                  (i_uart_rx                  ),
    .o_data                     (urx_data                   ),
    .o_valid                    (urx_valid                  )
);

uart_tx #(
    .P_CLK_FREQ                 (P_CLK_FREQ                 ),
    .P_BAUD                     (P_BAUD                     )
) uart_tx_m0 (
    .i_sys_clk                  (i_sys_clk                  ),
    .i_rst_n                    (i_rst_n                    ),
    .i_tx_data                  (utx_data                   ),
    .i_tx_send                  (utx_send                   ),
    .o_tx_busy                  (utx_busy                   ),
    .o_uart_tx                  (o_uart_tx                  )
);

/////////////////////////////////////////////////////////////////////////////////////////
////////////////////                 模式寄存器              /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
always_ff @(posedge i_sys_clk) begin
    if (!i_rst_n) begin
        o_mode <= 2'd0;
    end else if (urx_valid) begin
        if (urx_data == 8'h30)      begin o_mode <= 2'd0; end
        else if (urx_data == 8'h31) begin o_mode <= 2'd1; end
        else if (urx_data == 8'h32) begin o_mode <= 2'd2; end
    end
end

/////////////////////////////////////////////////////////////////////////////////////////
////////////////////             命令回复状态机              /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
always_comb begin
    cmd_st_next     = cmd_st;
    reply_cnt_next  = reply_cnt;
    utx_data        = 8'h00;
    utx_send        = 1'b0;

    case (cmd_st)
        C_IDLE: begin
            if (urx_valid && (urx_data == 8'h3F || urx_data == 8'h30 ||
                              urx_data == 8'h31 || urx_data == 8'h32)) begin
                cmd_st_next     = C_REPLY;
                reply_cnt_next  = 4'd0;
            end
        end

        C_REPLY: begin
            if (!utx_busy) begin
                utx_send = 1'b1;
                case (reply_cnt)
                    0: utx_data = 8'h3E;       // >
                    1: begin
                        utx_data        = 8'h30 + {6'd0, o_mode};
                        cmd_st_next     = C_IDLE;
                    end
                    default: utx_data = 8'h00;
                endcase
                reply_cnt_next = reply_cnt + 4'd1;
            end
        end

        default: cmd_st_next = C_IDLE;
    endcase
end

/////////////////////////////////////////////////////////////////////////////////////////
////////////////////                 寄存器                 /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
always_ff @(posedge i_sys_clk) begin
    if (!i_rst_n) begin
        cmd_st      <= C_IDLE;
        reply_cnt   <= 4'd0;
    end else begin
        cmd_st      <= cmd_st_next;
        reply_cnt   <= reply_cnt_next;
    end
end

endmodule
