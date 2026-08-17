//  GMII IO 
// V1.0.0
//
module gmii_io (
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
    // User GMII
    output                              o_usr_clk,
    output      logic           [ 7:0]  o_rx_data,
    output      logic                   o_rx_dv,
    output      logic                   o_rx_er,
    input                       [ 7:0]  i_tx_data,
    input                               i_tx_en,
    input                               i_tx_er
    );
/////////////////////////////////////////////////////////////////////////////////////////
////////////////////                 内部信号                /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
assign                          o_usr_clk = ~i_gmii_rx_clk;

/////////////////////////////////////////////////////////////////////////////////////////
////////////////////           RXD                          /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
assign o_rx_data = i_gmii_rx_data;
assign o_rx_dv   = i_gmii_rx_valid;
assign o_rx_er   = i_gmii_rx_err;

/////////////////////////////////////////////////////////////////////////////////////////
////////////////////           TXD                          /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
assign o_gmii_tx_clk   = o_usr_clk; //gmii_rxc
assign o_gmii_tx_data  = i_tx_data;
assign o_gmii_tx_err   = i_tx_er;
assign o_gmii_tx_valid = i_tx_en;

endmodule
