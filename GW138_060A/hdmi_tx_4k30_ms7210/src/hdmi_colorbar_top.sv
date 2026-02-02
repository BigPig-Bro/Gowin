module  hdmi_colorbar_top(
    input         		i_clk_50m,    
    input         		i_rst_n,  
    
    output    [ 1:0]    o_led,

    output            	o_rst_n,   
    output            	o_iic_scl,    
    inout             	io_iic_sda,    
   
    output              o_video_clk,  
    output            	o_video_vs,   
    output            	o_video_hs,   
    output            	o_video_de,   
    output     [23:0]   o_video_rgb   
);

//*****************************************************
//**                    main code
//*****************************************************
logic key_rst_n, sys_rst_n;
key_sync #(
    .CLK_FRE     (50                      ),
    .KEY_IN_MODE (0                       ),
    .KEY_OUT_MODE(0                       )
)key_sync_m0(
    .i_sys_clk      (i_clk_50m             ),
    .i_key_async    (i_rst_n               ),
    .o_key_sync     (key_rst_n             )
);

logic locked;
sys_pll sys_pll_m0(
    .clkin      (i_clk_50m              ),
    .clkout0    (o_video_clk              ),
    .reset      (~key_rst_n             ),
    .lock       (locked                 )
);

assign sys_rst_n = key_rst_n & locked;

wire init_over;
ms72xx_ctl ms72xx_ctl(
    .i_sys_clk        (i_clk_50m        ), 
    .i_rst_n          (sys_rst_n        ),  

    .o_rst_n          (o_rst_n          ),                     
    .o_init_over      (init_over        ),     
    .o_iic_scl        (o_iic_scl        ), 
    .io_iic_sda       (io_iic_sda       )  
);

reg [25:0] clk_cnt;
always@(posedge i_clk_50m) clk_cnt <= clk_cnt + 1;
assign  o_led[0] =  init_over? clk_cnt[25] : 1'b0; //0亮 初始化完成后闪烁
assign  o_led[1] =  sys_rst_n? clk_cnt[25] : 1'b0; //0亮 locked后闪烁

//wire define
logic  [12:0]  pixel_xpos_w;
logic  [12:0]  pixel_ypos_w;
logic  [23:0]  pixel_data_w;    
video_driver  u_video_driver(
    .i_sys_clk          (o_video_clk        ),
    .i_rst_n            (sys_rst_n          ),

    .o_video_hs         (o_video_hs         ),
    .o_video_vs         (o_video_vs         ),
    .o_video_de         (o_video_de         ),
    .o_video_rgb        (o_video_rgb        ),
	.o_data_req		    (                   ),

    .o_pixel_xpos       (pixel_xpos_w       ),
    .o_pixel_ypos       (pixel_ypos_w       ),
	.i_pixel_data       (pixel_data_w       )
);

video_display  u_video_display(
    .i_sys_clk          (o_video_clk        ),
    .i_rst_n            (sys_rst_n          ),

    .i_pixel_xpos       (pixel_xpos_w       ),
    .i_pixel_ypos       (pixel_ypos_w       ),
    .o_pixel_data       (pixel_data_w       )
    );

endmodule 