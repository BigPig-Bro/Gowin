// RX MUX — 25级流水线 + 协议分类 → 3路请求输出（无RAM，持续移位）
// V1.0.0
//
module rx_mux (
    input                               i_sys_clk,
    input                               i_rst_n,
    input                       [ 7:0]  i_rx_data,
    input                               i_rx_valid,
    input                               i_rx_last,
    output      logic           [ 7:0]  o_arp_data,
    output      logic                   o_arp_valid,
    output      logic                   o_arp_last,
    output      logic           [ 7:0]  o_icmp_data,
    output      logic                   o_icmp_valid,
    output      logic                   o_icmp_last,
    output      logic           [ 7:0]  o_usr_data,
    output      logic                   o_usr_valid,
    output      logic                   o_usr_last
    );
logic [24:0][7:0]               pipe;
logic [24:0]                    vld_pipe;
logic [24:0]                    lst_pipe;
logic [15:0]                    eth_type;
logic [ 7:0]                    ip_proto;
logic [ 1:0]                    route;              // 0=None 1=ARP 2=ICMP 3=User
logic [10:0]                    bc;                 // 输入字节计数

always_ff @(posedge i_sys_clk) begin
    if (!i_rst_n) begin
        pipe       <= '0;
        vld_pipe   <= '0;
        lst_pipe   <= '0;
        eth_type   <= 16'd0;
        ip_proto   <= 8'd0;
        route      <= 2'd0;
        bc         <= 11'd0;
        o_arp_data <= 8'h00; o_arp_valid <= 1'b0; o_arp_last <= 1'b0;
        o_icmp_data<= 8'h00; o_icmp_valid<= 1'b0; o_icmp_last<= 1'b0;
        o_usr_data <= 8'h00; o_usr_valid <= 1'b0; o_usr_last <= 1'b0;
    end else begin
        // 每周期持续移位
        pipe     <= {pipe[23:0],     i_rx_data};
        vld_pipe <= {vld_pipe[23:0], i_rx_valid};
        lst_pipe <= {lst_pipe[23:0], i_rx_last};

        // 输入侧字节计数
        if (i_rx_last)begin
            bc <= 11'd0;
        end else if (i_rx_valid)begin
            bc <= bc + 11'd1;
        end
        
        // 字段提取（从i_rx_data，在bc位置）
        if (i_rx_valid) begin
            if (bc == 11'd12)begin  eth_type[15:8] <= i_rx_data; end
            else if (bc == 11'd13)begin  eth_type[ 7:0] <= i_rx_data; end
            else if (bc == 11'd23)begin  ip_proto <= i_rx_data;       end 
        end

        // 路由判定（比eth_type\ip_proto 晚一拍
        if (i_rx_valid && bc == 11'd14 && eth_type == 16'h0806)begin
            route <= 2'd1;
        end else if (i_rx_valid && bc == 11'd24 && eth_type == 16'h0800) begin
            if (ip_proto == 8'h01) begin   route <= 2'd2; end
            else                   begin   route <= 2'd3; end
        end else if (lst_pipe[24])begin
            route <= 2'd0;
        end

        // 输出侧（pipe[23] = 24拍前数据）
        case (route)
            2'd1: begin
                o_arp_data  <= pipe[24]; o_arp_valid <= vld_pipe[24];
                o_arp_last  <= lst_pipe[24];
                o_icmp_data <= 8'd0; o_icmp_valid <= 1'd0; o_icmp_last <= 1'd0;
                o_usr_data <= 8'd0; o_usr_valid <= 1'd0; o_usr_last <= 1'd0;
            end
            2'd2: begin
                o_icmp_data <= pipe[24]; o_icmp_valid<= vld_pipe[24];
                o_icmp_last <= lst_pipe[24];
                o_arp_data <= 8'd0; o_arp_valid <= 1'd0; o_arp_last <= 1'd0;
                o_usr_data <= 8'd0; o_usr_valid <= 1'd0; o_usr_last <= 1'd0;
            end
            2'd3: begin
                o_usr_data  <= pipe[24]; o_usr_valid <= vld_pipe[24];
                o_usr_last  <= lst_pipe[24];
                o_arp_data <= 8'd0; o_arp_valid <= 1'd0; o_arp_last <= 1'd0;
                o_icmp_data <= 8'd0; o_icmp_valid <= 1'd0; o_icmp_last <= 1'd0;
            end
            default:begin
                o_arp_data <= 8'd0; o_arp_valid <= 1'd0; o_arp_last <= 1'd0;
                o_icmp_data <= 8'd0; o_icmp_valid <= 1'd0; o_icmp_last <= 1'd0;
                o_usr_data <= 8'd0; o_usr_valid <= 1'd0; o_usr_last <= 1'd0;
            end
        endcase
    end
end

endmodule
