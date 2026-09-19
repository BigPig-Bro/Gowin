//WM8731 初始化寄存器查找表
//数据格式：{器件地址16bit, 寄存器地址16bit, 寄存器数据8bit}，iic_top 按 LUT 输出的扩展标志自动截取
//260912    v1.0.0   初始版本
module lut_wm8731(
    input               i_sys_clk,           //查找表时钟
    input               i_rst_n,             //低有效复位
    input        [ 9:0] i_lut_index,         //查找表地址
    output logic [39:0] o_lut_data,          //器件地址、寄存器地址、寄存器数据
    output logic        o_iic_slave_addr_ex, //从机地址扩展：1 为 2 字节
    output logic        o_iic_slave_reg_ex   //寄存器地址扩展：1 为 2 字节
);

assign o_iic_slave_addr_ex = 1'b0; //WM8731 从机地址 1 字节
assign o_iic_slave_reg_ex  = 1'b0; //WM8731 寄存器地址 1 字节

always@(posedge i_sys_clk)begin
    if(!i_rst_n)begin
        o_lut_data <= 'd0;
    end else begin
        case(i_lut_index)
            10'd 0: o_lut_data <= {16'h0034, 16'h0000, 8'h1A}; //SET_LIN_L
            10'd 1: o_lut_data <= {16'h0034, 16'h0002, 8'h1A}; //SET_LIN_R
            10'd 2: o_lut_data <= {16'h0034, 16'h0004, 8'h7B}; //SET_HEAD_L
            10'd 3: o_lut_data <= {16'h0034, 16'h0006, 8'h7B}; //SET_HEAD_R
            10'd 4: o_lut_data <= {16'h0034, 16'h0008, 8'hF8}; //A_PATH_CTRL
            10'd 5: o_lut_data <= {16'h0034, 16'h000A, 8'h06}; //D_PATH_CTRL
            10'd 6: o_lut_data <= {16'h0034, 16'h000C, 8'h00}; //POWER_ON
            10'd 7: o_lut_data <= {16'h0034, 16'h000E, 8'h01}; //SET_FORMAT
            10'd 8: o_lut_data <= {16'h0034, 16'h0010, 8'h02}; //SAMPLE_CTRL
            10'd 9: o_lut_data <= {16'h0034, 16'h0012, 8'h01}; //SET_ACTIVE
            default: o_lut_data <= {16'hFFFF, 16'hFFFF, 8'hFF}; //结束标志
        endcase
    end
end

endmodule
