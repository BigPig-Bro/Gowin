// RGB 时序生成模块，按参数选择分辨率，HS/VS/DE/XY 两级寄存器打拍输出
//260906    v1.0.0   按Coder规范整理

module rgb_timing #(
    parameter P_RGB_MODE = 4    //分辨率选择，0~7
)(
    input               i_sys_clk,     //像素时钟
    input               i_rst_n,       //复位信号，低有效

    output logic        o_rgb_hs,      //水平同步
    output logic        o_rgb_vs,      //垂直同步
    output logic        o_rgb_de,      //数据有效

    output logic [15:0] o_rgb_x,       //视频X坐标，第一个有效像素从0开始
    output logic [15:0] o_rgb_y        //视频Y坐标，第一个有效行从0开始
);

/********************************************************************************/
/**************************    分辨率时序参数    ********************************/
/********************************************************************************/

logic [15:0] h_active, h_fp, h_sync, h_bp;  //水平有效/前沿/同步/后沿
logic [15:0] v_active, v_fp, v_sync, v_bp;  //垂直有效/前沿/同步/后沿
logic        hs_pol, vs_pol;                //同步极性，1正极性

rgb_timing_cfg #(
    .P_RGB_MODE (P_RGB_MODE)
) rgb_timing_cfg_m0 (
    .o_h_active (h_active),
    .o_h_fp     (h_fp    ),
    .o_h_sync   (h_sync  ),
    .o_h_bp     (h_bp    ),

    .o_v_active (v_active),
    .o_v_fp     (v_fp    ),
    .o_v_sync   (v_sync  ),
    .o_v_bp     (v_bp    ),

    .o_hs_pol   (hs_pol  ),
    .o_vs_pol   (vs_pol  )
);

/********************************************************************************/
/**************************      行场总像素/总行数    ***************************/
/********************************************************************************/

logic [15:0] h_total, v_total;   //水平总像素/垂直总行数

assign h_total = h_active + h_fp + h_sync + h_bp;
assign v_total = v_active + v_fp + v_sync + v_bp;

/********************************************************************************/
/**************************        内部信号        ********************************/
/********************************************************************************/

logic [15:0] h_cnt, v_cnt;       //水平/垂直计数器
logic        hs_d, vs_d;         //同步第一级打拍
logic        h_de, v_de;         //数据有效第一级打拍
logic [15:0] x_d, y_d;           //坐标第一级打拍，从0开始
logic        rgb_hs, rgb_vs, rgb_de;  //第二级打拍：同步/数据有效
logic [15:0] rgb_x, rgb_y;       //第二级打拍：坐标

/********************************************************************************/
/**************************        行场时序生成        ***************************/
/********************************************************************************/

always@(posedge i_sys_clk)begin
    if(!i_rst_n)begin
        h_cnt <= 16'd0;
        v_cnt <= 16'd0;
        hs_d  <= 1'b0;
        vs_d  <= 1'b0;
        h_de  <= 1'b0;
        v_de  <= 1'b0;
        x_d   <= 16'd0;
        y_d   <= 16'd0;
    end else begin
        //水平同步：位于前沿之后、后沿之前
        if((h_cnt >= h_fp) && (h_cnt < h_fp + h_sync))begin
            hs_d <= hs_pol;
        end else begin
            hs_d <= ~hs_pol;
        end

        //垂直同步：位于垂直前沿之后、垂直后沿之前
        if((v_cnt >= v_fp) && (v_cnt < v_fp + v_sync))begin
            vs_d <= vs_pol;
        end else begin
            vs_d <= ~vs_pol;
        end

        //水平数据有效
        h_de <= (h_cnt >= h_fp + h_sync + h_bp) &&
                (h_cnt <  h_fp + h_sync + h_bp + h_active);

        //垂直数据有效
        v_de <= (v_cnt >= v_fp + v_sync + v_bp) &&
                (v_cnt <  v_fp + v_sync + v_bp + v_active);

        //X坐标：第一个有效像素为0，随后逐像素加1
        if((h_cnt >= h_fp + h_sync + h_bp) &&
           (h_cnt <  h_fp + h_sync + h_bp + h_active))begin
            x_d <= h_cnt - (h_fp + h_sync + h_bp);
        end else begin
            x_d <= 16'd0;
        end

        //Y坐标：第一个有效行为0，随后逐行加1
        if((v_cnt >= v_fp + v_sync + v_bp) &&
           (v_cnt <  v_fp + v_sync + v_bp + v_active))begin
            y_d <= v_cnt - (v_fp + v_sync + v_bp);
        end else begin
            y_d <= 16'd0;
        end

        //水平计数器
        if(h_cnt == h_total - 16'd1)begin
            h_cnt <= 16'd0;
            //垂直计数器
            if(v_cnt == v_total - 16'd1)begin
                v_cnt <= 16'd0;
            end else begin
                v_cnt <= v_cnt + 16'd1;
            end
        end else begin
            h_cnt <= h_cnt + 16'd1;
        end
    end
end

/********************************************************************************/
/**************************        输出两级打拍        ***************************/
/********************************************************************************/

always@(posedge i_sys_clk)begin
    if(!i_rst_n)begin
        rgb_hs   <= 1'b0;
        rgb_vs   <= 1'b0;
        rgb_de   <= 1'b0;
        rgb_x    <= 16'd0;
        rgb_y    <= 16'd0;
        o_rgb_hs <= 1'b0;
        o_rgb_vs <= 1'b0;
        o_rgb_de <= 1'b0;
        o_rgb_x  <= 16'd0;
        o_rgb_y  <= 16'd0;
    end else begin
        rgb_hs   <= hs_d;
        rgb_vs   <= vs_d;
        rgb_de   <= h_de & v_de;
        rgb_x    <= x_d;
        rgb_y    <= y_d;

        o_rgb_hs <= rgb_hs;
        o_rgb_vs <= rgb_vs;
        o_rgb_de <= rgb_de;
        o_rgb_x  <= rgb_x;
        o_rgb_y  <= rgb_y;
    end
end

endmodule

/********************************************************************************/
/**************************    分辨率时序参数译码    *****************************/
/********************************************************************************/

module rgb_timing_cfg #(
    parameter P_RGB_MODE = 4    //分辨率选择，0~7
)(
    output logic [15:0] o_h_active,   //水平有效像素
    output logic [15:0] o_h_fp,       //水平前沿
    output logic [15:0] o_h_sync,     //水平同步
    output logic [15:0] o_h_bp,       //水平后沿

    output logic [15:0] o_v_active,   //垂直有效行数
    output logic [15:0] o_v_fp,       //垂直前沿
    output logic [15:0] o_v_sync,     //垂直同步
    output logic [15:0] o_v_bp,       //垂直后沿

    output logic        o_hs_pol,     //水平同步极性，1正极性
    output logic        o_vs_pol      //垂直同步极性，1正极性
);

//仅本文件内部使用的分辨率选择常量，按横向分辨率从小到大排列
localparam RES_480_272   = 4'd0;   //0: 480x272 @60Hz 9MHz
localparam RES_640_480   = 4'd1;   //1: 640x480 @60Hz 25.175MHz
localparam RES_800_480   = 4'd2;   //2: 800x480 @60Hz 33MHz
localparam RES_1024_768  = 4'd3;   //3: 1024x768 @60Hz 65MHz
localparam RES_1280_720  = 4'd4;   //4: 1280x720 @60Hz 74.25MHz
localparam RES_1920_1080 = 4'd5;   //5: 1920x1080 @60Hz 148.5MHz
localparam RES_2560_1440 = 4'd6;   //6: 2560x1440 @60Hz 241.5MHz
localparam RES_3840_2160 = 4'd7;   //7: 3840x2160 @60Hz 594MHz

always@(*)begin
    case(P_RGB_MODE)
        //0: 480x272
        RES_480_272:begin
            o_h_active = 16'd480;
            o_h_fp     = 16'd2;
            o_h_sync   = 16'd41;
            o_h_bp     = 16'd2;
            o_v_active = 16'd272;
            o_v_fp     = 16'd2;
            o_v_sync   = 16'd10;
            o_v_bp     = 16'd2;
            o_hs_pol   = 1'b0;
            o_vs_pol   = 1'b0;
        end

        //1: 640x480
        RES_640_480:begin
            o_h_active = 16'd640;
            o_h_fp     = 16'd16;
            o_h_sync   = 16'd96;
            o_h_bp     = 16'd48;
            o_v_active = 16'd480;
            o_v_fp     = 16'd10;
            o_v_sync   = 16'd2;
            o_v_bp     = 16'd33;
            o_hs_pol   = 1'b0;
            o_vs_pol   = 1'b0;
        end

        //2: 800x480
        RES_800_480:begin
            o_h_active = 16'd800;
            o_h_fp     = 16'd40;
            o_h_sync   = 16'd128;
            o_h_bp     = 16'd88;
            o_v_active = 16'd480;
            o_v_fp     = 16'd13;
            o_v_sync   = 16'd2;
            o_v_bp     = 16'd31;
            o_hs_pol   = 1'b0;
            o_vs_pol   = 1'b0;
        end

        //3: 1024x768
        RES_1024_768:begin
            o_h_active = 16'd1024;
            o_h_fp     = 16'd24;
            o_h_sync   = 16'd136;
            o_h_bp     = 16'd160;
            o_v_active = 16'd768;
            o_v_fp     = 16'd3;
            o_v_sync   = 16'd6;
            o_v_bp     = 16'd29;
            o_hs_pol   = 1'b0;
            o_vs_pol   = 1'b0;
        end

        //4: 1280x720
        RES_1280_720:begin
            o_h_active = 16'd1280;
            o_h_fp     = 16'd110;
            o_h_sync   = 16'd40;
            o_h_bp     = 16'd220;
            o_v_active = 16'd720;
            o_v_fp     = 16'd5;
            o_v_sync   = 16'd5;
            o_v_bp     = 16'd20;
            o_hs_pol   = 1'b1;
            o_vs_pol   = 1'b1;
        end

        //5: 1920x1080
        RES_1920_1080:begin
            o_h_active = 16'd1920;
            o_h_fp     = 16'd88;
            o_h_sync   = 16'd44;
            o_h_bp     = 16'd148;
            o_v_active = 16'd1080;
            o_v_fp     = 16'd4;
            o_v_sync   = 16'd5;
            o_v_bp     = 16'd36;
            o_hs_pol   = 1'b1;
            o_vs_pol   = 1'b1;
        end

        //6: 2560x1440
        RES_2560_1440:begin
            o_h_active = 16'd2560;
            o_h_fp     = 16'd48;
            o_h_sync   = 16'd32;
            o_h_bp     = 16'd80;
            o_v_active = 16'd1440;
            o_v_fp     = 16'd3;
            o_v_sync   = 16'd5;
            o_v_bp     = 16'd33;
            o_hs_pol   = 1'b1;
            o_vs_pol   = 1'b1;
        end

        //7: 3840x2160
        RES_3840_2160:begin
            o_h_active = 16'd3840;
            o_h_fp     = 16'd176;
            o_h_sync   = 16'd88;
            o_h_bp     = 16'd296;
            o_v_active = 16'd2160;
            o_v_fp     = 16'd8;
            o_v_sync   = 16'd10;
            o_v_bp     = 16'd72;
            o_hs_pol   = 1'b1;
            o_vs_pol   = 1'b1;
        end

        //默认按0: 480x272处理
        default:begin
            o_h_active = 16'd480;
            o_h_fp     = 16'd2;
            o_h_sync   = 16'd41;
            o_h_bp     = 16'd2;
            o_v_active = 16'd272;
            o_v_fp     = 16'd2;
            o_v_sync   = 16'd10;
            o_v_bp     = 16'd2;
            o_hs_pol   = 1'b0;
            o_vs_pol   = 1'b0;
        end
    endcase
end

endmodule
