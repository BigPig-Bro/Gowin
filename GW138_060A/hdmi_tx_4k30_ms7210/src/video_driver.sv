module video_driver(
    input           	    i_sys_clk	,
    input           	    i_rst_n	,
		
    //RGB�ӿ�	
    output  logic      	    o_video_hs	,    
    output  logic      	    o_video_vs	,    
    output  logic      	    o_video_de	,    
    output  logic [23:0]    o_video_rgb	,    
    output	logic 			o_data_req 	,
	
    input   	  [23:0]    i_pixel_data	,     
    output  logic [12:0]    o_pixel_xpos	, 
    output  logic [12:0]    o_pixel_ypos    
);

//1280*720   75m
//localparam  H_SYNC   =  11'd40;   
//localparam  H_BACK   =  11'd220;  
//localparam  H_DISP   =  11'd1280; 
//localparam  H_FRONT  =  11'd110;  
//localparam  H_TOTAL  =  11'd1650; 

//localparam  V_SYNC   =  11'd5;    
//localparam  V_BACK   =  11'd20;   
//localparam  V_DISP   =  11'd720;  
//localparam  V_FRONT  =  11'd5;    
//localparam  V_TOTAL  =  11'd750;  

//1920*1080 150m
// localparam  H_SYNC   =  12'd44;  
// localparam  H_BACK   =  12'd148; 
// localparam  H_DISP   =  12'd1920;
// localparam  H_FRONT  =  12'd88;  
// localparam  H_TOTAL  =  12'd2200;

// localparam  V_SYNC   =  12'd5;   
// localparam  V_BACK   =  12'd36;  
// localparam  V_DISP   =  12'd1080;
// localparam  V_FRONT  =  12'd4;   
// localparam  V_TOTAL  =  12'd1125;

//3840*2160 300m
localparam  H_SYNC   =  13'd88;  
localparam  H_BACK   =  13'd296; 
localparam  H_DISP   =  13'd3840;
localparam  H_FRONT  =  13'd176; 
localparam  H_TOTAL  =  13'd4400;

localparam  V_SYNC   =  12'd10;  
localparam  V_BACK   =  12'd72;  
localparam  V_DISP   =  12'd2160;
localparam  V_FRONT  =  12'd8;   
localparam  V_TOTAL  =  12'd2250;

//2560*1600 270m
//localparam  H_SYNC   =  13'd32;   
//localparam  H_BACK   =  13'd80;  
//localparam  H_DISP   =  13'd2560;
//localparam  H_FRONT  =  13'd48;  
//localparam  H_TOTAL  =  13'd2720; 

//localparam  V_SYNC   =  12'd6;    
//localparam  V_BACK   =  12'd37;   
//localparam  V_DISP   =  12'd1600; 
//localparam  V_FRONT  =  12'd3;    
//localparam  V_TOTAL  =  12'd1646; 

logic [12:0] cnt_h;
logic [12:0] cnt_v;
logic        video_en;

//*****************************************************
//**                    main code
//*****************************************************
always @(posedge i_sys_clk) begin
    o_video_de  <= video_en;
    o_video_hs  <= ( cnt_h < H_SYNC ) ? 1'b0 : 1'b1;  
    o_video_vs  <= ( cnt_v < V_SYNC ) ? 1'b0 : 1'b1;  
    o_video_rgb <= video_en ? i_pixel_data : 24'd0; 
end

always @(posedge i_sys_clk) begin
	if(!i_rst_n)
		video_en <= 1'b0;
	else
		video_en <= o_data_req;
end

always @(posedge i_sys_clk) begin
	if(!i_rst_n)
		o_data_req <= 1'b0;
	else if(((cnt_h >= H_SYNC + H_BACK - 2'd2) && (cnt_h < H_SYNC + H_BACK + H_DISP - 2'd2))
                  && ((cnt_v >= V_SYNC + V_BACK) && (cnt_v < V_SYNC + V_BACK+V_DISP)))
		o_data_req <= 1'b1;
	else
		o_data_req <= 1'b0;
end

always@ (posedge i_sys_clk) begin
    if(!i_rst_n)
        o_pixel_xpos <= 13'd0;
    else if(o_data_req)
        o_pixel_xpos <= cnt_h + 2'd2 - H_SYNC - H_BACK ;
    else 
        o_pixel_xpos <= 13'd0;
end
    
always@ (posedge i_sys_clk) begin
    if(!i_rst_n)
        o_pixel_ypos <= 13'd0;
    else if((cnt_v >= (V_SYNC + V_BACK)) && (cnt_v < (V_SYNC + V_BACK + V_DISP)))
        o_pixel_ypos <= cnt_v + 1'b1 - (V_SYNC + V_BACK) ;
    else 
        o_pixel_ypos <= 13'd0;
end

always @(posedge i_sys_clk) begin
    if (!i_rst_n)
        cnt_h <= 13'd0;
    else begin
        if(cnt_h < H_TOTAL - 1'b1)
            cnt_h <= cnt_h + 1'b1;
        else 
            cnt_h <= 13'd0;
    end
end

always @(posedge i_sys_clk) begin
    if (!i_rst_n)
        cnt_v <= 13'd0;
    else if(cnt_h == H_TOTAL - 1'b1) begin
        if(cnt_v < V_TOTAL - 1'b1)
            cnt_v <= cnt_v + 1'b1;
        else 
            cnt_v <= 13'd0;
    end
end

endmodule