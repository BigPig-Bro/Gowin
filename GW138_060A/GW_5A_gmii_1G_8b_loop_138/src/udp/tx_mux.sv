// TX MUX — 三路请求仲裁，ARP可抢占 → 单路TX输出
// V1.0.0
//
module tx_mux (
    input                               i_sys_clk,
    input                               i_rst_n,
    input                       [ 7:0]  i_arp_data,
    input                               i_arp_wr,
    input                               i_arp_last,
    input                       [ 7:0]  i_icmp_data,
    input                               i_icmp_wr,
    input                               i_icmp_last,
    input                       [ 7:0]  i_usr_data,
    input                               i_usr_wr,
    input                               i_usr_last,
    input                               i_tx_busy,
    output      logic           [ 7:0]  o_tx_data,
    output      logic                   o_tx_wr,
    output      logic                   o_tx_last
);
typedef enum logic [1:0] {
    S_IDLE  = 2'b00,
    S_ARP   = 2'b01,
    S_ICMP  = 2'b10,
    S_USR   = 2'b11
} state_t;

state_t state;
logic   frame_done;

always_ff @(posedge i_sys_clk) begin
    if (!i_rst_n) begin
        state      <= S_IDLE;
        frame_done <= 1'b0;
        o_tx_data  <= 8'h00;
        o_tx_wr    <= 1'b0;
        o_tx_last  <= 1'b0;
    end else begin
        o_tx_wr   <= 1'b0;
        o_tx_last <= 1'b0;

        case (state)
            S_IDLE: begin
                if (i_arp_wr) begin
                    o_tx_data <= i_arp_data; o_tx_wr <= i_arp_wr; o_tx_last <= i_arp_last;
                    state <= S_ARP;
                end else if (i_icmp_wr) begin
                    o_tx_data <= i_icmp_data; o_tx_wr <= i_icmp_wr; o_tx_last <= i_icmp_last;
                    state <= S_ICMP;
                end else if (i_usr_wr) begin
                    o_tx_data <= i_usr_data; o_tx_wr <= i_usr_wr; o_tx_last <= i_usr_last;
                    state <= S_USR;
                end
            end

            S_ARP: begin
                o_tx_data <= i_arp_data; o_tx_wr <= i_arp_wr; o_tx_last <= i_arp_last;
                if (i_arp_wr && i_arp_last) begin frame_done <= 1'b1; end
                if (frame_done && !i_tx_busy) begin
                    state <= S_IDLE;
                    frame_done <= 1'b0;
                end
            end

            S_ICMP: begin
                if (i_arp_wr) begin
                    o_tx_data <= i_arp_data; o_tx_wr <= i_arp_wr; o_tx_last <= i_arp_last;
                    state <= S_ARP;
                    frame_done <= 1'b0;
                end else begin
                    o_tx_data <= i_icmp_data; o_tx_wr <= i_icmp_wr; o_tx_last <= i_icmp_last;
                    if (i_icmp_wr && i_icmp_last) begin frame_done <= 1'b1; end
                    if (frame_done && !i_tx_busy) begin
                        state <= S_IDLE;
                        frame_done <= 1'b0;
                    end
                end
            end

            S_USR: begin
                if (i_arp_wr) begin
                    o_tx_data <= i_arp_data; o_tx_wr <= i_arp_wr; o_tx_last <= i_arp_last;
                    state <= S_ARP;
                    frame_done <= 1'b0;
                end else begin
                    o_tx_data <= i_usr_data; o_tx_wr <= i_usr_wr; o_tx_last <= i_usr_last;
                    if (i_usr_wr && i_usr_last) begin frame_done <= 1'b1; end
                    if (frame_done && !i_tx_busy) begin
                        state <= S_IDLE;
                        frame_done <= 1'b0;
                    end
                end
            end

            default: begin state <= S_IDLE; end
        endcase
    end
end

endmodule
