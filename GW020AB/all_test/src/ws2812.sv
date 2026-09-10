// WS2812 单线驱动：RGB888输入，GRB顺序MSB发送
//260910    v1.0.0   按Coder规范重构

module ws2812 #(
    parameter P_LED_NUM = 1,          //WS2812 LED数量
    parameter P_CLK_FRE = 27_000_000, //系统时钟频率 Hz

    localparam P_BIT_NUM     = 24,   //每颗LED数据位宽
    localparam P_LED_CNT_W   = (P_LED_NUM > 1) ? $clog2(P_LED_NUM) : 1,  //LED计数位宽
    localparam P_MHZ         = P_CLK_FRE / 1_000_000,  //时钟频率 MHz
    localparam P_DELAY_1_HIGH = (P_MHZ * 850 / 1000) - 1,  //1码高电平
    localparam P_DELAY_1_LOW  = (P_MHZ * 400 / 1000) - 1,  //1码低电平
    localparam P_DELAY_0_HIGH = (P_MHZ * 400 / 1000) - 1,  //0码高电平
    localparam P_DELAY_0_LOW  = (P_MHZ * 850 / 1000) - 1,  //0码低电平
    localparam P_RESET_CNT    = (P_CLK_FRE / 10000) - 1                 //复位时间 100us
)(
    input                  i_sys_clk,    //系统时钟
    input                  i_rst_n,      //系统复位，低有效

    input      [23:0]      i_rgb888,     //RGB888颜色数据
    input                  i_data_en,    //开始发送使能

    output logic           o_ready,      //空闲可接收
    output logic           o_done,       //一帧发送完成
    output logic           o_ws2812_di   //WS2812数据输出
);

typedef enum logic [2:0] {WS_IDLE, WS_BIT_HIGH, WS_BIT_LOW, WS_RESET} STATE_WS;
STATE_WS state;

logic [23:0]      rgb_r;      //锁存RGB数据
logic [23:0]      frame;      //GRB发送帧
logic [ 4:0]      bit_cnt;    //当前发送位
logic [P_LED_CNT_W-1:0] led_cnt;  //当前发送LED序号
logic [31:0]      delay_cnt;  //延时计数

assign frame = {rgb_r[15:8], rgb_r[23:16], rgb_r[7:0]};  //RGB转GRB
assign o_ready = (state == WS_IDLE);

always@(posedge i_sys_clk)begin
    if(!i_rst_n)begin
        state     <= WS_IDLE;
        rgb_r     <= 24'd0;
        bit_cnt   <= 5'd0;
        led_cnt   <= {P_LED_CNT_W{1'b0}};
        delay_cnt <= 32'd0;
        o_done    <= 1'b0;
        o_ws2812_di <= 1'b0;
    end else begin
        case(state)
            WS_IDLE:begin
                o_ws2812_di <= 1'b0;
                o_done      <= 1'b0;

                if(i_data_en)begin
                    rgb_r     <= i_rgb888;
                    bit_cnt   <= 5'd0;
                    led_cnt   <= {P_LED_CNT_W{1'b0}};
                    delay_cnt <= 32'd0;

                    state <= WS_BIT_HIGH;
                end
            end

            WS_BIT_HIGH:begin
                o_ws2812_di <= 1'b1;
                o_done      <= 1'b0;

                if(frame[P_BIT_NUM - 1 - bit_cnt])begin
                    if(delay_cnt < P_DELAY_1_HIGH)begin
                        delay_cnt <= delay_cnt + 32'd1;
                    end else begin
                        delay_cnt <= 32'd0;
                        state     <= WS_BIT_LOW;
                    end
                end else begin
                    if(delay_cnt < P_DELAY_0_HIGH)begin
                        delay_cnt <= delay_cnt + 32'd1;
                    end else begin
                        delay_cnt <= 32'd0;
                        state     <= WS_BIT_LOW;
                    end
                end
            end

            WS_BIT_LOW:begin
                o_ws2812_di <= 1'b0;
                o_done      <= 1'b0;

                if(frame[P_BIT_NUM - 1 - bit_cnt])begin
                    if(delay_cnt < P_DELAY_1_LOW)begin
                        delay_cnt <= delay_cnt + 32'd1;
                    end else begin
                        delay_cnt <= 32'd0;
                        bit_cnt   <= bit_cnt + 5'd1;

                        if(bit_cnt == P_BIT_NUM - 1)begin
                            bit_cnt <= 5'd0;

                            if(led_cnt == P_LED_NUM - 1)begin
                                led_cnt <= {P_LED_CNT_W{1'b0}};
                                state   <= WS_RESET;
                            end else begin
                                led_cnt <= led_cnt + 1'b1;
                                state   <= WS_BIT_HIGH;
                            end
                        end else begin
                            state <= WS_BIT_HIGH;
                        end
                    end
                end else begin
                    if(delay_cnt < P_DELAY_0_LOW)begin
                        delay_cnt <= delay_cnt + 32'd1;
                    end else begin
                        delay_cnt <= 32'd0;
                        bit_cnt   <= bit_cnt + 5'd1;

                        if(bit_cnt == P_BIT_NUM - 1)begin
                            bit_cnt <= 5'd0;

                            if(led_cnt == P_LED_NUM - 1)begin
                                led_cnt <= {P_LED_CNT_W{1'b0}};
                                state   <= WS_RESET;
                            end else begin
                                led_cnt <= led_cnt + 1'b1;
                                state   <= WS_BIT_HIGH;
                            end
                        end else begin
                            state <= WS_BIT_HIGH;
                        end
                    end
                end
            end

            WS_RESET:begin
                o_ws2812_di <= 1'b0;

                if(delay_cnt < P_RESET_CNT)begin
                    delay_cnt <= delay_cnt + 32'd1;
                    o_done    <= 1'b0;
                end else begin
                    delay_cnt <= 32'd0;
                    o_done    <= 1'b1;
                    state     <= WS_IDLE;
                end
            end

            default:begin
                state     <= WS_IDLE;
                rgb_r     <= 24'd0;
                bit_cnt   <= 5'd0;
                led_cnt   <= {P_LED_CNT_W{1'b0}};
                delay_cnt <= 32'd0;
                o_done    <= 1'b0;
                o_ws2812_di <= 1'b0;
            end
        endcase
    end
end

endmodule
