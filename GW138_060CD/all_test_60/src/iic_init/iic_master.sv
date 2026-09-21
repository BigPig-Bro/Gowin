//IIC 主机底层驱动：SCL 二分频 + SDA 移位延时，支持 1/2 字节从机地址与寄存器地址
//220901    v1.0.0   初始版本
module iic_master #(
    parameter P_CLK_FRE = 27_000_000, //输入时钟 Hz
    parameter P_IIC_FRE = 100_000     //IIC 时钟 Hz
)(
    //时钟
    input        i_sys_clk,   //系统时钟
    input        i_rst_n,     //系统复位

    //读写地址相关
    input        i_slave_addr_ex, //从机地址扩展：1 为 2 字节
    input [15:0] i_slave_addr,
    input        i_send_rw,
    input        i_reg_addr_ex,   //寄存器地址扩展：1 为 2 字节
    input [15:0] i_reg_addr,

    //读写数据相关
    input               i_send_en,
    output logic        o_brust_ready,
    input               i_brust_vaild,
    input        [ 7:0] i_send_data,
    output logic [ 7:0] o_recv_data,

    output              o_send_busy,
    output logic        o_send_en_ack, //发送使能应答：IDLE 收到 i_send_en 时拉高一个时钟
    output logic        o_send_done,   //一笔事务完成：回到 IDLE 时拉高一个时钟
    output logic        o_iic_error,   //从机无应答错误（锁存）

    //IIC 物理接口
    output logic        o_iic_scl,
    inout               io_iic_sda
);

//IIC inout 方向与输出移位延时
logic sda_en;
logic sda_out;
logic [P_CLK_FRE / 2_000_000 : 0] sda_out_r;
logic [P_CLK_FRE / 2_000_000 : 0] sda_en_r;
assign io_iic_sda = sda_en_r[P_CLK_FRE / 2_000_000] ? sda_out_r[P_CLK_FRE / 2_000_000] : 1'bz;

//SCL 分频 2 倍：scl_x2 = 2 * IIC_FRE，CLK_DIV 为半个 scl_x2 周期计数
localparam CLK_DIV = P_CLK_FRE / (2 * P_IIC_FRE);
logic [31:0] clk_delay;
logic        scl_x2;

always@(posedge i_sys_clk)begin
    clk_delay <= (clk_delay == CLK_DIV) ? 'd0 : clk_delay + 'd1;
end

always@(posedge i_sys_clk)begin
    scl_x2 <= (clk_delay >= CLK_DIV / 2);
end

//SDA 偏移约 500ns
always@(posedge i_sys_clk)begin
    sda_out_r <= (sda_out_r << 1) + sda_out;
end

always@(posedge i_sys_clk)begin
    sda_en_r <= (sda_en_r << 1) + sda_en;
end

//端口采样，避免影响主机时序
logic [7:0]  send_data_r;
logic [15:0] slave_addr_r;
logic [15:0] reg_addr_r;
logic [7:0]  recv_data_r;
logic [3:0]  send_cnt;
logic        send_busy_r;

//状态机定义
typedef enum logic [2:0] {
    STATE_IDLE,
    STATE_SLAVE_EX,
    STATE_SLAVE,
    STATE_REG_EX,
    STATE_REG,
    STATE_DATA,
    STATE_ACK,
    STATE_END
} STATE_IIC_t;

STATE_IIC_t state_main;
STATE_IIC_t state_next;
logic [1:0] state_sub;

initial begin
    o_recv_data   = 'd0;
    o_send_en_ack = 1'b0;
    o_send_done   = 1'b0;
    o_iic_error   = 1'b0;
    o_iic_scl     = 1'b1;
    sda_en        = 1'b1;
    sda_out       = 1'b1;
    sda_out_r     = 'd0;
    sda_en_r      = 'd0;
    clk_delay     = 'd0;
    scl_x2        = 1'b0;
    send_data_r   = 'd0;
    slave_addr_r  = 'd0;
    reg_addr_r    = 'd0;
    recv_data_r   = 'd0;
    send_cnt      = 'd0;
    state_sub     = 'd0;
    send_busy_r   = 1'b0;
end

assign o_send_busy = (state_main != STATE_IDLE);

//scl_x2 为分频时钟域，使用 i_rst_n 复位状态机与错误锁存
always@(posedge scl_x2)begin
    if(!i_rst_n)begin
        state_main    <= STATE_IDLE;
        state_next    <= STATE_SLAVE;
        state_sub     <= 'd0;
        send_cnt      <= 'd0;
        sda_en        <= 1'b1;
        sda_out       <= 1'b1;
        o_iic_scl     <= 1'b1;
        send_data_r   <= 'd0;
        reg_addr_r    <= 'd0;
        slave_addr_r  <= 'd0;
        recv_data_r   <= 'd0;
        o_brust_ready <= 1'b0;
        o_iic_error   <= 1'b0;
    end else begin
        case(state_main)
            STATE_IDLE:begin
                if(i_send_en)begin
                    send_data_r  <= i_send_data;
                    reg_addr_r   <= i_reg_addr;
                    slave_addr_r <= i_slave_addr + i_send_rw;
                    sda_out      <= 1'b0; //IIC 起始信号
                    state_main   <= (i_slave_addr_ex) ? STATE_SLAVE_EX : STATE_SLAVE;
                end else begin
                    sda_en    <= 1'b1;
                    sda_out   <= 1'b1;
                    o_iic_scl <= 1'b1;
                end
            end

            STATE_SLAVE_EX:begin //发送从机器件地址高 8 位
                case(state_sub)
                    2'd0:begin //SCL 下降沿，准备数据
                        o_iic_scl <= 1'b0;
                        sda_en    <= 1'b1;
                        sda_out   <= slave_addr_r[15 - send_cnt];
                        send_cnt  <= send_cnt + 'd1;
                        state_sub <= state_sub + 'd1;
                    end

                    2'd1:begin //SCL 上升沿，发送数据
                        o_iic_scl  <= 1'b1;
                        state_sub  <= 'd0;
                        state_next <= (send_cnt == 8) ? STATE_SLAVE : state_next;
                        state_main <= (send_cnt == 8) ? STATE_ACK  : state_main;
                    end
                endcase
            end

            STATE_SLAVE:begin //发送从机器件地址低 8 位
                case(state_sub)
                    2'd0:begin //SCL 下降沿，准备数据
                        o_iic_scl <= 1'b0;
                        sda_en    <= 1'b1;
                        sda_out   <= slave_addr_r[7 - send_cnt];
                        send_cnt  <= send_cnt + 'd1;
                        state_sub <= state_sub + 'd1;
                    end

                    2'd1:begin //SCL 上升沿，发送数据
                        o_iic_scl  <= 1'b1;
                        state_sub  <= 'd0;
                        state_next <= (send_cnt == 8) ? ((i_reg_addr_ex) ? STATE_REG_EX : STATE_REG) : state_next;
                        state_main <= (send_cnt == 8) ? STATE_ACK : state_main;
                    end
                endcase
            end

            STATE_REG_EX:begin //发送寄存器地址高 8 位
                case(state_sub)
                    2'd0:begin //SCL 下降沿，准备数据
                        o_iic_scl <= 1'b0;
                        sda_en    <= 1'b1;
                        sda_out   <= reg_addr_r[15 - send_cnt];
                        send_cnt  <= send_cnt + 'd1;
                        state_sub <= state_sub + 'd1;
                    end

                    2'd1:begin //SCL 上升沿，发送数据
                        o_iic_scl  <= 1'b1;
                        state_sub  <= 'd0;
                        state_next <= (send_cnt == 8) ? STATE_REG : state_next;
                        state_main <= (send_cnt == 8) ? STATE_ACK : state_main;
                    end
                endcase
            end

            STATE_REG:begin //发送寄存器地址低 8 位
                case(state_sub)
                    2'd0:begin //SCL 下降沿，准备数据
                        o_iic_scl <= 1'b0;
                        sda_en    <= 1'b1;
                        sda_out   <= reg_addr_r[7 - send_cnt];
                        send_cnt  <= send_cnt + 'd1;
                        state_sub <= state_sub + 'd1;
                    end

                    2'd1:begin //SCL 上升沿，发送数据
                        o_iic_scl  <= 1'b1;
                        state_sub  <= 'd0;
                        state_next <= (send_cnt == 8) ? STATE_DATA : state_next;
                        state_main <= (send_cnt == 8) ? STATE_ACK  : state_main;
                    end
                endcase
            end

            STATE_DATA:begin //发送/读取数据（突发）
                case(state_sub)
                    2'd0:begin //SCL 下降沿，准备数据
                        o_iic_scl <= 1'b0;
                        sda_en    <= slave_addr_r[0] ? 1'b0 : 1'b1;
                        sda_out   <= send_data_r[7 - send_cnt]; //写
                        send_cnt  <= send_cnt + 'd1;
                        state_sub <= state_sub + 'd1;
                    end

                    2'd1:begin //SCL 上升沿，发送/读取数据
                        o_iic_scl     <= 1'b1;
                        recv_data_r[8 - send_cnt] <= io_iic_sda; //读
                        o_brust_ready <= (send_cnt == 8) ? 1'b1 : 'd0;
                        state_sub     <= 'd0;
                        state_next    <= (send_cnt == 8) ? (i_brust_vaild ? STATE_DATA : STATE_END) : state_next;
                        state_main    <= (send_cnt == 8) ? STATE_ACK : state_main;
                    end
                endcase
            end

            STATE_ACK:begin //应答
                sda_en   <= 1'b0;
                send_cnt <= 'd0;
                case(state_sub)
                    2'd0:begin //SCL 下降沿
                        o_iic_scl <= 1'b0;
                        state_sub <= state_sub + 'd1;
                    end

                    2'd1:begin //SCL 上升沿，采样 ACK
                        o_iic_scl     <= 1'b1;
                        o_brust_ready <= 1'b0;
                        send_data_r   <= i_send_data;
                        state_sub     <= 'd0;
                        if(io_iic_sda)begin //SDA 高 = 从机无应答
                            o_iic_error <= 1'b1;
                            state_main  <= STATE_END;
                        end else begin
                            state_main  <= state_next;
                        end
                    end
                endcase
            end

            STATE_END:begin
                sda_en <= 1'b1;
                case(state_sub)
                    2'd0:begin //SCL 下降沿
                        o_iic_scl <= 1'b0;
                        sda_out   <= 1'b0;
                        state_sub <= state_sub + 'd1;
                    end

                    2'd1:begin
                        o_iic_scl  <= 1'b1;
                        sda_out    <= 1'b1;
                        state_main <= STATE_IDLE;
                        state_sub  <= 'd0;
                    end
                endcase
            end

            default:begin
                state_main <= STATE_IDLE;
            end
        endcase
    end
end

//发送使能应答：检测 o_send_busy 上升沿，产生一个 i_sys_clk 脉冲
always@(posedge i_sys_clk)begin
    if(!i_rst_n)begin
        send_busy_r   <= 1'b0;
        o_send_en_ack <= 1'b0;
        o_send_done   <= 1'b0;
    end else begin
        send_busy_r   <= o_send_busy;
        o_send_en_ack <= o_send_busy && !send_busy_r;
        o_send_done   <= !o_send_busy && send_busy_r; //busy 下降沿：一笔事务完成
    end
end

endmodule
