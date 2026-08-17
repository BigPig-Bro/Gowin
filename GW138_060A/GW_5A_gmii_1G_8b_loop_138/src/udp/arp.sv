// ARP 应答模块 — 接收ARP请求，生成ARP应答
// V1.0.0
//
module arp (
    input                               i_sys_clk,
    input                               i_rst_n,
    // ARP 帧输入（已由 udp_decode 分类）
    input                       [ 7:0]  i_rx_data,
    input                               i_rx_valid,
    input                               i_rx_last,
    // 本地配置
    input                       [47:0]  i_local_mac,
    input                       [31:0]  i_local_ip,
    // TX 忙
    input                               i_tx_busy,
    // ARP 应答输出
    output      logic           [ 7:0]  o_tx_data,
    output      logic                   o_tx_wr,
    output      logic                   o_tx_last
    );
/////////////////////////////////////////////////////////////////////////////////////////
////////////////////                 状态定义                /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
typedef enum logic [1:0] {
    S_IDLE  = 2'b00,
    S_WAIT  = 2'b01,
    S_TX    = 2'b10
} state_t;

state_t state;

/////////////////////////////////////////////////////////////////////////////////////////
////////////////////                 内部信号                /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
logic [15:0]                    recv_cnt;           // 接收字节计数
logic [ 5:0]                    tx_cnt;             // 发送计数

// 锁存 ARP 字段
logic [15:0]                    oper;
logic [47:0]                    sha;
logic [31:0]                    spa;
logic [31:0]                    tpa;

// 应答数据锁存（防止TX期间被新帧覆盖）
logic [47:0]                    resp_sha;
logic [31:0]                    resp_spa;

logic                           is_req;

/////////////////////////////////////////////////////////////////////////////////////////
////////////////////                 RX 字段锁存            /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
always_ff @(posedge i_sys_clk) begin
    if (!i_rst_n) begin
        recv_cnt <= 16'd0;
    end else if (i_rx_last) begin
        recv_cnt <= 16'd0;
    end else if (i_rx_valid) begin
        case (recv_cnt)
            16'd20: oper[15: 8] <= i_rx_data;
            16'd21: oper[ 7: 0] <= i_rx_data;
            16'd22: sha[47:40]  <= i_rx_data;
            16'd23: sha[39:32]  <= i_rx_data;
            16'd24: sha[31:24]  <= i_rx_data;
            16'd25: sha[23:16]  <= i_rx_data;
            16'd26: sha[15: 8]  <= i_rx_data;
            16'd27: sha[ 7: 0]  <= i_rx_data;
            16'd28: spa[31:24]  <= i_rx_data;
            16'd29: spa[23:16]  <= i_rx_data;
            16'd30: spa[15: 8]  <= i_rx_data;
            16'd31: spa[ 7: 0]  <= i_rx_data;
            16'd38: tpa[31:24]  <= i_rx_data;
            16'd39: tpa[23:16]  <= i_rx_data;
            16'd40: tpa[15: 8]  <= i_rx_data;
            16'd41: tpa[ 7: 0]  <= i_rx_data;
            default: ;
        endcase
        recv_cnt <= recv_cnt + 16'd1;
    end
end

/////////////////////////////////////////////////////////////////////////////////////////
////////////////////                ARP 请求判定            /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
assign is_req = (recv_cnt >= 16'd46) &&
                (oper     == 16'h0001) &&
                (tpa      == i_local_ip) &&
                (sha      != i_local_mac);    // 防回环


/////////////////////////////////////////////////////////////////////////////////////////
////////////////////               应答目标锁存             /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
always_ff @(posedge i_sys_clk) begin
    if (!i_rst_n) begin
        resp_sha <= 48'd0;
        resp_spa <= 32'd0;
    end else if (i_rx_last && is_req && !i_tx_busy) begin
        resp_sha <= sha;
        resp_spa <= spa;
    end
end

/////////////////////////////////////////////////////////////////////////////////////////
////////////////////             ARP 应答字节生成           /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
function automatic [7:0] gen_byte (
    input [5:0]             cnt,
    input [47:0]            target_mac,
    input [31:0]            target_ip,
    input [47:0]            local_mac,
    input [31:0]            local_ip
);
    case (cnt)
        6'd0:   gen_byte = target_mac[47:40];
        6'd1:   gen_byte = target_mac[39:32];
        6'd2:   gen_byte = target_mac[31:24];
        6'd3:   gen_byte = target_mac[23:16];
        6'd4:   gen_byte = target_mac[15: 8];
        6'd5:   gen_byte = target_mac[ 7: 0];
        6'd6:   gen_byte = local_mac[47:40];
        6'd7:   gen_byte = local_mac[39:32];
        6'd8:   gen_byte = local_mac[31:24];
        6'd9:   gen_byte = local_mac[23:16];
        6'd10:  gen_byte = local_mac[15: 8];
        6'd11:  gen_byte = local_mac[ 7: 0];
        6'd12:  gen_byte = 8'h08;
        6'd13:  gen_byte = 8'h06;
        6'd14:  gen_byte = 8'h00;
        6'd15:  gen_byte = 8'h01;
        6'd16:  gen_byte = 8'h08;
        6'd17:  gen_byte = 8'h00;
        6'd18:  gen_byte = 8'h06;
        6'd19:  gen_byte = 8'h04;
        6'd20:  gen_byte = 8'h00;
        6'd21:  gen_byte = 8'h02;
        6'd22:  gen_byte = local_mac[47:40];
        6'd23:  gen_byte = local_mac[39:32];
        6'd24:  gen_byte = local_mac[31:24];
        6'd25:  gen_byte = local_mac[23:16];
        6'd26:  gen_byte = local_mac[15: 8];
        6'd27:  gen_byte = local_mac[ 7: 0];
        6'd28:  gen_byte = local_ip[31:24];
        6'd29:  gen_byte = local_ip[23:16];
        6'd30:  gen_byte = local_ip[15: 8];
        6'd31:  gen_byte = local_ip[ 7: 0];
        6'd32:  gen_byte = target_mac[47:40];
        6'd33:  gen_byte = target_mac[39:32];
        6'd34:  gen_byte = target_mac[31:24];
        6'd35:  gen_byte = target_mac[23:16];
        6'd36:  gen_byte = target_mac[15: 8];
        6'd37:  gen_byte = target_mac[ 7: 0];
        6'd38:  gen_byte = target_ip[31:24];
        6'd39:  gen_byte = target_ip[23:16];
        6'd40:  gen_byte = target_ip[15: 8];
        6'd41:  gen_byte = target_ip[ 7: 0];
        default: gen_byte = 8'h00;
    endcase
endfunction

/////////////////////////////////////////////////////////////////////////////////////////
////////////////////                 主状态机               /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
always_ff @(posedge i_sys_clk) begin
    if (!i_rst_n) begin
        state     <= S_IDLE;
        tx_cnt    <= 6'd0;
        o_tx_data <= 8'h00;
        o_tx_wr   <= 1'b0;
        o_tx_last <= 1'b0;
    end else begin
        o_tx_wr   <= 1'b0;
        o_tx_last <= 1'b0;

        case (state)
            S_IDLE: begin
                if (i_rx_last && is_req) begin
                    tx_cnt <= 6'd0;
                    state  <= i_tx_busy ? S_WAIT : S_TX;
                end
            end

            S_WAIT: begin
                if (!i_tx_busy) begin
                    tx_cnt <= 6'd0;
                    state  <= S_TX;
                end
            end

            S_TX: begin
                o_tx_data <= gen_byte(tx_cnt, resp_sha, resp_spa, i_local_mac, i_local_ip);
                o_tx_wr   <= 1'b1;
                if (tx_cnt == 6'd41) begin
                    o_tx_last <= 1'b1;
                    state     <= S_IDLE;
                end else begin
                    tx_cnt <= tx_cnt + 6'd1;
                end
            end

            default: state <= S_IDLE;
        endcase
    end
end

endmodule
