// TEST TOP — UDP 数据包生成器（模式0=空闲, 1=1pps, 2=满带宽）
//260812 V1.0.0 初始版本
//       V1.0.1 修订TIMER_1S定义
module test_top #(
    parameter [47:0] P_LOCAL_MAC   = 48'hDEAD_BEEF_0001,
    parameter [31:0] P_LOCAL_IP    = {8'd192, 8'd168, 8'd1, 8'd100},
    parameter [47:0] P_DST_MAC     = 48'hFFFF_FFFF_FFFF,
    parameter [31:0] P_DST_IP      = {8'd192, 8'd168, 8'd1, 8'd101},
    parameter [15:0] P_DST_PORT    = 16'd5001,
    parameter [15:0] P_SRC_PORT    = 16'd5000,
    parameter P_UART_CLK      = 25_000_000,
    parameter P_UART_BAUD     = 115200
) (
    input                               i_sys_clk,
    input                               i_rst_n,
    input                               i_tx_busy,
    output      logic           [ 7:0]  o_tx_data,
    output      logic                   o_tx_wr,
    output      logic                   o_tx_last,

    input                               i_uart_rx,
    output                              o_uart_tx
);
localparam [15:0] P_PAYLOAD_LEN = 16'd1024;
localparam        PKT_LEN  = 16'd14 + 16'd20 + 16'd8 + P_PAYLOAD_LEN;
localparam        IP_LEN   =          16'd20 + 16'd8 + P_PAYLOAD_LEN;
localparam        UDP_LEN  =                   16'd8 + P_PAYLOAD_LEN;
localparam        TIMER_1S = P_UART_CLK;
localparam        WAIT_CYC = 12'd32;
/////////////////////////////////////////////////////////////////////////////////////////
////////////////////                 状态定义                /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
typedef enum logic [1:0] {
    S_IDLE  = 2'b00,
    S_TX    = 2'b01,
    S_WAIT  = 2'b10
} state_t;

state_t state;

/////////////////////////////////////////////////////////////////////////////////////////
////////////////////                 内部信号                /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
logic [15:0]                    tx_cnt;
logic [15:0]                    ip_id;
logic [15:0]                    ip_csum;
logic [27:0]                    timer;
logic [11:0]                    wait_cnt;
logic [ 1:0]                    user_mode;

/////////////////////////////////////////////////////////////////////////////////////////
////////////////////              1秒定时器                 /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
always_ff @(posedge i_sys_clk) begin
    if (!i_rst_n)
        timer <= 28'd0;
    else if (user_mode != 2'd1)
        timer <= 28'd0;
    else if (timer < TIMER_1S - 1)
        timer <= timer + 28'd1;
    else
        timer <= 28'd0;
end

/////////////////////////////////////////////////////////////////////////////////////////
////////////////////              帧字节生成                /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
function automatic [7:0] gen_byte (input [15:0] cnt);begin
    case (cnt)
        0:  gen_byte = P_DST_MAC[47:40];
        1:  gen_byte = P_DST_MAC[39:32];
        2:  gen_byte = P_DST_MAC[31:24];
        3:  gen_byte = P_DST_MAC[23:16];
        4:  gen_byte = P_DST_MAC[15:8];
        5:  gen_byte = P_DST_MAC[7:0];
        6:  gen_byte = P_LOCAL_MAC[47:40];
        7:  gen_byte = P_LOCAL_MAC[39:32];
        8:  gen_byte = P_LOCAL_MAC[31:24];
        9:  gen_byte = P_LOCAL_MAC[23:16];
        10: gen_byte = P_LOCAL_MAC[15:8];
        11: gen_byte = P_LOCAL_MAC[7:0];
        12: gen_byte = 8'h08;
        13: gen_byte = 8'h00;
        14: gen_byte = 8'h45;
        15: gen_byte = 8'h00;
        16: gen_byte = IP_LEN[15:8];
        17: gen_byte = IP_LEN[7:0];
        18: gen_byte = ip_id[15:8];
        19: gen_byte = ip_id[7:0];
        20: gen_byte = 8'h00;
        21: gen_byte = 8'h00;
        22: gen_byte = 8'h40;
        23: gen_byte = 8'h11;
        24: gen_byte = ip_csum[15:8];
        25: gen_byte = ip_csum[7:0];
        26: gen_byte = P_LOCAL_IP[31:24];
        27: gen_byte = P_LOCAL_IP[23:16];
        28: gen_byte = P_LOCAL_IP[15:8];
        29: gen_byte = P_LOCAL_IP[7:0];
        30: gen_byte = P_DST_IP[31:24];
        31: gen_byte = P_DST_IP[23:16];
        32: gen_byte = P_DST_IP[15:8];
        33: gen_byte = P_DST_IP[7:0];
        34: gen_byte = P_SRC_PORT[15:8];
        35: gen_byte = P_SRC_PORT[7:0];
        36: gen_byte = P_DST_PORT[15:8];
        37: gen_byte = P_DST_PORT[7:0];
        38: gen_byte = UDP_LEN[15:8];
        39: gen_byte = UDP_LEN[7:0];
        40: gen_byte = 8'h00;
        41: gen_byte = 8'h00;
        default: gen_byte = cnt[7:0] - 8'd42;
    endcase
end
endfunction

/////////////////////////////////////////////////////////////////////////////////////////
////////////////////                IP ID 无递增              /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
assign ip_id = 16'h0102;

/////////////////////////////////////////////////////////////////////////////////////////
////////////////////               IP 校验和                /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
logic [19:0] s0, s1, s2, s3, s4;
always_ff @(posedge i_sys_clk) begin
    s0 <= 17'h4500 + IP_LEN + ip_id + 17'h0000 + 17'h4011;
    s1 <= s0 + P_LOCAL_IP[31:16] + P_LOCAL_IP[15:0];
    s2 <= s1 + P_DST_IP[31:16] + P_DST_IP[15:0];
    s3 <= (s2 & 17'hFFFF) + (s2 >> 16);
    s4 <= (s3 & 17'hFFFF) + (s3 >> 16);
    ip_csum <= ~s4[15:0];
end
/////////////////////////////////////////////////////////////////////////////////////////
////////////////////                 主状态机                /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
always_ff @(posedge i_sys_clk) begin
    if (!i_rst_n) begin
        state      <= S_IDLE;
        tx_cnt     <= 16'd0;
        wait_cnt   <= 12'd0;
        o_tx_data  <= 8'h00;
        o_tx_wr    <= 1'b0;
        o_tx_last  <= 1'b0;
    end else begin
        case (state)
            S_IDLE: begin
                o_tx_wr   <= 1'b0;
                o_tx_last <= 1'b0;

                if (user_mode == 2'd1 && timer == TIMER_1S - 1 && !i_tx_busy) begin
                    tx_cnt <= 16'd0;
                    state  <= S_TX;
                end else if (user_mode == 2'd2 && !i_tx_busy) begin
                    tx_cnt <= 16'd0;
                    state  <= S_TX;
                end
            end

            S_TX: begin
                o_tx_data <= gen_byte(tx_cnt);
                o_tx_wr   <= 1'b1;
                if (tx_cnt == PKT_LEN - 1) begin
                    o_tx_last <= 1'b1;
                    wait_cnt  <= 12'd0;
                    state     <= S_WAIT;
                end else begin
                    tx_cnt <= tx_cnt + 16'd1;
                end
            end

            S_WAIT: begin
                o_tx_wr   <= 1'b0;
                o_tx_last <= 1'b0;
                if (wait_cnt < WAIT_CYC - 1)
                    wait_cnt <= wait_cnt + 12'd1;
                else begin
                    tx_cnt <= 16'd0;
                    state  <= S_IDLE;
                end
            end

            default: state <= S_IDLE;
        endcase
    end
end

// === UART TOP ===
uart_top #(
    .P_CLK_FREQ     (P_UART_CLK     ),
    .P_BAUD         (P_UART_BAUD    )
) uart_top_m0 (
    .i_sys_clk      (i_sys_clk      ),
    .i_rst_n        (i_rst_n        ),
    .i_uart_rx      (i_uart_rx      ),
    .o_uart_tx      (o_uart_tx      ),
    .o_mode         (user_mode      )
);

endmodule
