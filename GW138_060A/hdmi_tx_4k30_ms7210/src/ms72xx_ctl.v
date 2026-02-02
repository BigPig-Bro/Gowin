module ms72xx_ctl(
    input       i_sys_clk,
    input       i_rst_n,
    
    output      o_rst_n,   
    output      o_init_over,  
    output      o_iic_scl ,   
    inout       io_iic_sda 
);


//parameter define
parameter SLAVE_ADDR = 7'h2b          ; 
parameter BIT_CTRL   = 1'b1           ; 
parameter CLK_FREQ   = 27'd50_000_000 ; 
parameter I2C_FREQ   = 18'd250_000    ; 

//reg define


//wire define
wire        i2c_exec       ;
wire [23:0] i2c_data       ;
wire        i2c_done       ;
wire        i2c_dri_clk    ;
wire [ 7:0] i2c_data_r     ;
wire        i2c_rh_wl      ;

//*****************************************************
//**                    main code
//*****************************************************
i2c_ms7210_cfg u_i2c_ms7210_cfg(
    .clk                (i2c_dri_clk        ),
    .rst_n              (i_rst_n            ),
            
    .i2c_exec           (i2c_exec           ),
    .i2c_data           (i2c_data           ),
    .i2c_rh_wl          (i2c_rh_wl          ),        
    .i2c_done           (i2c_done           ), 
    .i2c_data_r         (i2c_data_r         ),   
    .rstn_out           (o_rst_n         ),       
    .init_done          (o_init_over        )         
    );    

i2c_dri #(
    .SLAVE_ADDR         (SLAVE_ADDR         ),    
    .CLK_FREQ           (CLK_FREQ           ),              
    .I2C_FREQ           (I2C_FREQ           ) 
    )
u_i2c_dri(
    .clk                (i_sys_clk          ),
    .rst_n              (i_rst_n            ),

    .i2c_exec           (i2c_exec           ),   
    .bit_ctrl           (BIT_CTRL           ),   
    .i2c_rh_wl          (i2c_rh_wl          ),      
    .i2c_addr           ({i2c_data[15:8],i2c_data[23:16]}),   
    .i2c_data_w         (i2c_data[7:0]      ),   
    .i2c_data_r         (i2c_data_r         ),   
    .i2c_done           (i2c_done           ),
    
    .scl                (o_iic_scl          ),   
    .sda                (io_iic_sda         ),   

    .dri_clk            (i2c_dri_clk        )      
    );	

    
endmodule
