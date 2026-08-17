// UDP_TOP — RGMII 千兆以太网 + 协议栈封装
// V1.0.0
//
module udp_top #(
    parameter [47:0] P_LOCAL_MAC   = 48'h0202_DEAD_BEEF,
    parameter [31:0] P_LOCAL_IP    = {8'd192, 8'd168, 8'd1, 8'd210},
    parameter [47:0] P_DST_MAC     = 48'h10FF_E0F7_CEE0,
    parameter [31:0] P_DST_IP      = {8'd192, 8'd168, 8'd1, 8'd100},
    parameter [15:0] P_DST_PORT    = 16'd4000,
    parameter [15:0] P_SRC_PORT    = 16'd5000
) (
    input                               i_rst_n,
    // GMII 引脚侧
    input                               i_gmii_rx_clk,
    input                               i_gmii_rx_valid,
    input                               i_gmii_rx_err,
    input                       [ 7:0]  i_gmii_rx_data,
    output                              o_gmii_tx_clk,
    output                              o_gmii_tx_valid,
    output                              o_gmii_tx_err,
    output                      [ 7:0]  o_gmii_tx_data,
    //  User 数据输出
    output                              o_usr_clk,
    output      logic           [ 7:0]  o_usr_rx_data,
    output      logic                   o_usr_rx_valid,
    output      logic                   o_usr_rx_last,
    input                       [ 7:0]  i_usr_tx_data,
    input                               i_usr_tx_wr,
    input                               i_usr_tx_last,
    // TX 忙状态输出
    output      logic                   o_tx_busy
);
logic [7:0] rx_data;
logic       rx_valid, rx_last;

logic [7:0] arp_rx_data, icmp_rx_data, usr_rx_data;
logic       arp_rx_valid, icmp_rx_valid, usr_rx_valid;
logic       arp_rx_last, icmp_rx_last, usr_rx_last;

logic [7:0] arp_tx_data, icmp_tx_data;
logic       arp_tx_wr, icmp_tx_wr;
logic       arp_tx_last, icmp_tx_last;

logic [7:0] tx_data;
logic       tx_wr, tx_last, tx_busy;

assign o_tx_busy = tx_busy;

assign o_usr_rx_data  = usr_rx_data;
assign o_usr_rx_valid = usr_rx_valid;
assign o_usr_rx_last  = usr_rx_last;

// === GMII TOP ===
gmii_top gmii_top_m0 (
    .i_rst_n                    (i_rst_n                   ),

    .i_gmii_rx_clk              (i_gmii_rx_clk              ),   
    .i_gmii_rx_valid            (i_gmii_rx_valid            ),       
    .i_gmii_rx_err              (i_gmii_rx_err              ),   
    .i_gmii_rx_data             (i_gmii_rx_data             ),   
    .o_gmii_tx_clk              (o_gmii_tx_clk              ),   
    .o_gmii_tx_valid            (o_gmii_tx_valid            ),       
    .o_gmii_tx_err              (o_gmii_tx_err              ),   
    .o_gmii_tx_data             (o_gmii_tx_data             ), 

    .o_usr_clk                  (o_usr_clk                 ),
    .o_rx_data                  (rx_data                    ),
    .o_rx_valid                 (rx_valid                   ),
    .o_rx_last                  (rx_last                    ),
    .i_tx_data                  (tx_data                    ),
    .i_tx_wr                    (tx_wr                      ),
    .i_tx_last                  (tx_last                    ),
    .o_tx_busy                  (tx_busy                    )
);  

// === RX 协议分类 ===
rx_mux rx_mux_m0 (
    .i_sys_clk   (o_usr_clk    ),
    .i_rst_n     (i_rst_n      ),

    .i_rx_data   (rx_data      ),
    .i_rx_valid  (rx_valid     ),
    .i_rx_last   (rx_last      ),

    .o_arp_data  (arp_rx_data  ),
    .o_arp_valid (arp_rx_valid ),
    .o_arp_last  (arp_rx_last  ),

    .o_icmp_data (icmp_rx_data ),
    .o_icmp_valid(icmp_rx_valid),
    .o_icmp_last (icmp_rx_last ),

    .o_usr_data  (usr_rx_data  ),
    .o_usr_valid (usr_rx_valid ),
    .o_usr_last  (usr_rx_last  )
);

// === ARP ===
arp arp_m0 (
    .i_sys_clk   (o_usr_clk    ),
    .i_rst_n     (i_rst_n      ),

    .i_rx_data   (arp_rx_data  ),
    .i_rx_valid  (arp_rx_valid ),
    .i_rx_last   (arp_rx_last  ),
    .i_local_mac (P_LOCAL_MAC  ),
    .i_local_ip  (P_LOCAL_IP   ),
    .i_tx_busy   (tx_busy      ),

    .o_tx_data   (arp_tx_data  ),
    .o_tx_wr     (arp_tx_wr    ),
    .o_tx_last   (arp_tx_last  )
);

// === ICMP ===
icmp icmp_m0 (
    .i_sys_clk   (o_usr_clk    ),
    .i_rst_n     (i_rst_n      ),

    .i_rx_data   (icmp_rx_data ),
    .i_rx_valid  (icmp_rx_valid),
    .i_rx_last   (icmp_rx_last ),
    .i_local_mac (P_LOCAL_MAC  ),
    .i_local_ip  (P_LOCAL_IP   ),
    .i_tx_busy   (tx_busy      ),

    .o_tx_data   (icmp_tx_data ),
    .o_tx_wr     (icmp_tx_wr   ),
    .o_tx_last   (icmp_tx_last )
);

// === TX 仲裁 ===
tx_mux tx_mux_m0 (
    .i_sys_clk  (o_usr_clk     ),
    .i_rst_n    (i_rst_n       ),

    .i_arp_data (arp_tx_data   ),
    .i_arp_wr   (arp_tx_wr     ),
    .i_arp_last (arp_tx_last   ),

    .i_icmp_data(icmp_tx_data  ),
    .i_icmp_wr  (icmp_tx_wr    ),
    .i_icmp_last(icmp_tx_last  ),
    .i_usr_data (i_usr_tx_data ),

    .i_usr_wr   (i_usr_tx_wr   ),
    .i_usr_last (i_usr_tx_last ),
    .i_tx_busy  (tx_busy       ),

    .o_tx_data  (tx_data       ),
    .o_tx_wr    (tx_wr         ),
    .o_tx_last  (tx_last       )
);

endmodule
