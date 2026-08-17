// GMII TOP — GMII桥接 + RX帧解码 + TX帧发送
// V1.0.0
//
module gmii_top (
    input                               i_rst_n,
    // GMII 引脚
    input                               i_gmii_rx_clk,
    input                               i_gmii_rx_valid,
    input                               i_gmii_rx_err,
    input                       [ 7:0]  i_gmii_rx_data,
    output                              o_gmii_tx_clk,
    output                              o_gmii_tx_valid,
    output                              o_gmii_tx_err,
    output                      [ 7:0]  o_gmii_tx_data,

    output                              o_usr_clk,
    // RX 帧流输出
    output      logic           [ 7:0]  o_rx_data,
    output      logic                   o_rx_valid,
    output      logic                   o_rx_last,
    // TX 帧流输入
    input                       [ 7:0]  i_tx_data,
    input                               i_tx_wr,
    input                               i_tx_last,
    output      logic                   o_tx_busy
    );
/////////////////////////////////////////////////////////////////////////////////////////
////////////////////                 内部信号                /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
logic [7:0]                     gmii_rx_data;
logic                           gmii_rx_dv;
logic [7:0]                     gmii_tx_data;
logic                           gmii_tx_en;

/////////////////////////////////////////////////////////////////////////////////////////
////////////////////          GMII IO                       /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
gmii_io gmii_io_m0 (
    .i_rst_n                    (i_rst_n                    ),
    // ---- IO  ----
    .i_gmii_rx_clk              (i_gmii_rx_clk              ),   
    .i_gmii_rx_valid            (i_gmii_rx_valid            ),       
    .i_gmii_rx_err              (i_gmii_rx_err              ),   
    .i_gmii_rx_data             (i_gmii_rx_data             ),   
    .o_gmii_tx_clk              (o_gmii_tx_clk              ),   
    .o_gmii_tx_valid            (o_gmii_tx_valid            ),       
    .o_gmii_tx_err              (o_gmii_tx_err              ),   
    .o_gmii_tx_data             (o_gmii_tx_data             ), 

    // ---- User  ----
    .o_usr_clk                  (o_usr_clk                  ),
    .o_rx_data                  (gmii_rx_data               ),
    .o_rx_dv                    (gmii_rx_dv                 ),
    .o_rx_er                    (                           ),
    .i_tx_data                  (gmii_tx_data               ),
    .i_tx_en                    (gmii_tx_en                 ),
    .i_tx_er                    (1'b0                       )
);

/////////////////////////////////////////////////////////////////////////////////////////
////////////////////             GMII RX 帧解码             /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
gmii_rx gmii_rx_m0 (
    .i_sys_clk                  (o_usr_clk                  ),
    .i_rst_n                    (i_rst_n                    ),
    // ---- GMII 输入 ----
    .i_rx_data                  (gmii_rx_data               ),
    .i_rx_dv                    (gmii_rx_dv                 ),
    // ---- 帧流输出 ----
    .o_rx_data                  (o_rx_data                  ),
    .o_rx_valid                 (o_rx_valid                 ),
    .o_rx_last                  (o_rx_last                  )
);

/////////////////////////////////////////////////////////////////////////////////////////
////////////////////             GMII TX 发送(+FCS)         /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
gmii_tx gmii_tx_m0 (
    .i_sys_clk                  (o_usr_clk                  ),
    .i_rst_n                    (i_rst_n                    ),
    // ---- 帧流输入 ----
    .i_tx_data                  (i_tx_data                  ),
    .i_tx_wr                    (i_tx_wr                    ),
    .i_tx_last                  (i_tx_last                  ),
    .o_tx_busy                  (o_tx_busy                  ),
    // ---- GMII 输出 ----
    .o_tx_data                  (gmii_tx_data               ),
    .o_tx_en                    (gmii_tx_en                 )
);

endmodule
