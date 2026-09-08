//OV5640 摄像头 DDR3 帧缓存 1024x768 HDMI 显示 顶层
//220901    v1.0.0   初始版本
//260908    v1.1.0   端口按 Coder 规范重命名(i_/o_/io_)并同步 CST/SDC，合并多余 define，显示延时链改同步复位
module top(
    input                  i_clk_27m,     //系统时钟 27MHz
    input                  i_rst_n,       //低有效复位
    output                 o_cmos_scl,    //cmos i2c clock
    inout                  io_cmos_sda,   //cmos i2c data
    input                  i_cmos_vsync,  //cmos vsync
    input                  i_cmos_href,   //cmos hsync refrence,data valid
    input                  i_cmos_pclk,   //cmos pixel clock
    input        [ 7:0]    i_cmos_db,     //cmos data
    output                 o_cmos_rst_n,  //cmos reset
    output                 o_cmos_pwdn,   //cmos power down

    output       [ 3:0]    o_state_led,   //状态指示灯

    output       [13:0]    o_ddr_addr,    //ROW_WIDTH=14
    output       [ 2:0]    o_ddr_bank,    //BANK_WIDTH=3
    output                 o_ddr_cs,
    output                 o_ddr_ras,
    output                 o_ddr_cas,
    output                 o_ddr_we,
    output                 o_ddr_ck,
    output                 o_ddr_ck_n,
    output                 o_ddr_cke,
    output                 o_ddr_odt,
    output                 o_ddr_reset_n,
    output       [ 1:0]    o_ddr_dm,      //DM_WIDTH=2
    inout        [15:0]    io_ddr_dq,     //DQ_WIDTH=16
    inout        [ 1:0]    io_ddr_dqs,    //DQS_WIDTH=2
    inout        [ 1:0]    io_ddr_dqs_n,  //DQS_WIDTH=2

    output                 o_tmds_clk_p,  //TMDS 时钟+
    output                 o_tmds_clk_n,  //TMDS 时钟-
    output       [ 2:0]    o_tmds_data_p, //TMDS 数据+ {r,g,b}
    output       [ 2:0]    o_tmds_data_n  //TMDS 数据- {r,g,b}
);

//===============================================================
//根据 IP 参数选择
`define    USE_THREE_FRAME_BUFFER

//内存接口参数
parameter ADDR_WIDTH     = 28;   //存储单元是 byte，总容量=2^27*16bit=2Gbit
parameter DATA_WIDTH     = 128;  //与生成 DDR3IP 有关，此 DDR3 2Gbit, x16, 时钟比例 1:4, 固定 128bit
parameter RD_VIDEO_WIDTH = 16;

//memory interface
wire                    memory_clk;
wire                    dma_clk;
wire                    DDR_pll_lock;
wire                    cmd_ready;
wire        [2:0]       cmd;
wire                    cmd_en;
wire        [5:0]       app_burst_number;
wire        [ADDR_WIDTH-1:0]      addr;
wire                    wr_data_rdy;
wire                    wr_data_en;
wire                    wr_data_end;
wire        [DATA_WIDTH-1:0]      wr_data;
wire        [DATA_WIDTH/8-1:0]    wr_data_mask;
wire                    rd_data_valid;
wire                    rd_data_end;
wire        [DATA_WIDTH-1:0]      rd_data;
wire                    init_calib_complete;

wire video_clk;//video pixel clock

//syn_code
wire                    syn_off0_vs;
wire                    syn_off0_hs;
wire                    off0_syn_de;
wire        [RD_VIDEO_WIDTH-1:0]  off0_syn_data;

wire        [15:0]      cmos_16bit_data;
wire                    cmos_16bit_clk;
wire                    cmos_16bit_wr;
wire        [15:0]      write_data;

//状态指示灯
reg [4:0] lcd_vs_cnt;
reg [4:0] cam_vs_cnt;

assign o_cmos_pwdn  = 1'b0;
assign o_cmos_rst_n = 1'b1;

assign o_state_led[3] = cam_vs_cnt[4];        //5640 工作
assign o_state_led[2] = lcd_vs_cnt[4];        //显示工作
assign o_state_led[1] = i_rst_n;                //复位指示灯
assign o_state_led[0] = init_calib_complete;  //DDR3 初始化指示灯

always@(posedge lcd_vs)begin
    lcd_vs_cnt <= lcd_vs_cnt + 1;
end

always@(posedge i_cmos_vsync)begin
    cam_vs_cnt <= cam_vs_cnt + 1;
end

/********************************************************************************/
/**************************     DRAM 控制器时钟       ****************************/
/********************************************************************************/
//生成  DRAM 控制器时钟
mem_pll mem_pll_m0(
    .clkin  (i_clk_27m       ),
    .clkout (memory_clk      ),
    .lock   (DDR_pll_lock    )
);

/********************************************************************************/
/**************************    IIC 初始化(OV5640)    *****************************/
/********************************************************************************/
//IIC 上电复位：boot_rst 提供复位脉冲
wire iic_rst_n;
boot_rst boot_rst_m0(
    .i_clk   (video_clk    ),
    .i_rst_n (i_rst_n      ),
    .o_rst_n (iic_rst_n    )
);

//I2C master 控制器，按 LUT 表配置 OV5640 寄存器
iic_top #(
    .CLK_FRE           (27        ),
    .IIC_FRE           (100       ),
    .IIC_SLAVE_REG_EX  (1         ),
    .IIC_SLAVE_ADDR_EX (0         ),
    .IIC_SLAVE_ADDR    (16'h78    )
) iic_top_m0(
    .i_sys_clk   (i_clk_27m      ),
    .i_rst_n     (iic_rst_n      ),
    .o_iic_scl   (o_cmos_scl     ),
    .io_iic_sda  (io_cmos_sda    ),
    .o_iic_done  (               ),
    .o_iic_error (               )
);

/********************************************************************************/
/**************************    CMOS 数据 8bit→16bit  *****************************/
/********************************************************************************/
cmos_8_16bit cmos_8_16bit_m0(
    .i_sys_clk (i_cmos_pclk        ),
    .i_rst_n   (i_rst_n            ),
    .i_pdata   (i_cmos_db          ),
    .i_de      (i_cmos_href        ),
    .o_pdata   (cmos_16bit_data    ),
    .o_hblank  (cmos_16bit_wr      ),
    .o_de      (cmos_16bit_clk     )
);

/********************************************************************************/
/**************************    显示时序 rgb_timing     ***************************/
/********************************************************************************/
wire out_de;
rgb_timing #(
    .P_RGB_MODE (3    )   //3: 1024x768 @60Hz
) rgb_timing_m0(
    .i_sys_clk (video_clk      ),
    .i_rst_n   (i_rst_n        ),
    .o_rgb_hs  (syn_off0_hs    ),
    .o_rgb_vs  (syn_off0_vs    ),
    .o_rgb_de  (out_de         ),
    .o_rgb_x   (               ),
    .o_rgb_y   (               )
);

/********************************************************************************/
/**************************    DDR3 视频帧缓存        ****************************/
/********************************************************************************/
assign write_data = {cmos_16bit_data[4:0], cmos_16bit_data[10:5], cmos_16bit_data[15:11]};
Video_Frame_Buffer_Top Video_Frame_Buffer_Top_m0
(
    .I_rst_n               (init_calib_complete    ),
    .I_dma_clk             (dma_clk                ),
`ifdef USE_THREE_FRAME_BUFFER
    .I_wr_halt             (1'd0                   ),//1:halt, 0:no halt
    .I_rd_halt             (1'd0                   ),//1:halt, 0:no halt
`endif
    //video data input
    .I_vin0_clk            (cmos_16bit_clk         ),
    .I_vin0_vs_n           (~i_cmos_vsync          ),//只接收负极性
    .I_vin0_de             (cmos_16bit_wr          ),
    .I_vin0_data           (write_data             ),
    .O_vin0_fifo_full      (                       ),

    //video data output
    .I_vout0_clk           (video_clk              ),
    .I_vout0_vs_n          (syn_off0_vs            ),//只接收负极性
    .I_vout0_de            (out_de                 ),
    .O_vout0_den           (off0_syn_de            ),
    .O_vout0_data          (off0_syn_data          ),
    .O_vout0_fifo_empty    (                       ),

    //ddr write request
    .I_cmd_ready           (cmd_ready              ),
    .O_cmd                 (cmd                    ),//0:write; 1:read
    .O_cmd_en              (cmd_en                 ),
    .O_app_burst_number    (app_burst_number       ),
    .O_addr                (addr                   ),//[ADDR_WIDTH-1:0]
    .I_wr_data_rdy         (wr_data_rdy            ),
    .O_wr_data_en          (wr_data_en             ),
    .O_wr_data_end         (wr_data_end            ),
    .O_wr_data             (wr_data                ),//[DATA_WIDTH-1:0]
    .O_wr_data_mask        (wr_data_mask           ),
    .I_rd_data_valid       (rd_data_valid          ),
    .I_rd_data_end         (rd_data_end            ),//unused
    .I_rd_data             (rd_data                ),//[DATA_WIDTH-1:0]
    .I_init_calib_complete (init_calib_complete    )
);

/********************************************************************************/
/**************************    显示输出延时 N 拍      ****************************/
/********************************************************************************/
localparam N = 7;//delay N clocks

reg  [N-1:0] Pout_hs_dn;
reg  [N-1:0] Pout_vs_dn;
reg  [N-1:0] Pout_de_dn;

always@(posedge video_clk)begin
    if(!i_rst_n)begin
        Pout_hs_dn <= {N{1'b1}};
        Pout_vs_dn <= {N{1'b1}};
        Pout_de_dn <= {N{1'b0}};
    end else begin
        Pout_hs_dn <= {Pout_hs_dn[N-2:0], syn_off0_hs};
        Pout_vs_dn <= {Pout_vs_dn[N-2:0], syn_off0_vs};
        Pout_de_dn <= {Pout_de_dn[N-2:0], out_de};
    end
end

wire [4:0] lcd_r, lcd_b;
wire [5:0] lcd_g;
wire lcd_vs, lcd_de, lcd_hs, lcd_dclk;

assign {lcd_r, lcd_g, lcd_b} = off0_syn_de ? off0_syn_data[15:0] : 16'h0000;//{r,g,b}
assign lcd_vs   = Pout_vs_dn[4];
assign lcd_hs   = Pout_hs_dn[4];
assign lcd_de   = Pout_de_dn[4];
assign lcd_dclk = video_clk;

/********************************************************************************/
/**************************    DDR3 内存接口          ****************************/
/********************************************************************************/
DDR3MI DDR3MI_m0
(
    .clk                 (video_clk              ),
    .memory_clk          (memory_clk             ),
    .pll_lock            (DDR_pll_lock           ),
    .rst_n               (i_rst_n                ),//i_rst_n
    .app_burst_number    (app_burst_number       ),
    .cmd_ready           (cmd_ready              ),
    .cmd                 (cmd                    ),
    .cmd_en              (cmd_en                 ),
    .addr                (addr                   ),
    .wr_data_rdy         (wr_data_rdy            ),
    .wr_data             (wr_data                ),
    .wr_data_en          (wr_data_en             ),
    .wr_data_end         (wr_data_end            ),
    .wr_data_mask        (wr_data_mask           ),
    .rd_data             (rd_data                ),
    .rd_data_valid       (rd_data_valid          ),
    .rd_data_end         (rd_data_end            ),
    .sr_req              (1'b0                   ),
    .ref_req             (1'b0                   ),
    .sr_ack              (                       ),
    .ref_ack             (                       ),
    .init_calib_complete (init_calib_complete    ),
    .clk_out             (dma_clk                ),
    .burst               (1'b1                   ),
    //mem interface
    .ddr_rst             (                       ),
    .O_ddr_addr          (o_ddr_addr             ),
    .O_ddr_ba            (o_ddr_bank             ),
    .O_ddr_cs_n          (o_ddr_cs               ),
    .O_ddr_ras_n         (o_ddr_ras              ),
    .O_ddr_cas_n         (o_ddr_cas              ),
    .O_ddr_we_n          (o_ddr_we               ),
    .O_ddr_clk           (o_ddr_ck               ),
    .O_ddr_clk_n         (o_ddr_ck_n             ),
    .O_ddr_cke           (o_ddr_cke              ),
    .O_ddr_odt           (o_ddr_odt              ),
    .O_ddr_reset_n       (o_ddr_reset_n          ),
    .O_ddr_dqm           (o_ddr_dm               ),
    .IO_ddr_dq           (io_ddr_dq              ),
    .IO_ddr_dqs          (io_ddr_dqs             ),
    .IO_ddr_dqs_n        (io_ddr_dqs_n           )
);

/********************************************************************************/
/**************************    TMDS TX(HDMI)         *****************************/
/********************************************************************************/
//RGB 时钟生成：x5 串行时钟 + x1 像素时钟
wire serial_clk;
wire hdmi4_rst_n;

rgb_clk_gen rgb_clk_gen_m0(
    .i_clk         (i_clk_27m      ),
    .i_rst_n       (i_rst_n        ),
    .o_rgb_clk     (video_clk      ),
    .o_rgb_clk_x5  (serial_clk     ),
    .o_hdmi4_rst_n (hdmi4_rst_n    )
);

DVI_TX_Top DVI_TX_Top_m0
(
    .I_rst_n       (hdmi4_rst_n      ),//asynchronous reset, low active
    .I_serial_clk  (serial_clk       ),
    .I_rgb_clk     (lcd_dclk         ),//pixel clock
    .I_rgb_vs      (lcd_vs           ),
    .I_rgb_hs      (lcd_hs           ),
    .I_rgb_de      (lcd_de           ),
    .I_rgb_r       ({lcd_r, 3'd0}    ),
    .I_rgb_g       ({lcd_g, 2'd0}    ),
    .I_rgb_b       ({lcd_b, 3'd0}    ),
    .O_tmds_clk_p  (o_tmds_clk_p     ),
    .O_tmds_clk_n  (o_tmds_clk_n     ),
    .O_tmds_data_p (o_tmds_data_p    ),//{r,g,b}
    .O_tmds_data_n (o_tmds_data_n    )
);

endmodule
