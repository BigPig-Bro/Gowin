// 用户侧回环控制：把接收到的数据原样回发，用于USB测速
// 与 ft232h_top 的用户侧接口对接
//260923    v1.0.0   初始版本
module loop_ctrl (
    input               i_clk,          //用户侧时钟
    input               i_rst_n,        //复位，低有效

    //接收（来自 ft232h_top）
    input       [7:0]   i_rx_data,      //接收数据
    input               i_rx_valid,     //接收数据有效
    input               i_rx_last,      //接收末字节

    //发送（发往 ft232h_top）
    output logic [7:0]  o_tx_data,      //发送数据
    output logic        o_tx_wr,        //发送写使能
    output logic        o_tx_last,      //发送末字节
    input               i_tx_busy       //发送忙
);

//回环：收到即转发（打一拍）
always@(posedge i_clk)begin
    if(!i_rst_n)begin
        o_tx_data <= 8'd0;
        o_tx_wr   <= 1'b0;
        o_tx_last <= 1'b0;
    end else begin
        o_tx_data <= i_rx_data;
        o_tx_wr   <= i_rx_valid;
        o_tx_last <= i_rx_last;
    end
end

endmodule
