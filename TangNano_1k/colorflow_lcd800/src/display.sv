module display (
	input 				clk,    // Clock
	
	input				in_hs,
	input				in_vs,
	input				in_de,
	input [10:0]		x_in,
	input [10:0]		y_in,

	output reg 			out_hs,
	output reg 			out_vs,
	output reg 			out_de,
	output reg [15:0]	out_data
);

//色带查表
wire [15:0] display_table = x_in + y_in ;

reg [15:0] colorflow = 16'h0000;
always@(posedge clk)
	case(display_table[15:6] % 6)
	 3'd0: colorflow[10: 5]  <= 	display_table[5:0];
	 3'd1: colorflow[15:11]  <= 31-	display_table[5:1];
	 3'd2: colorflow[ 4: 0]  <= 	display_table[5:1];
	 3'd3: colorflow[10: 5]  <= 63-	display_table[5:0];
	 3'd4: colorflow[15:11]  <= 	display_table[5:1];
	 3'd5: colorflow[ 4: 0]  <= 31-	display_table[5:1];
	endcase

//输出信号
always@(posedge clk)
	if (in_de) begin
		out_data <= colorflow;
	end
	else
		out_data <= 16'h0000;

reg out_hs_d,out_vs_d,out_de_d;
always@(posedge clk)begin 
	out_hs_d <= in_hs;
	out_vs_d <= in_vs;
	out_de_d <= in_de;

	out_hs <= out_hs_d;
	out_vs <= out_vs_d;
	out_de <= out_de_d;
end

endmodule