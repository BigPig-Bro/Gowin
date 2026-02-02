module  video_display(
    input                i_sys_clk,
    input                i_rst_n,
    
    input        [12:0]  i_pixel_xpos,  
    input        [12:0]  i_pixel_ypos,  
    output  reg  [23:0]  o_pixel_data   
);

//parameter define
localparam  H_DISP = 13'd3840;                

localparam RGB0     = 24'h000001;
localparam RGB1     = 24'h000002;
localparam RGB2     = 24'h000004;
localparam RGB3     = 24'h000008;
localparam RGB4     = 24'h000010;
localparam RGB5     = 24'h000020;
localparam RGB6     = 24'h000040;
localparam RGB7     = 24'h000080;
localparam RGB8     = 24'h000100;
localparam RGB9     = 24'h000200;
localparam RGB10    = 24'h000400;
localparam RGB11    = 24'h000800;
localparam RGB12    = 24'h001000;
localparam RGB13    = 24'h002000;
localparam RGB14    = 24'h004000;
localparam RGB15    = 24'h008000;
localparam RGB16    = 24'h010000;
localparam RGB17    = 24'h020000;
localparam RGB18    = 24'h040000;
localparam RGB19    = 24'h080000;
localparam RGB20    = 24'h100000;
localparam RGB21    = 24'h200000;
localparam RGB22    = 24'h400000;
localparam RGB23    = 24'h800000;    
//*****************************************************
//**                    main code
//*****************************************************

always @(posedge i_sys_clk ) begin
    if (!i_rst_n)
        o_pixel_data <= 24'd0;
    else begin
        if((i_pixel_xpos >= 0) && (i_pixel_xpos < (H_DISP/24)*1))
            o_pixel_data <= RGB0;
        else if((i_pixel_xpos >= (H_DISP/24)*1) && (i_pixel_xpos < (H_DISP/24)*2))
            o_pixel_data <= RGB1;  
        else if((i_pixel_xpos >= (H_DISP/24)*2) && (i_pixel_xpos < (H_DISP/24)*3))
            o_pixel_data <= RGB2;  
        else if((i_pixel_xpos >= (H_DISP/24)*3) && (i_pixel_xpos < (H_DISP/24)*4))
            o_pixel_data <= RGB3;
        else if((i_pixel_xpos >= (H_DISP/24)*4) && (i_pixel_xpos < (H_DISP/24)*5))
            o_pixel_data <= RGB4;
        else if((i_pixel_xpos >= (H_DISP/24)*5) && (i_pixel_xpos < (H_DISP/24)*6))
            o_pixel_data <= RGB5;
        else if((i_pixel_xpos >= (H_DISP/24)*6) && (i_pixel_xpos < (H_DISP/24)*7))
            o_pixel_data <= RGB6;
        else if((i_pixel_xpos >= (H_DISP/24)*7) && (i_pixel_xpos < (H_DISP/24)*8))
            o_pixel_data <= RGB7;
        else if((i_pixel_xpos >= (H_DISP/24)*8) && (i_pixel_xpos < (H_DISP/24)*9))
            o_pixel_data <= RGB8;
        else if((i_pixel_xpos >= (H_DISP/24)*9) && (i_pixel_xpos < (H_DISP/24)*10))
            o_pixel_data <= RGB9;
        else if((i_pixel_xpos >= (H_DISP/24)*10) && (i_pixel_xpos < (H_DISP/24)*11))
            o_pixel_data <= RGB10;
        else if((i_pixel_xpos >= (H_DISP/24)*11) && (i_pixel_xpos < (H_DISP/24)*12))
            o_pixel_data <= RGB11;
        else if((i_pixel_xpos >= (H_DISP/24)*12) && (i_pixel_xpos < (H_DISP/24)*13))
            o_pixel_data <= RGB12;
        else if((i_pixel_xpos >= (H_DISP/24)*13) && (i_pixel_xpos < (H_DISP/24)*14))
            o_pixel_data <= RGB13;
        else if((i_pixel_xpos >= (H_DISP/24)*14) && (i_pixel_xpos < (H_DISP/24)*15))
            o_pixel_data <= RGB14;
        else if((i_pixel_xpos >= (H_DISP/24)*15) && (i_pixel_xpos < (H_DISP/24)*16))
            o_pixel_data <= RGB15;
        else if((i_pixel_xpos >= (H_DISP/24)*16) && (i_pixel_xpos < (H_DISP/24)*17))
            o_pixel_data <= RGB16;
        else if((i_pixel_xpos >= (H_DISP/24)*17) && (i_pixel_xpos < (H_DISP/24)*18))
            o_pixel_data <= RGB17;
        else if((i_pixel_xpos >= (H_DISP/24)*18) && (i_pixel_xpos < (H_DISP/24)*19))
            o_pixel_data <= RGB18;
        else if((i_pixel_xpos >= (H_DISP/24)*19) && (i_pixel_xpos < (H_DISP/24)*20))
            o_pixel_data <= RGB19;
        else if((i_pixel_xpos >= (H_DISP/24)*20) && (i_pixel_xpos < (H_DISP/24)*21))
            o_pixel_data <= RGB20;
        else if((i_pixel_xpos >= (H_DISP/24)*21) && (i_pixel_xpos < (H_DISP/24)*22))
            o_pixel_data <= RGB21;
        else if((i_pixel_xpos >= (H_DISP/24)*22) && (i_pixel_xpos < (H_DISP/24)*23))
            o_pixel_data <= RGB22;
        else 
            o_pixel_data <= RGB23;
    end
end

endmodule