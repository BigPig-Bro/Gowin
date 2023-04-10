module oled_ctrl#(
	parameter CLK_FRE = 50
	) (
	input 			  	clk,rst_n,

	output[ 9:0] 		read_addr,
	input [ 7:0] 		read_data,

	input 				brust_ready,	
	output reg 			brust_vaild = 0,	
	input 				send_busy,	  	
	output reg 			send_en = 0,   		
	output reg [ 7:0]	send_addr = 0,   	
	output reg [ 7:0]	send_data  = 0		
);

parameter DELAY = CLK_FRE  * 100;

parameter INIT_CMD_NUM 	= 27 ;
parameter SET_CMD_NUM 	= 3 ;

parameter OLED_CMD_REG = 8'H00;
parameter OLED_DAT_REG = 8'H40;

parameter PAGE_LINE_NUM = 128 ;
parameter PAGE_NUM = 8 ;

parameter STATE_DELAY    		= 0;
parameter STATE_INIT     		= 1;
parameter STATE_CLEAR    		= 2;
parameter STATE_WRITE    		= 3;
parameter STATE_WAIT_BUSY     	= 4;
parameter STATE_WAIT_BRUST     	= 5;

logic [ 2:0] pre_state = 0;
logic [ 2:0] state_main = 0;
logic [ 2:0] state_sub = 0;
logic [31:0] clk_delay = 0;

logic [10:0] send_cnt = 0;
logic [ 3:0] page_cnt = 0 ;//单个page 128 * 8 共8个
logic [INIT_CMD_NUM - 1 : 0][ 7:0] init_cmd = {
	//22+左上XY+左下XY (局部刷新)
	//29 2A 2E 2F 连续水平 垂直 滚动（开始，暂停）局部
	 8'hAE,//(固定命令 关闭屏幕)----turn off oled panel
	 8'h00,//(设置显示行列XY起始点）--set low column address
	 8'h10,//(设置显示行列XY起始点）--set high column address
	 8'h40,//(设置上下偏移地址，默认0不偏移)--set start line address  Set Mapping RAM Display Start Line (0x00~0x3F)
	 8'h81,//(设置显示对比度)--set contrast control register
	 8'hFF,//(设置显示亮度)--set SEG Output Current Brightness
	 8'hA1,//(设置行列地址映射)--Set SEG/Column Mapping     	    0xa0左右反置 0xa1正常
	 8'hC8,//(设置行列输出扫描方向)--Set COM/Row Scan Direction   	0xc0上下反置 0xc8正常
	 8'hA7,//(设置点亮为1 不亮为0，反过来就是 设置A7)--set normal display, reverse is A7
	 8'hA8,//(固定命令,行列复用)--set multiplex ratio(1 to 64)
	 8'h3f,//--1/64 duty
	 8'hD3,//(设置画面上下偏移)-set display offset	Shift Mapping RAM Counter (0x00~0x3F)
	 8'h00,//(设置画面上下偏移)-not offset
	 8'hd5,//(设置时钟)--set display clock divide ratio/oscillator frequency
	 8'h80,//(设置时钟)--set divide ratio, Set Clock as 100 Frames/Sec
	 8'hD9,//(固定命令)--set pre-charge period
	 8'hF1,//Set Pre-Charge as 15 Clocks & Discharge as 1 Clock
	 8'hDA,//(设置行列和半区排列)--set com pins hardware configuration
	 8'h12,//(设置行列和半区排列)
	 8'hDB,//(固定命令)--set vcomh
	 8'h40,//(固定命令) Set VCOM Deselect Level
	 8'h20,//(设置扫描方式)-Set Page Addressing Mode (0x00/0x01/0x02)
	 8'h02,//(设置扫描方式)
	 8'h8D,//--set Charge Pump enable/disable
	 8'h14,//--set(0x10) disable
	 8'hA4,//(设置显存显示) Disable Entire Display On (0xa4/0xa5)
	 8'hAF };//(固定命令 开启屏幕)----turn on oled panel
logic [SET_CMD_NUM - 1 : 0][ 7:0] set_cmd 	 = {8'hb0,8'h00,8'h10};// page y + 列 低 + 列 高 地址(默认左上角)

assign read_addr = {page_cnt[2:0],send_cnt[6:0]};

always@(posedge clk,negedge rst_n)
	if(!rst_n)begin 
		state_main 	<= 'd0;
		send_cnt 	<= 'd0;
		page_cnt 	<= 'd0;
		send_en 	<= 'b0;
		brust_vaild <= 'd0;
	end
	else
		case (state_main)
		STATE_DELAY:
			if(clk_delay == DELAY)begin
				brust_vaild <= 0;
				clk_delay <= 'd0;
				state_main <= state_main + 'd1;
			end
			else  
				clk_delay <= clk_delay + 'd1;
		STATE_INIT://initial oled
			if (send_cnt == INIT_CMD_NUM) //初始化完成
			begin 
				send_en <= 0;
				send_cnt <= 0;
				state_sub <= 0;

				// state_main <= STATE_CLEAR;
				state_main <= STATE_WRITE;
			end
			else if(!send_busy)begin 		  
				send_en <= 1;
				send_addr <= OLED_CMD_REG;
				send_data <= init_cmd[INIT_CMD_NUM - 1 - send_cnt];
				send_cnt <= send_cnt + 'd1;

				pre_state <= state_main;
				state_main <= STATE_WAIT_BUSY;
			end
			else
				send_en <= 0;

		STATE_WRITE://write data
						case (state_sub)
				3'd0: //定位具体page
					if(page_cnt == PAGE_NUM)begin//所有page更新完成
						page_cnt <= 0;
						state_main <= STATE_WRITE;
						state_sub <= 0;
					end
					else if (send_cnt == SET_CMD_NUM) begin//单个page初始化完成
						send_en <= 0;
						send_cnt <= 0;
						state_sub <= state_sub + 'd1;
					end
					else if(!send_busy) begin 		  
						send_en <= 1;
						send_addr <= OLED_CMD_REG;
						send_data <= (send_cnt==0)? set_cmd[SET_CMD_NUM -  1 -send_cnt] + page_cnt 
						: set_cmd[SET_CMD_NUM -  1 -send_cnt];
						send_cnt <= send_cnt + 'd1;

						pre_state <= state_main;
						state_main <= STATE_WAIT_BUSY;
					end
					else
						send_en <= 0;
				3'd1://写入 数据 头
					if(!send_busy) begin 		  
						send_en <= 1;
						send_addr <= 8'H40;
						send_data <= read_data;
						send_cnt <= send_cnt + 'd1;

						brust_vaild <= 1;

						state_sub <= state_sub + 'd1;

						pre_state <= state_main;
						state_main <= STATE_WAIT_BUSY;
					end
					else
						send_en <= 0;

				3'd2://写入突发
					if (send_cnt == PAGE_LINE_NUM + 1) begin//初始化完成
						send_en <= 0;
						send_cnt <= 0;
						brust_vaild <= 0;
						page_cnt <= page_cnt + 'd1;
						state_sub <= 0;
					end
					else if(brust_ready) begin 		  
						send_data <= read_data;
						send_cnt <= send_cnt + 'd1;

						pre_state <= state_main;
						state_main <= STATE_WAIT_BRUST;
					end
					else
						send_en <= 0;

			endcase
		STATE_WAIT_BUSY://WAIT FOR BUSY 
			if(send_busy) state_main <= pre_state;

		STATE_WAIT_BRUST://WAIT FOR BRUST
			if(!brust_ready) state_main <= pre_state;

		default : begin
			state_main <= 'd0;
			state_sub  <= 'd0;
		end
		endcase

endmodule

		// STATE_CLEAR://clear write all 0
		// 	case (state_sub)
		// 		3'd0: //定位具体page
		// 			if(page_cnt == PAGE_NUM)begin//所有page更新完成
		// 				page_cnt <= 0;
		// 				state_main <= STATE_WRITE;
		// 				state_sub <= 0;
		// 			end
		// 			else if (send_cnt == SET_CMD_NUM) begin//单个page初始化完成
		// 				send_en <= 0;
		// 				send_cnt <= 0;
		// 				state_sub <= state_sub + 'd1;
		// 			end
		// 			else if(!send_busy) begin 		  
		// 				send_en <= 1;
		// 				send_addr <= OLED_CMD_REG;
		// 				send_data <= (send_cnt==0)? set_cmd[SET_CMD_NUM -  1 -send_cnt] + page_cnt 
		// 				: set_cmd[SET_CMD_NUM -  1 -send_cnt];
		// 				send_cnt <= send_cnt + 'd1;

		// 				pre_state <= state_main;
		// 				state_main <= STATE_WAIT_BUSY;
		// 			end
		// 			else
		// 				send_en <= 0;
		// 		3'd1://写入 数据 头
		// 			if(!send_busy) begin 		  
		// 				send_en <= 1;
		// 				send_addr <= OLED_DAT_REG;
		// 				send_data <= 8'H00;
		// 				send_cnt <= send_cnt + 'd1;

		// 				brust_vaild <= 1;

		// 				state_sub <= state_sub + 'd1;

		// 				pre_state <= state_main;
		// 				state_main <= STATE_WAIT_BUSY;
		// 			end
		// 			else
		// 				send_en <= 0;

		// 		3'd2://写入突发
		// 			if (send_cnt == PAGE_LINE_NUM + 1) begin//初始化完成
		// 				send_en <= 0;
		// 				send_cnt <= 0;
		// 				brust_vaild <= 0;
		// 				page_cnt <= page_cnt + 'd1;
		// 				state_sub <= 0;
		// 			end
		// 			else if(brust_ready) begin 		  
		// 				send_data <= 8'H00;
		// 				send_cnt <= send_cnt + 'd1;

		// 				pre_state <= state_main;
		// 				state_main <= STATE_WAIT_BRUST;
		// 			end
		// 			else
		// 				send_en <= 0;

		// 	endcase
