// FT232H 高速USB测速顶层：ft232h_top（物理接口）+ loop_ctrl（回环）
//260923    v1.0.0   初始版本
module top (
    input               i_rst_n,        //复位，低有效
    input               i_ft_clk,       //FT232H时钟
    input               i_ft_rxf_n,     //FT232H数据有效，低有效
    input               i_ft_txe_n,     //FT232H可写，低有效
    output logic        o_ft_oe_n,      //FT232H输出使能，低有效
    output logic        o_ft_rd_n,      //FT232H读，低有效
    output logic        o_ft_wr_n,      //FT232H写，低有效
    output logic        o_ft_siwu_n,    //FT232H唤醒，低有效
    inout  [7:0]        io_ft_data      //FT232H数据总线
);

/////////////////////////////////////////////////////////////////////////////////////////
////////////////////                 内部信号                /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
logic        sys_rst_n;    //系统复位（boot_rst上电复位输出）
logic        usr_clk;      //用户侧时钟
logic [7:0]  usr_rx_data;  //接收数据
logic        usr_rx_valid; //接收数据有效
logic        usr_rx_last;  //接收末字节
logic [7:0]  usr_tx_data;  //发送数据
logic        usr_tx_wr;    //发送写使能
logic        usr_tx_last;  //发送末字节
logic        tx_busy;      //发送忙

/////////////////////////////////////////////////////////////////////////////////////////
////////////////////            时钟复位（boot_rst）         /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
boot_rst boot_rst_m0(
    .i_clk   (i_ft_clk  ),
    .i_rst_n (i_rst_n   ),
    .o_rst_n (sys_rst_n )
);

/////////////////////////////////////////////////////////////////////////////////////////
////////////////////              FT232H 物理接口            /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
ft232h_top ft232h_top_m0(
    .i_rst_n        (sys_rst_n      ),
    .i_ft_clk       (i_ft_clk       ),
    .i_ft_rxf_n     (i_ft_rxf_n     ),
    .i_ft_txe_n     (i_ft_txe_n     ),
    .o_ft_oe_n      (o_ft_oe_n      ),
    .o_ft_rd_n      (o_ft_rd_n      ),
    .o_ft_wr_n      (o_ft_wr_n      ),
    .o_ft_siwu_n    (o_ft_siwu_n    ),
    .io_ft_data     (io_ft_data     ),

    .o_usr_clk      (usr_clk        ),
    .o_usr_rx_data  (usr_rx_data    ),
    .o_usr_rx_valid (usr_rx_valid   ),
    .o_usr_rx_last  (usr_rx_last    ),
    .i_usr_tx_data  (usr_tx_data    ),
    .i_usr_tx_wr    (usr_tx_wr      ),
    .i_usr_tx_last  (usr_tx_last    ),
    .o_tx_busy      (tx_busy        )
);

/////////////////////////////////////////////////////////////////////////////////////////
////////////////////              回环控制（用户逻辑）        /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
loop_ctrl loop_ctrl_m0(
    .i_clk       (usr_clk      ),
    .i_rst_n     (sys_rst_n    ),

    .i_rx_data   (usr_rx_data  ),
    .i_rx_valid  (usr_rx_valid ),
    .i_rx_last   (usr_rx_last  ),

    .o_tx_data   (usr_tx_data  ),
    .o_tx_wr     (usr_tx_wr    ),
    .o_tx_last   (usr_tx_last  ),
    .i_tx_busy   (tx_busy      )
);

endmodule
