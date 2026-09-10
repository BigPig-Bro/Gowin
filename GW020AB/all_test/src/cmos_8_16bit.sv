//CMOS 8bit 转 16bit：HREF 有效时合并相邻两字节，输出 16bit 像素数据
//220901    v1.0.0   初始版本
//260908    v1.1.0   由 .v 转 .sv，按 Coder 规范整理：同步低有效复位、i_/o_ 端口、4 空格缩进
module cmos_8_16bit(
    input                  i_sys_clk,  //cmos pclk 像素时钟
    input                  i_rst_n,    //低有效复位
    input        [ 7:0]    i_pdata,    //8bit 像素数据
    input                  i_de,       //输入数据有效(HREF)
    output logic [15:0]    o_pdata,    //16bit 像素数据
    output logic           o_hblank,   //16bit 数据有效(写使能)
    output logic           o_de        //16bit 写时钟
);

logic [ 7:0] pdata_d0;  //输入数据打 1 拍
logic        x_cnt;     //字节对相位计数
logic        de_d1;     //输入有效打 1 拍
logic        de_d2;     //输入有效打 2 拍

//8bit 输入数据打拍，用于和当前字节拼接成 16bit
always@(posedge i_sys_clk)begin
    if(!i_rst_n)begin
        pdata_d0 <= 'd0;
    end else begin
        pdata_d0 <= i_pdata;
    end
end

//字节对相位：HREF 上升沿置 1，其后每个像素时钟翻转
always@(posedge i_sys_clk)begin
    if(!i_rst_n)begin
        x_cnt <= 1'b0;
    end else if(i_de && !de_d1)begin
        x_cnt <= 1'b1;
    end else begin
        x_cnt <= ~x_cnt;
    end
end

//输出写时钟：x_cnt 为 1 时有效
always@(posedge i_sys_clk)begin
    if(!i_rst_n)begin
        o_de <= 1'b0;
    end else if(x_cnt)begin
        o_de <= 1'b1;
    end else begin
        o_de <= 1'b0;
    end
end

//输入有效打 2 拍作为 16bit 写使能
always@(posedge i_sys_clk)begin
    if(!i_rst_n)begin
        de_d1    <= 1'b0;
        de_d2    <= 1'b0;
        o_hblank <= 1'b0;
    end else begin
        de_d1    <= i_de;
        de_d2    <= de_d1;
        o_hblank <= de_d2;
    end
end

//16bit 数据拼接：第二个字节时钟沿写入
always@(posedge i_sys_clk)begin
    if(!i_rst_n)begin
        o_pdata <= 16'd0;
    end else if(i_de && x_cnt)begin
        o_pdata <= {pdata_d0, i_pdata};
    end else begin
        o_pdata <= o_pdata;
    end
end

endmodule
