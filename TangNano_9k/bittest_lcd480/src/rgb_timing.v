module rgb_timing(
	input               rgb_clk,           //pixel clock
	input               rgb_rst_n,         //reset signal high active
	output  reg         rgb_hs,            //horizontal synchronization
	output  reg         rgb_vs,            //vertical synchronization
	output            	rgb_de,            //video valid

	output reg [10:0] 	rgb_x,              //video x position 
	output reg [10:0] 	rgb_y               //video y position 
	);


//480x272 9Mhz
parameter H_ACTIVE = 16'd480; 
parameter H_FP = 16'd2;       
parameter H_SYNC = 16'd41;    
parameter H_BP = 16'd2;       
parameter V_ACTIVE = 16'd272; 
parameter V_FP  = 16'd2;     
parameter V_SYNC  = 16'd10;   
parameter V_BP  = 16'd2;     
parameter HS_POL = 'b0;
parameter VS_POL = 'b0;

parameter H_TOTAL = H_ACTIVE + H_FP + H_SYNC + H_BP;//horizontal total time (pixels)
parameter V_TOTAL = V_ACTIVE + V_FP + V_SYNC + V_BP;//vertical total time (lines)

reg[11:0] h_cnt;                 //horizontal counter
reg[11:0] v_cnt;                 //vertical counter

reg h_active;                    //horizontal video active
reg v_active;                    //vertical video active
assign rgb_de = h_active & v_active;

always@(posedge rgb_clk)begin 
//显示计数
	if(h_cnt >= H_FP + H_SYNC + H_BP)
		rgb_x <= h_cnt - (H_FP[11:0] + H_SYNC[11:0] + H_BP[11:0]);
	else
		rgb_x <= rgb_x;
	if(v_cnt >= V_FP + V_SYNC + V_BP)
		rgb_y <= v_cnt - (V_FP[11:0] + V_SYNC[11:0] + V_BP[11:0]);
	else
		rgb_y <= rgb_y;
end

always@(posedge rgb_clk ,negedge rgb_rst_n)begin 
//列计数
	if(rgb_rst_n == 'b0)
		h_cnt <= 12'd0;
	else if(h_cnt == H_TOTAL - 1)//horizontal counter maximum value
		h_cnt <= 12'd0;
	else
		h_cnt <= h_cnt + 12'd1;
//行计数
	if(rgb_rst_n == 'b0)
		v_cnt <= 12'd0;
	else if(h_cnt == H_FP  - 1)//horizontal sync time
		if(v_cnt == V_TOTAL - 1)//vertical counter maximum value
			v_cnt <= 12'd0;
		else
			v_cnt <= v_cnt + 12'd1;
	else
		v_cnt <= v_cnt;
//HS生成
	if(rgb_rst_n == 'b0)
		rgb_hs <= 'b0;
	else if(h_cnt == H_FP - 1)//horizontal sync begin
		rgb_hs <= HS_POL;
	else if(h_cnt == H_FP + H_SYNC - 1)//horizontal sync end
		rgb_hs <= ~rgb_hs;
	else
		rgb_hs <= rgb_hs;
//列有效
	if(rgb_rst_n == 'b0)
		h_active <= 'b0;
	else if(h_cnt == H_FP + H_SYNC + H_BP - 1)//horizontal active begin
		h_active <= 'b1;
	else if(h_cnt == H_TOTAL - 1)//horizontal active end
		h_active <= 'b0;
	else
		h_active <= h_active;
//VS生成
	if(rgb_rst_n == 'b0)
		rgb_vs <= 'd0;
	else if((v_cnt == V_FP - 1) && (h_cnt == H_FP - 1))//vertical sync begin
		rgb_vs <= VS_POL;
	else if((v_cnt == V_FP + V_SYNC - 1) && (h_cnt == H_FP - 1))//vertical sync end
		rgb_vs <= ~rgb_vs;  
	else
		rgb_vs <= rgb_vs;
//行有效
	if(rgb_rst_n == 'b0)
		v_active <= 'd0;
	else if((v_cnt == V_FP + V_SYNC + V_BP - 1) && (h_cnt == H_FP - 1))//vertical active begin
		v_active <= 'b1;
	else if((v_cnt == V_TOTAL - 1) && (h_cnt == H_FP - 1)) //vertical active end
		v_active <= 'b0;   
	else
		v_active <= v_active;
end
endmodule 