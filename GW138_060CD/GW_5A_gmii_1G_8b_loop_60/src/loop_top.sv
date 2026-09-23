// LOOP TOP — 34级流水线即时环回（边收边发，无缓冲）
//260812    v1.0.0   初始版本
//260822    v1.0.1   修复巨型帧回环计数溢出，支持8KB包回环
//
module loop_top (
    input                               i_sys_clk,
    input                               i_rst_n,
    input                       [ 7:0]  i_rx_data,
    input                               i_rx_valid,
    input                               i_rx_last,
    input                       [47:0]  i_local_mac,
    input                       [31:0]  i_local_ip,
    input                               i_tx_busy,
    output      logic           [ 7:0]  o_tx_data,
    output      logic                   o_tx_wr,
    output      logic                   o_tx_last
);

logic [13:0]        rcnt;
logic [13:0]        tcnt;
logic [13:0]        tlen;
logic               is_mine;
logic [47:0]        req_mac;
logic [15:0]        ip_len, ip_id, ip_frag, ip_csum;
logic [ 7:0]        ip_ver, ip_dscp, ip_ttl, ip_proto;
logic [31:0]        req_ip;
logic [15:0]        req_port, local_port;

logic               tx_req;
logic [39:0][7:0]   pipe_data;                // 流水
logic [39:0]        pipe_valid;
/////////////////////////////////////////////////////////////////////////////////////////
////////////////////                IP ID 无递增              /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
assign ip_id = 16'h0102;

/////////////////////////////////////////////////////////////////////////////////////////
////////////////////               IP 校验和                /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
logic [19:0] s0, s1, s2, s3, s4;
always_ff @(posedge i_sys_clk) begin
    s0 <= 17'h4500 + ip_len + ip_id + 17'h0000 + 17'h4011;
    s1 <= s0 + i_local_ip[31:16] + i_local_ip[15:0];
    s2 <= s1 + req_ip[31:16] + req_ip[15:0];
    s3 <= (s2 & 17'hFFFF) + (s2 >> 16);
    s4 <= (s3 & 17'hFFFF) + (s3 >> 16);
    ip_csum <= ~s4[15:0];
end
/////////////////////////////////////////////////////////////////////////////////////////
////////////////////               MAIN                     /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
always_ff @(posedge i_sys_clk) begin
    if (!i_rst_n) begin
        rcnt      <= 14'd0;
        is_mine   <= 1'b0;
        req_mac    <= 48'd0;
        ip_len    <= 16'd0;
        ip_frag   <= 16'd0;
        ip_ver    <= 8'd0;
        ip_dscp   <= 8'd0;
        ip_ttl    <= 8'd0;
        ip_proto  <= 8'd0;
        req_ip   <= 32'd0;
    end else begin
        // === 流水线 ===
        pipe_data <= {pipe_data[38:0], i_rx_data};
        pipe_valid <= {pipe_valid[38:0], i_rx_valid};

        // === 字段提取 ===
        if (i_rx_valid) begin
            case (rcnt)
                14'd0:  is_mine <= (i_rx_data == i_local_mac[47:40]);
                14'd1:  is_mine <= is_mine && (i_rx_data == i_local_mac[39:32]);
                14'd2:  is_mine <= is_mine && (i_rx_data == i_local_mac[31:24]);
                14'd3:  is_mine <= is_mine && (i_rx_data == i_local_mac[23:16]);
                14'd4:  is_mine <= is_mine && (i_rx_data == i_local_mac[15:8]);
                14'd5:  is_mine <= is_mine && (i_rx_data == i_local_mac[7:0]);
                14'd6:  req_mac[47:40] <= i_rx_data;
                14'd7:  req_mac[39:32] <= i_rx_data;
                14'd8:  req_mac[31:24] <= i_rx_data;
                14'd9:  req_mac[23:16] <= i_rx_data;
                14'd10: req_mac[15:8]  <= i_rx_data;
                14'd11: req_mac[7:0]   <= i_rx_data;
                14'd14: ip_ver  <= i_rx_data;
                14'd15: ip_dscp <= i_rx_data;
                14'd16: ip_len[15:8]  <= i_rx_data;
                14'd17: ip_len[7:0]   <= i_rx_data;
                //18-19 原ID
                14'd20: ip_frag[15:8] <= i_rx_data;
                14'd21: ip_frag[7:0]  <= i_rx_data;
                14'd22: ip_ttl  <= i_rx_data;
                14'd23: ip_proto <= i_rx_data;
                //24-25 原Check sum
                14'd26: req_ip[31:24] <= i_rx_data;
                14'd27: req_ip[23:16] <= i_rx_data;
                14'd28: req_ip[15:8]  <= i_rx_data;
                14'd29: req_ip[7:0]   <= i_rx_data;
                //30-33 local IP
                14'd34: req_port[15:8]   <= i_rx_data;
                14'd35: req_port[ 7:0]   <= i_rx_data;
                14'd36: local_port[15:8]   <= i_rx_data;
                14'd37: local_port[ 7:0]   <= i_rx_data;
                default: ;
            endcase

            rcnt <= rcnt + 14'd1;
        end else begin
            rcnt  <= 14'd0;
        end
    end
end

always_ff @(posedge i_sys_clk) begin
    if (!i_rst_n) begin
        o_tx_data <= 8'h00;
        o_tx_wr   <= 1'b0;
        o_tx_last <= 1'b0;
    end else begin
        // IP 头收齐（rcnt=37），TX 空闲则立即发送
        if(rcnt == 14'd37 && is_mine && !i_tx_busy)begin
            tx_req <= 1'b1;
            tlen   <= ip_len + 14'd14; 
        end else if(tcnt == tlen - 14'd1) begin
            tx_req <= 1'b0;
        end

        // === TX ===
        o_tx_wr   <= tx_req ;
        o_tx_last <= (tcnt == tlen - 14'd1);
        if (tx_req) begin
            tcnt <= tcnt + 14'd1;

            case (tcnt)
                14'd0:  o_tx_data <= req_mac[47:40];
                14'd1:  o_tx_data <= req_mac[39:32];
                14'd2:  o_tx_data <= req_mac[31:24];
                14'd3:  o_tx_data <= req_mac[23:16];
                14'd4:  o_tx_data <= req_mac[15:8];
                14'd5:  o_tx_data <= req_mac[7:0];
                14'd6:  o_tx_data <= i_local_mac[47:40];
                14'd7:  o_tx_data <= i_local_mac[39:32];
                14'd8:  o_tx_data <= i_local_mac[31:24];
                14'd9:  o_tx_data <= i_local_mac[23:16];
                14'd10: o_tx_data <= i_local_mac[15:8];
                14'd11: o_tx_data <= i_local_mac[7:0];
                14'd12: o_tx_data <= 8'h08;
                14'd13: o_tx_data <= 8'h00;
                14'd14: o_tx_data <= ip_ver;
                14'd15: o_tx_data <= ip_dscp;
                14'd16: o_tx_data <= ip_len[15:8];
                14'd17: o_tx_data <= ip_len[7:0];
                14'd18: o_tx_data <= ip_id[15:8];
                14'd19: o_tx_data <= ip_id[7:0];
                14'd20: o_tx_data <= ip_frag[15:8];
                14'd21: o_tx_data <= ip_frag[7:0];
                14'd22: o_tx_data <= 8'h40;//ip_ttl;
                14'd23: o_tx_data <= ip_proto;
                14'd24: o_tx_data <= ip_csum[15:8];
                14'd25: o_tx_data <= ip_csum[7:0];
                14'd26: o_tx_data <= i_local_ip[31:24];
                14'd27: o_tx_data <= i_local_ip[23:16];
                14'd28: o_tx_data <= i_local_ip[15:8];
                14'd29: o_tx_data <= i_local_ip[7:0];
                14'd30: o_tx_data <= req_ip[31:24];
                14'd31: o_tx_data <= req_ip[23:16];
                14'd32: o_tx_data <= req_ip[15:8];
                14'd33: o_tx_data <= req_ip[7:0];
                14'd34: o_tx_data <= local_port[15:8];
                14'd35: o_tx_data <= local_port[7:0];
                14'd36: o_tx_data <= req_port[15:8];
                14'd37: o_tx_data <= req_port[7:0];
                14'd40: o_tx_data <= 8'h00;
                14'd41: o_tx_data <= 8'h00;
                default: o_tx_data <= pipe_data[37];
            endcase
        end else begin
            tcnt <= 14'd0;
        end
    end
end

endmodule
