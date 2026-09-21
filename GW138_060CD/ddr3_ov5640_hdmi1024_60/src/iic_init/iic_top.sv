//IIC 初始化控制器：上电延时后按 LUT 表逐条配置 OV5640 寄存器
//220901    v1.0.0   初始版本
//260908    v1.1.0   去掉 INIT_CMD_NUM 改 FF 地址自动完成，状态机改同步复位，LUT 改同步逻辑

module iic_top #(
    parameter P_CLK_FRE = 27_000_000, //输入时钟 Hz
    parameter P_IIC_FRE = 100_000     //IIC 时钟 Hz
)(
    input  i_sys_clk,   //系统时钟
    input  i_rst_n,     //低有效复位

    output o_iic_scl,   //IIC 时钟
    inout  io_iic_sda,  //IIC 数据

    output o_iic_done,  //初始化完成
    output o_iic_error  //IIC 无应答错误
);

//上电延时约 1ms
localparam P_DELAY_1MS = P_CLK_FRE / 1000;

//LUT 结束标志：读到该器件地址表示初始化完成
localparam P_END_MARK  = 16'h00FF;

//状态机定义
typedef enum logic [2:0] {
    STATE_DELAY,
    STATE_GAP,
    STATE_LOAD,
    STATE_INIT,
    STATE_FINISH
} STATE_CTRL_t;

STATE_CTRL_t state_main;

logic [31:0] clk_delay;
logic [ 9:0] send_cnt;
logic        send_en;
logic [15:0] send_addr;
logic [ 7:0] send_data;

logic        send_busy;    //IIC 传输忙
logic        send_en_ack;  //IIC 已接收本笔请求
logic        send_done;    //一笔事务完成

//LUT 查表输出
logic [ 9:0] lut_index;
logic [39:0] lut_data;
logic        lut_slave_addr_ex;
logic        lut_slave_reg_ex;
logic [15:0] lut_dev_addr;
logic [15:0] lut_reg_addr;

assign lut_index = send_cnt;
assign o_iic_done = (state_main == STATE_FINISH);

initial begin
    clk_delay = 'd0;
    send_cnt  = 'd0;
    send_en   = 1'b0;
    send_addr = 'd0;
    send_data = 'd0;
end

//根据 LUT 输出的地址扩展标志，自动截取器件地址/寄存器地址
always@(*)begin
    if(lut_slave_addr_ex)begin
        lut_dev_addr = lut_data[39:24];
    end else begin
        lut_dev_addr = {8'h00, lut_data[31:24]};
    end

    if(lut_slave_reg_ex)begin
        lut_reg_addr = lut_data[23:8];
    end else begin
        lut_reg_addr = {8'h00, lut_data[15:8]};
    end
end

always@(posedge i_sys_clk)begin
    if(!i_rst_n)begin
        state_main <= STATE_DELAY;
        send_cnt   <= 'd0;
        send_en    <= 1'b0;
        send_addr  <= 'd0;
        send_data  <= 'd0;
        clk_delay  <= 'd0;
    end else begin
        case(state_main)
            STATE_DELAY:begin
                //上电延时，等待从机上电稳定
                if(clk_delay == P_DELAY_1MS)begin
                    clk_delay  <= 'd0;
                    send_cnt   <= 'd0;
                    send_en    <= 1'b0;
                    state_main <= STATE_GAP;
                end else begin
                    clk_delay <= clk_delay + 'd1;
                end
            end

            STATE_GAP:begin
                //LUT 为寄存器输出，索引变化后需等一拍数据才有效
                state_main <= STATE_LOAD;
            end

            STATE_LOAD:begin
                if(lut_dev_addr == P_END_MARK)begin //读到结束标志，初始化完成
                    send_en    <= 1'b0;
                    state_main <= STATE_FINISH;
                end else begin
                    send_addr  <= lut_reg_addr; //装载本条寄存器地址
                    send_data  <= lut_data[7:0];//装载本条寄存器数据
                    send_en    <= 1'b1;
                    state_main <= STATE_INIT;
                end
            end

            STATE_INIT:begin
                //iic_master 已接收，及时撤销使能，避免重复触发
                if(send_en_ack)begin
                    send_en <= 1'b0;
                end

                //等待本笔事务完成后推进索引，避免地址滞后一行
                if(send_done)begin
                    send_cnt   <= send_cnt + 'd1;
                    state_main <= STATE_GAP;
                end else begin
                    state_main <= STATE_INIT;
                end
            end

            STATE_FINISH:begin
                state_main <= STATE_FINISH;
            end

            default:begin
                state_main <= STATE_DELAY;
            end
        endcase
    end
end

lut_ov5640_rgb565_1024_768 lut_ov5640_rgb565_1024_768_m0(
    .i_sys_clk            (i_sys_clk            ),
    .i_rst_n              (i_rst_n              ),
    .i_lut_index          (lut_index            ),
    .o_lut_data           (lut_data             ),
    .o_iic_slave_addr_ex  (lut_slave_addr_ex    ),
    .o_iic_slave_reg_ex   (lut_slave_reg_ex     )
);

//IIC 底层驱动
iic_master #(
    .P_CLK_FRE (P_CLK_FRE    ),
    .P_IIC_FRE (P_IIC_FRE    )
) iic_master_m0(
    .i_sys_clk       (i_sys_clk            ),
    .i_rst_n         (i_rst_n              ),
    .i_slave_addr_ex (lut_slave_addr_ex    ),
    .i_slave_addr    (lut_dev_addr         ),

    .i_send_rw       (1'b0                 ),
    .i_reg_addr_ex   (lut_slave_reg_ex     ),
    .i_reg_addr      (send_addr            ),
    .i_send_en       (send_en              ),
    .o_send_en_ack   (send_en_ack          ),
    .o_send_done     (send_done            ),
    .o_send_busy     (send_busy            ),
    .i_send_data     (send_data            ),
    .o_recv_data     (                     ),
    .o_brust_ready   (                     ),
    .i_brust_vaild   (1'b0                 ),
    .o_iic_error     (o_iic_error          ),

    .o_iic_scl       (o_iic_scl            ),
    .io_iic_sda      (io_iic_sda           )
);

endmodule
