// WM8731 音频回环：ADC采集写入FIFO，DAC从FIFO读取播放（BCK/LRCK由FPGA主控）
//260826    v1.0.0   初始版本（从Cyclone wm8731_loop移植至Xilinx XI050CD）
//260826    v1.1.0   按代码风格重构：logic/同步复位/snake_case命名

module audio_dac_fifo #(
    parameter P_REF_CLK     = 12_000_000, //音频主时钟 12MHz
    parameter P_SAMPLE_RATE = 48_000,     //采样率 48kHz
    parameter P_DATA_WIDTH  = 16,         //数据位宽 16bit
    parameter P_CHANNEL_NUM = 2           //双声道
)(
    input                       i_sys_clk,    //音频主时钟
    input                       i_rst_n,      //复位，低有效

    input                       i_aud_data,   //ADC串行数据
    output logic                o_aud_bck,    //音频位时钟
    output logic                o_aud_data,   //DAC串行数据
    output logic                o_aud_lrck,   //左右声道时钟
    output logic                o_aud_xck     //音频主时钟输出
);

//派生参数：由外部可调参数计算，外部不直接调用
localparam P_BCK_DIV_MAX  = P_REF_CLK / (P_SAMPLE_RATE * P_DATA_WIDTH * P_CHANNEL_NUM * 2) - 1; //位时钟分频
localparam P_LRCK_DIV_MAX = P_REF_CLK / (P_SAMPLE_RATE * 2) - 1;                               //左右声道时钟分频
localparam P_LRCK_2X_MAX  = P_REF_CLK / (P_SAMPLE_RATE * 4) - 1;                               //2倍左右声道时钟分频

/********************************************************************************/
/**************************        内部信号        ******************************/
/********************************************************************************/

logic        bck_r;        //位时钟寄存器
logic        lrck_r;       //左右声道时钟寄存器
logic        lrck_2x_r;    //2倍左右声道时钟寄存器

logic [15:0] bck_div_r;    //位时钟分频计数
logic [15:0] lrck_div_r;   //左右声道时钟分频计数
logic [15:0] lrck_2x_div_r;//2倍左右声道时钟分频计数

logic [ 3:0] sel_cnt_r;    //PISO选择计数
logic [15:0] data_in_r;    //ADC输入数据
logic [15:0] data_in_tmp_r;//ADC输入数据暂存
logic [15:0] data_out_r;   //DAC输出数据
logic [15:0] data_out_tmp_r;//DAC输出数据暂存

logic        data_rd_r;    //数据读取脉冲

assign o_aud_xck  = ~i_sys_clk;
assign o_aud_bck  = bck_r;
assign o_aud_lrck = lrck_r;
assign o_aud_data = data_out_r[P_DATA_WIDTH - 1 - sel_cnt_r];

/********************************************************************************/
/**************************        AUD_BCK生成        ***************************/
/********************************************************************************/

always@(posedge i_sys_clk)begin
    if(!i_rst_n)begin
        bck_div_r <= 'd0;
        bck_r     <= 1'b0;
    end else if(bck_div_r >= P_BCK_DIV_MAX)begin
        bck_div_r <= 'd0;
        bck_r     <= ~bck_r;
    end else begin
        bck_div_r <= bck_div_r + 1'b1;
    end
end

/********************************************************************************/
/**************************       AUD_LRCK生成        ***************************/
/********************************************************************************/

always@(posedge i_sys_clk)begin
    if(!i_rst_n)begin
        lrck_div_r    <= 'd0;
        lrck_2x_div_r <= 'd0;
        lrck_r        <= 1'b0;
        lrck_2x_r     <= 1'b0;
    end else begin
        //LRCK 1X：左右声道时钟
        if(lrck_div_r >= P_LRCK_DIV_MAX)begin
            lrck_div_r <= 'd0;
            lrck_r     <= ~lrck_r;
        end else begin
            lrck_div_r <= lrck_div_r + 1'b1;
        end

        //LRCK 2X：数据锁存节拍
        if(lrck_2x_div_r >= P_LRCK_2X_MAX)begin
            lrck_2x_div_r <= 'd0;
            lrck_2x_r     <= ~lrck_2x_r;
        end else begin
            lrck_2x_div_r <= lrck_2x_div_r + 1'b1;
        end
    end
end

/********************************************************************************/
/**************************        ADC数据采样        ***************************/
/********************************************************************************/

always@(posedge i_sys_clk)begin
    if(!i_rst_n)begin
        data_in_tmp_r <= 'd0;
    end else if(lrck_r == 1'b0)begin
        data_in_tmp_r[P_DATA_WIDTH - 1 - sel_cnt_r] <= i_aud_data;
    end else begin
        data_in_tmp_r <= data_in_tmp_r;
    end
end

/********************************************************************************/
/**************************        数据读取脉冲       ***************************/
/********************************************************************************/

always@(posedge i_sys_clk)begin
    if(!i_rst_n)begin
        data_rd_r <= 1'b0;
        data_in_r <= 'd0;
    end else if(lrck_div_r == P_LRCK_DIV_MAX)begin
        data_rd_r <= 1'b1;
        data_in_r <= data_in_tmp_r;
    end else begin
        data_rd_r <= 1'b0;
        data_in_r <= data_in_r;
    end
end

/********************************************************************************/
/**************************        数据锁存输出       ***************************/
/********************************************************************************/

always@(posedge i_sys_clk)begin
    if(!i_rst_n)begin
        data_out_tmp_r <= 'd0;
    end else if(lrck_2x_div_r == P_LRCK_2X_MAX)begin
        data_out_tmp_r <= data_in_r;
    end else begin
        data_out_tmp_r <= data_out_tmp_r;
    end
end

always@(posedge i_sys_clk)begin
    if(!i_rst_n)begin
        data_out_r <= 'd0;
    end else if(lrck_2x_div_r == P_LRCK_2X_MAX - 2)begin
        data_out_r <= data_out_tmp_r;
    end else begin
        data_out_r <= data_out_r;
    end
end

/********************************************************************************/
/**************************     16bit PISO MSB First  ***************************/
/********************************************************************************/

//在音频位时钟下降沿切换输出位，保证数据在BCK高电平期间稳定
always@(posedge i_sys_clk)begin
    if(!i_rst_n)begin
        sel_cnt_r <= 'd0;
    end else if(bck_r == 1'b0 && bck_div_r >= P_BCK_DIV_MAX)begin
        sel_cnt_r <= sel_cnt_r + 1'b1;
    end else begin
        sel_cnt_r <= sel_cnt_r;
    end
end

endmodule
