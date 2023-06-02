module cmos_8_16bit(
	input              pclk,
	input [7:0]        pdata_i,
	input              de_i,
	output reg[15:0]   pdata_o,
	output reg         de_o
);
reg[7:0] pdata_i_d0;
reg x_cnt;
always@(posedge pclk)
	pdata_i_d0 <= pdata_i;

always@(posedge pclk)
	if(de_i)
		x_cnt <= ~x_cnt ;
	else
		x_cnt <= 0;

always@(posedge pclk)
	if(de_i && x_cnt)
		de_o <= 1'b1;
	else
		de_o <= 1'b0;

always@(posedge pclk)
	if(de_i && x_cnt)
		pdata_o <= {pdata_i_d0,pdata_i};
	else
		pdata_o <= pdata_o;

endmodule 