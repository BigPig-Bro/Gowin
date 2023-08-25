module spi_top#(
	parameter CLK_FRE = 27,
	parameter SPI_FRE = 100  //SPI SCK 步进x10Khz
	) (
	input 			  	clk,rst_n,

	output 				lcd_bl	 ,
	output reg			lcd_rst_n,
	output  			spi_cs   ,   
	output  			spi_dc   ,   
	output  			spi_sck  ,  
	input 				spi_miso , 
	output  			spi_mosi  
);

parameter DELAY_100MS = CLK_FRE* 1000 * 100;
parameter DELAY_120MS = CLK_FRE* 1000 * 120;
parameter DELAY_200MS = CLK_FRE* 1000 * 200;

parameter RS_DAT = 1;
parameter RS_CMD = 0;

parameter INIT_CMD_NUM 	=  70;
parameter DISPLAY_WIDTH  =  240;
parameter DISPLAY_HEIGHT =  135;
parameter DISPLAY_NUM  	 =   DISPLAY_WIDTH * DISPLAY_HEIGHT;

enum {STATE_RESET,STATE_WAKE,STATE_EXIT_SLEEP,STATE_WAIT_WAKE,STATE_INIT,STATE_WRITE,STATE_DONE,STATE_WAIT} STATE;

logic [ 2:0] pre_state = 0;
logic [ 2:0] state_main = 0;
logic [ 2:0] state_sub = 0;
logic [31:0] clk_delay = 0;

logic [31:0] send_cnt = 0;
logic [ 8:0] init_cmd [INIT_CMD_NUM-1:0];
logic [15:0] dis_data [DISPLAY_NUM-1:0];

// modelsim仿真需要具体路径
// initial $readmemh("D:\\Users\\HUIP\\Desktop\\SPI_LCD_ST7789_16bitRGB\\src\\init.txt",init_cmd);  
// initial $readmemh("D:\\Users\\HUIP\\Desktop\\SPI_LCD_ST7789_16bitRGB\\src\\VME50.txt",dis_data);
initial $readmemh("init.txt",init_cmd);
initial $readmemh("VME50.txt",dis_data);

wire 		send_busy ;	
reg 		send_en 	= 'd0;   	
reg  	  	send_dc 	= 'd0;   	
reg [ 7:0] 	send_data 	= 'd0;

assign lcd_bl =1'b0;
reg [15:0] data_r;
always@(posedge clk) data_r <= dis_data[send_cnt];
reg [ 8:0] cmd_r;
always@(posedge clk) cmd_r <= init_cmd[send_cnt];

always@(posedge clk,negedge rst_n)
	if(!rst_n)begin 
		state_main <= 0;
		state_sub  <= 0;
	end
	else
		case (state_main)
			STATE_RESET://reset
				if(clk_delay == DELAY_100MS)begin
					lcd_rst_n <= 'b1;
					clk_delay <= 'd0;
					state_main <= STATE_WAKE;
				end
				else begin 
					lcd_rst_n <= 'b0;
					clk_delay ++;
				end

			STATE_WAKE://reset
				if(clk_delay == DELAY_200MS)begin
					clk_delay <= 'd0;
					state_main <= STATE_EXIT_SLEEP;
				end
				else begin 
					clk_delay ++;
				end

			STATE_EXIT_SLEEP://reset
				if(!send_busy)begin 		  //spi空闲
					send_en 	<= 1;
					send_dc 	<= RS_CMD;
					send_data 	<= 8'H11;

					pre_state <= STATE_WAIT_WAKE;
					state_main <= STATE_WAIT;
				end
				else
					send_en <= 0;

			STATE_WAIT_WAKE:begin//reset
				send_en <= 0;
				if(clk_delay == DELAY_120MS)begin
					clk_delay <= 'd0;
					state_main <= STATE_INIT;
				end
				else begin 
					clk_delay ++;
				end
			end

			STATE_INIT://initial SPI
				if (send_cnt == INIT_CMD_NUM) //初始化完成
				begin 
					send_en <= 0;
					send_cnt <= 0;
					state_sub <= 0;

					state_main <= STATE_WRITE;
				end
				else if(!send_busy)begin 		  //spi空闲
					send_en 	<= 1;
					send_dc 	<= cmd_r[8];
					send_data 	<= cmd_r[7:0];
					send_cnt ++;

					pre_state <= state_main;
					state_main <= STATE_WAIT;
				end
				else
					send_en <= 0;
			
			STATE_WRITE://write data
				case (state_sub)
					3'd0:
						if(!send_busy)begin //发送低八位
							send_en <= 1;
							send_dc <= RS_DAT;
							send_data <= data_r[7:0];

							state_sub <= state_sub + 'd1;
							pre_state <= state_main;
							state_main <= STATE_WAIT;
						end
						else
							send_en <= 0;

					3'd1:
						if(!send_busy)begin//发送高八位
							send_en <= 1;
							send_dc <= RS_DAT;
							send_data <= data_r[15:8];
							send_cnt <= send_cnt + 1;

							state_sub <= 'd0;
							pre_state <= (send_cnt == DISPLAY_NUM - 1)? STATE_DONE : state_main;
							state_main <= STATE_WAIT;
						end
						else
							send_en <= 0;
				endcase
			STATE_DONE:begin
				send_en <= 0;
				state_main <= state_main;
			end		

			STATE_WAIT://WAIT FOR BUSY 
				if(send_busy) state_main <= pre_state;

			default : begin
				state_main <= 'd0;
				state_sub  <= 'd0;
			end
		endcase

spi_master#(
	.CLK_FRE (CLK_FRE	 ),
	.SPI_FRE (SPI_FRE 	 )
	) spi_master_m0(
	.clk 	  (clk 			),
	.send_busy(send_busy 	),

	.send_en  (send_en 		),
	.send_dc  (send_dc 	 	),
	.send_data(send_data 	),
	.recv_data(  	 	 	),

	.spi_cs   (spi_cs   	),
	.spi_dc   (spi_dc   	),
	.spi_sck  (spi_sck  	),
	.spi_miso (spi_miso 	),
	.spi_mosi (spi_mosi 	)
	);

endmodule