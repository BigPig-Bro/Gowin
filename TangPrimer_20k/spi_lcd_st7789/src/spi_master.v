module spi_master#(
	parameter CLK_FRE = 50 , //input clock Mhz
	parameter SPI_FRE = 200  //SPI SCK 步进x10Khz
	) (
	input 				clk,    // Clock

	input 				send_en,
	input 				send_dc ,
	input 		[ 7:0] 	send_data,
	output reg  [ 7:0] 	recv_data,

	output  			send_busy,

	//默认工作在 MODE 0 —— CPOL 0 空闲低电平 CPHA 0 第一个沿（此处为上升）传输
	output reg 			spi_cs   = 1,   
	output reg 			spi_dc   = 0,   
	output reg 			spi_sck  = 0,  
	input 				spi_miso, 
	output reg 			spi_mosi = 0 
);

//分出个SCK X2出来
parameter CLK_DIV = CLK_FRE * 50 / SPI_FRE;
reg [9:0] clk_delay = 0;
reg sck_x2 = 0;
always@(posedge clk) clk_delay <= (clk_delay == CLK_DIV)? 0 : clk_delay + 'd1;
always@(posedge clk) sck_x2 <= clk_delay >= CLK_DIV / 2;

//端口采样，避免影响主机时序
reg [6:0] send_data_r = 0;

reg [7:0] recv_data_r = 0;
reg [3:0] recv_cnt    = 0;

//循环发送 接收
reg [1:0] state = 0;
assign send_busy = state != 0;
always@(posedge sck_x2)
	case (state)
		2'd0://等待 en 触发信号
			if (send_en) begin
				send_data_r <= send_data[6:0];
				recv_cnt    <= 'd0;
				
				spi_sck  <= 'd0;
				spi_cs   	<= 'd0;
				spi_mosi  	<= send_data[7];
				spi_dc   	<= send_dc ;

				state <= 2'd1;
			end
			else begin
				spi_cs   <= 'd1;
				spi_dc   <= 'd0;
				spi_sck  <= 'd0;
				spi_mosi <= 'd0;
			end

		2'd1:begin//SCK 上升沿 循环发送
			spi_sck	  <= (recv_cnt[3])? 0 : ~spi_sck;

			recv_data_r[recv_cnt] <= spi_miso;//更新接收数据 第一次无效

			spi_cs    <= (recv_cnt[3])? 'd1 : 'd0;
			recv_data <= (recv_cnt[3])? {recv_data_r[7:1],spi_miso} : recv_data;
			state 	  <= (recv_cnt[3])? 'd0 : state + 'd1;
		end

		2'd2:begin//SCK 下降沿 循环接收
			spi_sck <= ~spi_sck;

			recv_cnt 	<= recv_cnt + 'd1;
			send_data_r <= send_data_r << 1;
			spi_mosi  	<= send_data_r[6];//更新发送数据

			state <= 2'd1;
		end
	endcase

endmodule