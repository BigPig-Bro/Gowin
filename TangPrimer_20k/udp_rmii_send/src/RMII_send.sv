module RMII_send#(
	parameter BOARD_MAC 	= 48'h03_08_35_01_AE_C2 		,//开发板MAC地址
	parameter BOARD_IP 		= {8'd192,8'd168,8'd3,8'd2}	,//开发板IP地址
	parameter BOARD_PORT	= 16'h8000, 					 //开发板IP地址-端口 
	parameter DES_MAC 		= 48'hff_ff_ff_ff_ff_ff 		,//目的MAC地址
	parameter DES_IP 		= {8'd192,8'd168,8'd3,8'd3} 	,//目的IP地址
	parameter DES_PORT		= 16'h8000, 					 //目的IP地址-端口 
	parameter DATA_SIZE		= 16'd500 						 //数据包长度 32~1500 B
	)(
	input  				rst_n, 	

	input 				RMII_50M,
	output reg  [1:0] 	RMII_TXD, 		
	output reg 			RMII_TXEN		
	);


/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//////////////////// 			      数据包发送 	        /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
parameter IP_HEAD_CODE = 64'h55_55_55_55_55_55_55_d5;  //7个前导码55,一个帧开始符d5
parameter DES_MAC_CODE = DES_MAC; //目的MAC地址 ff-ff-ff-ff-ff-ff, 全ff为广播包
parameter BOARD_MAC_CODE = BOARD_MAC; //开发板MAC地址
parameter DATA_TYPE = 16'H0800; // 数据包类型
parameter MAC_DATA = {DES_MAC,BOARD_MAC,16'h0800}; //目的MAC+源MAC+数据类型

reg [31:0] packet_header [6:0];     //IP数据头包
reg [31:0] check_buffer; // 检验和临时变量

enum {IDLE, CHECK_SUM, PACKET_HEAD, SEND_MAC, SEND_HEADER, SEND_DATA, SEND_CRC,DELAY} SEND_STATE;

reg [ 3:0] state;
reg [15:0] send_cnt;

always@(posedge RMII_50M)begin
	if(!rst_n)begin
		send_cnt 	<= 'd0;
		state 		<= IDLE;
	end
	else
		case(state)
			IDLE:begin
				crc_rst 		<= 'b1;
				send_cnt 		<= 'd0;

				RMII_TXEN 		<= 'b0;
				RMII_TXD  		<= 'd0;

				if(1)begin
					//IP header
					packet_header[0] <= {16'h4500,DATA_SIZE+16'd28};  //版本号：4； 包头长度：20；IP包总长(数据+20B头)
					packet_header[1] <= {{5'b00000,11'd0},16'h4000};    //包序列号+Fragment offset
					packet_header[2] <= {8'h80,8'h11,16'h0000};         //生存时间 + UDP协议 + IP包头空白检验和
					packet_header[3] <= BOARD_IP;                   	//开发板源地址
					packet_header[4] <= DES_IP;                   		//目的地址广播地址
					packet_header[5] <= {BOARD_PORT,DES_PORT};          //2个字节的源端口号和2个字节的目的端口号
					packet_header[6] <= {DATA_SIZE+16'd8,16'h0000};         	//数据长度+UDP头检验（可不用）

				 	state <= CHECK_SUM;
				 end
			end
			
			CHECK_SUM:begin  //----------生成包头的校验和
				send_cnt <= (send_cnt == 2) ? 0 : send_cnt + 1; // 纯计数，未发送
				
				crc_rst 		<= 'b0;
				case(send_cnt)
					'd0: check_buffer <= ((packet_header[0][15:0]+packet_header[0][31:16])+(packet_header[1][15:0]
						+packet_header[1][31:16]))+(((packet_header[2][15:0]+packet_header[2][31:16])+((packet_header[3][15:0]
						+packet_header[3][31:16])))+(packet_header[4][15:0]+packet_header[4][31:16]));
					'd1: check_buffer[15:0] <= check_buffer[31:16]+check_buffer[15:0];
					'd2: packet_header[2][15:0] <= ~check_buffer[15:0];                 //header checksum
				endcase

				state <= (send_cnt == 2) ? PACKET_HEAD : state;
			end

			PACKET_HEAD:begin//----------发送8个IP前导码:7个55, 1个d5   
				send_cnt 	<= (send_cnt == 31) ? 0 : send_cnt + 1; 

				RMII_TXEN 	<= 'b1;
				RMII_TXD 	<= {IP_HEAD_CODE [send_cnt*2+1], IP_HEAD_CODE [send_cnt*2]};

				state <= (send_cnt == 31) ? SEND_MAC : state;
			end

			SEND_MAC:begin //------------发送目标MAC address和源MAC address和IP包类型  ，开始CRC
				send_cnt 	<= (send_cnt == 55) ? 0 : send_cnt + 1; 
				crc_en 		<= 'b1;

				RMII_TXD 	<= {MAC_DATA [send_cnt*2+1], MAC_DATA [send_cnt*2]};

				state 		<= (send_cnt == 55) ? SEND_HEADER : state;
			end

			SEND_HEADER:begin //---------发送7个32bit的IP 包头
				send_cnt 	<= (send_cnt == 'd111) ? 0 : send_cnt + 1; 

				RMII_TXD 	<= {packet_header[send_cnt[15:4]][send_cnt[3:1]+1],packet_header[send_cnt[15:4]][send_cnt[3:1]]};

				state <= (send_cnt == 'd111) ? SEND_DATA : state;
			end

			SEND_DATA:begin //-----------发送数据包
				send_cnt 		<= (send_cnt == DATA_SIZE * 4 - 1) ? 0 :send_cnt + 'b1;

				RMII_TXD 		<= 'H2; // 重复测试数据

				state 			<= (send_cnt == DATA_SIZE * 4 - 1) ? SEND_CRC: state;
			end

			SEND_CRC:begin //------------发送CRC包
				send_cnt 		<= (send_cnt == 'd15)? 0 : send_cnt + 1;
				crc_en 			<= 'b0;

				case(send_cnt)
					'd3 :  RMII_TXD <= {~crc_data[24], ~crc_data[25]};
					'd2 :  RMII_TXD <= {~crc_data[26], ~crc_data[27]};
					'd1 :  RMII_TXD <= {~crc_data[28], ~crc_data[29]}; 
					'd0 :  RMII_TXD <= {~crc_data[30], ~crc_data[31]}; 

					'd7 :  RMII_TXD <= {~crc_data[16], ~crc_data[17]}; 
					'd6 :  RMII_TXD <= {~crc_data[18], ~crc_data[19]}; 
					'd5 :  RMII_TXD <= {~crc_data[20], ~crc_data[21]}; 
					'd4 :  RMII_TXD <= {~crc_data[22], ~crc_data[23]};

					'd11:  RMII_TXD <= {~crc_data[8] , ~crc_data[9] }; 
					'd10:  RMII_TXD <= {~crc_data[10], ~crc_data[11]};
					'd9 :  RMII_TXD <= {~crc_data[12], ~crc_data[13]}; 
					'd 8:  RMII_TXD <= {~crc_data[14], ~crc_data[15]}; 

					'd15:  RMII_TXD <= {~crc_data[0] , ~crc_data[1] }; 
					'd14:  RMII_TXD <= {~crc_data[2] , ~crc_data[3] }; 
					'd13:  RMII_TXD <= {~crc_data[4] , ~crc_data[5] }; 
					'd12:  RMII_TXD <= {~crc_data[6] , ~crc_data[7] }; 
				endcase

				state 			<= (send_cnt == 'd15)? DELAY: state;
			end
			
			DELAY:begin//------------等待帧间隔
				send_cnt <= send_cnt [6] ? 0 : send_cnt + 1;
				
				RMII_TXEN 		<= 'b0;
				RMII_TXD  		<= 'd0;
				
				state <= send_cnt [6] ? IDLE : state;
			end

			default: state <= IDLE;
		endcase
end


/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//////////////////// 			      CRC校验  		        /////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
reg [1:0]   RMII_TXC = 0;
reg [7:0] 	RMII_TXD_BYTE;
always@(negedge RMII_50M) begin
	RMII_TXC <= crc_en?RMII_TXC + 1 : 0;

	RMII_TXD_BYTE <= {RMII_TXD_BYTE[5:0],RMII_TXD[0],RMII_TXD[1]};
end

wire [7:0] Data_in_r;
assign Data_in_r = send_cnt[1:0] == 3 ? {RMII_TXD_BYTE[5:0],RMII_TXD[0],RMII_TXD[1]} : Data_in_r;

wire [31:0] 	crc_data;
reg 		 	crc_en;
reg 			crc_rst;
crc crc32_m0(
	.Clk		(RMII_TXC == 0 	), 
	.Reset		(crc_rst 	 	), 
	.Data_in	(Data_in_r 	 	), 
	.Enable		(crc_en 		), 
	.Crc		(crc_data 		),
	.CrcNext	(  				)
	);


endmodule 