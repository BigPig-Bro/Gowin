//OV5640 1024x768 RGB565 初始化寄存器查找表
//数据格式：{器件地址16bit, 寄存器地址16bit, 寄存器数据8bit}，iic_top 按 LUT 输出的扩展标志自动截取
//220901    v1.0.0   初始版本
//260908    v1.1.0   改为同步逻辑(i_sys_clk 打拍)，端口加 i_/o_ 前缀，合并重复项 303→277
module lut_ov5640_rgb565_1024_768(
    input               i_sys_clk,           //查找表时钟
    input               i_rst_n,             //低有效复位
    input        [ 9:0] i_lut_index,         //查找表地址
    output logic [39:0] o_lut_data,          //器件地址、寄存器地址、寄存器数据
    output logic        o_iic_slave_addr_ex, //从机地址扩展：1 为 2 字节
    output logic        o_iic_slave_reg_ex   //寄存器地址扩展：1 为 2 字节
);

assign o_iic_slave_addr_ex = 1'b0; //OV5640 从机地址 1 字节
assign o_iic_slave_reg_ex  = 1'b1; //OV5640 寄存器地址 2 字节

localparam P_TSET_MODE = 8'h00; //测试图模式：00-OFF 80 84-8色条 82-多色交替方块 86 渐变测试
localparam P_VFLIP     = 8'h40; //上下翻转：40-OFF 46-ON
localparam P_MIRROR    = 8'h00; //左右镜像：00-OFF 06-ON

//图像分辨率（DVPHO/DVPVO）：默认 1024x768
localparam P_IMAGE_WIDTH  = 16'd1024;
localparam P_IMAGE_HEIGHT = 16'd768;

//1024x768下 FPS = ？
localparam P_PLL_DIV      = 8'd60; //PLL分频系数


always@(posedge i_sys_clk)begin
    if(!i_rst_n)begin
        o_lut_data <= 'd0;
    end else begin
        case(i_lut_index)
            10'd 0: o_lut_data <= {16'h0078, 16'h3103, 8'h11}; //system clock from pad, bit[1]
            10'd 1: o_lut_data <= {16'h0078, 16'h3008, 8'h82}; //software reset, bit[7]// delay 5ms
            10'd 2: o_lut_data <= {16'h0078, 16'h3008, 8'h42}; //software power down, bit[6]
            10'd 3: o_lut_data <= {16'h0078, 16'h3103, 8'h03}; //system clock from PLL, bit[1]
            10'd 4: o_lut_data <= {16'h0078, 16'h3017, 8'hFF}; //FREX, Vsync, HREF, PCLK, D[9:6] output enable
            10'd 5: o_lut_data <= {16'h0078, 16'h3018, 8'hFF}; //D[5:0], GPIO[1:0] output enable
            10'd 6: o_lut_data <= {16'h0078, 16'h3034, 8'h1A}; //MIPI 10-bit
            10'd 7: o_lut_data <= {16'h0078, 16'h3037, 8'h03}; //PLL root divider, bit[4], PLL pre-divider, bit[3:0]
            10'd 8: o_lut_data <= {16'h0078, 16'h3108, 8'h01}; //PCLK root divider, bit[5:4], SCLK2x root divider, bit[3:2] // SCLK root divider, bit[1:0]
            10'd 9: o_lut_data <= {16'h0078, 16'h3630, 8'h36};
            10'd 10: o_lut_data <= {16'h0078, 16'h3631, 8'h0E};
            10'd 11: o_lut_data <= {16'h0078, 16'h3632, 8'hE2};
            10'd 12: o_lut_data <= {16'h0078, 16'h3633, 8'h12};
            10'd 13: o_lut_data <= {16'h0078, 16'h3621, 8'hE0};
            10'd 14: o_lut_data <= {16'h0078, 16'h3704, 8'hA0};
            10'd 15: o_lut_data <= {16'h0078, 16'h3703, 8'h5A};
            10'd 16: o_lut_data <= {16'h0078, 16'h3715, 8'h78};
            10'd 17: o_lut_data <= {16'h0078, 16'h3717, 8'h01};
            10'd 18: o_lut_data <= {16'h0078, 16'h370B, 8'h60};
            10'd 19: o_lut_data <= {16'h0078, 16'h3705, 8'h1A};
            10'd 20: o_lut_data <= {16'h0078, 16'h3905, 8'h02};
            10'd 21: o_lut_data <= {16'h0078, 16'h3906, 8'h10};
            10'd 22: o_lut_data <= {16'h0078, 16'h3901, 8'h0A};
            10'd 23: o_lut_data <= {16'h0078, 16'h3731, 8'h12};
            10'd 24: o_lut_data <= {16'h0078, 16'h3600, 8'h08}; //VCM control
            10'd 25: o_lut_data <= {16'h0078, 16'h3601, 8'h33}; //VCM control
            10'd 26: o_lut_data <= {16'h0078, 16'h302D, 8'h60}; //system control
            10'd 27: o_lut_data <= {16'h0078, 16'h3620, 8'h52};
            10'd 28: o_lut_data <= {16'h0078, 16'h371B, 8'h20};
            10'd 29: o_lut_data <= {16'h0078, 16'h471C, 8'h50};
            10'd 30: o_lut_data <= {16'h0078, 16'h3A13, 8'h43}; //pre-gain = 1.047x
            10'd 31: o_lut_data <= {16'h0078, 16'h3A18, 8'h00}; //gain ceiling
            10'd 32: o_lut_data <= {16'h0078, 16'h3A19, 8'hF8}; //gain ceiling = 15.5x
            10'd 33: o_lut_data <= {16'h0078, 16'h3635, 8'h13};
            10'd 34: o_lut_data <= {16'h0078, 16'h3636, 8'h03};
            10'd 35: o_lut_data <= {16'h0078, 16'h3634, 8'h40};
            10'd 36: o_lut_data <= {16'h0078, 16'h3622, 8'h01}; //50/60Hz detection     50/60Hz 灯光条纹过滤
            10'd 37: o_lut_data <= {16'h0078, 16'h3C01, 8'h34}; //Band auto, bit[7]
            10'd 38: o_lut_data <= {16'h0078, 16'h3C04, 8'h28}; //threshold low sum
            10'd 39: o_lut_data <= {16'h0078, 16'h3C05, 8'h98}; //threshold high sum
            10'd 40: o_lut_data <= {16'h0078, 16'h3C06, 8'h00}; //light meter 1 threshold[15:8]
            10'd 41: o_lut_data <= {16'h0078, 16'h3C08, 8'h00}; //light meter 2 threshold[15:8]
            10'd 42: o_lut_data <= {16'h0078, 16'h3C09, 8'h1C}; //light meter 2 threshold[7:0]
            10'd 43: o_lut_data <= {16'h0078, 16'h3C0A, 8'h9C}; //sample number[15:8]
            10'd 44: o_lut_data <= {16'h0078, 16'h3C0B, 8'h40}; //sample number[7:0]
            10'd 45: o_lut_data <= {16'h0078, 16'h3810, 8'h00}; //Timing Hoffset[11:8]
            10'd 46: o_lut_data <= {16'h0078, 16'h3811, 8'h10}; //Timing Hoffset[7:0]
            10'd 47: o_lut_data <= {16'h0078, 16'h3812, 8'h00}; //Timing Voffset[10:8]
            10'd 48: o_lut_data <= {16'h0078, 16'h3708, 8'h64};
            10'd 49: o_lut_data <= {16'h0078, 16'h4001, 8'h02}; //BLC start from line 2
            10'd 50: o_lut_data <= {16'h0078, 16'h4005, 8'h1A}; //BLC always update
            10'd 51: o_lut_data <= {16'h0078, 16'h3000, 8'h00}; //enable blocks
            10'd 52: o_lut_data <= {16'h0078, 16'h3004, 8'hFF}; //enable clocks
            10'd 53: o_lut_data <= {16'h0078, 16'h300E, 8'h58}; //MIPI power down, DVP enable
            10'd 54: o_lut_data <= {16'h0078, 16'h302E, 8'h00};
            10'd 55: o_lut_data <= {16'h0078, 16'h4300, 8'h60}; //RGB565
            10'd 56: o_lut_data <= {16'h0078, 16'h501F, 8'h01}; //ISP RGB
            10'd 57: o_lut_data <= {16'h0078, 16'h440E, 8'h00};
            10'd 58: o_lut_data <= {16'h0078, 16'h5000, 8'hA7}; //Lenc on, raw gamma on, BPC on, WPC on, CIP on // AEC target    自动曝光控制
            10'd 59: o_lut_data <= {16'h0078, 16'h3A0F, 8'h30}; //stable range in high
            10'd 60: o_lut_data <= {16'h0078, 16'h3A10, 8'h28}; //stable range in low
            10'd 61: o_lut_data <= {16'h0078, 16'h3A1B, 8'h30}; //stable range out high
            10'd 62: o_lut_data <= {16'h0078, 16'h3A1E, 8'h26}; //stable range out low
            10'd 63: o_lut_data <= {16'h0078, 16'h3A11, 8'h60}; //fast zone high
            10'd 64: o_lut_data <= {16'h0078, 16'h3A1F, 8'h14}; //fast zone low// Lens correction for ?   镜头补偿
            10'd 65: o_lut_data <= {16'h0078, 16'h5800, 8'h23};
            10'd 66: o_lut_data <= {16'h0078, 16'h5801, 8'h14};
            10'd 67: o_lut_data <= {16'h0078, 16'h5802, 8'h0F};
            10'd 68: o_lut_data <= {16'h0078, 16'h5803, 8'h0F};
            10'd 69: o_lut_data <= {16'h0078, 16'h5804, 8'h12};
            10'd 70: o_lut_data <= {16'h0078, 16'h5805, 8'h26};
            10'd 71: o_lut_data <= {16'h0078, 16'h5806, 8'h0C};
            10'd 72: o_lut_data <= {16'h0078, 16'h5807, 8'h08};
            10'd 73: o_lut_data <= {16'h0078, 16'h5808, 8'h05};
            10'd 74: o_lut_data <= {16'h0078, 16'h5809, 8'h05};
            10'd 75: o_lut_data <= {16'h0078, 16'h580A, 8'h08};
            10'd 76: o_lut_data <= {16'h0078, 16'h580B, 8'h0D};
            10'd 77: o_lut_data <= {16'h0078, 16'h580C, 8'h08};
            10'd 78: o_lut_data <= {16'h0078, 16'h580D, 8'h03};
            10'd 79: o_lut_data <= {16'h0078, 16'h580E, 8'h00};
            10'd 80: o_lut_data <= {16'h0078, 16'h580F, 8'h00};
            10'd 81: o_lut_data <= {16'h0078, 16'h5810, 8'h03};
            10'd 82: o_lut_data <= {16'h0078, 16'h5811, 8'h09};
            10'd 83: o_lut_data <= {16'h0078, 16'h5812, 8'h07};
            10'd 84: o_lut_data <= {16'h0078, 16'h5813, 8'h03};
            10'd 85: o_lut_data <= {16'h0078, 16'h5814, 8'h00};
            10'd 86: o_lut_data <= {16'h0078, 16'h5815, 8'h01};
            10'd 87: o_lut_data <= {16'h0078, 16'h5816, 8'h03};
            10'd 88: o_lut_data <= {16'h0078, 16'h5817, 8'h08};
            10'd 89: o_lut_data <= {16'h0078, 16'h5818, 8'h0D};
            10'd 90: o_lut_data <= {16'h0078, 16'h5819, 8'h08};
            10'd 91: o_lut_data <= {16'h0078, 16'h581A, 8'h05};
            10'd 92: o_lut_data <= {16'h0078, 16'h581B, 8'h06};
            10'd 93: o_lut_data <= {16'h0078, 16'h581C, 8'h08};
            10'd 94: o_lut_data <= {16'h0078, 16'h581D, 8'h0E};
            10'd 95: o_lut_data <= {16'h0078, 16'h581E, 8'h29};
            10'd 96: o_lut_data <= {16'h0078, 16'h581F, 8'h17};
            10'd 97: o_lut_data <= {16'h0078, 16'h5820, 8'h11};
            10'd 98: o_lut_data <= {16'h0078, 16'h5821, 8'h11};
            10'd 99: o_lut_data <= {16'h0078, 16'h5822, 8'h15};
            10'd100: o_lut_data <= {16'h0078, 16'h5823, 8'h28};
            10'd101: o_lut_data <= {16'h0078, 16'h5824, 8'h46};
            10'd102: o_lut_data <= {16'h0078, 16'h5825, 8'h26};
            10'd103: o_lut_data <= {16'h0078, 16'h5826, 8'h08};
            10'd104: o_lut_data <= {16'h0078, 16'h5827, 8'h26};
            10'd105: o_lut_data <= {16'h0078, 16'h5828, 8'h64};
            10'd106: o_lut_data <= {16'h0078, 16'h5829, 8'h26};
            10'd107: o_lut_data <= {16'h0078, 16'h582A, 8'h24};
            10'd108: o_lut_data <= {16'h0078, 16'h582B, 8'h22};
            10'd109: o_lut_data <= {16'h0078, 16'h582C, 8'h24};
            10'd110: o_lut_data <= {16'h0078, 16'h582D, 8'h24};
            10'd111: o_lut_data <= {16'h0078, 16'h582E, 8'h06};
            10'd112: o_lut_data <= {16'h0078, 16'h582F, 8'h22};
            10'd113: o_lut_data <= {16'h0078, 16'h5830, 8'h40};
            10'd114: o_lut_data <= {16'h0078, 16'h5831, 8'h42};
            10'd115: o_lut_data <= {16'h0078, 16'h5832, 8'h24};
            10'd116: o_lut_data <= {16'h0078, 16'h5833, 8'h26};
            10'd117: o_lut_data <= {16'h0078, 16'h5834, 8'h24};
            10'd118: o_lut_data <= {16'h0078, 16'h5835, 8'h22};
            10'd119: o_lut_data <= {16'h0078, 16'h5836, 8'h22};
            10'd120: o_lut_data <= {16'h0078, 16'h5837, 8'h26};
            10'd121: o_lut_data <= {16'h0078, 16'h5838, 8'h44};
            10'd122: o_lut_data <= {16'h0078, 16'h5839, 8'h24};
            10'd123: o_lut_data <= {16'h0078, 16'h583A, 8'h26};
            10'd124: o_lut_data <= {16'h0078, 16'h583B, 8'h28};
            10'd125: o_lut_data <= {16'h0078, 16'h583C, 8'h42};
            10'd126: o_lut_data <= {16'h0078, 16'h583D, 8'hCE}; //lenc BR offset // AWB   自动白平衡
            10'd127: o_lut_data <= {16'h0078, 16'h5180, 8'hFF}; //AWB B block
            10'd128: o_lut_data <= {16'h0078, 16'h5181, 8'hF2}; //AWB control
            10'd129: o_lut_data <= {16'h0078, 16'h5182, 8'h00}; //[7:4] max local counter, [3:0] max fast counter
            10'd130: o_lut_data <= {16'h0078, 16'h5183, 8'h14}; //AWB advanced
            10'd131: o_lut_data <= {16'h0078, 16'h5184, 8'h25};
            10'd132: o_lut_data <= {16'h0078, 16'h5185, 8'h24};
            10'd133: o_lut_data <= {16'h0078, 16'h5186, 8'h09};
            10'd134: o_lut_data <= {16'h0078, 16'h5187, 8'h09};
            10'd135: o_lut_data <= {16'h0078, 16'h5188, 8'h09};
            10'd136: o_lut_data <= {16'h0078, 16'h5189, 8'h75};
            10'd137: o_lut_data <= {16'h0078, 16'h518A, 8'h54};
            10'd138: o_lut_data <= {16'h0078, 16'h518B, 8'hE0};
            10'd139: o_lut_data <= {16'h0078, 16'h518C, 8'hB2};
            10'd140: o_lut_data <= {16'h0078, 16'h518D, 8'h42};
            10'd141: o_lut_data <= {16'h0078, 16'h518E, 8'h3D};
            10'd142: o_lut_data <= {16'h0078, 16'h518F, 8'h56};
            10'd143: o_lut_data <= {16'h0078, 16'h5190, 8'h46};
            10'd144: o_lut_data <= {16'h0078, 16'h5191, 8'hF8}; //AWB top limit
            10'd145: o_lut_data <= {16'h0078, 16'h5192, 8'h04}; //AWB bottom limit
            10'd146: o_lut_data <= {16'h0078, 16'h5193, 8'h70}; //red limit
            10'd147: o_lut_data <= {16'h0078, 16'h5194, 8'hF0}; //green limit
            10'd148: o_lut_data <= {16'h0078, 16'h5195, 8'hF0}; //blue limit
            10'd149: o_lut_data <= {16'h0078, 16'h5196, 8'h03}; //AWB control
            10'd150: o_lut_data <= {16'h0078, 16'h5197, 8'h01}; //local limit
            10'd151: o_lut_data <= {16'h0078, 16'h5198, 8'h04};
            10'd152: o_lut_data <= {16'h0078, 16'h5199, 8'h12};
            10'd153: o_lut_data <= {16'h0078, 16'h519A, 8'h04};
            10'd154: o_lut_data <= {16'h0078, 16'h519B, 8'h00};
            10'd155: o_lut_data <= {16'h0078, 16'h519C, 8'h06};
            10'd156: o_lut_data <= {16'h0078, 16'h519D, 8'h82};
            10'd157: o_lut_data <= {16'h0078, 16'h519E, 8'h38}; //AWB control // Gamma    伽玛曲线
            10'd158: o_lut_data <= {16'h0078, 16'h5480, 8'h01}; //Gamma bias plus on, bit[0]
            10'd159: o_lut_data <= {16'h0078, 16'h5481, 8'h08};
            10'd160: o_lut_data <= {16'h0078, 16'h5482, 8'h14};
            10'd161: o_lut_data <= {16'h0078, 16'h5483, 8'h28};
            10'd162: o_lut_data <= {16'h0078, 16'h5484, 8'h51};
            10'd163: o_lut_data <= {16'h0078, 16'h5485, 8'h65};
            10'd164: o_lut_data <= {16'h0078, 16'h5486, 8'h71};
            10'd165: o_lut_data <= {16'h0078, 16'h5487, 8'h7D};
            10'd166: o_lut_data <= {16'h0078, 16'h5488, 8'h87};
            10'd167: o_lut_data <= {16'h0078, 16'h5489, 8'h91};
            10'd168: o_lut_data <= {16'h0078, 16'h548A, 8'h9A};
            10'd169: o_lut_data <= {16'h0078, 16'h548B, 8'hAA};
            10'd170: o_lut_data <= {16'h0078, 16'h548C, 8'hB8};
            10'd171: o_lut_data <= {16'h0078, 16'h548D, 8'hCD};
            10'd172: o_lut_data <= {16'h0078, 16'h548E, 8'hDD};
            10'd173: o_lut_data <= {16'h0078, 16'h548F, 8'hEA};
            10'd174: o_lut_data <= {16'h0078, 16'h5490, 8'h1D}; //color matrix   色彩矩阵
            10'd175: o_lut_data <= {16'h0078, 16'h5381, 8'h1E}; //CMX1 for Y
            10'd176: o_lut_data <= {16'h0078, 16'h5382, 8'h5B}; //CMX2 for Y
            10'd177: o_lut_data <= {16'h0078, 16'h5383, 8'h08}; //CMX3 for Y
            10'd178: o_lut_data <= {16'h0078, 16'h5384, 8'h0A}; //CMX4 for U
            10'd179: o_lut_data <= {16'h0078, 16'h5385, 8'h7E}; //CMX5 for U
            10'd180: o_lut_data <= {16'h0078, 16'h5386, 8'h88}; //CMX6 for U
            10'd181: o_lut_data <= {16'h0078, 16'h5387, 8'h7C}; //CMX7 for V
            10'd182: o_lut_data <= {16'h0078, 16'h5388, 8'h6C}; //CMX8 for V
            10'd183: o_lut_data <= {16'h0078, 16'h5389, 8'h10}; //CMX9 for V
            10'd184: o_lut_data <= {16'h0078, 16'h538A, 8'h01}; //sign[9]
            10'd185: o_lut_data <= {16'h0078, 16'h538B, 8'h98}; //sign[8:1] // UV adjust   UV色彩饱和度调整
            10'd186: o_lut_data <= {16'h0078, 16'h5580, 8'h06}; //saturation on, bit[1]
            10'd187: o_lut_data <= {16'h0078, 16'h5583, 8'h40};
            10'd188: o_lut_data <= {16'h0078, 16'h5584, 8'h10};
            10'd189: o_lut_data <= {16'h0078, 16'h5589, 8'h10};
            10'd190: o_lut_data <= {16'h0078, 16'h558A, 8'h00};
            10'd191: o_lut_data <= {16'h0078, 16'h558B, 8'hF8};
            10'd192: o_lut_data <= {16'h0078, 16'h501D, 8'h40}; //enable manual offset of contrast// CIP  锐化和降噪
            10'd193: o_lut_data <= {16'h0078, 16'h5300, 8'h08}; //CIP sharpen MT threshold 1
            10'd194: o_lut_data <= {16'h0078, 16'h5301, 8'h30}; //CIP sharpen MT threshold 2
            10'd195: o_lut_data <= {16'h0078, 16'h5302, 8'h10}; //CIP sharpen MT offset 1
            10'd196: o_lut_data <= {16'h0078, 16'h5303, 8'h00}; //CIP sharpen MT offset 2
            10'd197: o_lut_data <= {16'h0078, 16'h5304, 8'h08}; //CIP DNS threshold 1
            10'd198: o_lut_data <= {16'h0078, 16'h5305, 8'h30}; //CIP DNS threshold 2
            10'd199: o_lut_data <= {16'h0078, 16'h5306, 8'h08}; //CIP DNS offset 1
            10'd200: o_lut_data <= {16'h0078, 16'h5307, 8'h16}; //CIP DNS offset 2
            10'd201: o_lut_data <= {16'h0078, 16'h5309, 8'h08}; //CIP sharpen TH threshold 1
            10'd202: o_lut_data <= {16'h0078, 16'h530A, 8'h30}; //CIP sharpen TH threshold 2
            10'd203: o_lut_data <= {16'h0078, 16'h530B, 8'h04}; //CIP sharpen TH offset 1
            10'd204: o_lut_data <= {16'h0078, 16'h530C, 8'h06}; //CIP sharpen TH offset 2
            10'd205: o_lut_data <= {16'h0078, 16'h5025, 8'h00};
            10'd206: o_lut_data <= {16'h0078, 16'h3008, 8'h02}; //wake up from standby, bit[6]
            10'd207: o_lut_data <= {16'h0078, 16'h3C07, 8'h08}; //light meter 1 threshold [7:0]
            10'd208: o_lut_data <= {16'h0078, 16'h3A02, 8'h17}; //60Hz max exposure, night mode 5fps
            10'd209: o_lut_data <= {16'h0078, 16'h3A03, 8'h10}; //60Hz max exposure // banding filters are calculated automatically in camera driver
            10'd210: o_lut_data <= {16'h0078, 16'h3A14, 8'h17}; //50Hz max exposure, night mode 5fps
            10'd211: o_lut_data <= {16'h0078, 16'h3A15, 8'h10}; //50Hz max exposure
            10'd212: o_lut_data <= {16'h0078, 16'h460B, 8'h35};
            10'd213: o_lut_data <= {16'h0078, 16'h460C, 8'h22};
            10'd214: o_lut_data <= {16'h0078, 16'h5001, 8'hA3}; //SDE on, scale on, UV average off, color matrix on, AWB on
            10'd215: o_lut_data <= {16'h0078, 16'h3035, 8'h21}; //PLL     input clock =24Mhz
            10'd216: o_lut_data <= {16'h0078, 16'h3036, P_PLL_DIV}; //PLL 4-127任意整数 128-252任意偶数
            10'd217: o_lut_data <= {16'h0078, 16'h3C07, 8'h07}; //lightmeter 1 threshold[7:0]
            10'd218: o_lut_data <= {16'h0078, 16'h3820, P_VFLIP}; //flip
            10'd219: o_lut_data <= {16'h0078, 16'h3821, P_MIRROR};   //mirror
            10'd220: o_lut_data <= {16'h0078, 16'h3814, 8'h31}; //timing X inc
            10'd221: o_lut_data <= {16'h0078, 16'h3815, 8'h31}; //timing Y inc
            10'd222: o_lut_data <= {16'h0078, 16'h3800, 8'h00}; //HS
            10'd223: o_lut_data <= {16'h0078, 16'h3801, 8'h00}; //HS
            10'd224: o_lut_data <= {16'h0078, 16'h3802, 8'h00}; //VS
            10'd225: o_lut_data <= {16'h0078, 16'h3803, 8'h04}; //VS
            10'd226: o_lut_data <= {16'h0078, 16'h3804, 8'h0A}; //HW (HE)
            10'd227: o_lut_data <= {16'h0078, 16'h3805, 8'h3F}; //HW (HE)
            10'd228: o_lut_data <= {16'h0078, 16'h3806, 8'h07}; //VH (VE)
            10'd229: o_lut_data <= {16'h0078, 16'h3807, 8'h9F}; //VH (VE)
            10'd230: o_lut_data <= {16'h0078, 16'h3808, P_IMAGE_WIDTH[15:8]}; // DVPHO
            10'd231: o_lut_data <= {16'h0078, 16'h3809, P_IMAGE_WIDTH[ 7:0]}; // DVPHO
            10'd232: o_lut_data <= {16'h0078, 16'h380A, P_IMAGE_HEIGHT[15:8]}; // DVPVO
            10'd233: o_lut_data <= {16'h0078, 16'h380B, P_IMAGE_HEIGHT[ 7:0]}; // DVPVO
            10'd234: o_lut_data <= {16'h0078, 16'h380C, 8'h05}; //HTS
            10'd235: o_lut_data <= {16'h0078, 16'h380D, 8'hF0}; //HTS
            10'd236: o_lut_data <= {16'h0078, 16'h380E, 8'h03}; //VTS
            10'd237: o_lut_data <= {16'h0078, 16'h380F, 8'hE0}; //VTS
            10'd238: o_lut_data <= {16'h0078, 16'h3813, 8'h04}; //timing V offset
            10'd239: o_lut_data <= {16'h0078, 16'h3618, 8'h00};
            10'd240: o_lut_data <= {16'h0078, 16'h3612, 8'h29};
            10'd241: o_lut_data <= {16'h0078, 16'h3709, 8'h52};
            10'd242: o_lut_data <= {16'h0078, 16'h370C, 8'h03};
            10'd243: o_lut_data <= {16'h0078, 16'h3A02, 8'h02}; //60Hz max exposure
            10'd244: o_lut_data <= {16'h0078, 16'h3A03, 8'hE0}; //60Hz max exposure
            10'd245: o_lut_data <= {16'h0078, 16'h3A08, 8'h00}; //B50 step
            10'd246: o_lut_data <= {16'h0078, 16'h3A09, 8'h6F}; //B50 step
            10'd247: o_lut_data <= {16'h0078, 16'h3A0A, 8'h00}; //B60 step
            10'd248: o_lut_data <= {16'h0078, 16'h3A0B, 8'h5C}; //B60 step
            10'd249: o_lut_data <= {16'h0078, 16'h3A0E, 8'h06}; //50Hz max band
            10'd250: o_lut_data <= {16'h0078, 16'h3A0D, 8'h08}; //60Hz max band
            10'd251: o_lut_data <= {16'h0078, 16'h3A14, 8'h02}; //50Hz max exposure
            10'd252: o_lut_data <= {16'h0078, 16'h3A15, 8'hE0}; //50Hz max exposure
            10'd253: o_lut_data <= {16'h0078, 16'h4004, 8'h02}; //BLC line number
            10'd254: o_lut_data <= {16'h0078, 16'h3002, 8'h1C}; //reset JFIFO, SFIFO, JPG
            10'd255: o_lut_data <= {16'h0078, 16'h3006, 8'hC3}; //disable clock of JPEG2x, JPEG
            10'd256: o_lut_data <= {16'h0078, 16'h4713, 8'h03}; //JPEG mode 3
            10'd257: o_lut_data <= {16'h0078, 16'h4407, 8'h04}; //Quantization sacle
            10'd258: o_lut_data <= {16'h0078, 16'h3503, 8'h00}; //AEC/AGC on
            10'd259: o_lut_data <= {16'h0078, 16'h3016, 8'h02}; //Strobe output enable
            10'd260: o_lut_data <= {16'h0078, 16'h3B07, 8'h0A}; //FREX strobe mode1
            10'd261: o_lut_data <= {16'h0078, 16'h3B00, 8'h83}; //STROBE CTRL: strobe request ON, Strobe mode: LED3
            10'd262: o_lut_data <= {16'h0078, 16'h3B00, 8'h00}; //STROBE CTRL: strobe request OFF
            10'd263: o_lut_data <= {16'h0078, 16'h503D, P_TSET_MODE}; //测试图模式
            default: o_lut_data <= {16'h00FF, 16'hFFFF, 8'hFF}; //结束标志
        endcase
    end
end

endmodule
