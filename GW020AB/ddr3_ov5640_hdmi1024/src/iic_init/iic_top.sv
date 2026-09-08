//IIC 初始化控制器：上电延时后按 LUT 表逐条配置 OV5640 寄存器
//220901    v1.0.0   初始版本
//260908    v1.1.0   去掉 INIT_CMD_NUM 改 FF 地址自动完成，状态机改同步复位，LUT 改同步逻辑

module iic_top #(
    parameter CLK_FRE           = 27,    //输入时钟 MHz
    parameter IIC_FRE           = 100,   //IIC 时钟 kHz
    parameter IIC_SLAVE_ADDR_EX = 0,     //从机地址扩展：1 为 2 字节
    parameter IIC_SLAVE_REG_EX  = 1,     //寄存器地址扩展：1 为 2 字节
    parameter IIC_SLAVE_ADDR    = 16'h78 //从机地址
)(
    input  i_sys_clk,  //系统时钟
    input  i_rst_n,    //低有效复位
    output o_iic_scl,  //IIC 时钟
    inout  io_iic_sda, //IIC 数据
    output o_iic_done, //初始化完成
    output o_iic_error //IIC 无应答错误
);

//上电延时约 1ms
localparam DELAY = CLK_FRE * 1000;

//LUT 结束标志：寄存器地址全 FF 表示配置表结束
localparam CMD_END_ADDR = 16'hFFFF;

//状态机定义
typedef enum logic [2:0] {
    STATE_DELAY,
    STATE_INIT,
    STATE_FINISH,
    STATE_WAIT_BUSY
} STATE_CTRL_t;

STATE_CTRL_t state_main;
STATE_CTRL_t pre_state;

logic [31:0] clk_delay = 'd0;
logic [ 9:0] send_cnt   = 'd0;
logic        send_busy;
logic        send_en    = 1'b0;
logic [ 7 + IIC_SLAVE_REG_EX * 8 : 0] send_addr = 'd0;
logic [ 7:0] send_data  = 'd0;

//LUT 查表输出
logic [ 9:0] lut_index;
logic [31:0] lut_data;

assign lut_index = send_cnt;

lut_ov5640_rgb565_1024_768 lut_ov5640_rgb565_1024_768_m0(
    .i_sys_clk  (i_sys_clk   ),
    .i_rst_n    (i_rst_n     ),
    .i_lut_index(lut_index   ),
    .o_lut_data (lut_data    )
);

always@(posedge i_sys_clk)begin
    if(!i_rst_n)begin
        state_main <= STATE_DELAY;
        send_cnt   <= 'd0;
        send_en    <= 1'b0;
        clk_delay  <= 'd0;
    end else begin
        case(state_main)
            STATE_DELAY:begin
                if(clk_delay == DELAY)begin
                    clk_delay  <= 'd0;
                    state_main <= STATE_INIT;
                end else begin
                    clk_delay <= clk_delay + 'd1;
                end
            end

            STATE_INIT:begin
                if(lut_data[15 + IIC_SLAVE_REG_EX * 8 : 8] == CMD_END_ADDR)begin//读到 FF 地址，初始化完成
                    send_en    <= 1'b0;
                    send_cnt   <= 'd0;
                    state_main <= STATE_FINISH;
                end else if(!send_busy)begin
                    send_en    <= 1'b1;
                    send_addr  <= lut_data[15 + IIC_SLAVE_REG_EX * 8 : 8];
                    send_data  <= lut_data[7:0];
                    send_cnt   <= send_cnt + 'd1;
                    pre_state  <= state_main;
                    state_main <= STATE_WAIT_BUSY;
                end else begin
                    send_en <= 1'b0;
                end
            end

            STATE_FINISH:begin
                state_main <= STATE_FINISH;
            end

            STATE_WAIT_BUSY:begin
                if(send_busy)begin
                    state_main <= pre_state;
                end
            end

            default:begin
                state_main <= STATE_DELAY;
            end
        endcase
    end
end

assign o_iic_done = (state_main == STATE_FINISH);

//IIC 底层驱动
iic_master #(
    .CLK_FRE           (CLK_FRE              ),
    .IIC_FRE           (IIC_FRE              ),
    .IIC_SLAVE_ADDR_EX (IIC_SLAVE_ADDR_EX    ),
    .IIC_SLAVE_REG_EX  (IIC_SLAVE_REG_EX     )
) iic_master_m0(
    .i_sys_clk     (i_sys_clk         ),
    .i_slave_addr  (IIC_SLAVE_ADDR    ),
    .i_send_rw     (1'b0              ),
    .i_reg_addr    (send_addr         ),
    .i_send_en     (send_en           ),
    .o_brust_ready (                  ),
    .i_brust_vaild (1'b0              ),
    .i_send_data   (send_data         ),
    .o_recv_data   (                  ),
    .o_send_busy   (send_busy         ),
    .o_iic_error   (o_iic_error       ),
    .o_iic_scl     (o_iic_scl         ),
    .io_iic_sda    (io_iic_sda        )
);

endmodule
