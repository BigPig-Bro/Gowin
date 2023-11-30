//功能： 选取 一组两个MIC为左右声道，判断声源越靠近哪一边，点亮对应LED
//例程选用的是MIC0 和 MIC1 ,lED为DOCK板载LED5 LED2
module top (
	input 				clk,    // Clock
	output reg  [ 1:0]  led,    
	output     			mic_clk,mic_ws,
	input 	   			mic_da
);

parameter CLK_FRE = 50 ;

//随便给时钟降个频拿去采样
assign mic_clk = clk_cnt[9];
assign mic_ws  = clk_cnt[15];
reg [15:0] clk_cnt;
always@(posedge clk) clk_cnt <= clk_cnt + 1;

//采样
reg [23:0] data_r_r,data_l_r;
always@(posedge mic_clk)
	if(clk_cnt[14:10] > 0 && clk_cnt[14:10] < 25) begin
		data_r_r <=  mic_ws? {data_r_r[22:0],mic_da} : data_r_r;
		data_l_r <= !mic_ws? {data_l_r[22:0],mic_da} : data_l_r;
	end

//更新左右声道
reg [23: 0] data_r,data_l;
always@(posedge mic_ws) data_l <= data_l_r;
always@(negedge mic_ws) data_r <= data_r_r;

//更新滤波序列
reg [ 4:0][23:0] max_l_r,max_r_r;
always@(posedge mic_ws) max_l_r <= {max_l_r[3:0],data_l};
always@(negedge mic_ws) max_r_r <= {max_r_r[3:0],data_r};

//判断声道变化点亮LED
parameter 	MIC_GAP = 100;
always@*
	if($signed(max_l_r[0][23:10]) > $signed(max_l_r[4][23:10]) + MIC_GAP)  	 	led <= 2'b10;
	else if($signed(max_r_r[0][23:10]) > $signed(max_r_r[4][23:10]) + MIC_GAP)  led <= 2'b01; 
	else 						     				 							led <= 2'b11; //差距过小 判定无

endmodule