// ICMP — ICMP Echo Request -> Echo Reply
// 固定32Bytes Payload
// 纯流水线，无RAM
// 不包含Preamble / SFD / FCS
// 输入有效后立即开始流水处理
// V1.0.0
module icmp #(
    parameter integer P_PAYLOAD_LEN = 32
) (
    input                               i_sys_clk,
    input                               i_rst_n,
    input                       [ 7:0]  i_rx_data,
    input                               i_rx_valid,
    input                               i_rx_last,
    input                       [47:0]  i_local_mac,
    input                       [31:0]  i_local_ip,
    input                               i_tx_busy,
    output      logic           [ 7:0]  o_tx_data,
    output      logic                   o_tx_wr   ,
    output      logic                   o_tx_last
);
localparam integer ETH_LEN   = 14;
localparam integer IP_LEN    = 20;
localparam integer ICMP_LEN  = 8;
localparam integer FRAME_LEN = ETH_LEN + IP_LEN + ICMP_LEN + P_PAYLOAD_LEN;
localparam integer PIPE_LEN  = 12;

logic [PIPE_LEN-1 : 0][7:0] pipe_data ;
logic [PIPE_LEN-1 : 0]      pipe_valid;
logic [PIPE_LEN-1 : 0]      pipe_last ;
logic [6:0] pipe_cnt_rx, pipe_cnt_tx  ;

logic [47:0] rx_src_mac;
logic [31:0] rx_src_ip;
logic [15:0] rx_icmp_csum;
logic [15:0] icmp_csum_reply;

logic [16:0] csum_sum;

integer i;

always_comb begin
    csum_sum = {1'b0, rx_icmp_csum} + 17'h00800;
    csum_sum = {1'b0, csum_sum[15:0]} + csum_sum[16];
    icmp_csum_reply = csum_sum[15:0];
end

always_ff @(posedge i_sys_clk) begin
    if (!i_rst_n) begin
        rx_src_mac   <= 48'd0;
        rx_src_ip    <= 32'd0;
        rx_icmp_csum <= 16'd0;
        pipe_data    <= {PIPE_LEN{8'd0}};
        pipe_valid   <= {PIPE_LEN{1'b0}};
        pipe_last    <= {PIPE_LEN{1'b0}};
        pipe_cnt_rx  <= 7'd0;
    end else begin
        pipe_data   <= {pipe_data [PIPE_LEN-2 : 0] , i_rx_data};
        pipe_valid  <= {pipe_valid[PIPE_LEN-2 : 0] , i_rx_valid};
        pipe_last   <= {pipe_last [PIPE_LEN-2 : 0] , i_rx_valid && i_rx_last};

        if (i_rx_valid) begin
            pipe_cnt_rx <= pipe_cnt_rx + 7'd1;

            case (pipe_cnt_rx)
                7'd6:  rx_src_mac[47:40] <= i_rx_data;
                7'd7:  rx_src_mac[39:32] <= i_rx_data;
                7'd8:  rx_src_mac[31:24] <= i_rx_data;
                7'd9:  rx_src_mac[23:16] <= i_rx_data;
                7'd10: rx_src_mac[15:8]  <= i_rx_data;
                7'd11: rx_src_mac[7:0]   <= i_rx_data;
                7'd26: rx_src_ip[31:24]  <= i_rx_data;
                7'd27: rx_src_ip[23:16]  <= i_rx_data;
                7'd28: rx_src_ip[15:8]   <= i_rx_data;
                7'd29: rx_src_ip[7:0]    <= i_rx_data;
                7'd36: rx_icmp_csum[15:8]<= i_rx_data;
                7'd37: rx_icmp_csum[7:0] <= i_rx_data;
                default: ;
            endcase
        end else begin
            pipe_cnt_rx <= 7'd0;
        end
    end
end

always_ff @(posedge i_sys_clk) begin
    if (!i_rst_n) begin
        o_tx_data <= 8'h00;
        o_tx_wr   <= 1'b0;
        o_tx_last <= 1'b0;
        pipe_cnt_tx <= 7'd0;
    end else begin
        if (pipe_valid[PIPE_LEN-1]) begin //提前触发，下面少写点条件
            pipe_cnt_tx <= pipe_cnt_tx + 7'd1;
        end else begin
            pipe_cnt_tx <= 7'd0;
        end

        o_tx_wr      <= ((pipe_cnt_tx <= 7'd73) & pipe_valid[PIPE_LEN-1]); //砍掉后面四位FCS
        o_tx_last    <= (pipe_cnt_tx == 7'd73); 

        case (pipe_cnt_tx)
            7'd0:  o_tx_data <= rx_src_mac[47:40];
            7'd1:  o_tx_data <= rx_src_mac[39:32];
            7'd2:  o_tx_data <= rx_src_mac[31:24];
            7'd3:  o_tx_data <= rx_src_mac[23:16];
            7'd4:  o_tx_data <= rx_src_mac[15:8];
            7'd5:  o_tx_data <= rx_src_mac[7:0];
            7'd6:  o_tx_data <= i_local_mac[47:40];
            7'd7:  o_tx_data <= i_local_mac[39:32];
            7'd8:  o_tx_data <= i_local_mac[31:24];
            7'd9:   o_tx_data <= i_local_mac[23:16];
            7'd10: o_tx_data <= i_local_mac[15:8];
            7'd11: o_tx_data <= i_local_mac[7:0];
            7'd12: o_tx_data <= 8'h08;
            7'd13: o_tx_data <= 8'h00;
            7'd14: o_tx_data <= pipe_data[PIPE_LEN-1];
            7'd15: o_tx_data <= pipe_data[PIPE_LEN-1];
            7'd16: o_tx_data <= pipe_data[PIPE_LEN-1];
            7'd17: o_tx_data <= pipe_data[PIPE_LEN-1];
            7'd18: o_tx_data <= pipe_data[PIPE_LEN-1];
            7'd19: o_tx_data <= pipe_data[PIPE_LEN-1];
            7'd20: o_tx_data <= pipe_data[PIPE_LEN-1];
            7'd21: o_tx_data <= pipe_data[PIPE_LEN-1];
            7'd22: o_tx_data <= pipe_data[PIPE_LEN-1];
            7'd23: o_tx_data <= pipe_data[PIPE_LEN-1];
            7'd24: o_tx_data <= pipe_data[PIPE_LEN-1];
            7'd25: o_tx_data <= pipe_data[PIPE_LEN-1];
            7'd26: o_tx_data <= i_local_ip[31:24]; 
            7'd27: o_tx_data <= i_local_ip[23:16]; 
            7'd28: o_tx_data <= i_local_ip[15:8];  
            7'd29: o_tx_data <= i_local_ip[7:0];   
            7'd30: o_tx_data <= rx_src_ip[31:24];
            7'd31: o_tx_data <= rx_src_ip[23:16];
            7'd32: o_tx_data <= rx_src_ip[15:8];
            7'd33: o_tx_data <= rx_src_ip[7:0];
            7'd34: o_tx_data <= 8'h00;
            7'd35: o_tx_data <= pipe_data[PIPE_LEN-1];
            7'd36: o_tx_data <= icmp_csum_reply[15:8];
            7'd37: o_tx_data <= icmp_csum_reply[7:0];
            default: o_tx_data <= pipe_data[PIPE_LEN-1]; //多的FCS数据发不出去
        endcase
    end
end

endmodule