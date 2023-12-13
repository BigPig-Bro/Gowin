
// ===========Oooo==========================================Oooo========
// =  Copyright (C) 2014-2023 Gowin Semiconductor Technology Co.,Ltd.
// =                     All rights reserved.
// =====================================================================
//
//  __      __      __
//  \ \    /  \    / /   [File name   ] prim_sim.v
//   \ \  / /\ \  / /    [Description ] GW5AT verilog functional simulation library
//    \ \/ /  \ \/ /     [Timestamp   ] Fri November 4 11:00:30 2022
//     \  /    \  /      [version     ] 1.9.10
//      \/      \/       
//
// ===========Oooo==========================================Oooo========


`timescale 1ns / 1ps

// MUX2
primitive mux2 (O, I0, I1, S);
output O;
input I0, I1, S;
table
// I0  I1  S     O
   0   ?   0  :  0 ;
   1   ?   0  :  1 ;
   x   ?   0  :  x ;
   ?   0   1  :  0 ;
   ?   1   1  :  1 ;
   ?   x   1  :  x ;
   0   0   x  :  0 ;
   0   1   x  :  x ;
   1   0   x  :  x ;
   1   1   x  :  1 ;
   ?   x   x  :  x ;
   x   ?   x  :  x ;
endtable
endprimitive

// MUXes
module MUX2 (O, I0, I1, S0);

input I0,I1;
input S0;
output O;

mux2 mux2_0 (O, I0, I1, S0);

endmodule //MUX2

module MUX2_LUT5 (O, I0, I1, S0);

input I0,I1;
input S0;
output O;

MUX2 mux2_lut5 (O, I0, I1, S0);

endmodule //MUX2 LUT_5: use two 4-input LUTs and 1 MUX2_LUT_5 to construct 5-input LUT

module MUX2_LUT6 (O, I0, I1, S0);

input I0,I1;
input S0;
output O;

MUX2 mux2_lut6 (O, I0, I1, S0);

endmodule //MUX2 LUT_6: use two 5-input LUTs and 1 MUX2_LUT_6 to construct 6-input LUT

module MUX2_LUT7 (O, I0, I1, S0);

input I0,I1;
input S0;
output O;

MUX2 mux2_lut7 (O, I0, I1, S0);

endmodule //MUX2 LUT_7: use two 6-input LUTs and 1 MUX2_LUT_7 to construct 7-input LUT

module MUX2_LUT8 (O, I0, I1, S0);

input I0,I1;
input S0;
output O;

MUX2 mux2_lut8 (O, I0, I1, S0);

endmodule //MUX2 LUT_8: use two 7-input LUTs and 1 MUX2_LUT_8 to construct 8-input LUT

module MUX2_MUX8(O, I0, I1, S0);

input I0,I1;
input S0;
output O;

MUX2 mux2_mux8 (O, I0, I1, S0);

endmodule // MUX2_MUX8:use two 4-input MUXs and 1 MUX2_MUX8's to construct 8-input mux

module MUX2_MUX16(O, I0, I1, S0);

input I0,I1;
input S0;
output O;

MUX2 mux2_mux16 (O, I0, I1, S0);

endmodule //MUX2_MUX16:use two 8-input MUXs and 1 MUX2_MUX8's to construct 16-input mux

module MUX2_MUX32(O, I0, I1, S0);

input I0,I1;
input S0;
output O;

MUX2 mux2_mux32 (O, I0, I1, S0);

endmodule //MUX2_MUX32:use two 16-input MUXs and 1 MUX2_MUX16's to construct 32-input mux

module MUX4 (O, I0, I1, I2, I3, S0, S1);

input I0, I1, I2, I3;
input S0, S1;
output O;

wire O1,O2;

MUX2 mux2_1(O1, I0, I1, S0);
MUX2 mux2_2(O2, I2, I3, S0);
MUX2 mux2_0(O, O1, O2, S1);

endmodule // MUX4

module MUX8 (O, I0, I1, I2, I3, I4, I5, I6, I7, S0, S1, S2);

input I0, I1, I2, I3, I4, I5, I6, I7;
input S0, S1, S2;
output O;

wire O1, O2;

MUX4 mux4_1(O1, I0, I1, I2, I3, S0, S1);
MUX4 mux4_2(O2, I4, I5, I6, I7, S0, S1);
MUX2 mux2_0(O, O1, O2, S2);

endmodule //MUX8


module MUX16(O, I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15, S0, S1, S2, S3);

input I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15;
input S0, S1, S2, S3;
output O;

wire O1, O2;

MUX8  mux8_1(O1, I0, I1, I2, I3, I4, I5, I6, I7, S0, S1, S2);
MUX8  mux8_2(O2, I8, I9, I10, I11, I12, I13, I14, I15, S0, S1, S2);

MUX2 mux2_o(O, O1, O2, S3);

endmodule


module MUX32(O, I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15,
				I16, I17, I18, I19, I20, I21, I22, I23, I24, I25, I26, I27, I28, I29, I30,
				I31, S0, S1, S2, S3, S4
    );
input I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15, I16, I17, I18, I19, I20, I21, I22, I23, I24, I25, I26, I27, I28, I29, I30, I31;
input S0, S1, S2, S3, S4;
output O;

wire O1, O2;

MUX16 mux16_1(O1, I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15, S0, S1, S2, S3);
MUX16 mux16_2(O2, I16, I17, I18, I19, I20, I21, I22, I23, I24, I25, I26, I27, I28, I29, I30, I31, S0, S1, S2, S3);

MUX2 mux2_o(O ,O1, O2, S4);

endmodule


//LUTs
module LUT1 (F, I0);

parameter INIT = 2'h0;

input I0;
output F;

MUX2 lut_1 (F, INIT[0], INIT[1], I0);

endmodule //lut1


module LUT2 (F, I0, I1);

parameter INIT = 4'h0;

input I0, I1;
output F;

MUX4 lut_2 (F, INIT[0], INIT[1], INIT[2], INIT[3], I0, I1);

endmodule //lut2


module LUT3 (F, I0, I1, I2);

parameter INIT = 8'h00;

input I0, I1, I2;
output F;

MUX8 lut_3 (F, INIT[0], INIT[1], INIT[2], INIT[3], INIT[4], INIT[5], INIT[6], INIT[7], I0, I1, I2);

endmodule //lut3


module LUT4 (F, I0, I1, I2, I3);

parameter INIT = 16'h0000;

input I0, I1, I2, I3;
output F;

MUX16 lut_4(F, INIT[0], INIT[1], INIT[2], INIT[3], INIT[4], INIT[5], INIT[6], INIT[7], INIT[8], INIT[9], INIT[10], INIT[11], INIT[12], INIT[13], INIT[14], INIT[15], I0, I1, I2, I3);

endmodule //lut4


module LUT5 (F, I0, I1, I2, I3, I4);

parameter INIT = 32'h00000000;

input I0, I1, I2, I3, I4;
output F;

MUX32 lut_5(F, INIT[0], INIT[1], INIT[2], INIT[3], INIT[4], INIT[5], INIT[6], INIT[7], INIT[8], INIT[9], INIT[10], INIT[11], INIT[12], INIT[13], INIT[14], INIT[15], INIT[16], INIT[17], INIT[18], INIT[19], INIT[20], INIT[21], INIT[22], INIT[23], INIT[24], INIT[25], INIT[26], INIT[27], INIT[28], INIT[29], INIT[30], INIT[31], I0, I1, I2, I3, I4);

endmodule//lut5


module LUT6 (F, I0, I1, I2, I3, I4, I5);

parameter INIT = 64'h0000_0000_0000_0000;

input I0, I1, I2, I3, I4, I5;
output F;

wire O1, O2;

defparam lut5_1.INIT = INIT[31:0];
LUT5 lut5_1(O1, I0, I1, I2, I3, I4);

defparam lut5_2.INIT = INIT[63:32];
LUT5 lut5_2(O2, I0, I1, I2, I3, I4);

MUX2 lut_6(F, O1, O2, I5);

endmodule//lut6


module LUT7 (F, I0, I1, I2, I3, I4, I5, I6);

parameter INIT = 128'h0000_0000_0000_0000_0000_0000_0000_0000;

input I0, I1, I2, I3, I4, I5, I6;
output F;

wire O1, O2;

defparam lut6_1.INIT = INIT[63:0];
LUT6 lut6_1(O1, I0, I1, I2, I3, I4, I5);

defparam lut6_2.INIT = INIT[127:64];
LUT6 lut6_2(O2, I0, I1, I2, I3, I4, I5);

MUX2 lut_7(F, O1, O2, I6);

endmodule//lut7


module LUT8 (F, I0, I1, I2, I3, I4, I5, I6, I7);

parameter INIT = 256'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000;

input I0, I1, I2, I3, I4, I5, I6, I7;
output F;

wire O1, O2;

defparam lut7_1.INIT = INIT[127:0];
LUT7 lut7_1(O1, I0, I1, I2, I3, I4, I5, I6);

defparam lut7_2.INIT = INIT[255:128];
LUT7 lut7_2(O2, I0, I1, I2, I3, I4, I5, I6);

MUX2 lut_8(F, O1, O2, I7);

endmodule//lut8


// ALU
module ALU (SUM, COUT, I0, I1, I3, CIN);

input I0;
input I1;
input I3;
input CIN;
output SUM;
output COUT;

parameter ADD = 0;
parameter SUB = 1;
parameter ADDSUB = 2;
parameter NE = 3;
parameter GE = 4;
parameter LE = 5;
parameter CUP = 6;
parameter CDN = 7;
parameter CUPCDN = 8;

parameter ALU_MODE = 0;

reg S, C;

assign SUM = S ^ CIN;
assign COUT = S? CIN : C;

always @(I0, I1, I3,CIN) begin
	case (ALU_MODE)
		ADD: begin // adder; LSB CIN must be 1'b0
			S = I0 ^ I1;
			C = I0;
		end
		SUB: begin // subtractor; LSB CIN must be 1'b1
			S = I0 ^ ~I1;
			C = I0;
		end
		ADDSUB: begin // adder subtractor;
			S = I3? I0 ^ I1 : I0 ^ ~I1;
			C = I0;
		end
		NE: begin // not equal to; LSB CIN must be 1'b0
			S = I0 ^ ~I1;
			C = 1'b1;
		end
		GE: begin // greater than or equal to; LSB CIN must be 1'b1
			S = I0 ^ ~I1;
			C = I0;
		end
		LE: begin // less than or equal to; LSB CIN must be 1'b1
			S = ~I0 ^ I1;
			C = I1;
		end
		CUP: begin // up counter; LSB CIN must be 1'b1
			S = I0;
			C = 1'b0; // or equivalently, I0
		end
		CDN: begin // down counter; LSB CIN must be 1'b0
			S = ~I0;
			C = 1'b1; // or equivalently, I0
		end
		CUPCDN: begin // up down counter; I3 as select bit - 1'b0: down counter, LSB CIN must be 1'b0; 1'b1: up counter, LSB CIN must be 1'b1
			S = I3? I0 : ~I0;
			C = I0;
		end
		default: begin
		//	$display ("%d: Unsupported ALU mode\n", ALU_PARAM);
		//	$finish;
		end
	endcase
end

endmodule // ALU: 2-input arithmetic logic unit


// Flip-Flops
module DFFSE (Q, D, CLK, CE, SET);

input D, CLK, SET, CE;
output Q;

parameter INIT = 1'b1;
reg Q_reg;
wire gsrt = GSR.GSRO;

initial Q_reg = INIT;

always @(gsrt)begin
	if(!gsrt)
		assign Q_reg = INIT;
	else
		deassign Q_reg;
end

always @(posedge CLK) begin
	if (SET)
		Q_reg <= 1'b1;
	else if (CE)
		Q_reg <= D;
end

assign Q = Q_reg;

endmodule // DFFSE (positive clock edge; synchronous set takes precedence over clock enable)


module DFFRE (Q, D, CLK, CE, RESET);

input D, CLK, RESET, CE;
output Q;

parameter INIT = 1'b0;
reg Q_reg;
wire gsrt = GSR.GSRO;

initial Q_reg = INIT;

always @(gsrt) begin
	if(!gsrt)
		assign Q_reg = INIT;
	else
		deassign Q_reg;
end

always @(posedge CLK) begin
	if (RESET)
		Q_reg <= 1'b0;
	else if (CE)
		Q_reg <= D;
end

assign Q = Q_reg;

endmodule // DFFRE (positive clock edge; synchronous reset takes precedence over clock enable)


module DFFPE (Q, D, CLK, CE, PRESET);

input D, CLK, PRESET, CE;
output Q;

parameter INIT = 1'b1;
reg Q_reg;
wire gsrt = GSR.GSRO;

initial Q_reg = INIT;

always @(gsrt or PRESET) begin
	if(!gsrt)
		assign Q_reg = INIT;
	else if(PRESET)
		assign Q_reg = 1'b1;
	else
		deassign Q_reg;
end

always @(posedge CLK) begin
	if (CE)
		Q_reg <= D;
end

assign Q = Q_reg;

endmodule // DFFPE (positive clock edge; asynchronous preset; clock enable)


module DFFCE (Q, D, CLK, CE, CLEAR);

input D, CLK, CLEAR, CE;
output Q;

parameter INIT = 1'b0;
reg Q_reg;
wire gsrt = GSR.GSRO;

initial Q_reg = INIT;

always @(gsrt or CLEAR) begin
	if(!gsrt)
		assign Q_reg = INIT;
	else if(CLEAR)
		assign Q_reg = 1'b0;
	else
		deassign Q_reg;
end

always @(posedge CLK) begin
	if (CE)
		Q_reg <= D;
end

assign Q = Q_reg;

endmodule // DFFCE (positive clock edge; asynchronous clear; clock enable)


//Latches
module DLCE (Q, D, G, GE, CLEAR);

input D, G, CLEAR, GE;
output Q;

parameter INIT = 1'b0;
reg Q_reg;
wire gsrt = GSR.GSRO;

initial Q_reg = INIT;

always @(D or G or CLEAR or GE or gsrt) begin
	if (!gsrt)
		Q_reg <= INIT;
	else if (CLEAR)
		Q_reg <= 1'b0;
	else if (G && GE)
		Q_reg <= D;
end

assign Q = Q_reg;

endmodule // DLCE (high active latch; asynchronous clear; latch enable)


module DLPE (Q, D, G, GE, PRESET);

input D, G, PRESET, GE;
output Q;

parameter INIT = 1'b1;
reg Q_reg;
wire gsrt = GSR.GSRO;

initial Q_reg = INIT;

always @(D or G or PRESET or GE or gsrt) begin
	if (!gsrt)
		Q_reg <= INIT;
	else if (PRESET)
		Q_reg <= 1'b1;
	else if (G && GE)
		Q_reg <= D;
end

assign Q = Q_reg;

endmodule // DLPE (high active latch; asynchronous preset; latch enable)


// RAM16S1
module RAM16S1 (DO, DI, AD, WRE, CLK);

input CLK;
input WRE;

input [3:0] AD;
input DI;
output DO;

parameter INIT_0 = 16'h0000;

reg [15:0] mem = INIT_0;

assign DO = mem [AD];

always @(posedge CLK) begin
	if (WRE) begin
	    mem [AD] <= DI;
	end
end

endmodule // RAM16S1: signal-port S-SRAM(16X1)

//RAM16S2
module RAM16S2 (DO, DI, AD, WRE, CLK);

input CLK;
input WRE;

input  [3:0] AD;
input  [1:0] DI;
output [1:0] DO;

parameter INIT_0 = 16'h0000;
parameter INIT_1 = 16'h0000;

reg [15:0] mem0;
reg [15:0] mem1;

initial begin
	mem0 = INIT_0;
	mem1 = INIT_1;
end

assign DO[0] = mem0[AD];
assign DO[1] = mem1[AD];

always @(posedge CLK) begin
	if (WRE) begin
		mem0[AD] <= DI[0];
		mem1[AD] <= DI[1];
	end
end

endmodule // RAM16S2: single-port S-SRAM(16X2)

//RAM16S4
module RAM16S4 (DO, DI, AD, WRE, CLK);

input CLK;
input WRE;

input [3:0] AD;
input [3:0] DI;
output [3:0] DO;

parameter INIT_0 = 16'h0000;
parameter INIT_1 = 16'h0000;
parameter INIT_2 = 16'h0000;
parameter INIT_3 = 16'h0000;

reg [15:0] mem0; 
reg [15:0] mem1;
reg [15:0] mem2;
reg [15:0] mem3;

initial begin
	mem0 = INIT_0;
	mem1 = INIT_1;
	mem2 = INIT_2;
	mem3 = INIT_3;	
end

assign	DO[0] = mem0[AD];
assign	DO[1] = mem1[AD];
assign	DO[2] = mem2[AD];
assign	DO[3] = mem3[AD];

always @(posedge CLK) begin
	if (WRE) begin
		mem0[AD] <= DI[0];
		mem1[AD] <= DI[1];
		mem2[AD] <= DI[2];
		mem3[AD] <= DI[3];
	end
end

endmodule // RAM16S4: single-port S-SRAM(16X4)

//RAM16SDP1
module RAM16SDP1 (DO, DI, WAD, RAD, WRE, CLK);

input CLK;
input WRE;
input [3:0] WAD;
input DI;
input [3:0] RAD;
output DO;

parameter INIT_0 = 16'h0000;

reg [15:0] mem;

initial mem = INIT_0;

assign DO = mem[RAD];

always @(posedge CLK) begin
	if (WRE)
		mem[WAD] <= DI;
end

endmodule // RAM16SDP1: Semi dual-port S-SRAM(16X1)

//RAM16SDP2
module RAM16SDP2 (DO, DI, WAD, RAD, WRE, CLK);

input CLK;
input WRE;
input [3:0] WAD;
input [1:0] DI;
input [3:0] RAD;
output [1:0] DO;

parameter INIT_0 = 16'h0000;
parameter INIT_1 = 16'h0000;

reg [15:0] mem0;
reg [15:0] mem1;

initial begin
	mem0 = INIT_0;
	mem1 = INIT_1;
end

assign DO[0] = mem0[RAD];
assign DO[1] = mem1[RAD];

always @(posedge CLK) begin
	if (WRE) begin
		mem0[WAD] <= DI[0];
		mem1[WAD] <= DI[1];
	end
end

endmodule // RAM16SDP2: Semi dual-port S-SRAM(16X2)

//RAM16SDP4
module RAM16SDP4 (DO, DI, WAD, RAD, WRE, CLK);

input CLK;
input WRE;

input [3:0] WAD;
input [3:0] DI;
input [3:0] RAD;
output [3:0] DO;

parameter INIT_0 = 16'h0000;
parameter INIT_1 = 16'h0000;
parameter INIT_2 = 16'h0000;
parameter INIT_3 = 16'h0000;

reg [15:0] mem0;
reg [15:0] mem1;
reg [15:0] mem2;
reg [15:0] mem3;

initial begin
	mem0 = INIT_0;
	mem1 = INIT_1;
	mem2 = INIT_2;
	mem3 = INIT_3;
end

assign DO[0] = mem0[RAD];
assign DO[1] = mem1[RAD];
assign DO[2] = mem2[RAD];
assign DO[3] = mem3[RAD];

always @(posedge CLK) begin
	if (WRE) begin
		mem0[WAD] <= DI[0];
		mem1[WAD] <= DI[1];
		mem2[WAD] <= DI[2];
		mem3[WAD] <= DI[3];
	end
end

endmodule // RAM16SDP4: Semi dual-port S-SRAM(16X4)

//ROM16
module ROM16 (DO, AD);

parameter INIT_0 = 16'h0000;

input [3:0] AD;
output DO;

reg DO;
reg [15:0] mem;

initial mem = INIT_0;

always @(AD) begin
	DO <= mem [AD];
end

endmodule // ROM16: signal-port shadow ROM(16 bit)

// Inverter
module INV (O, I);

input  I;
output O;

assign O = !I;
        
endmodule // inv


//Misc
module GND (G);

output G;

wire G;

assign G = 1'b0;

endmodule


module VCC (V);

output V;

wire V;

assign V = 1'b1;

endmodule


module GSR (GSRI);

input GSRI;

wire GSRO;

assign GSRO = GSRI;

endmodule //GSR (global set/reset control)


//IOBs
module IBUF (O, I);

input  I;
output O;

buf IB (O, I);
        
endmodule //IBUF (input buffer)


module OBUF (O, I);

input  I;
output O;

buf OB (O, I);
    
endmodule //OBUF (output buffer)


module TBUF (O, I, OEN);

input I, OEN;
output O;

bufif0 TB (O, I, OEN); 

endmodule // TBUF (output buffer with tri-state control)


module IOBUF (O, IO, I, OEN);

input I,OEN;
output O;
inout IO;

buf OB (O, IO);
bufif0 IB (IO,I,OEN);
 
endmodule //IOBUF (inout buffer)

//TRUE LVDS 
module TLVDS_IBUF (O, I, IB);
output O;
input  I, IB;
reg O_oreg;
assign O = O_oreg;
always @(I or IB) begin
	if (I == 1'b1 && IB == 1'b0)
		O_oreg <= I;
	else if (I == 1'b0 && IB == 1'b1)
		O_oreg <= I;
    else if (I == 1'bx || IB == 1'bx)
		O_oreg <= 1'bx;
end
endmodule

module TLVDS_OBUF (O, OB, I);
output O, OB;
input  I;
supply0 gst;

bufif0 TB (O, I, gst);
notif0 YB (OB, I, gst);
endmodule

module TLVDS_TBUF (O, OB, I, OEN);
output O, OB;
input  I, OEN;
bufif0 TB (O, I, OEN);
notif0 YB (OB, I, OEN);
endmodule

module TLVDS_IOBUF (O, IO, IOB, I, OEN);
output   O;
inout IO, IOB;
input I, OEN;
reg O;
bufif0 IB (IO, I, OEN);
notif0 YB (IOB, I, OEN);
always @(IO or IOB) begin
    if (IO == 1'b1 && IOB == 1'b0)
        O <= IO;
    else if (IO == 1'b0 && IOB == 1'b1)
        O <= IO;
    else if (IO == 1'bx || IOB == 1'bx)
        O <= 1'bx;
end
endmodule

//emulated LVDS 

module ELVDS_OBUF (O, OB, I);
output O, OB;
input  I;
supply0 gst;

bufif0 TB (O, I, gst);
notif0 YB (OB, I, gst);
endmodule

module ELVDS_TBUF (O, OB, I, OEN);
output O, OB;
input  I, OEN;
bufif0 TB (O, I, OEN);
notif0 YB (OB, I, OEN);
endmodule

module ELVDS_IOBUF (O, IO, IOB, I, OEN);
output   O;
inout IO, IOB;
input I, OEN;
reg O;
bufif0 IB (IO, I, OEN);
notif0 YB (IOB, I, OEN);
always @(IO or IOB) begin
        if (IO == 1'b1 && IOB == 1'b0)
            O <= IO;
        else if (IO == 1'b0 && IOB == 1'b1)
            O <= IO;
        else if (IO == 1'bx || IOB == 1'bx)
            O <= 1'bx;
end
endmodule


//MIPI_IBUF
//BUF for mipi input
module MIPI_IBUF (OH, OL, OB, IO, IOB, I, IB, OEN, OENB, HSEN, HSREN);
output OH, OL, OB;
inout IO, IOB;
input  I, IB;
input OEN, OENB;
input HSEN, HSREN;
reg OH;

//LP mode
bufif0 IL_INST (IO,I,OEN);
bufif0 IB_INST (IOB,IB,OENB);

assign OL = IO;
assign OB = IOB;

//HS mode
always @(IO or IOB or HSEN)
begin
    if(HSEN)
    begin
        if (IO == 1'b1 && IOB == 1'b0)
        begin
		    OH <= IO;
        end else if (IO == 1'b0 && IOB == 1'b1) 
        begin
		    OH <= IO;
        end else if (IO == 1'bx || IOB == 1'bx) 
        begin
		    OH <= 1'bx;
        end
    end
end

endmodule

//OBUF for mipi output, gw5a-25
module MIPI_OBUF_A (O, OB, I, IB, IL, MODESEL);
output O, OB;
input  I, IB, IL, MODESEL;

bufif1  (O, I, MODESEL); //HS mode
notif1  (OB, I, MODESEL);

bufif0  (O, IL, MODESEL); //LP mode
bufif0  (OB, IB, MODESEL);

endmodule


//IBUF with ODT
module IBUF_R (O, I, RTEN);

input  I;
input RTEN;
output O;

buf IB (O, I);
        
endmodule

//IOBUF with ODT
module IOBUF_R (O, IO, I, OEN, RTEN);

input I,OEN;
input RTEN;
output O;
inout IO;

buf OB (O, IO);
bufif0 IB (IO,I,OEN);
    
endmodule 


//ELVDS_IOBUF with ODT
module ELVDS_IOBUF_R (O, IO, IOB, I, OEN, RTEN);
output  O;
inout IO, IOB;
input I, OEN;
input RTEN;
reg O;
bufif0 IB (IO, I, OEN);
notif0 YB (IOB, I, OEN);
always @(IO or IOB) begin
        if (IO == 1'b1 && IOB == 1'b0)
            O <= IO;
        else if (IO == 1'b0 && IOB == 1'b1)
            O <= IO;
        else if (IO == 1'bx || IOB == 1'bx)
            O <= 1'bx;
end
endmodule


//IOBUF for I3C mode
module I3C_IOBUF (O, IO, I, MODESEL);
output O;
inout IO;
input  I, MODESEL;
reg oreg;

buf OB (O, IO);

always @(I or MODESEL) begin
    if(MODESEL == 1'b1) begin //open-drain mode
        if(I == 1'b0) begin //pull down
            oreg <= 1'b0;
        end else begin //floating
            oreg <= 1'bz;
        end
    end else begin //normal mode
        oreg <= I;
    end
end

assign IO = oreg;

endmodule

//tlvds ibuf for ADC bank1 voltage signal source dynamic selection,GW5A-25
//tlvds ibuf for ADC bank2/3/6/7 voltage signal source dynamic selection,GW5AT-138B
module TLVDS_IBUF_ADC(I, IB, ADCEN);
input I, IB;
input ADCEN;

endmodule


//Block SRAM
module SP (DO, DI, BLKSEL, AD, WRE, CLK, CE, OCE, RESET);

parameter READ_MODE = 1'b0; // 1'b0: bypass mode; 1'b1: pipeline mode
parameter WRITE_MODE = 2'b00; // 2'b00: normal mode; 2'b01: write-through mode; 2'b10: read-before-write mode
parameter BIT_WIDTH = 32; // 1, 2, 4, 8, 16, 32
parameter BLK_SEL = 3'b000;
parameter RESET_MODE = "SYNC"; // SYNC, ASYNC
parameter INIT_RAM_00 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_01 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_02 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_03 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_04 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_05 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_06 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_07 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_08 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_09 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_10 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_11 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_12 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_13 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_14 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_15 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_16 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_17 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_18 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_19 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_20 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_21 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_22 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_23 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_24 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_25 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_26 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_27 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_28 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_29 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_30 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_31 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_32 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_33 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_34 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_35 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_36 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_37 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_38 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_39 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
input CLK, CE;
input OCE; // clock enable of memory output register
input RESET; // resets output registers, not memory contents
input WRE; // 1'b0: read enabled; 1'b1: write enabled
input [13:0] AD;
input [31:0] DI;
input [2:0] BLKSEL;
output [31:0] DO;

reg [31:0] pl_reg,pl_reg_async,pl_reg_sync;
reg [31:0] bp_reg,bp_reg_async,bp_reg_sync;
reg bs_en;
wire pce;
reg [16383:0] ram_MEM = {INIT_RAM_3F, INIT_RAM_3E, INIT_RAM_3D, INIT_RAM_3C,INIT_RAM_3B, INIT_RAM_3A, INIT_RAM_39, INIT_RAM_38,INIT_RAM_37, INIT_RAM_36, INIT_RAM_35, INIT_RAM_34,INIT_RAM_33, INIT_RAM_32, INIT_RAM_31, INIT_RAM_30,INIT_RAM_2F, INIT_RAM_2E, INIT_RAM_2D, INIT_RAM_2C,INIT_RAM_2B, INIT_RAM_2A, INIT_RAM_29, INIT_RAM_28,INIT_RAM_27, INIT_RAM_26, INIT_RAM_25, INIT_RAM_24,INIT_RAM_23, INIT_RAM_22, INIT_RAM_21, INIT_RAM_20,INIT_RAM_1F, INIT_RAM_1E, INIT_RAM_1D, INIT_RAM_1C,INIT_RAM_1B, INIT_RAM_1A, INIT_RAM_19, INIT_RAM_18,INIT_RAM_17, INIT_RAM_16, INIT_RAM_15, INIT_RAM_14,INIT_RAM_13, INIT_RAM_12, INIT_RAM_11, INIT_RAM_10,INIT_RAM_0F, INIT_RAM_0E, INIT_RAM_0D, INIT_RAM_0C, INIT_RAM_0B, INIT_RAM_0A, INIT_RAM_09, INIT_RAM_08,INIT_RAM_07, INIT_RAM_06, INIT_RAM_05, INIT_RAM_04,INIT_RAM_03, INIT_RAM_02, INIT_RAM_01, INIT_RAM_00};
reg [BIT_WIDTH-1:0] mem_t;
reg mc;
reg [13:0] addr;
integer dwidth = BIT_WIDTH;
integer awidth; // ADDR_WIDTH
wire grstn = GSR.GSRO;

initial begin
    bp_reg = 0;
    pl_reg = 0;
    bp_reg_async = 0;
    bp_reg_sync = 0;
    pl_reg_async = 0;
    pl_reg_sync = 0;
    mc = 1'b0;
end

initial begin
	case(dwidth)
		1: awidth = 14;
		2: awidth = 13;
		4: awidth = 12;
		8: awidth = 11;
		16: awidth = 10;
		32: awidth = 9;
		default: begin
		//	$display ("%d: Unsupported data width\n", dwidth);
		//	$finish;
		end
	endcase
end

assign DO = (READ_MODE == 1'b0)? bp_reg : pl_reg;

assign pce = CE && bs_en && grstn;   
always @ (BLKSEL)
begin
	if(BLKSEL == BLK_SEL) begin
		bs_en = 1;
	end else begin
		bs_en = 0;
	end
end

always@(awidth,AD,WRE,mc)begin
	if(awidth==14)begin
		addr[13:0] = AD[13:0];
		mem_t[0] =ram_MEM[addr];
	end
	else if(awidth==13)begin
		addr[13:0] = {AD[13:1],1'b0};
		mem_t[1:0] ={ram_MEM[addr+1],ram_MEM[addr]};
	end
	else if(awidth==12)begin
		addr[13:0] = {AD[13:2],2'b00};
		mem_t[3:0] ={ram_MEM[addr+3],ram_MEM[addr+2],ram_MEM[addr+1],ram_MEM[addr]};
	end
	else if(awidth==11)begin
		addr[13:0] = {AD[13:3],3'b000};
		mem_t[7:0] ={ram_MEM[addr+7],ram_MEM[addr+6],ram_MEM[addr+5],ram_MEM[addr+4],ram_MEM[addr+3],ram_MEM[addr+2],ram_MEM[addr+1],ram_MEM[addr]};
	end
	else if(awidth==10)begin
		addr[13:0] = {AD[13:4],4'b0000};
		mem_t[15:0] ={ram_MEM[addr+15],ram_MEM[addr+14],ram_MEM[addr+13],ram_MEM[addr+12],ram_MEM[addr+11],ram_MEM[addr+10],ram_MEM[addr+9],ram_MEM[addr+8],ram_MEM[addr+7],ram_MEM[addr+6],ram_MEM[addr+5],ram_MEM[addr+4],ram_MEM[addr+3],ram_MEM[addr+2],ram_MEM[addr+1],ram_MEM[addr]};
	end
	else if(awidth==9)begin
		addr[13:0] = {AD[13:5],5'b00000};
		mem_t[31:0]={ram_MEM[addr+31],ram_MEM[addr+30],ram_MEM[addr+29],ram_MEM[addr+28],ram_MEM[addr+27],ram_MEM[addr+26],ram_MEM[addr+25],ram_MEM[addr+24],ram_MEM[addr+23],ram_MEM[addr+22],ram_MEM[addr+21],ram_MEM[addr+20],ram_MEM[addr+19],ram_MEM[addr+18],ram_MEM[addr+17],ram_MEM[addr+16],ram_MEM[addr+15],ram_MEM[addr+14],ram_MEM[addr+13],ram_MEM[addr+12],ram_MEM[addr+11],ram_MEM[addr+10],ram_MEM[addr+9],ram_MEM[addr+8],ram_MEM[addr+7],ram_MEM[addr+6],ram_MEM[addr+5],ram_MEM[addr+4],ram_MEM[addr+3],ram_MEM[addr+2],ram_MEM[addr+1],ram_MEM[addr]};
	end
end

//write and read
always @(posedge CLK) begin
	if (pce) begin
    	if(WRE) begin
		    if(dwidth==1)
			    ram_MEM[addr] <= DI[0];
			else if(dwidth==2)
				{ram_MEM[addr+1],ram_MEM[addr]}<=DI[BIT_WIDTH-1:0];
			else if(dwidth==4)
				{ram_MEM[addr+3],ram_MEM[addr+2],ram_MEM[addr+1],ram_MEM[addr]}<=DI[BIT_WIDTH-1:0];
			else if(dwidth==8)
				{ram_MEM[addr+7],ram_MEM[addr+6],ram_MEM[addr+5],ram_MEM[addr+4],ram_MEM[addr+3],ram_MEM[addr+2],ram_MEM[addr+1],ram_MEM[addr]}<=DI[7:0];

			else if(dwidth==16) begin
				if(AD[0] == 1'b1)
					{ram_MEM[addr+7],ram_MEM[addr+6],ram_MEM[addr+5],ram_MEM[addr+4],ram_MEM[addr+3],ram_MEM[addr+2],ram_MEM[addr+1],ram_MEM[addr]} <= DI[7:0];
				if(AD[1] == 1'b1)
					{ram_MEM[addr+15],ram_MEM[addr+14],ram_MEM[addr+13],ram_MEM[addr+12],ram_MEM[addr+11],ram_MEM[addr+10],ram_MEM[addr+9],ram_MEM[addr+8]} <= DI[15:8];
			end
			else if(dwidth==32) begin
				if(AD[0] == 1'b1)
					{ram_MEM[addr+7],ram_MEM[addr+6],ram_MEM[addr+5],ram_MEM[addr+4],ram_MEM[addr+3],ram_MEM[addr+2],ram_MEM[addr+1],ram_MEM[addr]}<=DI[7:0];
				if(AD[1] == 1'b1)
					{ram_MEM[addr+15],ram_MEM[addr+14],ram_MEM[addr+13],ram_MEM[addr+12],ram_MEM[addr+11],ram_MEM[addr+10],ram_MEM[addr+9],ram_MEM[addr+8]}<=DI[15:8];
				if(AD[2] == 1'b1)
					{ram_MEM[addr+23],ram_MEM[addr+22],ram_MEM[addr+21],ram_MEM[addr+20],ram_MEM[addr+19],ram_MEM[addr+18],ram_MEM[addr+17],ram_MEM[addr+16]} <= DI[23:16];	
				if(AD[3] == 1'b1)
					{ram_MEM[addr+31],ram_MEM[addr+30],ram_MEM[addr+29],ram_MEM[addr+28],ram_MEM[addr+27],ram_MEM[addr+26],ram_MEM[addr+25],ram_MEM[addr+24]} <= DI[31:24];	
			end
		    mc <= ~mc;
        end
	end
end	

always @ (bp_reg_async or bp_reg_sync or pl_reg_async or pl_reg_sync) begin
    if(RESET_MODE == "ASYNC") begin
        bp_reg <= bp_reg_async;
        pl_reg <= pl_reg_async;
    end
    else begin
        bp_reg <= bp_reg_sync;
        pl_reg <= pl_reg_sync;
    end
end

always @(posedge CLK or posedge RESET or negedge grstn) begin
    if(!grstn) begin
		bp_reg_async <= 0;   
    end else if (RESET) begin
		bp_reg_async <= 0;
	end else begin
		if (pce) begin
    	    if(WRE) begin
				if (WRITE_MODE == 2'b01) begin
					bp_reg_async[BIT_WIDTH-1:0] <= mem_t[BIT_WIDTH-1:0];
                    if(dwidth <= 8) begin
					    bp_reg_async[BIT_WIDTH-1:0] <= DI[BIT_WIDTH-1:0]; 
                    end else if(dwidth==16) begin
						if(AD[0] == 1'b1)
							bp_reg_async[7:0] <= DI[7:0];
						if(AD[1] == 1'b1)
                            bp_reg_async[15:8] <= DI[15:8];
				    end else if(dwidth==32) begin
						if(AD[0] == 1'b1)
                            bp_reg_async[7:0]  <= DI[7:0];
						if(AD[1] == 1'b1)
                            bp_reg_async[15:8] <= DI[15:8];
						if(AD[2] == 1'b1)
                            bp_reg_async[23:16] <= DI[23:16];
						if(AD[3] == 1'b1)
                            bp_reg_async[31:24] <= DI[31:24];
			        end
				end

				if (WRITE_MODE == 2'b10) begin
					bp_reg_async[BIT_WIDTH-1:0] <= mem_t[BIT_WIDTH-1:0];
				end
				
			end else begin // WRE==0, read
				bp_reg_async[BIT_WIDTH-1:0] <= mem_t[BIT_WIDTH-1:0];
			end
		end
	end
end	

always @(posedge CLK or negedge grstn) begin
    if(!grstn) begin
		bp_reg_sync <= 0;   
    end else if (RESET) begin
		bp_reg_sync <= 0;
	end else begin
		if (pce) begin
    	    if(WRE) begin	
				if (WRITE_MODE == 2'b01) begin
					bp_reg_sync[BIT_WIDTH-1:0] <= mem_t[BIT_WIDTH-1:0];
                    if(dwidth <= 8) begin
					    bp_reg_sync[BIT_WIDTH-1:0] <= DI[BIT_WIDTH-1:0];                       
                    end else if(dwidth==16) begin
						if(AD[0] == 1'b1)
							bp_reg_sync[7:0] <= DI[7:0];
						if(AD[1] == 1'b1)
                            bp_reg_sync[15:8] <= DI[15:8];                        
				    end else if(dwidth==32) begin
						if(AD[0] == 1'b1)
                            bp_reg_sync[7:0]  <= DI[7:0];
						if(AD[1] == 1'b1)
                            bp_reg_sync[15:8] <= DI[15:8];
						if(AD[2] == 1'b1)
                            bp_reg_sync[23:16] <= DI[23:16];	
						if(AD[3] == 1'b1)
                            bp_reg_sync[31:24] <= DI[31:24];
			        end
				end

				if (WRITE_MODE == 2'b10) begin
					bp_reg_sync[BIT_WIDTH-1:0] <= mem_t[BIT_WIDTH-1:0];
				end
				
			end else begin // WRE==0, read
				bp_reg_sync[BIT_WIDTH-1:0] <= mem_t[BIT_WIDTH-1:0];
			end
		end
	end
end	

always @(posedge CLK or posedge RESET or negedge grstn) begin
	if(!grstn) begin
		pl_reg_async <= 0;
    end else if (RESET) begin
		pl_reg_async <= 0;
	end else begin
		if(OCE) begin
			pl_reg_async <= bp_reg;
		end
	end
end

always @(posedge CLK or negedge grstn) begin
	if(!grstn) begin
		pl_reg_sync <= 0;
    end else if (RESET) begin
		pl_reg_sync <= 0;
	end else begin
		if(OCE) begin
			pl_reg_sync <= bp_reg;
		end
	end
end	

endmodule  // SP: single port 16k Block SRAM

//SPX9
module SPX9 (DO, DI, BLKSEL, AD, WRE, CLK, CE, OCE, RESET);

parameter READ_MODE = 1'b0; // 1'b0: bypass mode; 1'b1: pipeline mode
parameter WRITE_MODE = 2'b00; // 2'b00: normal mode; 2'b01: write-through mode; 2'b10: read-before-write mode
parameter BIT_WIDTH = 36; // 9, 18, 36
parameter BLK_SEL = 3'b000;
parameter RESET_MODE = "SYNC"; // SYNC, ASYNC
parameter INIT_RAM_00 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000; 
parameter INIT_RAM_01 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_02 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_03 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_04 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_05 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_06 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_07 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_08 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_09 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0A = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0B = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0C = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0D = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0E = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0F = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_10 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_11 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_12 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_13 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_14 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_15 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_16 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_17 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_18 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_19 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1A = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1B = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1C = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1D = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1E = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1F = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_20 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_21 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_22 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_23 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_24 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_25 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_26 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_27 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_28 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_29 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2A = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2B = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2C = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2D = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2E = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2F = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_30 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_31 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_32 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_33 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_34 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_35 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_36 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_37 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_38 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_39 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3A = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3B = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3C = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3D = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3E = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3F = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;

input CLK, CE;
input OCE; // clock enable of memory output register
input RESET; // resets output registers, not memory contents
input WRE; // 1'b0: read enabled; 1'b1: write enabled
input [2:0] BLKSEL;
input [13:0] AD;
input [35:0] DI;
output [35:0] DO;

reg [35:0] pl_reg,pl_reg_async,pl_reg_sync;
reg [35:0] bp_reg,bp_reg_async,bp_reg_sync;
reg [18431:0] ram_MEM = {INIT_RAM_3F, INIT_RAM_3E, INIT_RAM_3D, INIT_RAM_3C,INIT_RAM_3B, INIT_RAM_3A, INIT_RAM_39, INIT_RAM_38,INIT_RAM_37, INIT_RAM_36, INIT_RAM_35, INIT_RAM_34,INIT_RAM_33, INIT_RAM_32, INIT_RAM_31, INIT_RAM_30,INIT_RAM_2F, INIT_RAM_2E, INIT_RAM_2D, INIT_RAM_2C,INIT_RAM_2B, INIT_RAM_2A, INIT_RAM_29, INIT_RAM_28,INIT_RAM_27, INIT_RAM_26, INIT_RAM_25, INIT_RAM_24,INIT_RAM_23, INIT_RAM_22, INIT_RAM_21, INIT_RAM_20,INIT_RAM_1F, INIT_RAM_1E, INIT_RAM_1D, INIT_RAM_1C,INIT_RAM_1B, INIT_RAM_1A, INIT_RAM_19, INIT_RAM_18,INIT_RAM_17, INIT_RAM_16, INIT_RAM_15, INIT_RAM_14,INIT_RAM_13, INIT_RAM_12, INIT_RAM_11, INIT_RAM_10,INIT_RAM_0F, INIT_RAM_0E, INIT_RAM_0D, INIT_RAM_0C, INIT_RAM_0B, INIT_RAM_0A, INIT_RAM_09, INIT_RAM_08,INIT_RAM_07, INIT_RAM_06, INIT_RAM_05, INIT_RAM_04,INIT_RAM_03, INIT_RAM_02, INIT_RAM_01, INIT_RAM_00} ;
reg [BIT_WIDTH-1:0] mem_t;
reg [14:0] addr;
reg mc,bs_en;
wire pce;
wire grstn = GSR.GSRO;

integer dwidth = BIT_WIDTH;
integer awidth; // ADDR_WIDTH

initial begin
    bp_reg = 0;
    pl_reg = 0;
    bp_reg_async = 0;
    bp_reg_sync = 0;
    pl_reg_async = 0;
    pl_reg_sync = 0;
    mc = 1'b0;
end

initial begin
	case(dwidth)
		9: awidth = 11;
		18: awidth = 10;
		36: awidth = 9;
		default: begin
		//	$display ("%d: Unsupported data width\n", dwidth);
		//	$finish;
		end
	endcase
end

assign DO = (READ_MODE == 1'b0)? bp_reg : pl_reg;

assign pce = CE && bs_en && grstn;   
always @ (BLKSEL)
begin
	if(BLKSEL == BLK_SEL) begin
		bs_en = 1;
	end else begin
		bs_en = 0;
	end  	
end

always@(AD,awidth,WRE,mc)begin
	if(awidth==11)begin
		addr[14:0] = AD[13:3]*dwidth;
		mem_t[8:0] = {ram_MEM[addr+8],ram_MEM[addr+7],ram_MEM[addr+6],ram_MEM[addr+5],ram_MEM[addr+4],ram_MEM[addr+3],ram_MEM[addr+2],ram_MEM[addr+1],ram_MEM[addr]};
	end
	else if(awidth==10)begin
		addr[14:0] = AD[13:4]*dwidth;
		mem_t[17:0] = {ram_MEM[addr+17],ram_MEM[addr+16],ram_MEM[addr+15],ram_MEM[addr+14],ram_MEM[addr+13],ram_MEM[addr+12],ram_MEM[addr+11],ram_MEM[addr+10],ram_MEM[addr+9],ram_MEM[addr+8],ram_MEM[addr+7],ram_MEM[addr+6],ram_MEM[addr+5],ram_MEM[addr+4],ram_MEM[addr+3],ram_MEM[addr+2],ram_MEM[addr+1],ram_MEM[addr]};	
	end
	else if(awidth==9)begin
		addr[14:0] = AD[13:5]*dwidth;
		mem_t[35:0]={ram_MEM[addr+35],ram_MEM[addr+34],ram_MEM[addr+33],ram_MEM[addr+32],ram_MEM[addr+31],ram_MEM[addr+30],ram_MEM[addr+29],ram_MEM[addr+28],ram_MEM[addr+27],ram_MEM[addr+26],ram_MEM[addr+25],ram_MEM[addr+24],ram_MEM[addr+23],ram_MEM[addr+22],ram_MEM[addr+21],ram_MEM[addr+20],ram_MEM[addr+19],ram_MEM[addr+18],ram_MEM[addr+17],ram_MEM[addr+16],ram_MEM[addr+15],ram_MEM[addr+14],ram_MEM[addr+13],ram_MEM[addr+12],ram_MEM[addr+11],ram_MEM[addr+10],ram_MEM[addr+9],ram_MEM[addr+8],ram_MEM[addr+7],ram_MEM[addr+6],ram_MEM[addr+5],ram_MEM[addr+4],ram_MEM[addr+3],ram_MEM[addr+2],ram_MEM[addr+1],ram_MEM[addr]};	

	end
end

// write and read
always @(posedge CLK) begin
	if (pce) begin
		if (WRE) begin		
			if (dwidth == 9)
				{ram_MEM [addr+8],ram_MEM [addr+7], ram_MEM [addr+6], ram_MEM [addr+5], ram_MEM [addr+4], ram_MEM [addr+3], ram_MEM [addr+2], ram_MEM [addr+1], ram_MEM [addr]} <= DI[8:0];
			else if(dwidth == 18) begin
				if(AD[0] == 1'b1)
					{ram_MEM [addr+8],ram_MEM [addr+7], ram_MEM [addr+6], ram_MEM [addr+5], ram_MEM [addr+4], ram_MEM [addr+3], ram_MEM [addr+2], ram_MEM [addr+1], ram_MEM [addr]} <= DI[8:0];
				if(AD[1] == 1'b1)
					{ram_MEM [addr+17],ram_MEM [addr+16], ram_MEM [addr+15], ram_MEM [addr+14], ram_MEM [addr+13], ram_MEM [addr+12], ram_MEM [addr+11], ram_MEM [addr+10], ram_MEM [addr+9]} <= DI[17:9];					
			end
			else if(dwidth == 36) begin
				if(AD[0] == 1'b1)
					{ram_MEM [addr+8],ram_MEM [addr+7], ram_MEM [addr+6], ram_MEM [addr+5], ram_MEM [addr+4], ram_MEM [addr+3], ram_MEM [addr+2], ram_MEM [addr+1], ram_MEM [addr]} <= DI[8:0];
				if(AD[1] == 1'b1)
					{ram_MEM [addr+17],ram_MEM [addr+16], ram_MEM [addr+15], ram_MEM [addr+14], ram_MEM [addr+13], ram_MEM [addr+12], ram_MEM [addr+11], ram_MEM [addr+10], ram_MEM [addr+9]} <= DI[17:9];
				if(AD[2] == 1'b1)
					{ram_MEM [addr+26],ram_MEM [addr+25], ram_MEM [addr+24], ram_MEM [addr+23], ram_MEM [addr+22], ram_MEM [addr+21], ram_MEM [addr+20], ram_MEM [addr+19], ram_MEM [addr+18]} <= DI[26:18];
				if(AD[3] == 1'b1)
					{ram_MEM [addr+35],ram_MEM [addr+34], ram_MEM [addr+33], ram_MEM [addr+32], ram_MEM [addr+31], ram_MEM [addr+30], ram_MEM [addr+29], ram_MEM [addr+28], ram_MEM [addr+27]} <= DI[35:27];
			end
			mc <= ~mc;
		end
	end
end

always @ (bp_reg_async or bp_reg_sync or pl_reg_async or pl_reg_sync) begin
    if(RESET_MODE == "ASYNC") begin
        bp_reg <= bp_reg_async;
        pl_reg <= pl_reg_async;
    end
    else begin
        bp_reg <= bp_reg_sync;
        pl_reg <= pl_reg_sync;
    end
end

always @(posedge CLK or posedge RESET or negedge grstn) begin
	if (!grstn) begin
		bp_reg_async <= 0;
	end else if (RESET) begin
		bp_reg_async <= 0;
	end else begin
		if (pce) begin
			if (WRE) begin
				if (WRITE_MODE == 2'b01) begin
					bp_reg_async[BIT_WIDTH-1:0] <= mem_t[BIT_WIDTH-1:0];
                    if(dwidth == 9) begin
					    bp_reg_async[BIT_WIDTH-1:0] <= DI[BIT_WIDTH-1:0];                       
                    end else if(dwidth==18) begin
						if(AD[0] == 1'b1)
							bp_reg_async[8:0] <= DI[8:0];
						if(AD[1] == 1'b1)
                            bp_reg_async[17:9] <= DI[17:9];                        
				    end else if(dwidth==36) begin
						if(AD[0] == 1'b1)
                            bp_reg_async[8:0]  <= DI[8:0];
						if(AD[1] == 1'b1)
                            bp_reg_async[17:9] <= DI[17:9];
						if(AD[2] == 1'b1)
                            bp_reg_async[26:18] <= DI[26:18];	
						if(AD[3] == 1'b1)
                            bp_reg_async[35:27] <= DI[35:27];
			        end

				end
				if (WRITE_MODE == 2'b10) begin
					bp_reg_async[BIT_WIDTH-1:0] <= mem_t[BIT_WIDTH-1:0];
				end				
	
			end else begin // WRE==0, read
				bp_reg_async[BIT_WIDTH-1:0] <= mem_t[BIT_WIDTH-1:0];
			end
		end
	end
end

always @(posedge CLK or negedge grstn) begin
	if (!grstn) begin
		bp_reg_sync <= 0;
	end else if (RESET) begin
		bp_reg_sync <= 0;
	end else begin
		if (pce) begin
			if (WRE) begin
				if (WRITE_MODE == 2'b01) begin
					bp_reg_sync[BIT_WIDTH-1:0] <= mem_t[BIT_WIDTH-1:0];
                    if(dwidth == 9) begin
					    bp_reg_sync[BIT_WIDTH-1:0] <= DI[BIT_WIDTH-1:0];
                    end else if(dwidth==18) begin
						if(AD[0] == 1'b1)
							bp_reg_sync[8:0] <= DI[8:0];
						if(AD[1] == 1'b1)
                            bp_reg_sync[17:9] <= DI[17:9];                        
				    end else if(dwidth==36) begin
						if(AD[0] == 1'b1)
                            bp_reg_sync[8:0]  <= DI[8:0];
						if(AD[1] == 1'b1)
                            bp_reg_sync[17:9] <= DI[17:9];
						if(AD[2] == 1'b1)
                            bp_reg_sync[26:18] <= DI[26:18];	
						if(AD[3] == 1'b1)
                            bp_reg_sync[35:27] <= DI[35:27];
			        end

				end
				if (WRITE_MODE == 2'b10) begin
					bp_reg_sync[BIT_WIDTH-1:0] <= mem_t[BIT_WIDTH-1:0];
				end				
	
			end else begin // WRE==0, read
				bp_reg_sync[BIT_WIDTH-1:0] <= mem_t[BIT_WIDTH-1:0];
			end
		end
	end
end


always @(posedge CLK or posedge RESET or negedge grstn) begin
	if (!grstn) begin
		pl_reg_async <= 0;
	end else if (RESET) begin
		pl_reg_async <= 0;
	end else begin
		if(OCE) begin
			pl_reg_async <= bp_reg;
		end
	end
end

always @(posedge CLK or negedge grstn) begin
	if (!grstn) begin
		pl_reg_sync <= 0;
	end else if (RESET) begin
		pl_reg_sync <= 0;
	end else begin
		if(OCE) begin
			pl_reg_sync <= bp_reg;
		end
	end
end

endmodule // SPX9: single port 18k Block SRAM


//SDPB
module SDPB (DO, DI, BLKSELA, BLKSELB, ADA, ADB, CLKA, CLKB, CEA, CEB, OCE, RESET);

parameter READ_MODE = 1'b0; // 1'b0: bypass mode; 1'b1: pipeline mode
parameter BIT_WIDTH_0 = 32; // 1, 2, 4, 8, 16, 32
parameter BIT_WIDTH_1 = 32; // 1, 2, 4, 8, 16, 32
parameter BLK_SEL_0 = 3'b000;
parameter BLK_SEL_1 = 3'b000;
parameter RESET_MODE = "SYNC"; //SYNC,ASYNC
parameter INIT_RAM_00 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_01 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_02 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_03 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_04 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_05 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_06 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_07 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_08 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_09 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_10 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_11 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_12 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_13 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_14 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_15 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_16 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_17 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_18 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_19 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_20 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_21 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_22 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_23 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_24 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_25 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_26 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_27 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_28 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_29 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_30 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_31 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_32 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_33 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_34 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_35 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_36 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_37 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_38 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_39 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3F = 256'h0000000000000000000000000000000000000000000000000000000000000000;

input CLKA, CEA, CLKB, CEB;
input OCE; // clock enable of memory output register
input RESET; // resets output registers, not memory contents
input [13:0] ADA, ADB;
input [31:0] DI;
input [2:0] BLKSELA, BLKSELB;
output [31:0] DO;

reg [31:0] pl_reg,pl_reg_async,pl_reg_sync;
reg [31:0] bp_reg,bp_reg_async,bp_reg_sync;
reg [16383:0] ram_MEM ={INIT_RAM_3F, INIT_RAM_3E, INIT_RAM_3D, INIT_RAM_3C,INIT_RAM_3B, INIT_RAM_3A, INIT_RAM_39, INIT_RAM_38,INIT_RAM_37, INIT_RAM_36, INIT_RAM_35, INIT_RAM_34,INIT_RAM_33, INIT_RAM_32, INIT_RAM_31, INIT_RAM_30,INIT_RAM_2F, INIT_RAM_2E, INIT_RAM_2D, INIT_RAM_2C,INIT_RAM_2B, INIT_RAM_2A, INIT_RAM_29, INIT_RAM_28,INIT_RAM_27, INIT_RAM_26, INIT_RAM_25, INIT_RAM_24,INIT_RAM_23, INIT_RAM_22, INIT_RAM_21, INIT_RAM_20,INIT_RAM_1F, INIT_RAM_1E, INIT_RAM_1D, INIT_RAM_1C,INIT_RAM_1B, INIT_RAM_1A, INIT_RAM_19, INIT_RAM_18,INIT_RAM_17, INIT_RAM_16, INIT_RAM_15, INIT_RAM_14,INIT_RAM_13, INIT_RAM_12, INIT_RAM_11, INIT_RAM_10,INIT_RAM_0F, INIT_RAM_0E, INIT_RAM_0D, INIT_RAM_0C, INIT_RAM_0B, INIT_RAM_0A, INIT_RAM_09, INIT_RAM_08,INIT_RAM_07, INIT_RAM_06, INIT_RAM_05, INIT_RAM_04,INIT_RAM_03, INIT_RAM_02, INIT_RAM_01, INIT_RAM_00} ;
reg [BIT_WIDTH_0-1:0] mem_a;
reg [BIT_WIDTH_1-1:0] mem_b;
reg [13:0] addr_a, addr_b;
reg mc,bs_ena,bs_enb;
wire pcea;
wire pceb;
wire grstn = GSR.GSRO;

integer bit_width_d0 = BIT_WIDTH_0;
integer bit_width_d1 = BIT_WIDTH_1;
integer bit_width_a0, bit_width_a1; // ADDR_WIDTH

initial begin
    bp_reg = 0;
    pl_reg = 0;
    bp_reg_async = 0;
    bp_reg_sync = 0;
    pl_reg_async = 0;
    pl_reg_sync = 0;
    mc = 1'b0;
end

initial begin
	case(bit_width_d0)
		1: bit_width_a0 = 14;
		2: bit_width_a0 = 13;
		4: bit_width_a0 = 12;
		8: bit_width_a0 = 11;
		16: bit_width_a0 = 10;
		32: bit_width_a0 = 9;
		default: begin
		//	$display ("%d: Unsupported data width\n", bit_width_d0);
		//	$finish;
		end
	endcase
	case(bit_width_d1)
		1: bit_width_a1 = 14;
		2: bit_width_a1 = 13;
		4: bit_width_a1 = 12;
		8: bit_width_a1 = 11;
		16: bit_width_a1 = 10;
		32: bit_width_a1 = 9;
		default: begin
		//	$display ("%d: Unsupported data width\n", bit_width_d1);
		//	$finish;
		end
	endcase
end

assign DO = (READ_MODE == 1'b0)? bp_reg: pl_reg;

assign pcea = CEA && bs_ena && grstn;   
assign pceb = CEB && bs_enb;

always @ (BLKSELA, BLKSELB)
begin
	if(BLKSELA == BLK_SEL_0) begin
		bs_ena = 1;
	end else begin
		bs_ena = 0;
	end

    if(BLKSELB == BLK_SEL_1) begin
		bs_enb = 1;
	end else begin
		bs_enb = 0;
	end
end

always@(ADA,ADB,bit_width_a0,bit_width_a1,mc)begin
	if(bit_width_a0==14)begin
		addr_a[13:0] = ADA[13:0];
		mem_a[0] = ram_MEM[addr_a];
	end
	else if(bit_width_a0==13)begin
		addr_a[13:0] = {ADA[13:1],1'b0};
		mem_a[1:0] = {ram_MEM[addr_a+1],ram_MEM[addr_a]};
	end
	else if(bit_width_a0==12)begin
		addr_a[13:0] = {ADA[13:2],2'b00};
		mem_a[3:0] = {ram_MEM[addr_a+3],ram_MEM[addr_a+2],ram_MEM[addr_a+1],ram_MEM[addr_a]};
	end
	else if(bit_width_a0==11)begin
		addr_a[13:0] = {ADA[13:3],3'b000};
		mem_a[7:0] = {ram_MEM[addr_a+7],ram_MEM[addr_a+6],ram_MEM[addr_a+5],ram_MEM[addr_a+4],ram_MEM[addr_a+3],ram_MEM[addr_a+2],ram_MEM[addr_a+1],ram_MEM[addr_a]};
	end
	else if(bit_width_a0==10)begin
		addr_a[13:0] = {ADA[13:4],4'b0000};
		mem_a[15:0] = {ram_MEM[addr_a+15],ram_MEM[addr_a+14],ram_MEM[addr_a+13],ram_MEM[addr_a+12],ram_MEM[addr_a+11],ram_MEM[addr_a+10],ram_MEM[addr_a+9],ram_MEM[addr_a+8],ram_MEM[addr_a+7],ram_MEM[addr_a+6],ram_MEM[addr_a+5],ram_MEM[addr_a+4],ram_MEM[addr_a+3],ram_MEM[addr_a+2],ram_MEM[addr_a+1],ram_MEM[addr_a]};
	end
	else if(bit_width_a0==9)begin
		addr_a[13:0] = {ADA[13:5],5'b00000};
		mem_a[31:0] = {ram_MEM[addr_a+31],ram_MEM[addr_a+30],ram_MEM[addr_a+29],ram_MEM[addr_a+28],ram_MEM[addr_a+27],ram_MEM[addr_a+26],ram_MEM[addr_a+25],ram_MEM[addr_a+24],ram_MEM[addr_a+23],ram_MEM[addr_a+22],ram_MEM[addr_a+21],ram_MEM[addr_a+20],ram_MEM[addr_a+19],ram_MEM[addr_a+18],ram_MEM[addr_a+17],ram_MEM[addr_a+16],ram_MEM[addr_a+15],ram_MEM[addr_a+14],ram_MEM[addr_a+13],ram_MEM[addr_a+12],ram_MEM[addr_a+11],ram_MEM[addr_a+10],ram_MEM[addr_a+9],ram_MEM[addr_a+8],ram_MEM[addr_a+7],ram_MEM[addr_a+6],ram_MEM[addr_a+5],ram_MEM[addr_a+4],ram_MEM[addr_a+3],ram_MEM[addr_a+2],ram_MEM[addr_a+1],ram_MEM[addr_a]};
	end
	if(bit_width_a1==14)begin
		addr_b[13:0] = ADB[13:0];
		mem_b[0]=ram_MEM[addr_b];
	end
	else if(bit_width_a1==13)begin
		addr_b[13:0] = {ADB[13:1],1'b0};
		mem_b[1:0]={ram_MEM[addr_b+1],ram_MEM[addr_b]};
	end
	else if(bit_width_a1==12)begin
		addr_b[13:0] = {ADB[13:2],2'b00};
		mem_b[3:0]={ram_MEM[addr_b+3],ram_MEM[addr_b+2],ram_MEM[addr_b+1],ram_MEM[addr_b]};
	end
	else if(bit_width_a1==11)begin
		addr_b[13:0] = {ADB[13:3],3'b000};
		mem_b[7:0]={ram_MEM[addr_b+7],ram_MEM[addr_b+6],ram_MEM[addr_b+5],ram_MEM[addr_b+4],ram_MEM[addr_b+3],ram_MEM[addr_b+2],ram_MEM[addr_b+1],ram_MEM[addr_b]};
	end
	else if(bit_width_a1==10)begin
		addr_b[13:0] = {ADB[13:4],4'b0000};
		mem_b[15:0]={ram_MEM[addr_b+15],ram_MEM[addr_b+14],ram_MEM[addr_b+13],ram_MEM[addr_b+12],ram_MEM[addr_b+11],ram_MEM[addr_b+10],ram_MEM[addr_b+9],ram_MEM[addr_b+8],ram_MEM[addr_b+7],ram_MEM[addr_b+6],ram_MEM[addr_b+5],ram_MEM[addr_b+4],ram_MEM[addr_b+3],ram_MEM[addr_b+2],ram_MEM[addr_b+1],ram_MEM[addr_b]};

	end
	else if(bit_width_a1==9)begin
		addr_b[13:0] = {ADB[13:5],5'b00000};
		mem_b[31:0]={ ram_MEM[addr_b+31],ram_MEM[addr_b+30],ram_MEM[addr_b+29],ram_MEM[addr_b+28],ram_MEM[addr_b+27],ram_MEM[addr_b+26],ram_MEM[addr_b+25],ram_MEM[addr_b+24],ram_MEM[addr_b+23],ram_MEM[addr_b+22],ram_MEM[addr_b+21],ram_MEM[addr_b+20],ram_MEM[addr_b+19],ram_MEM[addr_b+18],ram_MEM[addr_b+17],ram_MEM[addr_b+16],ram_MEM[addr_b+15],ram_MEM[addr_b+14],ram_MEM[addr_b+13],ram_MEM[addr_b+12],ram_MEM[addr_b+11],ram_MEM[addr_b+10],ram_MEM[addr_b+9],ram_MEM[addr_b+8],ram_MEM[addr_b+7],ram_MEM[addr_b+6],ram_MEM[addr_b+5],ram_MEM[addr_b+4],ram_MEM[addr_b+3],ram_MEM[addr_b+2],ram_MEM[addr_b+1],ram_MEM[addr_b]};

	end
end

always @(posedge CLKA) begin
	if (pcea) begin
	    if(bit_width_d0==1)
			ram_MEM[addr_a] <= DI[0];
		else if(bit_width_d0==2)
			{ram_MEM[addr_a+1],ram_MEM[addr_a]}<=DI[BIT_WIDTH_0-1:0];
		else if(bit_width_d0==4)
			{ram_MEM[addr_a+3],ram_MEM[addr_a+2],ram_MEM[addr_a+1],ram_MEM[addr_a]}<=DI[BIT_WIDTH_0-1:0];
		else if(bit_width_d0==8)
			{ram_MEM[addr_a+7],ram_MEM[addr_a+6],ram_MEM[addr_a+5],ram_MEM[addr_a+4],ram_MEM[addr_a+3],ram_MEM[addr_a+2],ram_MEM[addr_a+1],ram_MEM[addr_a]}<=DI[BIT_WIDTH_0-1:0];
		else if(bit_width_d0==16) begin
			if(ADA[0] == 1'b1)
				{ram_MEM[addr_a+7],ram_MEM[addr_a+6],ram_MEM[addr_a+5],ram_MEM[addr_a+4],ram_MEM[addr_a+3],ram_MEM[addr_a+2],ram_MEM[addr_a+1],ram_MEM[addr_a]}<=DI[7:0];
			if(ADA[1] ==1'b1)
				{ram_MEM[addr_a+15],ram_MEM[addr_a+14],ram_MEM[addr_a+13],ram_MEM[addr_a+12],ram_MEM[addr_a+11],ram_MEM[addr_a+10],ram_MEM[addr_a+9],ram_MEM[addr_a+8]}<=DI[15:8];
		end
		else if(bit_width_d0==32) begin
			if(ADA[0] == 1'b1)
				{ram_MEM[addr_a+7],ram_MEM[addr_a+6],ram_MEM[addr_a+5],ram_MEM[addr_a+4],ram_MEM[addr_a+3],ram_MEM[addr_a+2],ram_MEM[addr_a+1],ram_MEM[addr_a]}<=DI[7:0];
			if(ADA[1] == 1'b1)
				{ram_MEM[addr_a+15],ram_MEM[addr_a+14],ram_MEM[addr_a+13],ram_MEM[addr_a+12],ram_MEM[addr_a+11],ram_MEM[addr_a+10],ram_MEM[addr_a+9],ram_MEM[addr_a+8]}<=DI[15:8];
			if(ADA[2] == 1'b1)
				{ram_MEM[addr_a+23],ram_MEM[addr_a+22],ram_MEM[addr_a+21],ram_MEM[addr_a+20],ram_MEM[addr_a+19],ram_MEM[addr_a+18],ram_MEM[addr_a+17],ram_MEM[addr_a+16]} <=DI[23:16];
			if(ADA[3] == 1'b1)
				{ram_MEM[addr_a+31],ram_MEM[addr_a+30],ram_MEM[addr_a+29],ram_MEM[addr_a+28],ram_MEM[addr_a+27],ram_MEM[addr_a+26],ram_MEM[addr_a+25],ram_MEM[addr_a+24]} <=DI[31:24];
		end
		mc <= ~mc;
	end
end

always @ (bp_reg_async or bp_reg_sync or pl_reg_async or pl_reg_sync) begin
    if(RESET_MODE == "ASYNC") begin
        bp_reg <= bp_reg_async;
        pl_reg <= pl_reg_async;
    end
    else begin
        bp_reg <= bp_reg_sync;
        pl_reg <= pl_reg_sync;
    end
end

always @(posedge CLKB or posedge RESET or negedge grstn) begin
	if (!grstn) begin
		pl_reg_async <= 0;
		bp_reg_async <= 0;
	end else if (RESET) begin
		pl_reg_async <= 0;
		bp_reg_async <= 0;
	end else begin
		if(OCE) begin
			pl_reg_async <= bp_reg;
		end
		if (pceb) begin
			bp_reg_async[BIT_WIDTH_1-1:0] <= mem_b[BIT_WIDTH_1-1:0];
		end
	end
end

always @(posedge CLKB or negedge grstn) begin
	if (!grstn) begin
		pl_reg_sync <= 0;
		bp_reg_sync <= 0;
	end else if (RESET) begin
		pl_reg_sync <= 0;
		bp_reg_sync <= 0;
	end else begin
		if(OCE) begin
			pl_reg_sync <= bp_reg;
		end
		if (pceb) begin
			bp_reg_sync[BIT_WIDTH_1-1:0] <= mem_b[BIT_WIDTH_1-1:0];
		end
	end
end

endmodule // SDPB: Semi dual port 16k Block SRAM

//SDPX9B
module SDPX9B (DO, DI, BLKSELA, BLKSELB, ADA, ADB, CLKA, CLKB, CEA, CEB, OCE, RESET);

parameter READ_MODE = 1'b0; // 1'b0: bypass mode; 1'b1: pipeline mode
parameter BIT_WIDTH_0 = 36; // 9, 18, 36
parameter BIT_WIDTH_1 = 36; // 9, 18, 36
parameter BLK_SEL_0 = 3'b000;
parameter BLK_SEL_1 = 3'b000;
parameter RESET_MODE = "SYNC"; //SYNC,ASYNC
parameter INIT_RAM_00 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000; 
parameter INIT_RAM_01 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_02 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_03 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_04 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_05 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_06 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_07 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_08 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_09 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0A = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0B = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0C = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0D = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0E = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0F = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_10 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_11 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_12 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_13 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_14 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_15 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_16 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_17 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_18 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_19 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1A = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1B = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1C = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1D = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1E = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1F = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_20 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_21 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_22 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_23 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_24 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_25 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_26 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_27 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_28 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_29 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2A = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2B = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2C = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2D = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2E = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2F = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_30 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_31 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_32 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_33 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_34 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_35 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_36 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_37 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_38 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_39 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3A = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3B = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3C = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3D = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3E = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3F = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;

input CLKA, CEA, CLKB, CEB;
input OCE; // clock enable of memory output register
input RESET; // resets output registers, not memory contents
input [13:0] ADA, ADB;
input [2:0] BLKSELA, BLKSELB;
input [35:0] DI;
output [35:0] DO;

reg [35:0] bp_reg,bp_reg_async,bp_reg_sync;
reg [35:0] pl_reg,pl_reg_async,pl_reg_sync;
reg [18431:0] ram_MEM = {INIT_RAM_3F, INIT_RAM_3E, INIT_RAM_3D, INIT_RAM_3C,INIT_RAM_3B, INIT_RAM_3A, INIT_RAM_39, INIT_RAM_38,INIT_RAM_37, INIT_RAM_36, INIT_RAM_35, INIT_RAM_34,INIT_RAM_33, INIT_RAM_32, INIT_RAM_31, INIT_RAM_30,INIT_RAM_2F, INIT_RAM_2E, INIT_RAM_2D, INIT_RAM_2C,INIT_RAM_2B, INIT_RAM_2A, INIT_RAM_29, INIT_RAM_28,INIT_RAM_27, INIT_RAM_26, INIT_RAM_25, INIT_RAM_24,INIT_RAM_23, INIT_RAM_22, INIT_RAM_21, INIT_RAM_20,INIT_RAM_1F, INIT_RAM_1E, INIT_RAM_1D, INIT_RAM_1C,INIT_RAM_1B, INIT_RAM_1A, INIT_RAM_19, INIT_RAM_18,INIT_RAM_17, INIT_RAM_16, INIT_RAM_15, INIT_RAM_14,INIT_RAM_13, INIT_RAM_12, INIT_RAM_11, INIT_RAM_10,INIT_RAM_0F, INIT_RAM_0E, INIT_RAM_0D, INIT_RAM_0C, INIT_RAM_0B, INIT_RAM_0A, INIT_RAM_09, INIT_RAM_08,INIT_RAM_07, INIT_RAM_06, INIT_RAM_05, INIT_RAM_04,INIT_RAM_03, INIT_RAM_02, INIT_RAM_01, INIT_RAM_00};
reg [BIT_WIDTH_0-1:0] mem_a;
reg [BIT_WIDTH_1-1:0] mem_b;
reg [14:0] addr_a, addr_b;
reg mc,bs_ena,bs_enb;
wire pcea,pceb;
integer bit_width_d0 = BIT_WIDTH_0;
integer bit_width_d1 = BIT_WIDTH_1;
integer bit_width_a0, bit_width_a1; // ADDR_WIDTH
wire grstn = GSR.GSRO;

initial begin
    bp_reg = 0;
    pl_reg = 0;
    bp_reg_async = 0;
    bp_reg_sync = 0;
    pl_reg_async = 0;
    pl_reg_sync = 0;
    mc = 1'b0;
end

initial begin
	case(bit_width_d0)
		9: bit_width_a0 = 11;
		18: bit_width_a0 = 10;
		36: bit_width_a0 = 9;
		default: begin
		//	$display ("%d: Unsupported data width\n", bit_width_d0);
		//	$finish;
		end
	endcase
	case(bit_width_d1)
		9: bit_width_a1 = 11;
		18: bit_width_a1 = 10;
		36: bit_width_a1 = 9;
		default: begin
		//	$display ("%d: Unsupported data width\n", bit_width_d1);
		//	$finish;
		end
	endcase
end

assign DO = (READ_MODE == 1'b0)? bp_reg: pl_reg;

assign pcea = CEA && bs_ena && grstn;   
assign pceb = CEB && bs_enb;
always @ (BLKSELA, BLKSELB)
begin
	if(BLKSELA == BLK_SEL_0) begin
		bs_ena = 1;
	end else begin
		bs_ena = 0;
	end

    if(BLKSELB == BLK_SEL_1) begin
		bs_enb = 1;
	end else begin
		bs_enb = 0;
	end
end

always@(ADA,ADB,bit_width_a0,bit_width_a1,mc)begin
	if(bit_width_a0==11)begin
		addr_a[14:0] = ADA[13:3]*bit_width_d0;
		mem_a[8:0] = {ram_MEM[addr_a+8],ram_MEM[addr_a+7],ram_MEM[addr_a+6],ram_MEM[addr_a+5],ram_MEM[addr_a+4],ram_MEM[addr_a+3],ram_MEM[addr_a+2],ram_MEM[addr_a+1],ram_MEM[addr_a]};
	end
	else if(bit_width_a0==10)begin
		addr_a[14:0] = ADA[13:4]*bit_width_d0;
		mem_a[17:0] = {ram_MEM[addr_a+17],ram_MEM[addr_a+16],ram_MEM[addr_a+15],ram_MEM[addr_a+14],ram_MEM[addr_a+13],ram_MEM[addr_a+12],ram_MEM[addr_a+11],ram_MEM[addr_a+10],ram_MEM[addr_a+9],ram_MEM[addr_a+8],ram_MEM[addr_a+7],ram_MEM[addr_a+6],ram_MEM[addr_a+5],ram_MEM[addr_a+4],ram_MEM[addr_a+3],ram_MEM[addr_a+2],ram_MEM[addr_a+1],ram_MEM[addr_a]};
	end
	else if(bit_width_a0==9)begin
		addr_a[14:0] = ADA[13:5]*bit_width_d0;
		mem_a[35:0] = {ram_MEM[addr_a+35],ram_MEM[addr_a+34],ram_MEM[addr_a+33],ram_MEM[addr_a+32],ram_MEM[addr_a+31],ram_MEM[addr_a+30],ram_MEM[addr_a+29],ram_MEM[addr_a+28],ram_MEM[addr_a+27],ram_MEM[addr_a+26],ram_MEM[addr_a+25],ram_MEM[addr_a+24],ram_MEM[addr_a+23],ram_MEM[addr_a+22],ram_MEM[addr_a+21],ram_MEM[addr_a+20],ram_MEM[addr_a+19],ram_MEM[addr_a+18],ram_MEM[addr_a+17],ram_MEM[addr_a+16],ram_MEM[addr_a+15],ram_MEM[addr_a+14],ram_MEM[addr_a+13],ram_MEM[addr_a+12],ram_MEM[addr_a+11],ram_MEM[addr_a+10],ram_MEM[addr_a+9],ram_MEM[addr_a+8],ram_MEM[addr_a+7],ram_MEM[addr_a+6],ram_MEM[addr_a+5],ram_MEM[addr_a+4],ram_MEM[addr_a+3],ram_MEM[addr_a+2],ram_MEM[addr_a+1],ram_MEM[addr_a]};
	end

	if(bit_width_a1==11)begin
		addr_b[14:0] = ADB[13:3]*bit_width_d1;
		mem_b[8:0] = {ram_MEM[addr_b+8],ram_MEM[addr_b+7],ram_MEM[addr_b+6],ram_MEM[addr_b+5],ram_MEM[addr_b+4],ram_MEM[addr_b+3],ram_MEM[addr_b+2],ram_MEM[addr_b+1],ram_MEM[addr_b]};
	end
	else if(bit_width_a1==10)begin
		addr_b[14:0] = ADB[13:4]*bit_width_d1;
		mem_b[17:0] = {ram_MEM[addr_b+17],ram_MEM[addr_b+16],ram_MEM[addr_b+15],ram_MEM[addr_b+14],ram_MEM[addr_b+13],ram_MEM[addr_b+12],ram_MEM[addr_b+11],ram_MEM[addr_b+10],ram_MEM[addr_b+9],ram_MEM[addr_b+8],ram_MEM[addr_b+7],ram_MEM[addr_b+6],ram_MEM[addr_b+5],ram_MEM[addr_b+4],ram_MEM[addr_b+3],ram_MEM[addr_b+2],ram_MEM[addr_b+1],ram_MEM[addr_b]};
	end
	else if(bit_width_a1==9)begin
		addr_b[14:0] = ADB[13:5]*bit_width_d1;
		mem_b[35:0] = {ram_MEM[addr_b+35],ram_MEM[addr_b+34],ram_MEM[addr_b+33],ram_MEM[addr_b+32],ram_MEM[addr_b+31],ram_MEM[addr_b+30],ram_MEM[addr_b+29],ram_MEM[addr_b+28],ram_MEM[addr_b+27],ram_MEM[addr_b+26],ram_MEM[addr_b+25],ram_MEM[addr_b+24],ram_MEM[addr_b+23],ram_MEM[addr_b+22],ram_MEM[addr_b+21],ram_MEM[addr_b+20],ram_MEM[addr_b+19],ram_MEM[addr_b+18],ram_MEM[addr_b+17],ram_MEM[addr_b+16],ram_MEM[addr_b+15],ram_MEM[addr_b+14],ram_MEM[addr_b+13],ram_MEM[addr_b+12],ram_MEM[addr_b+11],ram_MEM[addr_b+10],ram_MEM[addr_b+9],ram_MEM[addr_b+8],ram_MEM[addr_b+7],ram_MEM[addr_b+6],ram_MEM[addr_b+5],ram_MEM[addr_b+4],ram_MEM[addr_b+3],ram_MEM[addr_b+2],ram_MEM[addr_b+1],ram_MEM[addr_b]};
	end
end

always @(posedge CLKA) begin		
	if (pcea) begin
		if(bit_width_d0 == 9) begin
			{ram_MEM [addr_a+8],ram_MEM [addr_a+7], ram_MEM [addr_a+6], ram_MEM [addr_a+5], ram_MEM [addr_a+4], ram_MEM [addr_a+3], ram_MEM [addr_a+2], ram_MEM [addr_a+1], ram_MEM [addr_a]} <= DI[8:0];
		end else if(bit_width_d0 == 18) begin
			if(ADA[0] == 1'b1)
				{ram_MEM [addr_a+8],ram_MEM [addr_a+7], ram_MEM [addr_a+6], ram_MEM [addr_a+5], ram_MEM [addr_a+4], ram_MEM [addr_a+3], ram_MEM [addr_a+2], ram_MEM [addr_a+1], ram_MEM [addr_a]} <= DI[8:0];
			if(ADA[1] == 1'b1)
				{ram_MEM[addr_a+17],ram_MEM[addr_a+16],ram_MEM[addr_a+15],ram_MEM[addr_a+14],ram_MEM[addr_a+13],ram_MEM[addr_a+12],ram_MEM[addr_a+11],ram_MEM[addr_a+10],ram_MEM[addr_a+9]} <= DI[17:9];
		end
		else if(bit_width_d0 == 36) begin
			if(ADA[0] == 1'b1)
				{ram_MEM [addr_a+8],ram_MEM [addr_a+7], ram_MEM [addr_a+6], ram_MEM [addr_a+5], ram_MEM [addr_a+4], ram_MEM [addr_a+3], ram_MEM [addr_a+2], ram_MEM [addr_a+1], ram_MEM [addr_a]} <= DI[8:0];
			if(ADA[1] == 1'b1)
				{ram_MEM[addr_a+17],ram_MEM[addr_a+16],ram_MEM[addr_a+15],ram_MEM[addr_a+14],ram_MEM[addr_a+13],ram_MEM[addr_a+12],ram_MEM[addr_a+11],ram_MEM[addr_a+10],ram_MEM[addr_a+9]} <= DI[17:9];
			if(ADA[2] == 1'b1)
				{ram_MEM[addr_a+26],ram_MEM[addr_a+25],ram_MEM[addr_a+24],ram_MEM[addr_a+23],ram_MEM[addr_a+22],ram_MEM[addr_a+21],ram_MEM[addr_a+20],ram_MEM[addr_a+19],ram_MEM[addr_a+18]} <= DI[26:18];
			if(ADA[3] == 1'b1)
				{ram_MEM[addr_a+35],ram_MEM[addr_a+34],ram_MEM[addr_a+33],ram_MEM[addr_a+32],ram_MEM[addr_a+31],ram_MEM[addr_a+30],ram_MEM[addr_a+29],ram_MEM[addr_a+28],ram_MEM[addr_a+27]} <= DI[35:27];
		end
		mc <= ~mc;
	end
end	

always @ (bp_reg_async or bp_reg_sync or pl_reg_async or pl_reg_sync) begin
    if(RESET_MODE == "ASYNC") begin
        bp_reg <= bp_reg_async;
        pl_reg <= pl_reg_async;
    end
    else begin
        bp_reg <= bp_reg_sync;
        pl_reg <= pl_reg_sync;
    end
end

always @(posedge CLKB or posedge RESET or negedge grstn) begin
	if (!grstn) begin
		bp_reg_async <=0;
		pl_reg_async <= 0;
	end else if (RESET) begin
		bp_reg_async <=0;
		pl_reg_async <= 0;
	end else begin
		if(OCE) begin
			pl_reg_async <= bp_reg;
		end
		if (pceb) begin
			bp_reg_async[BIT_WIDTH_1-1:0] <= mem_b[BIT_WIDTH_1-1:0];
		end
	end
end

always @(posedge CLKB or negedge grstn) begin
	if (!grstn) begin
		bp_reg_sync <=0;
		pl_reg_sync <= 0;
	end else if (RESET) begin
		bp_reg_sync <=0;
		pl_reg_sync <= 0;
	end else begin
		if(OCE) begin
			pl_reg_sync <= bp_reg;
		end
		if (pceb) begin
			bp_reg_sync[BIT_WIDTH_1-1:0] <= mem_b[BIT_WIDTH_1-1:0];
		end
	end
end

endmodule // SDPX9B: Semi dual port 18k Block SRAM

module DPB (DOA, DOB, DIA, DIB, BLKSELA, BLKSELB, ADA, ADB, WREA, WREB, CLKA, CLKB, CEA, CEB, OCEA, OCEB, RESETA, RESETB);

parameter READ_MODE0 = 1'b0; // 1'b0: bypass mode; 1'b1: pipeline mode
parameter READ_MODE1 = 1'b0; // 1'b0: bypass mode; 1'b1: pipeline mode
parameter WRITE_MODE0 = 2'b00; // 2'b00: normal mode; 2'b01: write-through mode; 2'b10: read-before-write mode
parameter WRITE_MODE1 = 2'b00; // 2'b00: normal mode; 2'b01: write-through mode; 2'b10: read-before-write mode
parameter BIT_WIDTH_0 = 16; // 1, 2, 4, 8, 16
parameter BIT_WIDTH_1 = 16; // 1, 2, 4, 8, 16
parameter BLK_SEL_0 = 3'b000;
parameter BLK_SEL_1 = 3'b000;
parameter RESET_MODE = "SYNC"; //SYNC, ASYNC
parameter INIT_RAM_00 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_01 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_02 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_03 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_04 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_05 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_06 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_07 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_08 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_09 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_10 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_11 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_12 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_13 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_14 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_15 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_16 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_17 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_18 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_19 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_20 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_21 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_22 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_23 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_24 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_25 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_26 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_27 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_28 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_29 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_30 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_31 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_32 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_33 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_34 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_35 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_36 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_37 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_38 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_39 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3F = 256'h0000000000000000000000000000000000000000000000000000000000000000;

input CLKA, CEA, CLKB, CEB;
input OCEA, OCEB; // clock enable of memory output register
input RESETA, RESETB; // resets output registers, not memory contents
input WREA, WREB; // 1'b0: read enabled; 1'b1: write enabled
input [13:0] ADA, ADB;
input [2:0] BLKSELA, BLKSELB;
input [15:0] DIA, DIB;
output [15:0] DOA, DOB;

reg [15:0] bpa_reg,bpa_reg_async,bpa_reg_sync;
reg [15:0] pla_reg,pla_reg_async,pla_reg_sync;
reg [15:0] bpb_reg, plb_reg,bpb_reg_async,bpb_reg_sync,plb_reg_async,plb_reg_sync;
reg [16383:0] ram_MEM = {INIT_RAM_3F, INIT_RAM_3E, INIT_RAM_3D, INIT_RAM_3C,INIT_RAM_3B, INIT_RAM_3A, INIT_RAM_39, INIT_RAM_38,INIT_RAM_37, INIT_RAM_36, INIT_RAM_35, INIT_RAM_34,INIT_RAM_33, INIT_RAM_32, INIT_RAM_31, INIT_RAM_30,INIT_RAM_2F, INIT_RAM_2E, INIT_RAM_2D, INIT_RAM_2C,INIT_RAM_2B, INIT_RAM_2A, INIT_RAM_29, INIT_RAM_28,INIT_RAM_27, INIT_RAM_26, INIT_RAM_25, INIT_RAM_24,INIT_RAM_23, INIT_RAM_22, INIT_RAM_21, INIT_RAM_20,INIT_RAM_1F, INIT_RAM_1E, INIT_RAM_1D, INIT_RAM_1C,INIT_RAM_1B, INIT_RAM_1A, INIT_RAM_19, INIT_RAM_18,INIT_RAM_17, INIT_RAM_16, INIT_RAM_15, INIT_RAM_14,INIT_RAM_13, INIT_RAM_12, INIT_RAM_11, INIT_RAM_10,INIT_RAM_0F, INIT_RAM_0E, INIT_RAM_0D, INIT_RAM_0C, INIT_RAM_0B, INIT_RAM_0A, INIT_RAM_09, INIT_RAM_08,INIT_RAM_07, INIT_RAM_06, INIT_RAM_05, INIT_RAM_04,INIT_RAM_03, INIT_RAM_02, INIT_RAM_01, INIT_RAM_00} ;
reg [BIT_WIDTH_0-1:0] mem_a;
reg [BIT_WIDTH_1-1:0] mem_b;
reg mc,bs_ena,bs_enb;
wire pcea,pceb;
reg [13:0] addr_a, addr_b;
integer bit_width_d0 = BIT_WIDTH_0;
integer bit_width_d1 = BIT_WIDTH_1;
integer bit_width_a0, bit_width_a1; // ADDR_WIDTH
wire grstn = GSR.GSRO;

initial begin
    bpa_reg = 0;
    pla_reg = 0;
    bpb_reg = 0;
    plb_reg = 0;
    bpa_reg_async = 0;
    bpa_reg_sync = 0;
    pla_reg_async = 0;
    pla_reg_sync = 0;
    bpb_reg_async = 0;
    bpb_reg_sync = 0;
    plb_reg_async = 0;
    plb_reg_sync = 0;
    mc = 1'b0;
end

initial begin
	case(bit_width_d0)
		1: bit_width_a0 = 14;
		2: bit_width_a0 = 13;
		4: bit_width_a0 = 12;
		8: bit_width_a0 = 11;
		16: bit_width_a0 = 10;
	default: begin
	//	$display ("%d: Unsupported data width\n", bit_width_d0);
	//	$finish;
	end
	endcase
	case(bit_width_d1)
		1: bit_width_a1 = 14;
		2: bit_width_a1 = 13;
		4: bit_width_a1 = 12;
		8: bit_width_a1 = 11;
		16: bit_width_a1 = 10;
	default: begin
	//	$display ("%d: Unsupported data width\n", bit_width_d1);
	//	$finish;
	end
	endcase
end

assign DOA = (READ_MODE0 == 1'b0)? bpa_reg : pla_reg;
assign DOB = (READ_MODE1 == 1'b0)? bpb_reg : plb_reg;

assign pcea = CEA && bs_ena && grstn;   
assign pceb = CEB && bs_enb && grstn;
always @ (BLKSELA, BLKSELB)
begin
	if(BLKSELA == BLK_SEL_0) begin
		bs_ena = 1;
	end else begin
		bs_ena = 0;
	end

    if(BLKSELB == BLK_SEL_1) begin
		bs_enb = 1;
	end else begin
		bs_enb = 0;
	end

end

always@(ADA,ADB,bit_width_a0,bit_width_a1,WREA,WREB,mc)begin
	if(bit_width_a0==14)begin
		addr_a[13:0] = ADA[13:0];
		mem_a[0]=ram_MEM[addr_a];
	end
	else if(bit_width_a0==13)begin
		addr_a[13:0] = {ADA[13:1],1'b0};
		mem_a[1:0]={ ram_MEM[addr_a+1],ram_MEM[addr_a]};
	end
	else if(bit_width_a0==12)begin
		addr_a[13:0] = {ADA[13:2],2'b00};
		mem_a[3:0]={ ram_MEM[addr_a+3],ram_MEM[addr_a+2],ram_MEM[addr_a+1],ram_MEM[addr_a]};
	end
	else if(bit_width_a0==11)begin
		addr_a[13:0] = {ADA[13:3],3'b000};
		mem_a[7:0]={ ram_MEM[addr_a+7],ram_MEM[addr_a+6],ram_MEM[addr_a+5],ram_MEM[addr_a+4],ram_MEM[addr_a+3],ram_MEM[addr_a+2],ram_MEM[addr_a+1],ram_MEM[addr_a]};
	end
	else if(bit_width_a0==10)begin
		addr_a[13:0] = {ADA[13:4],4'b0000};
		mem_a[15:0]={ram_MEM[addr_a+15],ram_MEM[addr_a+14],ram_MEM[addr_a+13],ram_MEM[addr_a+12],ram_MEM[addr_a+11],ram_MEM[addr_a+10],ram_MEM[addr_a+9],ram_MEM[addr_a+8],ram_MEM[addr_a+7],ram_MEM[addr_a+6],ram_MEM[addr_a+5],ram_MEM[addr_a+4],ram_MEM[addr_a+3],ram_MEM[addr_a+2],ram_MEM[addr_a+1],ram_MEM[addr_a]};
	end
	if(bit_width_a1==14)begin
		addr_b[13:0] = ADB[13:0];
		mem_b[0]=ram_MEM[addr_b];
	end
	else if(bit_width_a1==13)begin
		addr_b[13:0] = {ADB[13:1],1'b0};
		mem_b[1:0]={ram_MEM[addr_b+1],ram_MEM[addr_b]};
	end
	else if(bit_width_a1==12)begin
		addr_b[13:0] = {ADB[13:2],2'b00};
		mem_b[3:0]={ ram_MEM[addr_b+3],ram_MEM[addr_b+2],ram_MEM[addr_b+1],ram_MEM[addr_b]};
	end
	else if(bit_width_a1==11)begin
		addr_b[13:0] = {ADB[13:3],3'b000};
		mem_b[7:0]={ ram_MEM[addr_b+7],ram_MEM[addr_b+6],ram_MEM[addr_b+5],ram_MEM[addr_b+4],ram_MEM[addr_b+3],ram_MEM[addr_b+2],ram_MEM[addr_b+1],ram_MEM[addr_b]};
	end
	else if(bit_width_a1==10)begin
		addr_b[13:0] = {ADB[13:4],4'b0000};
		mem_b[15:0]={ram_MEM[addr_b+15],ram_MEM[addr_b+14],ram_MEM[addr_b+13],ram_MEM[addr_b+12],ram_MEM[addr_b+11],ram_MEM[addr_b+10],ram_MEM[addr_b+9],ram_MEM[addr_b+8],ram_MEM[addr_b+7],ram_MEM[addr_b+6],ram_MEM[addr_b+5],ram_MEM[addr_b+4],ram_MEM[addr_b+3],ram_MEM[addr_b+2],ram_MEM[addr_b+1],ram_MEM[addr_b]};
	end
end

always @ (bpa_reg_async or bpa_reg_sync or pla_reg_async or pla_reg_sync or bpb_reg_async or bpb_reg_sync or plb_reg_async or plb_reg_sync) begin
    if(RESET_MODE == "ASYNC") begin
        bpa_reg <= bpa_reg_async;
        pla_reg <= pla_reg_async;
        bpb_reg <= bpb_reg_async;
        plb_reg <= plb_reg_async;
    end
    else begin
        bpa_reg <= bpa_reg_sync;
        pla_reg <= pla_reg_sync;
        bpb_reg <= bpb_reg_sync;
        plb_reg <= plb_reg_sync;
    end
end

always @(posedge CLKA) begin
	if (pcea) begin
		if (WREA) begin
			if(bit_width_d0==1)
				ram_MEM[addr_a] <= DIA[0];
			else if(bit_width_d0==2)
				{ram_MEM[addr_a+1],ram_MEM[addr_a]}<=DIA[BIT_WIDTH_0-1:0];
			else if(bit_width_d0==4)
				{ram_MEM[addr_a+3],ram_MEM[addr_a+2],ram_MEM[addr_a+1],ram_MEM[addr_a]}<=DIA[BIT_WIDTH_0-1:0];
			else if(bit_width_d0==8)
				{ram_MEM[addr_a+7],ram_MEM[addr_a+6],ram_MEM[addr_a+5],ram_MEM[addr_a+4],ram_MEM[addr_a+3],ram_MEM[addr_a+2],ram_MEM[addr_a+1],ram_MEM[addr_a]}<=DIA[BIT_WIDTH_0-1:0];
			else if(bit_width_d0==16) begin
				if(ADA[0] == 1'b1)
					{ram_MEM[addr_a+7],ram_MEM[addr_a+6],ram_MEM[addr_a+5],ram_MEM[addr_a+4],ram_MEM[addr_a+3],ram_MEM[addr_a+2],ram_MEM[addr_a+1],ram_MEM[addr_a]} <= DIA[7:0];
				if(ADA[1] == 1'b1)
					{ram_MEM[addr_a+15],ram_MEM[addr_a+14],ram_MEM[addr_a+13],ram_MEM[addr_a+12],ram_MEM[addr_a+11],ram_MEM[addr_a+10],ram_MEM[addr_a+9],ram_MEM[addr_a+8]} <= DIA[15:8];
			end
			mc <= ~mc;
		end 
	end
end	

always @(posedge CLKA or posedge RESETA or negedge grstn) begin
	if (!grstn) begin
		pla_reg_async <= 0;
		bpa_reg_async <= 0;
	end else if (RESETA) begin
		pla_reg_async <= 0;
		bpa_reg_async <= 0;
	end else begin
		if(OCEA) begin
			pla_reg_async <= bpa_reg;
		end
		if (pcea) begin
			if (WREA) begin
				if (WRITE_MODE0 == 2'b01) begin
					bpa_reg_async[BIT_WIDTH_0-1:0] <= mem_a[BIT_WIDTH_0-1:0];
                    if(bit_width_d0<=8)
					    bpa_reg_async[BIT_WIDTH_0-1:0] <= DIA[BIT_WIDTH_0-1:0];
				    else if(bit_width_d0==16) begin
					    if(ADA[0] == 1'b1)
						    bpa_reg_async[7:0] <= DIA[7:0];
					    if(ADA[1] == 1'b1)
						    bpa_reg_async[15:8]  <= DIA[15:8];
				    end
				end

				if (WRITE_MODE0 == 2'b10) begin
					bpa_reg_async[BIT_WIDTH_0-1:0] <= mem_a[BIT_WIDTH_0-1:0];
				end
				
			end 
			else begin // WREA==0, read
				bpa_reg_async[BIT_WIDTH_0-1:0] <= mem_a[BIT_WIDTH_0-1:0];
			end
		end
	end
end	

always @(posedge CLKA or negedge grstn) begin
	if (!grstn) begin
		pla_reg_sync <= 0;
		bpa_reg_sync <= 0;
	end else if (RESETA) begin
		pla_reg_sync <= 0;
		bpa_reg_sync <= 0;
	end else begin
		if(OCEA) begin
			pla_reg_sync <= bpa_reg;
		end
		if (pcea) begin
			if (WREA) begin
				if (WRITE_MODE0 == 2'b01) begin
					bpa_reg_sync[BIT_WIDTH_0-1:0] <= mem_a[BIT_WIDTH_0-1:0];
                    if(bit_width_d0<=8)
					    bpa_reg_sync[BIT_WIDTH_0-1:0] <= DIA[BIT_WIDTH_0-1:0];
				    else if(bit_width_d0==16) begin
					    if(ADA[0] == 1'b1)
						    bpa_reg_sync[7:0] <= DIA[7:0];
					    if(ADA[1] == 1'b1)
						    bpa_reg_sync[15:8]  <= DIA[15:8];
				    end
				end

				if (WRITE_MODE0 == 2'b10) begin
					bpa_reg_sync[BIT_WIDTH_0-1:0] <= mem_a[BIT_WIDTH_0-1:0];
				end
				
			end 
			else begin // WREA==0, read
				bpa_reg_sync[BIT_WIDTH_0-1:0] <= mem_a[BIT_WIDTH_0-1:0];
			end
		end
	end
end

always @(posedge CLKB) begin
	if (pceb) begin
		if (WREB) begin
			if(bit_width_d1==1)
				ram_MEM[addr_b] <= DIB[0];
			else if(bit_width_d1==2)
				{ram_MEM[addr_b+1],ram_MEM[addr_b]}<=DIB[BIT_WIDTH_1-1:0];
			else if(bit_width_d1==4)
				{ram_MEM[addr_b+3],ram_MEM[addr_b+2],ram_MEM[addr_b+1],ram_MEM[addr_b]}<=DIB[BIT_WIDTH_1-1:0];
			else if(bit_width_d1==8)
				{ram_MEM[addr_b+7],ram_MEM[addr_b+6],ram_MEM[addr_b+5],ram_MEM[addr_b+4],ram_MEM[addr_b+3],ram_MEM[addr_b+2],ram_MEM[addr_b+1],ram_MEM[addr_b]}<=DIB[BIT_WIDTH_1-1:0];
			else if(bit_width_d1==16) begin
				if(ADB[0] == 1'b1)
					{ram_MEM[addr_b+7],ram_MEM[addr_b+6],ram_MEM[addr_b+5],ram_MEM[addr_b+4],ram_MEM[addr_b+3],ram_MEM[addr_b+2],ram_MEM[addr_b+1],ram_MEM[addr_b]} <= DIB[7:0];
				if(ADB[1] == 1'b1)
					{ram_MEM[addr_b+15],ram_MEM[addr_b+14],ram_MEM[addr_b+13],ram_MEM[addr_b+12],ram_MEM[addr_b+11],ram_MEM[addr_b+10],ram_MEM[addr_b+9],ram_MEM[addr_b+8]} <= DIB[15:8];
			end
			mc <= ~mc;
		end 
    end
end

always @(posedge CLKB or posedge RESETB or negedge grstn) begin
	if (!grstn) begin
		plb_reg_async <= 0;
		bpb_reg_async <= 0;
	end else if (RESETB) begin
		plb_reg_async <= 0;
		bpb_reg_async <= 0;
	end else begin
		if(OCEB) begin
			plb_reg_async <= bpb_reg;
		end
		if (pceb) begin
			if (WREB) begin
				if (WRITE_MODE1 == 2'b01) begin
					bpb_reg_async[BIT_WIDTH_1-1:0] <= mem_b[BIT_WIDTH_1-1:0];
                    if(bit_width_d1<=8)
					    bpb_reg_async[BIT_WIDTH_1-1:0] <= DIB[BIT_WIDTH_1-1:0];
				    else if(bit_width_d1==16) begin
					    if(ADB[0] == 1'b1)
						    bpb_reg_async[7:0] <= DIB[7:0];
					    if(ADB[1] == 1'b1)
						    bpb_reg_async[15:8]  <= DIB[15:8];
				    end
				end

				if (WRITE_MODE1 == 2'b10) begin
					bpb_reg_async[BIT_WIDTH_1-1:0] <= mem_b[BIT_WIDTH_1-1:0];
				end

			end else begin
				bpb_reg_async[BIT_WIDTH_1-1:0] <= mem_b[BIT_WIDTH_1-1:0];
			end
		end
	end
end	

always @(posedge CLKB or negedge grstn) begin
	if (!grstn) begin
		plb_reg_sync <= 0;
		bpb_reg_sync <= 0;
	end else if (RESETB) begin
		plb_reg_sync <= 0;
		bpb_reg_sync <= 0;
	end else begin
		if(OCEB) begin
			plb_reg_sync <= bpb_reg;
		end
		if (pceb) begin
			if (WREB) begin
				if (WRITE_MODE1 == 2'b01) begin
					bpb_reg_sync[BIT_WIDTH_1-1:0] <= mem_b[BIT_WIDTH_1-1:0];
                    if(bit_width_d1<=8)
					    bpb_reg_sync[BIT_WIDTH_1-1:0] <= DIB[BIT_WIDTH_1-1:0];
				    else if(bit_width_d1==16) begin
					    if(ADB[0] == 1'b1)
						    bpb_reg_sync[7:0] <= DIB[7:0];
					    if(ADB[1] == 1'b1)
						    bpb_reg_sync[15:8]  <= DIB[15:8];
				    end
				end

				if (WRITE_MODE1 == 2'b10) begin
					bpb_reg_sync[BIT_WIDTH_1-1:0] <= mem_b[BIT_WIDTH_1-1:0];
				end

			end else begin
				bpb_reg_sync[BIT_WIDTH_1-1:0] <= mem_b[BIT_WIDTH_1-1:0];
			end
		end
	end
end

endmodule // DPB: true dual port 16k Block SRAM

//DPX9B
module DPX9B (DOA, DOB, DIA, DIB, BLKSELA, BLKSELB, ADA, ADB, WREA, WREB, CLKA, CLKB, CEA, CEB, OCEA, OCEB, RESETA, RESETB);

parameter READ_MODE0 = 1'b0; // 1'b0: bypass mode; 1'b1: pipeline mode
parameter READ_MODE1 = 1'b0; // 1'b0: bypass mode; 1'b1: pipeline mode
parameter WRITE_MODE0 = 2'b00; // 2'b00: normal mode; 2'b01: write-through mode; 2'b10: read-before-write mode
parameter WRITE_MODE1 = 2'b00; // 2'b00: normal mode; 2'b01: write-through mode; 2'b10: read-before-write mode
parameter BIT_WIDTH_0 = 18; // 9, 18
parameter BIT_WIDTH_1 = 18; // 9, 18
parameter BLK_SEL_0 = 3'b000;
parameter BLK_SEL_1 = 3'b000;
parameter RESET_MODE = "SYNC"; //SYNC,ASYNC
parameter INIT_RAM_00 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000; 
parameter INIT_RAM_01 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_02 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_03 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_04 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_05 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_06 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_07 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_08 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_09 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0A = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0B = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0C = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0D = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0E = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0F = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_10 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_11 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_12 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_13 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_14 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_15 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_16 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_17 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_18 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_19 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1A = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1B = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1C = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1D = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1E = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1F = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_20 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_21 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_22 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_23 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_24 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_25 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_26 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_27 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_28 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_29 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2A = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2B = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2C = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2D = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2E = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2F = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_30 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_31 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_32 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_33 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_34 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_35 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_36 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_37 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_38 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_39 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3A = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3B = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3C = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3D = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3E = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3F = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;

input CLKA, CEA, CLKB, CEB;
input OCEA, OCEB; // clock enable of memory output register
input RESETA, RESETB; // resets output registers, not memory contents
input WREA, WREB; // 1'b0: read enabled; 1'b1: write enabled
input [13:0] ADA, ADB;
input [17:0] DIA, DIB;
input [2:0] BLKSELA, BLKSELB;
output [17:0] DOA, DOB;
reg [17:0] bpa_reg, bpb_reg,bpa_reg_async, bpb_reg_async,bpa_reg_sync, bpb_reg_sync;
reg [17:0] pla_reg, plb_reg,pla_reg_async, plb_reg_async,pla_reg_sync, plb_reg_sync;
reg [18431:0] ram_MEM = {INIT_RAM_3F, INIT_RAM_3E, INIT_RAM_3D, INIT_RAM_3C,INIT_RAM_3B, INIT_RAM_3A, INIT_RAM_39, INIT_RAM_38,INIT_RAM_37, INIT_RAM_36, INIT_RAM_35, INIT_RAM_34,INIT_RAM_33, INIT_RAM_32, INIT_RAM_31, INIT_RAM_30,INIT_RAM_2F, INIT_RAM_2E, INIT_RAM_2D, INIT_RAM_2C,INIT_RAM_2B, INIT_RAM_2A, INIT_RAM_29, INIT_RAM_28,INIT_RAM_27, INIT_RAM_26, INIT_RAM_25, INIT_RAM_24,INIT_RAM_23, INIT_RAM_22, INIT_RAM_21, INIT_RAM_20,INIT_RAM_1F, INIT_RAM_1E, INIT_RAM_1D, INIT_RAM_1C,INIT_RAM_1B, INIT_RAM_1A, INIT_RAM_19, INIT_RAM_18,INIT_RAM_17, INIT_RAM_16, INIT_RAM_15, INIT_RAM_14,INIT_RAM_13, INIT_RAM_12, INIT_RAM_11, INIT_RAM_10,INIT_RAM_0F, INIT_RAM_0E, INIT_RAM_0D, INIT_RAM_0C, INIT_RAM_0B, INIT_RAM_0A, INIT_RAM_09, INIT_RAM_08,INIT_RAM_07, INIT_RAM_06, INIT_RAM_05, INIT_RAM_04,INIT_RAM_03, INIT_RAM_02, INIT_RAM_01, INIT_RAM_00};
reg [BIT_WIDTH_0-1:0] mem_a;
reg [BIT_WIDTH_1-1:0] mem_b;
reg mc,bs_ena,bs_enb;
wire pcea,pceb;
integer bit_width_d0 = BIT_WIDTH_0;
integer bit_width_d1 = BIT_WIDTH_1;
integer bit_width_a0, bit_width_a1; // ADDR_WIDTH
reg [14:0] addr_a, addr_b;
wire grstn = GSR.GSRO;

initial begin
    bpa_reg = 0;
    bpb_reg = 0;
    pla_reg = 0;
    plb_reg = 0;
    bpa_reg_async = 0;
    bpa_reg_sync = 0;
    pla_reg_async = 0;
    pla_reg_sync = 0;
    bpb_reg_async = 0;
    bpb_reg_sync = 0;
    plb_reg_async = 0;
    plb_reg_sync = 0;
    mc = 1'b0;
end

initial begin
	case(bit_width_d0)
		9: bit_width_a0 = 11;
		18: bit_width_a0 = 10;
		default: begin
		//	$display ("%d: Unsupported data width\n", bit_width_d0);
		//	$finish;
		end
	endcase
	case(bit_width_d1)
		9: bit_width_a1 = 11;
		18: bit_width_a1 = 10;
		default: begin
		//	$display ("%d: Unsupported data width\n", bit_width_d1);
		//	$finish;
		end
	endcase
end

assign DOA = (READ_MODE0 == 1'b0)? bpa_reg : pla_reg;
assign DOB = (READ_MODE1 == 1'b0)? bpb_reg : plb_reg;

assign pcea = CEA && bs_ena && grstn;
assign pceb = CEB && bs_enb && grstn;
always @ (BLKSELA, BLKSELB)
begin
	if(BLKSELA == BLK_SEL_0) begin
		bs_ena = 1;
	end else begin
		bs_ena = 0;
	end

    if(BLKSELB == BLK_SEL_1) begin
		bs_enb = 1;
	end else begin
		bs_enb = 0;
	end
end

always@(ADA, ADB, bit_width_a0, bit_width_a1,WREA, WREB,mc)begin
    if(bit_width_a0==11)begin
		addr_a[14:0] = ADA[13:3]*bit_width_d0;
		mem_a[8:0]={ ram_MEM[addr_a+8],ram_MEM[addr_a+7],ram_MEM[addr_a+6],ram_MEM[addr_a+5],ram_MEM[addr_a+4],ram_MEM[addr_a+3],ram_MEM[addr_a+2],ram_MEM[addr_a+1],ram_MEM[addr_a]};
	end
	else if(bit_width_a0==10)begin
		addr_a[14:0] = ADA[13:4]*bit_width_d0;
		mem_a[17:0]={ram_MEM[addr_a+17],ram_MEM[addr_a+16],ram_MEM[addr_a+15],ram_MEM[addr_a+14],ram_MEM[addr_a+13],ram_MEM[addr_a+12],ram_MEM[addr_a+11],ram_MEM[addr_a+10],ram_MEM[addr_a+9],ram_MEM[addr_a+8],ram_MEM[addr_a+7],ram_MEM[addr_a+6],ram_MEM[addr_a+5],ram_MEM[addr_a+4],ram_MEM[addr_a+3],ram_MEM[addr_a+2],ram_MEM[addr_a+1],ram_MEM[addr_a]};
	end
	
	if(bit_width_a1==11)begin
		addr_b[14:0] = ADB[13:3]*bit_width_d1;
		mem_b[8:0]={ram_MEM[addr_b+8],ram_MEM[addr_b+7],ram_MEM[addr_b+6],ram_MEM[addr_b+5],ram_MEM[addr_b+4],ram_MEM[addr_b+3],ram_MEM[addr_b+2],ram_MEM[addr_b+1],ram_MEM[addr_b]};
	end
	else if(bit_width_a1==10)begin
		addr_b[14:0] = ADB[13:4]*bit_width_d1;
		mem_b[17:0]={ram_MEM[addr_b+17],ram_MEM[addr_b+16],ram_MEM[addr_b+15],ram_MEM[addr_b+14],ram_MEM[addr_b+13],ram_MEM[addr_b+12],ram_MEM[addr_b+11],ram_MEM[addr_b+10],ram_MEM[addr_b+9],ram_MEM[addr_b+8],ram_MEM[addr_b+7],ram_MEM[addr_b+6],ram_MEM[addr_b+5],ram_MEM[addr_b+4],ram_MEM[addr_b+3],ram_MEM[addr_b+2],ram_MEM[addr_b+1],ram_MEM[addr_b]};
	end
end

always @ (bpa_reg_async or bpa_reg_sync or pla_reg_async or pla_reg_sync or bpb_reg_async or bpb_reg_sync or plb_reg_async or plb_reg_sync) begin
    if(RESET_MODE == "ASYNC") begin
        bpa_reg <= bpa_reg_async;
        pla_reg <= pla_reg_async;
        bpb_reg <= bpb_reg_async;
        plb_reg <= plb_reg_async;
    end
    else begin
        bpa_reg <= bpa_reg_sync;
        pla_reg <= pla_reg_sync;
        bpb_reg <= bpb_reg_sync;
        plb_reg <= plb_reg_sync;
    end
end

always @(posedge CLKA) begin
	if (pcea) begin
		if (WREA) begin
			if (bit_width_d0 == 9)
				{ ram_MEM[addr_a+8],ram_MEM[addr_a+7],ram_MEM[addr_a+6],ram_MEM[addr_a+5],ram_MEM[addr_a+4],ram_MEM[addr_a+3],ram_MEM[addr_a+2],ram_MEM[addr_a+1],ram_MEM[addr_a] } <= DIA[8:0];
			else if(bit_width_d0 == 18) begin
				if(ADA[0] == 1'b1)
					{ ram_MEM[addr_a+8],ram_MEM[addr_a+7],ram_MEM[addr_a+6],ram_MEM[addr_a+5],ram_MEM[addr_a+4],ram_MEM[addr_a+3],ram_MEM[addr_a+2],ram_MEM[addr_a+1],ram_MEM[addr_a] } <= DIA[8:0];
				if(ADA[1] == 1'b1)
					{ ram_MEM[addr_a+17],ram_MEM[addr_a+16],ram_MEM[addr_a+15],ram_MEM[addr_a+14],ram_MEM[addr_a+13],ram_MEM[addr_a+12],ram_MEM[addr_a+11],ram_MEM[addr_a+10],ram_MEM[addr_a+9]} <= DIA[17:9];
			end
			mc <= ~mc;
		end
	end
end

always @(posedge CLKA or posedge RESETA or negedge grstn) begin
	if (!grstn) begin
		pla_reg_async <= 0;
		bpa_reg_async <= 0;
	end else if (RESETA) begin
		pla_reg_async <= 0;
		bpa_reg_async <= 0;
	end else begin
		if(OCEA) begin
			pla_reg_async <= bpa_reg;
		end
		if (pcea) begin
			if (WREA) begin
				if (WRITE_MODE0 == 2'b01) begin
					bpa_reg_async[BIT_WIDTH_0-1:0] <= mem_a[BIT_WIDTH_0-1:0];
                    if (bit_width_d0 == 9)
					    bpa_reg_async[8:0] <= DIA[8:0];
				    else if(bit_width_d0 == 18) begin
					    if(ADA[0] == 1'b1)
						    bpa_reg_async[8:0] <= DIA[8:0];
					    if(ADA[1] == 1'b1)
						    bpa_reg_async[17:9] <= DIA[17:9];
				    end
				end

				if (WRITE_MODE0 == 2'b10) begin
					bpa_reg_async[BIT_WIDTH_0-1:0] <= mem_a[BIT_WIDTH_0-1:0];
				end

			end else begin // WREA==0, read
				bpa_reg_async[BIT_WIDTH_0-1:0] <= mem_a[BIT_WIDTH_0-1:0];
			end

		end
	end
end

always @(posedge CLKA or negedge grstn) begin
	if (!grstn) begin
		pla_reg_sync <= 0;
		bpa_reg_sync <= 0;
	end else if (RESETA) begin
		pla_reg_sync <= 0;
		bpa_reg_sync <= 0;
	end else begin	
		if(OCEA) begin
			pla_reg_sync <= bpa_reg;
		end
		if (pcea) begin
			if (WREA) begin
				if (WRITE_MODE0 == 2'b01) begin
					bpa_reg_sync[BIT_WIDTH_0-1:0] <= mem_a[BIT_WIDTH_0-1:0];
                    if (bit_width_d0 == 9)
					    bpa_reg_sync[8:0] <= DIA[8:0];
				    else if(bit_width_d0 == 18) begin
					    if(ADA[0] == 1'b1)
						    bpa_reg_sync[8:0] <= DIA[8:0];
					    if(ADA[1] == 1'b1)
						    bpa_reg_sync[17:9] <= DIA[17:9];
				    end
				end

				if (WRITE_MODE0 == 2'b10) begin
					bpa_reg_sync[BIT_WIDTH_0-1:0] <= mem_a[BIT_WIDTH_0-1:0];
				end

			end else begin // WREA==0, read
				bpa_reg_sync[BIT_WIDTH_0-1:0] <= mem_a[BIT_WIDTH_0-1:0];
			end

		end
	end
end

always @(posedge CLKB) begin
	if (pceb) begin
		if (WREB) begin
			if (bit_width_d1 == 9)
				{ ram_MEM[addr_b+8],ram_MEM[addr_b+7],ram_MEM[addr_b+6],ram_MEM[addr_b+5],ram_MEM[addr_b+4],ram_MEM[addr_b+3],ram_MEM[addr_b+2],ram_MEM[addr_b+1],ram_MEM[addr_b] } <= DIB[8:0];
			else if(bit_width_d1 == 18) begin
				if(ADB[0] == 1'b1)
					{ ram_MEM[addr_b+8],ram_MEM[addr_b+7],ram_MEM[addr_b+6],ram_MEM[addr_b+5],ram_MEM[addr_b+4],ram_MEM[addr_b+3],ram_MEM[addr_b+2],ram_MEM[addr_b+1],ram_MEM[addr_b] } <= DIB[8:0];
				if(ADB[1] == 1'b1)
					{ram_MEM[addr_b+17],ram_MEM[addr_b+16],ram_MEM[addr_b+15],ram_MEM[addr_b+14],ram_MEM[addr_b+13],ram_MEM[addr_b+12],ram_MEM[addr_b+11],ram_MEM[addr_b+10], ram_MEM[addr_b+9]} <= DIB[17:9];
			end
			mc <= ~mc;
		end
	end
end

always @(posedge CLKB or posedge RESETB or negedge grstn) begin
	if (!grstn) begin
		plb_reg_async <= 0;
		bpb_reg_async <= 0;
	end else if (RESETB) begin
		plb_reg_async <= 0;
		bpb_reg_async <= 0;
	end else begin
		if(OCEB) begin
			plb_reg_async <= bpb_reg;
		end
		if (pceb) begin
			if (WREB) begin
				if (WRITE_MODE1 == 2'b01) begin
					bpb_reg_async[BIT_WIDTH_1-1:0] <= mem_b[BIT_WIDTH_1-1:0];
                    if (bit_width_d1 == 9)
					    bpb_reg_async[8:0] <= DIB[8:0];
				    else if(bit_width_d1 == 18) begin
					    if(ADB[0] == 1'b1)
						    bpb_reg_async[8:0] <= DIB[8:0];
				    	if(ADB[1] == 1'b1)
						    bpb_reg_async[17:9] <= DIB[17:9];
				    end
				end

				if (WRITE_MODE1 == 2'b10) begin
					bpb_reg_async[BIT_WIDTH_1-1:0] <= mem_b[BIT_WIDTH_1-1:0];
				end

			end else begin
				bpb_reg_async[BIT_WIDTH_1-1:0] <= mem_b[BIT_WIDTH_1-1:0];
			end
		end
	end
end

always @(posedge CLKB or negedge grstn) begin
	if (!grstn) begin
		plb_reg_sync <= 0;
		bpb_reg_sync <= 0;
	end else if (RESETB) begin
		plb_reg_sync <= 0;
		bpb_reg_sync <= 0;
	end else begin
		if(OCEB) begin
			plb_reg_sync <= bpb_reg;
		end
		if (pceb) begin
			if (WREB) begin
				if (WRITE_MODE1 == 2'b01) begin
					bpb_reg_sync[BIT_WIDTH_1-1:0] <= mem_b[BIT_WIDTH_1-1:0];
                    if (bit_width_d1 == 9)
					    bpb_reg_sync[8:0] <= DIB[8:0];
				    else if(bit_width_d1 == 18) begin
					    if(ADB[0] == 1'b1)
						    bpb_reg_sync[8:0] <= DIB[8:0];
				    	if(ADB[1] == 1'b1)
						    bpb_reg_sync[17:9] <= DIB[17:9];
				    end
				end

				if (WRITE_MODE1 == 2'b10) begin
					bpb_reg_sync[BIT_WIDTH_1-1:0] <= mem_b[BIT_WIDTH_1-1:0];
				end

			end else begin
				bpb_reg_sync[BIT_WIDTH_1-1:0] <= mem_b[BIT_WIDTH_1-1:0];
			end
		end
	end
end

endmodule // DPX9B: true dual port 18k Block SRAM

//pROM
module pROM (DO, AD, CLK, CE, OCE, RESET);

parameter READ_MODE = 1'b0; // 1'b0: bypass mode; 1'b1: pipeline mode
parameter BIT_WIDTH = 32; // 1, 2, 4, 8, 16, 32
parameter RESET_MODE = "SYNC"; //SYNC, ASYNC
parameter INIT_RAM_00 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_01 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_02 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_03 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_04 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_05 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_06 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_07 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_08 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_09 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_10 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_11 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_12 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_13 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_14 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_15 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_16 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_17 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_18 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_19 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_20 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_21 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_22 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_23 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_24 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_25 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_26 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_27 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_28 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_29 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_30 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_31 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_32 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_33 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_34 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_35 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_36 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_37 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_38 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_39 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3F = 256'h0000000000000000000000000000000000000000000000000000000000000000;

input CLK, CE;
input OCE; // clock enable of memory output register
input RESET; // resets registers, not memory contents
input [13:0] AD;
output [31:0] DO;
reg [31:0] bp_reg,bp_reg_async,bp_reg_sync;
reg [31:0] pl_reg,pl_reg_async,pl_reg_sync;
reg [16383:0] ram_MEM = {INIT_RAM_3F, INIT_RAM_3E, INIT_RAM_3D, INIT_RAM_3C,INIT_RAM_3B, INIT_RAM_3A, INIT_RAM_39, INIT_RAM_38,INIT_RAM_37, INIT_RAM_36, INIT_RAM_35, INIT_RAM_34,INIT_RAM_33, INIT_RAM_32, INIT_RAM_31, INIT_RAM_30,INIT_RAM_2F, INIT_RAM_2E, INIT_RAM_2D, INIT_RAM_2C,INIT_RAM_2B, INIT_RAM_2A, INIT_RAM_29, INIT_RAM_28,INIT_RAM_27, INIT_RAM_26, INIT_RAM_25, INIT_RAM_24,INIT_RAM_23, INIT_RAM_22, INIT_RAM_21, INIT_RAM_20,INIT_RAM_1F, INIT_RAM_1E, INIT_RAM_1D, INIT_RAM_1C,INIT_RAM_1B, INIT_RAM_1A, INIT_RAM_19, INIT_RAM_18,INIT_RAM_17, INIT_RAM_16, INIT_RAM_15, INIT_RAM_14,INIT_RAM_13, INIT_RAM_12, INIT_RAM_11, INIT_RAM_10,INIT_RAM_0F, INIT_RAM_0E, INIT_RAM_0D, INIT_RAM_0C, INIT_RAM_0B, INIT_RAM_0A, INIT_RAM_09, INIT_RAM_08,INIT_RAM_07, INIT_RAM_06, INIT_RAM_05, INIT_RAM_04,INIT_RAM_03, INIT_RAM_02, INIT_RAM_01, INIT_RAM_00};
reg [BIT_WIDTH-1:0] mem_t;
reg [13:0] addr;
integer dwidth = BIT_WIDTH;
integer awidth; // ADDR_WIDTH
wire grstn = GSR.GSRO;

initial begin
    bp_reg = 0;
    pl_reg = 0;
    bp_reg_async = 0;
    bp_reg_sync = 0;
    pl_reg_async = 0;
    pl_reg_sync = 0;
end

initial begin
	case(dwidth)
		1: begin 
			awidth = 14;			
		   end
		2: begin 
			awidth = 13;			
		   end
		4: begin 
			awidth = 12;			
		   end
		8: begin 
			awidth = 11; 			
		   end
		16: begin 
			awidth = 10;
		   end
		32: begin 
			awidth = 9;
		   end
		default: begin
	//		$display ("%d: Unsupported data width\n", dwidth);
	//		$finish;
		end
	endcase
end

always@(AD,awidth)begin
	if(awidth==14)begin
		addr[13:0] = AD[13:0];
		mem_t[0] = ram_MEM[addr];
	end
	else if(awidth==13)begin
		addr[13:0] = {AD[13:1],1'b0};
		mem_t[1:0] = {ram_MEM[addr+1],ram_MEM[addr]};
	end
	else if(awidth==12)begin
		addr[13:0] = {AD[13:2],2'b00};
		mem_t[3:0] = {ram_MEM[addr+3],ram_MEM[addr+2],ram_MEM[addr+1],ram_MEM[addr]};
	end
	else if(awidth==11)begin
		addr[13:0] = {AD[13:3],3'b000};
		mem_t[7:0] = {ram_MEM[addr+7],ram_MEM[addr+6],ram_MEM[addr+5],ram_MEM[addr+4],ram_MEM[addr+3],ram_MEM[addr+2],ram_MEM[addr+1],ram_MEM[addr]};
	end
	else if(awidth==10)begin
		addr[13:0] = {AD[13:4],4'b0000};
		mem_t[15:0] = {ram_MEM[addr+15],ram_MEM[addr+14],ram_MEM[addr+13],ram_MEM[addr+12],ram_MEM[addr+11],ram_MEM[addr+10],ram_MEM[addr+9],ram_MEM[addr+8],ram_MEM[addr+7],ram_MEM[addr+6],ram_MEM[addr+5],ram_MEM[addr+4],ram_MEM[addr+3],ram_MEM[addr+2],ram_MEM[addr+1],ram_MEM[addr]};
	end
	else if(awidth==9)begin
		addr[13:0] = {AD[13:5],5'b00000};
		mem_t[31:0] = {ram_MEM[addr+31],ram_MEM[addr+30],ram_MEM[addr+29],ram_MEM[addr+28],ram_MEM[addr+27],ram_MEM[addr+26],ram_MEM[addr+25],ram_MEM[addr+24],ram_MEM[addr+23],ram_MEM[addr+22],ram_MEM[addr+21],ram_MEM[addr+20],ram_MEM[addr+19],ram_MEM[addr+18],ram_MEM[addr+17],ram_MEM[addr+16],ram_MEM[addr+15],ram_MEM[addr+14],ram_MEM[addr+13],ram_MEM[addr+12],ram_MEM[addr+11],ram_MEM[addr+10],ram_MEM[addr+9],ram_MEM[addr+8],ram_MEM[addr+7],ram_MEM[addr+6],ram_MEM[addr+5],ram_MEM[addr+4],ram_MEM[addr+3],ram_MEM[addr+2],ram_MEM[addr+1],ram_MEM[addr]};
	end
end

assign DO = (READ_MODE === 1'b0)? bp_reg : pl_reg;

always @ (bp_reg_async or bp_reg_sync or pl_reg_async or pl_reg_sync) begin
    if(RESET_MODE == "ASYNC") begin
        bp_reg <= bp_reg_async;
        pl_reg <= pl_reg_async;
    end
    else begin
        bp_reg <= bp_reg_sync;
        pl_reg <= pl_reg_sync;
    end
end

always @(posedge CLK or posedge RESET or negedge grstn) begin
	if (!grstn) begin
		pl_reg_async <= 0;
		bp_reg_async <= 0;
	end else if (RESET) begin
		pl_reg_async <= 0;
		bp_reg_async <= 0;
	end else begin
		if(OCE) begin
			pl_reg_async <= bp_reg;
		end
		if (CE) begin
			bp_reg_async[BIT_WIDTH-1:0] <= mem_t[BIT_WIDTH-1:0];
		end
	end
end	

always @(posedge CLK or negedge grstn) begin
	if (!grstn) begin
		pl_reg_sync <= 0;
		bp_reg_sync <= 0;
	end else if (RESET) begin
		pl_reg_sync <= 0;
		bp_reg_sync <= 0;
	end else begin
		if(OCE) begin
			pl_reg_sync <= bp_reg;
		end
		if (CE) begin
			bp_reg_sync[BIT_WIDTH-1:0] <= mem_t[BIT_WIDTH-1:0];
		end
	end
end

endmodule //pROM

//pROMX9
module pROMX9 (DO, AD, CLK, CE, OCE, RESET);

parameter READ_MODE = 1'b0; // 1'b0: bypass mode; 1'b1: pipeline mode
parameter BIT_WIDTH = 36; // 9, 18, 36
parameter RESET_MODE = "SYNC"; //SYNC,ASYNC
parameter INIT_RAM_00 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000; 
parameter INIT_RAM_01 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_02 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_03 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_04 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_05 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_06 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_07 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_08 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_09 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0A = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0B = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0C = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0D = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0E = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0F = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_10 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_11 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_12 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_13 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_14 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_15 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_16 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_17 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_18 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_19 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1A = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1B = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1C = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1D = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1E = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1F = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_20 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_21 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_22 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_23 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_24 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_25 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_26 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_27 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_28 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_29 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2A = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2B = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2C = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2D = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2E = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2F = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_30 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_31 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_32 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_33 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_34 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_35 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_36 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_37 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_38 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_39 = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3A = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3B = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3C = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3D = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3E = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3F = 288'h000000000000000000000000000000000000000000000000000000000000000000000000;

input CLK, CE;
input OCE; // clock enable of memory output register
input RESET; // resets registers, not memory contents
input [13:0] AD;
output [35:0] DO;

reg [35:0] bp_reg,bp_reg_async,bp_reg_sync;
reg [35:0] pl_reg,pl_reg_async,pl_reg_sync;
reg [18431:0] ram_MEM = {INIT_RAM_3F, INIT_RAM_3E, INIT_RAM_3D, INIT_RAM_3C,INIT_RAM_3B, INIT_RAM_3A, INIT_RAM_39, INIT_RAM_38,INIT_RAM_37, INIT_RAM_36, INIT_RAM_35, INIT_RAM_34,INIT_RAM_33, INIT_RAM_32, INIT_RAM_31, INIT_RAM_30,INIT_RAM_2F, INIT_RAM_2E, INIT_RAM_2D, INIT_RAM_2C,INIT_RAM_2B, INIT_RAM_2A, INIT_RAM_29, INIT_RAM_28,INIT_RAM_27, INIT_RAM_26, INIT_RAM_25, INIT_RAM_24,INIT_RAM_23, INIT_RAM_22, INIT_RAM_21, INIT_RAM_20,INIT_RAM_1F, INIT_RAM_1E, INIT_RAM_1D, INIT_RAM_1C,INIT_RAM_1B, INIT_RAM_1A, INIT_RAM_19, INIT_RAM_18,INIT_RAM_17, INIT_RAM_16, INIT_RAM_15, INIT_RAM_14,INIT_RAM_13, INIT_RAM_12, INIT_RAM_11, INIT_RAM_10,INIT_RAM_0F, INIT_RAM_0E, INIT_RAM_0D, INIT_RAM_0C, INIT_RAM_0B, INIT_RAM_0A, INIT_RAM_09, INIT_RAM_08,INIT_RAM_07, INIT_RAM_06, INIT_RAM_05, INIT_RAM_04,INIT_RAM_03, INIT_RAM_02, INIT_RAM_01, INIT_RAM_00};
reg [BIT_WIDTH-1:0] mem_t;
reg [14:0] addr;
integer dwidth = BIT_WIDTH;
integer awidth; // ADDR_WIDTH
wire grstn = GSR.GSRO;

initial begin
    bp_reg = 0;
    pl_reg = 0;
    bp_reg_async = 0;
    bp_reg_sync = 0;
    pl_reg_async = 0;
    pl_reg_sync = 0;
end

initial begin
	case(dwidth)
		9: begin awidth = 11; 
		   end
		18: begin awidth = 10; 
			end
		36: begin awidth = 9; 
		    end
		default: begin
		//	$display ("%d: Unsupported data width\n", dwidth);
		//	$finish;
		end
	endcase
end

always@(AD,awidth)begin	
	if(awidth==11)begin
		addr[14:0] = AD[13:3]*dwidth;
		mem_t[8:0] = {ram_MEM[addr+8],ram_MEM[addr+7],ram_MEM[addr+6],ram_MEM[addr+5],ram_MEM[addr+4],ram_MEM[addr+3],ram_MEM[addr+2],ram_MEM[addr+1],ram_MEM[addr]};

	end
	else if(awidth==10)begin
		addr[14:0] = AD[13:4]*dwidth;
		mem_t[17:0] = {ram_MEM[addr+17],ram_MEM[addr+16],ram_MEM[addr+15],ram_MEM[addr+14],ram_MEM[addr+13],ram_MEM[addr+12],ram_MEM[addr+11],ram_MEM[addr+10],ram_MEM[addr+9],ram_MEM[addr+8],ram_MEM[addr+7],ram_MEM[addr+6],ram_MEM[addr+5],ram_MEM[addr+4],ram_MEM[addr+3],ram_MEM[addr+2],ram_MEM[addr+1],ram_MEM[addr]};
	end
	else if(awidth==9)begin
		addr[14:0] = AD[13:5]*dwidth;
		mem_t[35:0] = {ram_MEM[addr+35],ram_MEM[addr+34],ram_MEM[addr+33],ram_MEM[addr+32],ram_MEM[addr+31],ram_MEM[addr+30],ram_MEM[addr+29],ram_MEM[addr+28],ram_MEM[addr+27],ram_MEM[addr+26],ram_MEM[addr+25],ram_MEM[addr+24],ram_MEM[addr+23],ram_MEM[addr+22],ram_MEM[addr+21],ram_MEM[addr+20],ram_MEM[addr+19],ram_MEM[addr+18],ram_MEM[addr+17],ram_MEM[addr+16],ram_MEM[addr+15],ram_MEM[addr+14],ram_MEM[addr+13],ram_MEM[addr+12],ram_MEM[addr+11],ram_MEM[addr+10],ram_MEM[addr+9],ram_MEM[addr+8],ram_MEM[addr+7],ram_MEM[addr+6],ram_MEM[addr+5],ram_MEM[addr+4],ram_MEM[addr+3],ram_MEM[addr+2],ram_MEM[addr+1],ram_MEM[addr]};
	end
end

assign DO = (READ_MODE === 1'b0)? bp_reg: pl_reg;

always @ (bp_reg_async or bp_reg_sync or pl_reg_async or pl_reg_sync) begin
    if(RESET_MODE == "ASYNC") begin
        bp_reg <= bp_reg_async;
        pl_reg <= pl_reg_async;
    end
    else begin
        bp_reg <= bp_reg_sync;
        pl_reg <= pl_reg_sync;
    end
end

always @(posedge CLK or posedge RESET or negedge grstn) begin
	if (!grstn) begin
		pl_reg_async <= 0;
		bp_reg_async <= 0;
	end else if (RESET) begin
		pl_reg_async <= 0;
		bp_reg_async <= 0;
	end else begin
		if(OCE) begin
			pl_reg_async <= bp_reg;
		end
		if (CE) begin
			bp_reg_async[BIT_WIDTH-1:0] <= mem_t[BIT_WIDTH-1:0];
		end
	end
end

always @(posedge CLK or negedge grstn) begin
	if (!grstn) begin
		pl_reg_sync <= 0;
		bp_reg_sync <= 0;
	end else if (RESET) begin
		pl_reg_sync <= 0;
		bp_reg_sync <= 0;
	end else begin
		if(OCE) begin
			pl_reg_sync <= bp_reg;
		end
		if (CE) begin
			bp_reg_sync[BIT_WIDTH-1:0] <= mem_t[BIT_WIDTH-1:0];
		end
	end
end	

endmodule //pROMX9


//SDP36KE
module SDP36KE (DO, DOP, DECCO, SECCO, ECCP, DI, DIP, BLKSELA, BLKSELB, ADA, ADB, DECCI, SECCI, CLKA, CLKB, CEA, CEB, OCE, RESET);

parameter ECC_WRITE_EN="FALSE"; //"FALSE":disable ECC WRITE mode; "TRUE":enable ECC WRITE mode
parameter ECC_READ_EN="FALSE"; //"FALSE":disable ECC READ mode; "TRUE":enable ECC READ mode
parameter READ_MODE = 1'b0; // 1'b0: bypass mode; 1'b1: pipeline mode
parameter BLK_SEL_A = 3'b000;
parameter BLK_SEL_B = 3'b000;
parameter RESET_MODE = "SYNC"; //SYNC,ASYNC
parameter INIT_FILE = "NONE"; //"NONE","*.ini"
parameter INIT_RAM_00 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_01 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_02 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_03 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_04 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_05 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_06 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_07 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_08 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_09 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_0F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_10 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_11 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_12 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_13 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_14 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_15 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_16 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_17 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_18 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_19 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_1F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_20 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_21 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_22 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_23 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_24 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_25 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_26 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_27 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_28 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_29 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_2F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_30 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_31 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_32 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_33 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_34 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_35 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_36 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_37 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_38 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_39 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_3F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_40 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_41 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_42 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_43 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_44 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_45 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_46 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_47 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_48 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_49 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_4A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_4B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_4C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_4D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_4E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_4F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_50 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_51 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_52 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_53 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_54 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_55 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_56 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_57 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_58 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_59 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_5A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_5B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_5C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_5D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_5E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_5F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_60 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_61 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_62 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_63 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_64 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_65 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_66 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_67 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_68 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_69 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_6A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_6B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_6C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_6D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_6E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_6F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_70 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_71 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_72 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_73 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_74 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_75 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_76 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_77 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_78 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_79 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_7A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_7B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_7C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_7D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_7E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INIT_RAM_7F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INITP_RAM_00 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INITP_RAM_01 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INITP_RAM_02 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INITP_RAM_03 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INITP_RAM_04 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INITP_RAM_05 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INITP_RAM_06 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INITP_RAM_07 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INITP_RAM_08 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INITP_RAM_09 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INITP_RAM_0A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INITP_RAM_0B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INITP_RAM_0C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INITP_RAM_0D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INITP_RAM_0E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
parameter INITP_RAM_0F = 256'h0000000000000000000000000000000000000000000000000000000000000000;

input CLKA, CEA, CLKB, CEB;
input OCE; // clock enable of memory output register
input RESET; // resets output registers, not memory contents
input [8:0] ADA, ADB;
input [63:0] DI;
input [7:0] DIP;
input [2:0] BLKSELA, BLKSELB;
input DECCI, SECCI;
output [63:0] DO;
output [7:0] DOP;
output DECCO, SECCO;
output [7:0] ECCP;

localparam mem_depth = 512;

reg [73:0] pl_reg,pl_reg_async,pl_reg_sync;
reg [73:0] bp_reg,bp_reg_async,bp_reg_sync;
reg DECCO, SECCO; 
reg [7:0] ECCP;
reg [63:0] DO;
reg [7:0] DOP;
reg [36863:0] ram_MEM;
reg [32767:0] mem_32k;
reg [4095:0]  memp_4k;
reg [71:0] mem_a;
reg [71:0] mem_b;
reg mc,bs_ena,bs_enb;
wire pcea,pceb;
integer bit_width_da = 72;
integer bit_width_db = 72;
integer bit_depth_ada = 9;
integer bit_depth_adb = 9; // ADDR_WIDTH
reg [16:0] addr_a, addr_b;
//wire [9:0] addr_a_r,addr_b_r;
reg [63:0] data_b;
integer width_max = 72;
integer i_a,i_d,i_m,i;
reg [7:0] ecc_a, ecc_b;
reg [7:0] ecc_addr;
reg [1:0] ecc_err;
wire grstn = GSR.GSRO;
reg [71:0] mem_init [mem_depth-1:0];
   
initial begin
    mem_32k = {INIT_RAM_7F, INIT_RAM_7E, INIT_RAM_7D, INIT_RAM_7C,INIT_RAM_7B, INIT_RAM_7A, INIT_RAM_79, INIT_RAM_78,INIT_RAM_77, INIT_RAM_76, INIT_RAM_75, INIT_RAM_74,INIT_RAM_73, INIT_RAM_72, INIT_RAM_71, INIT_RAM_70,INIT_RAM_6F, INIT_RAM_6E, INIT_RAM_6D, INIT_RAM_6C,INIT_RAM_6B, INIT_RAM_6A, INIT_RAM_69, INIT_RAM_68,INIT_RAM_67, INIT_RAM_66, INIT_RAM_65, INIT_RAM_64,INIT_RAM_63, INIT_RAM_62, INIT_RAM_61, INIT_RAM_60,INIT_RAM_5F, INIT_RAM_5E, INIT_RAM_5D, INIT_RAM_5C,INIT_RAM_5B, INIT_RAM_5A, INIT_RAM_59, INIT_RAM_58,INIT_RAM_57, INIT_RAM_56, INIT_RAM_55, INIT_RAM_54,INIT_RAM_53, INIT_RAM_52, INIT_RAM_51, INIT_RAM_50,INIT_RAM_4F, INIT_RAM_4E, INIT_RAM_4D, INIT_RAM_4C,INIT_RAM_4B, INIT_RAM_4A, INIT_RAM_49, INIT_RAM_48,INIT_RAM_47, INIT_RAM_46, INIT_RAM_45, INIT_RAM_44,INIT_RAM_43, INIT_RAM_42, INIT_RAM_41, INIT_RAM_40,INIT_RAM_3F, INIT_RAM_3E, INIT_RAM_3D, INIT_RAM_3C,INIT_RAM_3B, INIT_RAM_3A, INIT_RAM_39, INIT_RAM_38,INIT_RAM_37, INIT_RAM_36, INIT_RAM_35, INIT_RAM_34,INIT_RAM_33, INIT_RAM_32, INIT_RAM_31, INIT_RAM_30,INIT_RAM_2F, INIT_RAM_2E, INIT_RAM_2D, INIT_RAM_2C,INIT_RAM_2B, INIT_RAM_2A, INIT_RAM_29, INIT_RAM_28,INIT_RAM_27, INIT_RAM_26, INIT_RAM_25, INIT_RAM_24,INIT_RAM_23, INIT_RAM_22, INIT_RAM_21, INIT_RAM_20,INIT_RAM_1F, INIT_RAM_1E, INIT_RAM_1D, INIT_RAM_1C,INIT_RAM_1B, INIT_RAM_1A, INIT_RAM_19, INIT_RAM_18,INIT_RAM_17, INIT_RAM_16, INIT_RAM_15, INIT_RAM_14,INIT_RAM_13, INIT_RAM_12, INIT_RAM_11, INIT_RAM_10,INIT_RAM_0F, INIT_RAM_0E, INIT_RAM_0D, INIT_RAM_0C, INIT_RAM_0B, INIT_RAM_0A, INIT_RAM_09, INIT_RAM_08,INIT_RAM_07, INIT_RAM_06, INIT_RAM_05, INIT_RAM_04,INIT_RAM_03, INIT_RAM_02, INIT_RAM_01, INIT_RAM_00};
    memp_4k = {INITP_RAM_0F, INITP_RAM_0E, INITP_RAM_0D, INITP_RAM_0C, INITP_RAM_0B, INITP_RAM_0A, INITP_RAM_09, INITP_RAM_08,INITP_RAM_07, INITP_RAM_06, INITP_RAM_05, INITP_RAM_04,INITP_RAM_03, INITP_RAM_02, INITP_RAM_01, INITP_RAM_00};

    if (INIT_FILE == "NONE") begin
        if(width_max == 72) begin
            for(i=0;i<2**9;i=i+1)
            begin
                ram_MEM[(i*72+71)-:72] = {memp_4k [i*8+7],mem_32k[(i*64+63)-:8],memp_4k [i*8+6],mem_32k[(i*64+55)-:8],memp_4k [i*8+5],mem_32k[(i*64+47)-:8],memp_4k [i*8+4],mem_32k[(i*64+39)-:8],memp_4k [i*8+3],mem_32k[(i*64+31)-:8],memp_4k [i*8+2],mem_32k[(i*64+23)-:8],memp_4k [i*8+1],mem_32k[(i*64+15)-:8],memp_4k [i*8],mem_32k[(i*64+7)-:8]};
            end
        end

    end else begin // memory initialization from memory file

	    for (i_a = 0; i_a < mem_depth; i_a = i_a + 1) begin
		    for (i_d = 0; i_d < width_max; i_d = i_d + 1) begin
		        mem_init[i_a][i_d] = 1'b0;
		    end
	    end
	    
	    $readmemh (INIT_FILE, mem_init);

	    case (width_max)
	    72 : for (i_m = 0; i_m <= mem_depth; i_m = i_m + 1) begin
		         ram_MEM[(i_m*72+71)-:72] = mem_init[i_m];
	         end
		
	    endcase //
	    
	end

end


initial begin
    bp_reg = 0;
    pl_reg = 0;
    bp_reg_async = 0;
    bp_reg_sync = 0;
    pl_reg_async = 0;
    pl_reg_sync = 0;
    mc = 1'b0;
    ECCP = 8'b0;
end

assign pcea = CEA && bs_ena && grstn;
assign pceb = CEB && bs_enb;

always @ (BLKSELA, BLKSELB)
begin
	if(BLKSELA == BLK_SEL_A) begin
		bs_ena = 1;
	end else begin
		bs_ena = 0;
	end

    if(BLKSELB == BLK_SEL_B) begin
		bs_enb = 1;
	end else begin
		bs_enb = 0;
	end
end

always@(ADA,ADB,bit_depth_ada,bit_depth_adb,mc)begin
	if(bit_depth_ada==9)begin
		addr_a = ADA[8:0]*72;
	end

	if(bit_depth_adb==9)begin
		addr_b = ADB[8:0]*72;
		mem_b[71:0]= ram_MEM[(addr_b+71)-:72];
	end
end

always @(DI) begin
    ecc_a[0] = DI[ 0]^DI[ 1]^DI[ 2]^DI[ 3]^DI[ 4]^DI[ 5]^DI[ 6]^DI[ 7]^DI[10]^DI[13]^DI[14]^DI[17]^DI[20]^DI[23]^DI[24]^DI[27]^DI[35]^DI[43]^DI[46]^DI[47]^DI[51]^DI[52]^DI[53]^DI[56]^DI[57]^DI[58];
    ecc_a[1] = DI[ 0]^DI[ 1]^DI[ 2]^DI[ 8]^DI[ 9]^DI[10]^DI[11]^DI[12]^DI[13]^DI[14]^DI[15]^DI[18]^DI[21]^DI[22]^DI[25]^DI[28]^DI[31]^DI[32]^DI[35]^DI[43]^DI[51]^DI[54]^DI[55]^DI[59]^DI[60]^DI[61];
    ecc_a[2] = DI[ 3]^DI[ 4]^DI[ 5]^DI[ 8]^DI[ 9]^DI[10]^DI[16]^DI[17]^DI[18]^DI[19]^DI[20]^DI[21]^DI[22]^DI[23]^DI[26]^DI[29]^DI[30]^DI[33]^DI[36]^DI[39]^DI[40]^DI[43]^DI[51]^DI[59]^DI[62]^DI[63];
    ecc_a[3] = DI[ 3]^DI[ 6]^DI[ 7]^DI[11]^DI[12]^DI[13]^DI[16]^DI[17]^DI[18]^DI[24]^DI[25]^DI[26]^DI[27]^DI[28]^DI[29]^DI[30]^DI[31]^DI[34]^DI[37]^DI[38]^DI[41]^DI[44]^DI[47]^DI[48]^DI[51]^DI[59];
    ecc_a[4] = DI[ 3]^DI[11]^DI[14]^DI[15]^DI[19]^DI[20]^DI[21]^DI[24]^DI[25]^DI[26]^DI[32]^DI[33]^DI[34]^DI[35]^DI[36]^DI[37]^DI[38]^DI[39]^DI[42]^DI[45]^DI[46]^DI[49]^DI[52]^DI[55]^DI[56]^DI[59];
    ecc_a[5] = DI[ 0]^DI[ 3]^DI[11]^DI[19]^DI[22]^DI[23]^DI[27]^DI[28]^DI[29]^DI[32]^DI[33]^DI[34]^DI[40]^DI[41]^DI[42]^DI[43]^DI[44]^DI[45]^DI[46]^DI[47]^DI[50]^DI[53]^DI[54]^DI[57]^DI[60]^DI[63];
    ecc_a[6] = DI[ 1]^DI[ 4]^DI[ 7]^DI[ 8]^DI[11]^DI[19]^DI[27]^DI[30]^DI[31]^DI[35]^DI[36]^DI[37]^DI[40]^DI[41]^DI[42]^DI[48]^DI[49]^DI[50]^DI[51]^DI[52]^DI[53]^DI[54]^DI[55]^DI[58]^DI[61]^DI[62];
    ecc_a[7] = DI[ 2]^DI[ 5]^DI[ 6]^DI[ 9]^DI[12]^DI[15]^DI[16]^DI[19]^DI[27]^DI[35]^DI[38]^DI[39]^DI[43]^DI[44]^DI[45]^DI[48]^DI[49]^DI[50]^DI[56]^DI[57]^DI[58]^DI[59]^DI[60]^DI[61]^DI[62]^DI[63];
end

always @(posedge CLKA) begin
	if (pcea) begin
	    if(bit_width_da==72) begin
            if(ECC_WRITE_EN == "TRUE") begin
                {ram_MEM[(addr_a+71)-:9]} <= DECCI ? {ecc_a[7],DI[63],!DI[62],DI[61:56]} : {ecc_a[7],DI[63:56]};
                {ram_MEM[(addr_a+62)-:9]} <= {ecc_a[6],DI[55:48]};
                {ram_MEM[(addr_a+53)-:9]} <= {ecc_a[5],DI[47:40]};
                {ram_MEM[(addr_a+44)-:9]} <= {ecc_a[4],DI[39:32]};
                {ram_MEM[(addr_a+35)-:9]} <= (SECCI | DECCI) ? {ecc_a[3],DI[31],!DI[30],DI[29:24]} : {ecc_a[3],DI[31:24]};
                {ram_MEM[(addr_a+26)-:9]} <= {ecc_a[2],DI[23:16]};
                {ram_MEM[(addr_a+17)-:9]} <= {ecc_a[1],DI[15:8]};
                {ram_MEM[(addr_a+8)-:9]} <= {ecc_a[0],DI[7:0]};
            end else begin                
                {ram_MEM[(addr_a+71)-:9]} <= DECCI ? {DIP[7],DI[63],!DI[62],DI[61:56]} : {DIP[7],DI[63:56]};
                {ram_MEM[(addr_a+62)-:9]} <= {DIP[6],DI[55:48]};
                {ram_MEM[(addr_a+53)-:9]} <= {DIP[5],DI[47:40]};
                {ram_MEM[(addr_a+44)-:9]} <= {DIP[4],DI[39:32]};
                {ram_MEM[(addr_a+35)-:9]} <= (SECCI | DECCI) ? {DIP[3],DI[31],!DI[30],DI[29:24]} : {DIP[3],DI[31:24]};
                {ram_MEM[(addr_a+26)-:9]} <= {DIP[2],DI[23:16]};
                {ram_MEM[(addr_a+17)-:9]} <= {DIP[1],DI[15:8]};
                {ram_MEM[(addr_a+8)-:9]} <= {DIP[0],DI[7:0]};

            end
        end
		mc <= ~mc;
	end
end

always @(addr_b or ram_MEM) begin

    data_b = {ram_MEM[(addr_b+70)-:8],ram_MEM[(addr_b+61)-:8],ram_MEM[(addr_b+52)-:8],ram_MEM[(addr_b+43)-:8],ram_MEM[(addr_b+34)-:8],ram_MEM[(addr_b+25)-:8],ram_MEM[(addr_b+16)-:8],ram_MEM[(addr_b+7)-:8]};
    ecc_b = {ram_MEM[addr_b+71],ram_MEM[addr_b+62],ram_MEM[addr_b+53],ram_MEM[addr_b+44],ram_MEM[addr_b+35],ram_MEM[addr_b+26],ram_MEM[addr_b+17],ram_MEM[addr_b+8]};
    
    if (ECC_READ_EN == "TRUE") begin
      ecc_addr[0] = ecc_b[0]^data_b[ 0]^data_b[ 1]^data_b[ 2]^data_b[ 3]^data_b[ 4]^data_b[ 5]^data_b[ 6]^data_b[ 7]^data_b[10]^data_b[13]^data_b[14]^data_b[17]^data_b[20]^data_b[23]^data_b[24]^data_b[27]^data_b[35]^data_b[43]^data_b[46]^data_b[47]^data_b[51]^data_b[52]^data_b[53]^data_b[56]^data_b[57]^data_b[58];
      ecc_addr[1] = ecc_b[1]^data_b[ 0]^data_b[ 1]^data_b[ 2]^data_b[ 8]^data_b[ 9]^data_b[10]^data_b[11]^data_b[12]^data_b[13]^data_b[14]^data_b[15]^data_b[18]^data_b[21]^data_b[22]^data_b[25]^data_b[28]^data_b[31]^data_b[32]^data_b[35]^data_b[43]^data_b[51]^data_b[54]^data_b[55]^data_b[59]^data_b[60]^data_b[61];
      ecc_addr[2] = ecc_b[2]^data_b[ 3]^data_b[ 4]^data_b[ 5]^data_b[ 8]^data_b[ 9]^data_b[10]^data_b[16]^data_b[17]^data_b[18]^data_b[19]^data_b[20]^data_b[21]^data_b[22]^data_b[23]^data_b[26]^data_b[29]^data_b[30]^data_b[33]^data_b[36]^data_b[39]^data_b[40]^data_b[43]^data_b[51]^data_b[59]^data_b[62]^data_b[63];
      ecc_addr[3] = ecc_b[3]^data_b[ 3]^data_b[ 6]^data_b[ 7]^data_b[11]^data_b[12]^data_b[13]^data_b[16]^data_b[17]^data_b[18]^data_b[24]^data_b[25]^data_b[26]^data_b[27]^data_b[28]^data_b[29]^data_b[30]^data_b[31]^data_b[34]^data_b[37]^data_b[38]^data_b[41]^data_b[44]^data_b[47]^data_b[48]^data_b[51]^data_b[59];
      ecc_addr[4] = ecc_b[4]^data_b[ 3]^data_b[11]^data_b[14]^data_b[15]^data_b[19]^data_b[20]^data_b[21]^data_b[24]^data_b[25]^data_b[26]^data_b[32]^data_b[33]^data_b[34]^data_b[35]^data_b[36]^data_b[37]^data_b[38]^data_b[39]^data_b[42]^data_b[45]^data_b[46]^data_b[49]^data_b[52]^data_b[55]^data_b[56]^data_b[59];
      ecc_addr[5] = ecc_b[5]^data_b[ 0]^data_b[ 3]^data_b[11]^data_b[19]^data_b[22]^data_b[23]^data_b[27]^data_b[28]^data_b[29]^data_b[32]^data_b[33]^data_b[34]^data_b[40]^data_b[41]^data_b[42]^data_b[43]^data_b[44]^data_b[45]^data_b[46]^data_b[47]^data_b[50]^data_b[53]^data_b[54]^data_b[57]^data_b[60]^data_b[63];
      ecc_addr[6] = ecc_b[6]^data_b[ 1]^data_b[ 4]^data_b[ 7]^data_b[ 8]^data_b[11]^data_b[19]^data_b[27]^data_b[30]^data_b[31]^data_b[35]^data_b[36]^data_b[37]^data_b[40]^data_b[41]^data_b[42]^data_b[48]^data_b[49]^data_b[50]^data_b[51]^data_b[52]^data_b[53]^data_b[54]^data_b[55]^data_b[58]^data_b[61]^data_b[62];
      ecc_addr[7] = ecc_b[7]^data_b[ 2]^data_b[ 5]^data_b[ 6]^data_b[ 9]^data_b[12]^data_b[15]^data_b[16]^data_b[19]^data_b[27]^data_b[35]^data_b[38]^data_b[39]^data_b[43]^data_b[44]^data_b[45]^data_b[48]^data_b[49]^data_b[50]^data_b[56]^data_b[57]^data_b[58]^data_b[59]^data_b[60]^data_b[61]^data_b[62]^data_b[63];
  
      if (ecc_addr) begin
        ecc_err = {!(^ecc_addr),^ecc_addr};
        case (ecc_addr)
          8'b00100011: data_b[ 0] = !data_b[ 0];
          8'b01000011: data_b[ 1] = !data_b[ 1];
          8'b10000011: data_b[ 2] = !data_b[ 2];
          8'b00111101: data_b[ 3] = !data_b[ 3];
          8'b01000101: data_b[ 4] = !data_b[ 4];
          8'b10000101: data_b[ 5] = !data_b[ 5];
          8'b10001001: data_b[ 6] = !data_b[ 6];
          8'b01001001: data_b[ 7] = !data_b[ 7];
          8'b01000110: data_b[ 8] = !data_b[ 8];
          8'b10000110: data_b[ 9] = !data_b[ 9];
          8'b00000111: data_b[10] = !data_b[10];
          8'b01111010: data_b[11] = !data_b[11];
          8'b10001010: data_b[12] = !data_b[12];
          8'b00001011: data_b[13] = !data_b[13];
          8'b00010011: data_b[14] = !data_b[14];
          8'b10010010: data_b[15] = !data_b[15];
          8'b10001100: data_b[16] = !data_b[16];
          8'b00001101: data_b[17] = !data_b[17];
          8'b00001110: data_b[18] = !data_b[18];
          8'b11110100: data_b[19] = !data_b[19];
          8'b00010101: data_b[20] = !data_b[20];
          8'b00010110: data_b[21] = !data_b[21];
          8'b00100110: data_b[22] = !data_b[22];
          8'b00100101: data_b[23] = !data_b[23];
          8'b00011001: data_b[24] = !data_b[24];
          8'b00011010: data_b[25] = !data_b[25];
          8'b00011100: data_b[26] = !data_b[26];
          8'b11101001: data_b[27] = !data_b[27];
          8'b00101010: data_b[28] = !data_b[28];
          8'b00101100: data_b[29] = !data_b[29];
          8'b01001100: data_b[30] = !data_b[30];
          8'b01001010: data_b[31] = !data_b[31];
          8'b00110010: data_b[32] = !data_b[32];
          8'b00110100: data_b[33] = !data_b[33];
          8'b00111000: data_b[34] = !data_b[34];
          8'b11010011: data_b[35] = !data_b[35];
          8'b01010100: data_b[36] = !data_b[36];
          8'b01011000: data_b[37] = !data_b[37];
          8'b10011000: data_b[38] = !data_b[38];
          8'b10010100: data_b[39] = !data_b[39];
          8'b01100100: data_b[40] = !data_b[40];
          8'b01101000: data_b[41] = !data_b[41];
          8'b01110000: data_b[42] = !data_b[42];
          8'b10100111: data_b[43] = !data_b[43];
          8'b10101000: data_b[44] = !data_b[44];
          8'b10110000: data_b[45] = !data_b[45];
          8'b00110001: data_b[46] = !data_b[46];
          8'b00101001: data_b[47] = !data_b[47];
          8'b11001000: data_b[48] = !data_b[48];
          8'b11010000: data_b[49] = !data_b[49];
          8'b11100000: data_b[50] = !data_b[50];
          8'b01001111: data_b[51] = !data_b[51];
          8'b01010001: data_b[52] = !data_b[52];
          8'b01100001: data_b[53] = !data_b[53];
          8'b01100010: data_b[54] = !data_b[54];
          8'b01010010: data_b[55] = !data_b[55];
          8'b10010001: data_b[56] = !data_b[56];
          8'b10100001: data_b[57] = !data_b[57];
          8'b11000001: data_b[58] = !data_b[58];
          8'b10011110: data_b[59] = !data_b[59];
          8'b10100010: data_b[60] = !data_b[60];
          8'b11000010: data_b[61] = !data_b[61];
          8'b11000100: data_b[62] = !data_b[62];
          8'b10100100: data_b[63] = !data_b[63];
          8'b00000001: ecc_b[0] = !ecc_b[0];
          8'b00000010: ecc_b[1] = !ecc_b[1];
          8'b00000100: ecc_b[2] = !ecc_b[2];
          8'b00001000: ecc_b[3] = !ecc_b[3];
          8'b00010000: ecc_b[4] = !ecc_b[4];
          8'b00100000: ecc_b[5] = !ecc_b[5];
          8'b01000000: ecc_b[6] = !ecc_b[6];
          8'b10000000: ecc_b[7] = !ecc_b[7];
        endcase
      end
      else
        ecc_err = 2'b00;
    end
    else
      ecc_err = 2'b00;
  end

always @ (bp_reg_async or bp_reg_sync or pl_reg_async or pl_reg_sync) begin
    if(RESET_MODE == "ASYNC") begin
        bp_reg <= bp_reg_async;
        pl_reg <= pl_reg_async;
    end
    else begin
        bp_reg <= bp_reg_sync;
        pl_reg <= pl_reg_sync;
    end
end

always @(posedge CLKB or posedge RESET or negedge grstn) begin
	if (!grstn) begin
		pl_reg_async <= 0;
		bp_reg_async <= 0;
	end else if (RESET) begin
		pl_reg_async <= 0;
		bp_reg_async <= 0;
	end else begin
		if(OCE) begin
			pl_reg_async <= bp_reg;
		end
		if (pceb) begin
            bp_reg_async[73:0] <= {ecc_err,ecc_b,data_b};
		end
	end
end

always @(posedge CLKB or negedge grstn) begin
	if (!grstn) begin
		pl_reg_sync <= 0;
		bp_reg_sync <= 0;
	end else if (RESET) begin
		pl_reg_sync <= 0;
		bp_reg_sync <= 0;
	end else begin
		if(OCE) begin
			pl_reg_sync <= bp_reg;
		end
		if (pceb) begin
			bp_reg_sync[73:0] <= {ecc_err,ecc_b,data_b};
		end
	end
end

always @(bp_reg, pl_reg)
begin
    if(READ_MODE == 1'b0)
    begin
        DO <= {bp_reg[63:0]};
        DOP <= {bp_reg[71:64]};
        SECCO <= bp_reg[72];
        DECCO <= bp_reg[73];
    end else begin
        DO <= pl_reg[63:0];
        DOP <= {pl_reg[71:64]};
        SECCO <= pl_reg[72];
        DECCO <= pl_reg[73];

    end
end

always @(posedge CLKA or negedge grstn)begin
    if (!grstn) begin
        ECCP = 8'b0;
    end
    else if (ECC_WRITE_EN=="TRUE" || ECC_READ_EN=="TRUE")begin
        ECCP = ecc_a;
    end
end  

endmodule // SDP36KE: semi dual port 36k Block SRAM with ECC


//////DSP models
//MULTADDALU12X12
module MULTADDALU12X12 (DOUT, CASO, A0, B0, A1, B1, CASI, ACCSEL, CASISEL, ADDSUB, CLK, CE, RESET);

parameter A0REG_CLK = "BYPASS"; // "BYPASS","CLK0","CLK1"
parameter A0REG_CE = "CE0"; // "CE0","CE1"
parameter A0REG_RESET = "RESET0"; //"RESET0", "RESET1"

parameter A1REG_CLK = "BYPASS"; // "BYPASS","CLK0","CLK1"
parameter A1REG_CE = "CE0"; // "CE0","CE1"
parameter A1REG_RESET = "RESET0"; //"RESET0", "RESET1"

parameter B0REG_CLK = "BYPASS"; // "BYPASS","CLK0","CLK1"
parameter B0REG_CE = "CE0"; // "CE0","CE1"
parameter B0REG_RESET = "RESET0"; //"RESET0", "RESET1"

parameter B1REG_CLK = "BYPASS"; // "BYPASS","CLK0","CLK1"
parameter B1REG_CE = "CE0"; // "CE0","CE1"
parameter B1REG_RESET = "RESET0"; //"RESET0", "RESET1"

parameter ACCSEL_IREG_CLK = "BYPASS"; // "BYPASS","CLK0","CLK1"
parameter ACCSEL_IREG_CE = "CE0"; // "CE0","CE1"
parameter ACCSEL_IREG_RESET = "RESET0"; //"RESET0", "RESET1"

parameter CASISEL_IREG_CLK = "BYPASS"; // "BYPASS","CLK0","CLK1"
parameter CASISEL_IREG_CE = "CE0"; // "CE0","CE1"
parameter CASISEL_IREG_RESET = "RESET0"; //"RESET0", "RESET1"

parameter ADDSUB0_IREG_CLK = "BYPASS"; // "BYPASS","CLK0","CLK1"
parameter ADDSUB0_IREG_CE = "CE0"; // "CE0","CE1"
parameter ADDSUB0_IREG_RESET = "RESET0"; //"RESET0", "RESET1"

parameter ADDSUB1_IREG_CLK = "BYPASS"; // "BYPASS","CLK0","CLK1"
parameter ADDSUB1_IREG_CE = "CE0"; // "CE0","CE1"
parameter ADDSUB1_IREG_RESET = "RESET0"; //"RESET0", "RESET1"

parameter PREG0_CLK = "BYPASS"; // "BYPASS","CLK0","CLK1"     //mult0 pipeline register
parameter PREG0_CE = "CE0"; // "CE0","CE1"
parameter PREG0_RESET = "RESET0"; //"RESET0", "RESET1"

parameter PREG1_CLK = "BYPASS"; // "BYPASS","CLK0","CLK1"     //mult1 pipeline register
parameter PREG1_CE = "CE0"; // "CE0","CE1"
parameter PREG1_RESET = "RESET0"; //"RESET0", "RESET1"

parameter FB_PREG_EN = "FALSE"; // "FALSE";"TRUE"      //feedback acc pipeline register,same clk/ce/reset as OREG

parameter ACCSEL_PREG_CLK = "BYPASS"; // "BYPASS","CLK0","CLK1"
parameter ACCSEL_PREG_CE = "CE0"; // "CE0","CE1"
parameter ACCSEL_PREG_RESET = "RESET0"; //"RESET0", "RESET1"

parameter CASISEL_PREG_CLK = "BYPASS"; // "BYPASS","CLK0","CLK1"
parameter CASISEL_PREG_CE = "CE0"; // "CE0","CE1"
parameter CASISEL_PREG_RESET = "RESET0"; //"RESET0", "RESET1"

parameter ADDSUB0_PREG_CLK = "BYPASS"; // "BYPASS","CLK0","CLK1"
parameter ADDSUB0_PREG_CE = "CE0"; // "CE0","CE1"
parameter ADDSUB0_PREG_RESET = "RESET0"; //"RESET0", "RESET1"

parameter ADDSUB1_PREG_CLK = "BYPASS"; // "BYPASS","CLK0","CLK1"
parameter ADDSUB1_PREG_CE = "CE0"; // "CE0","CE1"
parameter ADDSUB1_PREG_RESET = "RESET0"; //"RESET0", "RESET1"

parameter OREG_CLK = "BYPASS"; // "BYPASS","CLK0","CLK1"
parameter OREG_CE = "CE0"; // "CE0","CE1"
parameter OREG_RESET = "RESET0"; //"RESET0", "RESET1"

parameter MULT_RESET_MODE = "SYNC";// SYNC,ASYNC
parameter PRE_LOAD = 48'h000000000000;
parameter DYN_ADD_SUB_0 = "FALSE";//"TRUE","FALSE"
parameter ADD_SUB_0 = 1'b0;//1'b0: '+'; 1'b1: '-'
parameter DYN_ADD_SUB_1 = "FALSE";//"TRUE","FALSE"
parameter ADD_SUB_1 = 1'b0;//1'b0: '+'; 1'b1: '-'

parameter DYN_CASI_SEL = "FALSE";//"TRUE","FALSE"
parameter CASI_SEL = 1'b0;//1'b0: select 0; 1'b1:select casi
parameter DYN_ACC_SEL = "FALSE";//"TRUE","FALSE"
parameter ACC_SEL = 1'b0;//1'b0: PRE_LOAD;1'b1: DOUT feedback;

output [47:0] DOUT, CASO;
input  [11:0] A0, B0, A1, B1;
input  [47:0] CASI;
input  ACCSEL;
input  CASISEL;
input  [1:0] ADDSUB;
input  [1:0] CLK, CE, RESET;

reg A0_CLK,A0_CE,A0_RESET,A1_CLK,A1_CE,A1_RESET,B0_CLK,B0_CE,B0_RESET,B1_CLK,B1_CE,B1_RESET,ACCSEL_ICLK,ACCSEL_ICE,ACCSEL_IRESET,CASISEL_ICLK,CASISEL_ICE,CASISEL_IRESET,ADDSUB0_ICLK,ADDSUB0_ICE,ADDSUB0_IRESET,ADDSUB1_ICLK,ADDSUB1_ICE,ADDSUB1_IRESET,P0_CLK,P0_CE,P0_RESET,P1_CLK,P1_CE,P1_RESET,ACCSEL_PCLK,ACCSEL_PCE,ACCSEL_PRESET,CASISEL_PCLK,CASISEL_PCE,CASISEL_PRESET,ADDSUB0_PCLK,ADDSUB0_PCE,ADDSUB0_PRESET,ADDSUB1_PCLK,ADDSUB1_PCE,ADDSUB1_PRESET,O_CLK,O_CE,O_RESET;
reg [11:0] ina0_reg_async,ina0_reg_sync,ina1_reg_async,ina1_reg_sync,ina0,ina0_reg,ina1,ina1_reg,ina_preg_async,ina_preg_sync,ina_preg,a_src;
reg [11:0] inb0_reg_async,inb0_reg_sync,inb1_reg_async,inb1_reg_sync,inb0,inb0_reg,inb1,inb1_reg;
reg accsel0_reg_async,accsel0_reg_sync,accsel_0,accsel0_reg,accsel1_reg_async,accsel1_reg_sync,accsel_1,accsel1_reg;
reg casisel0_reg_async,casisel0_reg_sync,casisel_0,casisel0_reg,casisel1_reg_async,casisel1_reg_sync,casisel_1,casisel1_reg;
reg addsub0_reg0_async,addsub0_reg0_sync,addsub0_reg0,addsub0_0,addsub0_reg1_async,addsub0_reg1_sync,addsub0_reg1,addsub0_1;
reg addsub1_reg0_async,addsub1_reg0_sync,addsub1_reg0,addsub1_0,addsub1_reg1_async,addsub1_reg1_sync,addsub1_reg1,addsub1_1;
wire [23:0] a0,b0,mult_out0,a1,b1,mult_out1;
reg [23:0] out0_reg_async,out0_reg_sync,out0,out0_reg,out1_reg_async,out1_reg_sync,out1,out1_reg;
reg [48:0] d_out,out_preg_async,out_preg_sync,out_preg,dout_reg,alu_out;
wire [47:0] m_out0,m_out1,acc_load,d_casi;
reg [48:0] out_reg_async,out_reg_sync,out_reg;
wire accsel_sig,casisel_sig,addsub0_sig,addsub1_sig;
reg [1:0] accsel_int;
reg [1:0] accsel_int0_reg_async,accsel_int0_reg_sync,accsel_int0,accsel_int0_reg,accsel_int1_reg_async,accsel_int1_reg_sync,accsel_int1,accsel_int1_reg;


wire grstn = GSR.GSRO;


always @(ina0_reg_async or ina0_reg_sync or ina1_reg_async or ina1_reg_sync or inb0_reg_async or inb0_reg_sync or inb1_reg_async or inb1_reg_sync or ina_preg_async or ina_preg_sync or accsel0_reg_async or accsel0_reg_sync or accsel1_reg_async or accsel1_reg_sync or casisel0_reg_async or casisel0_reg_sync or casisel1_reg_async or casisel1_reg_sync or addsub0_reg0_async or addsub0_reg0_sync or addsub0_reg1_async or addsub0_reg1_sync or addsub1_reg0_async or addsub1_reg0_sync or addsub1_reg1_async or addsub1_reg1_sync or out0_reg_async or out0_reg_sync or out1_reg_async or out1_reg_sync or out_preg_async or out_preg_sync or out_reg_sync or out_reg_async or accsel_int0_reg_async or accsel_int0_reg_sync or accsel_int0_reg or accsel_int1_reg_async or accsel_int1_reg_sync or accsel_int1_reg)
    begin
        if (MULT_RESET_MODE == "ASYNC")
        begin
            ina0_reg <= ina0_reg_async;
            ina1_reg <= ina1_reg_async;
            inb0_reg <= inb0_reg_async;
            inb1_reg <= inb1_reg_async;
            accsel0_reg <= accsel0_reg_async;
            accsel1_reg <= accsel1_reg_async;
            addsub0_reg0 <= addsub0_reg0_async;
            addsub0_reg1 <= addsub0_reg1_async;
            addsub1_reg0 <= addsub1_reg0_async;
            addsub1_reg1 <= addsub1_reg1_async;
            casisel0_reg <= casisel0_reg_async;
            casisel1_reg <= casisel1_reg_async;
            out0_reg <= out0_reg_async;
            out1_reg <= out1_reg_async;
            out_preg <= out_preg_async;
            ina_preg <= ina_preg_async;
            out_reg <= out_reg_async;
            accsel_int0_reg <= accsel_int0_reg_async;
            accsel_int1_reg <= accsel_int1_reg_async;
        end
        else if (MULT_RESET_MODE == "SYNC")
        begin
            ina0_reg <= ina0_reg_sync;
            ina1_reg <= ina1_reg_sync;
            inb0_reg <= inb0_reg_sync;
            inb1_reg <= inb1_reg_sync;
            accsel0_reg <= accsel0_reg_sync;
            accsel1_reg <= accsel1_reg_sync;
            addsub0_reg0 <= addsub0_reg0_sync;
            addsub0_reg1 <= addsub0_reg1_sync;
            addsub1_reg0 <= addsub1_reg0_sync;
            addsub1_reg1 <= addsub1_reg1_sync;
            casisel0_reg <= casisel0_reg_sync;
            casisel1_reg <= casisel1_reg_sync;
            out0_reg <= out0_reg_sync;
            out1_reg <= out1_reg_sync;
            out_preg <= out_preg_sync;
            ina_preg <= ina_preg_sync;
            out_reg <= out_reg_sync;
            accsel_int0_reg <= accsel_int0_reg_sync;
            accsel_int1_reg <= accsel_int1_reg_sync;
         end
    end

    //clk,ce,reset mux
    //A0REG
    always @(CLK)
    begin
        if (A0REG_CLK == "CLK0")
            A0_CLK = CLK[0];
        else if (A0REG_CLK == "CLK1")
            A0_CLK = CLK[1];
    end

    always @(CE)
    begin
        if (A0REG_CE == "CE0")
            A0_CE = CE[0];
        else if (A0REG_CE == "CE1")
            A0_CE = CE[1];
    end

    always @(RESET)
    begin
        if (A0REG_RESET == "RESET0")
            A0_RESET = RESET[0];
        else if (A0REG_RESET == "RESET1")
            A0_RESET = RESET[1];
    end

    //A1REG
    always @(CLK)
    begin
        if (A1REG_CLK == "CLK0")
            A1_CLK = CLK[0];
        else if (A1REG_CLK == "CLK1")
            A1_CLK = CLK[1];
    end

    always @(CE)
    begin
        if (A1REG_CE == "CE0")
            A1_CE = CE[0];
        else if (A1REG_CE == "CE1")
            A1_CE = CE[1];
    end

    always @(RESET)
    begin
        if (A1REG_RESET == "RESET0")
            A1_RESET = RESET[0];
        else if (A1REG_RESET == "RESET1")
            A1_RESET = RESET[1];
    end

    //B0REG
    always @(CLK)
    begin
        if (B0REG_CLK == "CLK0")
            B0_CLK = CLK[0];
        else if (B0REG_CLK == "CLK1")
            B0_CLK = CLK[1];
    end

    always @(CE)
    begin
        if (B0REG_CE == "CE0")
            B0_CE = CE[0];
        else if (B0REG_CE == "CE1")
            B0_CE = CE[1];
    end

    always @(RESET)
    begin
        if (B0REG_RESET == "RESET0")
            B0_RESET = RESET[0];
        else if (B0REG_RESET == "RESET1")
            B0_RESET = RESET[1];
    end

    //B1REG
    always @(CLK)
    begin
        if (B1REG_CLK == "CLK0")
            B1_CLK = CLK[0];
        else if (B1REG_CLK == "CLK1")
            B1_CLK = CLK[1];
    end

    always @(CE)
    begin
        if (B1REG_CE == "CE0")
            B1_CE = CE[0];
        else if (B1REG_CE == "CE1")
            B1_CE = CE[1];
    end

    always @(RESET)
    begin
        if (B1REG_RESET == "RESET0")
            B1_RESET = RESET[0];
        else if (B1REG_RESET == "RESET1")
            B1_RESET = RESET[1];
    end
    
    //IREG
    always @(CLK)
    begin
        if (ACCSEL_IREG_CLK == "CLK0")
            ACCSEL_ICLK = CLK[0];
        else if (ACCSEL_IREG_CLK == "CLK1")
            ACCSEL_ICLK = CLK[1];
    end

    always @(CE)
    begin
        if (ACCSEL_IREG_CE == "CE0")
            ACCSEL_ICE = CE[0];
        else if (ACCSEL_IREG_CE == "CE1")
            ACCSEL_ICE = CE[1];
    end

    always @(RESET)
    begin
        if (ACCSEL_IREG_RESET == "RESET0")
            ACCSEL_IRESET = RESET[0];
        else if (ACCSEL_IREG_RESET == "RESET1")
            ACCSEL_IRESET = RESET[1];
    end

    always @(CLK)
    begin
        if (ADDSUB0_IREG_CLK == "CLK0")
            ADDSUB0_ICLK = CLK[0];
        else if (ADDSUB0_IREG_CLK == "CLK1")
            ADDSUB0_ICLK = CLK[1];
    end

    always @(CE)
    begin
        if (ADDSUB0_IREG_CE == "CE0")
            ADDSUB0_ICE = CE[0];
        else if (ADDSUB0_IREG_CE == "CE1")
            ADDSUB0_ICE = CE[1];
    end

    always @(RESET)
    begin
        if (ADDSUB0_IREG_RESET == "RESET0")
            ADDSUB0_IRESET = RESET[0];
        else if (ADDSUB0_IREG_RESET == "RESET1")
            ADDSUB0_IRESET = RESET[1];
    end
    
    always @(CLK)
    begin
        if (ADDSUB1_IREG_CLK == "CLK0")
            ADDSUB1_ICLK = CLK[0];
        else if (ADDSUB1_IREG_CLK == "CLK1")
            ADDSUB1_ICLK = CLK[1];
    end

    always @(CE)
    begin
        if (ADDSUB1_IREG_CE == "CE0")
            ADDSUB1_ICE = CE[0];
        else if (ADDSUB1_IREG_CE == "CE1")
            ADDSUB1_ICE = CE[1];
    end

    always @(RESET)
    begin
        if (ADDSUB1_IREG_RESET == "RESET0")
            ADDSUB1_IRESET = RESET[0];
        else if (ADDSUB1_IREG_RESET == "RESET1")
            ADDSUB1_IRESET = RESET[1];
    end

    always @(CLK)
    begin
        if (CASISEL_IREG_CLK == "CLK0")
            CASISEL_ICLK = CLK[0];
        else if (CASISEL_IREG_CLK == "CLK1")
            CASISEL_ICLK = CLK[1];
    end

    always @(CE)
    begin
        if (CASISEL_IREG_CE == "CE0")
            CASISEL_ICE = CE[0];
        else if (CASISEL_IREG_CE == "CE1")
            CASISEL_ICE = CE[1];
    end

    always @(RESET)
    begin
        if (CASISEL_IREG_RESET == "RESET0")
            CASISEL_IRESET = RESET[0];
        else if (CASISEL_IREG_RESET == "RESET1")
            CASISEL_IRESET = RESET[1];
    end

    //PREG0
    always @(CLK)
    begin
        if (PREG0_CLK == "CLK0")
            P0_CLK = CLK[0];
        else if (PREG0_CLK == "CLK1")
            P0_CLK = CLK[1];
    end

    always @(CE)
    begin
        if (PREG0_CE == "CE0")
            P0_CE = CE[0];
        else if (PREG0_CE == "CE1")
            P0_CE = CE[1];
    end

    always @(RESET)
    begin
        if (PREG0_RESET == "RESET0")
            P0_RESET = RESET[0];
        else if (PREG0_RESET == "RESET1")
            P0_RESET = RESET[1];
    end

    //PREG1
    always @(CLK)
    begin
        if (PREG1_CLK == "CLK0")
            P1_CLK = CLK[0];
        else if (PREG1_CLK == "CLK1")
            P1_CLK = CLK[1];
    end

    always @(CE)
    begin
        if (PREG1_CE == "CE0")
            P1_CE = CE[0];
        else if (PREG1_CE == "CE1")
            P1_CE = CE[1];
    end

    always @(RESET)
    begin
        if (PREG1_RESET == "RESET0")
            P1_RESET = RESET[0];
        else if (PREG1_RESET == "RESET1")
            P1_RESET = RESET[1];
    end

    //PREG
    always @(CLK)
    begin
        if (ACCSEL_PREG_CLK == "CLK0")
            ACCSEL_PCLK = CLK[0];
        else if (ACCSEL_PREG_CLK == "CLK1")
            ACCSEL_PCLK = CLK[1];
    end

    always @(CE)
    begin
        if (ACCSEL_PREG_CE == "CE0")
            ACCSEL_PCE = CE[0];
        else if (ACCSEL_PREG_CE == "CE1")
            ACCSEL_PCE = CE[1];
    end

    always @(RESET)
    begin
        if (ACCSEL_PREG_RESET == "RESET0")
            ACCSEL_PRESET = RESET[0];
        else if (ACCSEL_PREG_RESET == "RESET1")
            ACCSEL_PRESET = RESET[1];
    end

    always @(CLK)
    begin
        if (ADDSUB0_PREG_CLK == "CLK0")
            ADDSUB0_PCLK = CLK[0];
        else if (ADDSUB0_PREG_CLK == "CLK1")
            ADDSUB0_PCLK = CLK[1];
    end

    always @(CE)
    begin
        if (ADDSUB0_PREG_CE == "CE0")
            ADDSUB0_PCE = CE[0];
        else if (ADDSUB0_PREG_CE == "CE1")
            ADDSUB0_PCE = CE[1];
    end

    always @(RESET)
    begin
        if (ADDSUB0_PREG_RESET == "RESET0")
            ADDSUB0_PRESET = RESET[0];
        else if (ADDSUB0_PREG_RESET == "RESET1")
            ADDSUB0_PRESET = RESET[1];
    end

    always @(CLK)
    begin
        if (ADDSUB1_PREG_CLK == "CLK0")
            ADDSUB1_PCLK = CLK[0];
        else if (ADDSUB1_PREG_CLK == "CLK1")
            ADDSUB1_PCLK = CLK[1];
    end

    always @(CE)
    begin
        if (ADDSUB1_PREG_CE == "CE0")
            ADDSUB1_PCE = CE[0];
        else if (ADDSUB1_PREG_CE == "CE1")
            ADDSUB1_PCE = CE[1];
    end

    always @(RESET)
    begin
        if (ADDSUB1_PREG_RESET == "RESET0")
            ADDSUB1_PRESET = RESET[0];
        else if (ADDSUB1_PREG_RESET == "RESET1")
            ADDSUB1_PRESET = RESET[1];
    end

    always @(CLK)
    begin
        if (CASISEL_PREG_CLK == "CLK0")
            CASISEL_PCLK = CLK[0];
        else if (CASISEL_PREG_CLK == "CLK1")
            CASISEL_PCLK = CLK[1];
    end

    always @(CE)
    begin
        if (CASISEL_PREG_CE == "CE0")
            CASISEL_PCE = CE[0];
        else if (CASISEL_PREG_CE == "CE1")
            CASISEL_PCE = CE[1];
    end

    always @(RESET)
    begin
        if (CASISEL_PREG_RESET == "RESET0")
            CASISEL_PRESET = RESET[0];
        else if (CASISEL_PREG_RESET == "RESET1")
            CASISEL_PRESET = RESET[1];
    end

    //OREG
    always @(CLK)
    begin
        if (OREG_CLK == "CLK0")
            O_CLK = CLK[0];
        else if (OREG_CLK == "CLK1")
            O_CLK = CLK[1];
    end

    always @(CE)
    begin
        if (OREG_CE == "CE0")
            O_CE = CE[0];
        else if (OREG_CE == "CE1")
            O_CE = CE[1];
    end

    always @(RESET)
    begin
        if (OREG_RESET == "RESET0")
            O_RESET = RESET[0];
        else if (OREG_RESET == "RESET1")
            O_RESET = RESET[1];
    end

    // in reg
    always @(posedge A0_CLK or posedge A0_RESET or negedge grstn)
    begin
        if (!grstn) begin
            ina0_reg_async <= 0;
        end else if (A0_RESET == 1'b1)
        begin
            ina0_reg_async <= 0;
        end
        else if (A0_CE == 1'b1)
        begin
            ina0_reg_async <= A0;
        end
    end

    always @(posedge A0_CLK or negedge grstn)
    begin
        if (!grstn) begin
            ina0_reg_sync <= 0; 
        end else if (A0_RESET == 1'b1)
        begin
            ina0_reg_sync <= 0;
        end
        else if (A0_CE == 1'b1)
        begin
            ina0_reg_sync <= A0;
        end
    end

    always @(posedge A1_CLK or posedge A1_RESET or negedge grstn)
    begin
        if (!grstn) begin
            ina1_reg_async <= 0;
        end else if (A1_RESET == 1'b1)
        begin
            ina1_reg_async <= 0;
        end
        else if (A1_CE == 1'b1)
        begin
            ina1_reg_async <= A1;
        end
    end

    always @(posedge A1_CLK or negedge grstn)
    begin
        if (!grstn) begin
            ina1_reg_sync <= 0; 
        end else if (A1_RESET == 1'b1)
        begin
            ina1_reg_sync <= 0;
        end
        else if (A1_CE == 1'b1)
        begin
            ina1_reg_sync <= A1;
        end
    end

    always @(A0 or ina0_reg)
    begin
        if (A0REG_CLK == "BYPASS")
        begin
            ina0 = A0;
        end else
        begin
            ina0 = ina0_reg;
        end
    end

    always @(A1 or ina1_reg)
    begin
        if (A1REG_CLK == "BYPASS")
        begin
            ina1 = A1;
        end else
        begin
            ina1 = ina1_reg;
        end
    end

    always @(posedge B0_CLK or posedge B0_RESET or negedge grstn)
    begin
        if (!grstn) begin
            inb0_reg_async <= 0;
        end else if (B0_RESET == 1'b1)
        begin
            inb0_reg_async <= 0;
        end
        else if (B0_CE == 1'b1)
        begin
            inb0_reg_async <= B0;
        end
    end

    always @(posedge B0_CLK or negedge grstn)
    begin
        if (!grstn) begin
            inb0_reg_sync <= 0; 
        end else if (B0_RESET == 1'b1)
        begin
            inb0_reg_sync <= 0;
        end
        else if (B0_CE == 1'b1)
        begin
            inb0_reg_sync <= B0;
        end
    end

    always @(posedge B1_CLK or posedge B1_RESET or negedge grstn)
    begin
        if (!grstn) begin
            inb1_reg_async <= 0;
        end else if (B1_RESET == 1'b1)
        begin
            inb1_reg_async <= 0;
        end
        else if (B1_CE == 1'b1)
        begin
            inb1_reg_async <= B1;
        end
    end

    always @(posedge B1_CLK or negedge grstn)
    begin
        if (!grstn) begin
            inb1_reg_sync <= 0; 
        end else if (B1_RESET == 1'b1)
        begin
            inb1_reg_sync <= 0;
        end
        else if (B1_CE == 1'b1)
        begin
            inb1_reg_sync <= B1;
        end
    end

    always @(B0 or inb0_reg)
    begin
        if (B0REG_CLK == "BYPASS")
        begin
            inb0 = B0;
        end else
        begin
            inb0 = inb0_reg;
        end
    end

    always @(B1 or inb1_reg)
    begin
        if (B1REG_CLK == "BYPASS")
        begin
            inb1 = B1;
        end else
        begin
            inb1 = inb1_reg;
        end
    end

    assign accsel_sig = (DYN_ACC_SEL == "FALSE") ? ACC_SEL : ACCSEL;
    assign casisel_sig = (DYN_CASI_SEL == "FALSE") ? CASI_SEL : CASISEL;
    
    assign addsub0_sig = (DYN_ADD_SUB_0 == "FALSE")? ADD_SUB_0 : ADDSUB[0];
    assign addsub1_sig = (DYN_ADD_SUB_1 == "FALSE")? ADD_SUB_1 : ADDSUB[1];

    always@(accsel_sig)
    begin
        if(accsel_sig == 1'b0)
        begin
            accsel_int = 2'b01;
        end else if(accsel_sig == 1'b1)
        begin
            accsel_int = 2'b10;
        end
    end

    always @(posedge ACCSEL_ICLK or posedge ACCSEL_IRESET or negedge grstn)
    begin
        if (!grstn) begin
            accsel0_reg_async <= 1'b0;
            accsel_int0_reg_async <= 2'b0;
        end else if (ACCSEL_IRESET == 1'b1)
        begin
            accsel0_reg_async <= 1'b0;
            accsel_int0_reg_async <= 2'b0;
        end
        else if (ACCSEL_ICE == 1'b1)
        begin
            accsel0_reg_async <= accsel_sig;
            accsel_int0_reg_async <= accsel_int;
        end
    end

    always @(posedge ACCSEL_ICLK or negedge grstn)
    begin
        if (!grstn) begin
            accsel0_reg_sync <= 1'b0; 
            accsel_int0_reg_sync <= 2'b0; 
        end else if (ACCSEL_IRESET == 1'b1)
        begin
            accsel0_reg_sync <= 1'b0;
            accsel_int0_reg_sync <= 2'b0; 
        end
        else if (ACCSEL_ICE == 1'b1)
        begin
            accsel0_reg_sync <= accsel_sig;
            accsel_int0_reg_sync <= accsel_int;
        end
    end

    always @(accsel_sig or accsel0_reg or accsel_int or accsel_int0_reg)
    begin
        if (ACCSEL_IREG_CLK == "BYPASS")
        begin
            accsel_0 <= accsel_sig;
            accsel_int0 <= accsel_int;
        end else
        begin
            accsel_0 <= accsel0_reg;
            accsel_int0 <= accsel_int0_reg;
        end
    end

    always @(posedge ACCSEL_PCLK or posedge ACCSEL_PRESET or negedge grstn)
    begin
        if (!grstn) begin
            accsel1_reg_async <= 1'b0;
            accsel_int1_reg_async <= 2'b0;
        end else if (ACCSEL_PRESET == 1'b1)
        begin
            accsel1_reg_async <= 1'b0;
            accsel_int1_reg_async <= 2'b0;
        end
        else if (ACCSEL_PCE == 1'b1)
        begin
            accsel1_reg_async <= accsel_0;
            accsel_int1_reg_async <= accsel_int0;
        end
    end

    always @(posedge ACCSEL_PCLK or negedge grstn)
    begin
        if (!grstn) begin
            accsel1_reg_sync <= 1'b0; 
            accsel_int1_reg_sync <= 2'b0; 
        end else if (ACCSEL_PRESET == 1'b1)
        begin
            accsel1_reg_sync <= 1'b0; 
            accsel_int1_reg_sync <= 2'b0; 
        end
        else if (ACCSEL_PCE == 1'b1)
        begin
            accsel1_reg_sync <= accsel_0;
            accsel_int1_reg_sync <= accsel_int0;
        end
    end

    always @(accsel_0 or accsel1_reg or accsel_int0 or accsel_int1_reg)
    begin
        if (ACCSEL_PREG_CLK == "BYPASS")
        begin
            accsel_1 <= accsel_0;
            accsel_int1 <= accsel_int0;
        end else
        begin
            accsel_1 <= accsel1_reg;
            accsel_int1 <= accsel_int1_reg;
        end
    end

    always @(posedge CASISEL_ICLK or posedge CASISEL_IRESET or negedge grstn)
    begin
        if (!grstn) begin
            casisel0_reg_async <= 0;
        end else if (CASISEL_IRESET == 1'b1)
        begin
            casisel0_reg_async <= 0;
        end
        else if (CASISEL_ICE == 1'b1)
        begin
            casisel0_reg_async <= casisel_sig;
        end
    end

    always @(posedge CASISEL_ICLK or negedge grstn)
    begin
        if (!grstn) begin
            casisel0_reg_sync <= 0; 
        end else if (CASISEL_IRESET == 1'b1)
        begin
            casisel0_reg_sync <= 0;
        end
        else if (CASISEL_ICE == 1'b1)
        begin
            casisel0_reg_sync <= casisel_sig;
        end
    end

    always @(casisel_sig or casisel0_reg)
    begin
        if (CASISEL_IREG_CLK == "BYPASS")
        begin
            casisel_0 <= casisel_sig;
        end else
        begin
            casisel_0 <= casisel0_reg;
        end
    end

    always @(posedge CASISEL_PCLK or posedge CASISEL_PRESET or negedge grstn)
    begin
        if (!grstn) begin
            casisel1_reg_async <= 0;
        end else if (CASISEL_PRESET == 1'b1)
        begin
            casisel1_reg_async <= 0;
        end
        else if (CASISEL_PCE == 1'b1)
        begin
            casisel1_reg_async <= casisel_0;
        end
    end

    always @(posedge CASISEL_PCLK or negedge grstn)
    begin
        if (!grstn) begin
            casisel1_reg_sync <= 0; 
        end else if (CASISEL_PRESET == 1'b1)
        begin
            casisel1_reg_sync <= 0;
        end
        else if (CASISEL_PCE == 1'b1)
        begin
            casisel1_reg_sync <= casisel_0;
        end
    end

    always @(casisel_0 or casisel1_reg)
    begin
        if (CASISEL_PREG_CLK == "BYPASS")
        begin
            casisel_1 <= casisel_0;
        end else
        begin
            casisel_1 <= casisel1_reg;
        end
    end

    always @(posedge ADDSUB0_ICLK or posedge ADDSUB0_IRESET or negedge grstn)
    begin
        if (!grstn) begin
            addsub0_reg0_async <= 0;
        end else if (ADDSUB0_IRESET == 1'b1)
        begin
            addsub0_reg0_async <= 0;
        end
        else if (ADDSUB0_ICE == 1'b1)
        begin
            addsub0_reg0_async <= addsub0_sig;
        end
    end

    always @(posedge ADDSUB0_ICLK or negedge grstn)
    begin
        if (!grstn) begin
            addsub0_reg0_sync <= 0; 
        end else if (ADDSUB0_IRESET == 1'b1)
        begin
            addsub0_reg0_sync <= 0;
        end
        else if (ADDSUB0_ICE == 1'b1)
        begin
            addsub0_reg0_sync <= addsub0_sig;
        end
    end

    always @(addsub0_sig or addsub0_reg0)
    begin
        if (ADDSUB0_IREG_CLK == "BYPASS")
        begin
            addsub0_0 <= addsub0_sig;
        end else
        begin
            addsub0_0 <= addsub0_reg0;
        end
    end

    always @(posedge ADDSUB0_PCLK or posedge ADDSUB0_PRESET or negedge grstn)
    begin
        if (!grstn) begin
            addsub0_reg1_async <= 0;
        end else if (ADDSUB0_PRESET == 1'b1)
        begin
            addsub0_reg1_async <= 0;
        end
        else if (ADDSUB0_PCE == 1'b1)
        begin
            addsub0_reg1_async <= addsub0_0;
        end
    end

    always @(posedge ADDSUB0_PCLK or negedge grstn)
    begin
        if (!grstn) begin
            addsub0_reg1_sync <= 0; 
        end else if (ADDSUB0_PRESET == 1'b1)
        begin
            addsub0_reg1_sync <= 0;
        end
        else if (ADDSUB0_PCE == 1'b1)
        begin
            addsub0_reg1_sync <= addsub0_0;
        end
    end

    always @(addsub0_0 or addsub0_reg1)
    begin
        if (ADDSUB0_PREG_CLK == "BYPASS")
        begin
            addsub0_1 <= addsub0_0;
        end else
        begin
            addsub0_1 <= addsub0_reg1;
        end
    end

    always @(posedge ADDSUB1_ICLK or posedge ADDSUB1_IRESET or negedge grstn)
    begin
        if (!grstn) begin
            addsub1_reg0_async <= 0;
        end else if (ADDSUB1_IRESET == 1'b1)
        begin
            addsub1_reg0_async <= 0;
        end
        else if (ADDSUB1_ICE == 1'b1)
        begin
            addsub1_reg0_async <= addsub1_sig;
        end
    end

    always @(posedge ADDSUB1_ICLK or negedge grstn)
    begin
        if (!grstn) begin
            addsub1_reg0_sync <= 0; 
        end else if (ADDSUB1_IRESET == 1'b1)
        begin
            addsub1_reg0_sync <= 0;
        end
        else if (ADDSUB1_ICE == 1'b1)
        begin
            addsub1_reg0_sync <= addsub1_sig;
        end
    end

    always @(addsub1_sig or addsub1_reg0)
    begin
        if (ADDSUB1_IREG_CLK == "BYPASS")
        begin
            addsub1_0 <= addsub1_sig;
        end else
        begin
            addsub1_0 <= addsub1_reg0;
        end
    end

    always @(posedge ADDSUB1_PCLK or posedge ADDSUB1_PRESET or negedge grstn)
    begin
        if (!grstn) begin
            addsub1_reg1_async <= 0;
        end else if (ADDSUB1_PRESET == 1'b1)
        begin
            addsub1_reg1_async <= 0;
        end
        else if (ADDSUB1_PCE == 1'b1)
        begin
            addsub1_reg1_async <= addsub1_0;
        end
    end

    always @(posedge ADDSUB1_PCLK or negedge grstn)
    begin
        if (!grstn) begin
            addsub1_reg1_sync <= 0; 
        end else if (ADDSUB1_PRESET == 1'b1)
        begin
            addsub1_reg1_sync <= 0;
        end
        else if (ADDSUB1_PCE == 1'b1)
        begin
            addsub1_reg1_sync <= addsub1_0;
        end
    end

    always @(addsub1_0 or addsub1_reg1)
    begin
        if (ADDSUB1_PREG_CLK == "BYPASS")
        begin
            addsub1_1 <= addsub1_0;
        end else
        begin
            addsub1_1 <= addsub1_reg1;
        end
    end

    assign a0[23:0] = {{12{ina0[11]}},ina0[11:0]};
    assign b0[23:0] = {{12{inb0[11]}},inb0[11:0]};
    assign a1[23:0] = {{12{ina1[11]}},ina1[11:0]};
    assign b1[23:0] = {{12{inb1[11]}},inb1[11:0]};

    assign mult_out0 = a0 * b0 ;
    assign mult_out1 = a1 * b1 ;

    // pipeline reg
    always @(posedge P0_CLK or posedge P0_RESET or negedge grstn)
    begin
        if (!grstn) begin
            out0_reg_async <= 0;
        end else if (P0_RESET == 1'b1)
        begin
            out0_reg_async <= 0;
        end
        else if (P0_CE == 1'b1)
        begin
            out0_reg_async <= mult_out0;
        end
    end

    always @(posedge P0_CLK or negedge grstn)
    begin
        if (!grstn) begin
            out0_reg_sync <= 0;
        end else if (P0_RESET == 1'b1)
        begin
            out0_reg_sync <= 0;
        end
        else if (P0_CE == 1'b1)
        begin
            out0_reg_sync <= mult_out0;
        end
    end

    always @(posedge P1_CLK or posedge P1_RESET or negedge grstn)
    begin
        if (!grstn) begin
            out1_reg_async <= 0;
        end else if (P1_RESET == 1'b1)
        begin
            out1_reg_async <= 0;
        end
        else if (P1_CE == 1'b1)
        begin
            out1_reg_async <= mult_out1;
        end
    end

    always @(posedge P1_CLK or negedge grstn)
    begin
        if (!grstn) begin
            out1_reg_sync <= 0;
        end else if (P1_RESET == 1'b1)
        begin
            out1_reg_sync <= 0;
        end
        else if (P1_CE == 1'b1)
        begin
            out1_reg_sync <= mult_out1;
        end
    end

    always @(posedge O_CLK or posedge O_RESET or negedge grstn)
    begin
        if (!grstn) begin
            out_preg_async <= 0;
        end else if (O_RESET == 1'b1)
        begin
            out_preg_async <= 0;
        end
        else if (O_CE == 1'b1)
        begin
            out_preg_async <= d_out;
        end
    end

    always @(posedge O_CLK or negedge grstn)
    begin
        if (!grstn) begin
            out_preg_sync <= 0;
        end else if (O_RESET == 1'b1)
        begin
            out_preg_sync <= 0;
        end
        else if (O_CE == 1'b1)
        begin
            out_preg_sync <= d_out;
        end
    end

    always @(mult_out0 or out0_reg)
    begin
        if (PREG0_CLK == "BYPASS")
        begin
            out0 = mult_out0;
        end else
        begin
            out0 = out0_reg;
        end
    end

    always @(mult_out1 or out1_reg)
    begin
        if (PREG1_CLK == "BYPASS")
        begin
            out1 = mult_out1;
        end else
        begin
            out1 = out1_reg;
        end
    end

    always @(d_out or out_preg)
    begin
        if (FB_PREG_EN == "FALSE")
        begin
            dout_reg = d_out;
        end else
        begin
            dout_reg = out_preg;
        end
    end

    assign m_out0 = {{24{out0[23]}},out0[23:0]};
    assign m_out1 = {{24{out1[23]}},out1[23:0]};

    assign acc_load = (accsel_int1 == 2'b10 || accsel_int1 == 2'b11) ? dout_reg : ((accsel_int1 == 2'b01) ? PRE_LOAD : 48'b0);
    assign d_casi = (casisel_1 == 1'b1) ? CASI : 48'b0;

    always @(acc_load or m_out0 or m_out1 or d_casi or addsub0_1 or addsub1_1)
    begin
        if(addsub0_1 == 1'b0 && addsub1_1 == 1'b0) begin
            alu_out = acc_load + m_out0 + m_out1 + d_casi;
        end else if(addsub0_1 == 1'b0 && addsub1_1 == 1'b1) begin
            alu_out = acc_load + m_out0 - m_out1 + d_casi;        
        end else if(addsub0_1 == 1'b1 && addsub1_1 == 1'b0) begin
            alu_out = acc_load - m_out0 + m_out1 + d_casi;        
        end else if(addsub0_1 == 1'b1 && addsub1_1 == 1'b1) begin
            alu_out = acc_load - m_out0 - m_out1 + d_casi;        
        end
    end

    // output reg
    always @(posedge O_CLK or posedge O_RESET or negedge grstn)
    begin
        if (!grstn) begin
            out_reg_async <= 0;
        end else if (O_RESET == 1'b1)
        begin
            out_reg_async <= 0;
        end
        else if (O_CE == 1'b1)
        begin
            out_reg_async <= alu_out;
        end
    end

    always @(posedge O_CLK or negedge grstn)
    begin
        if (!grstn) begin
            out_reg_sync <= 0;
        end else if (O_RESET == 1'b1)
        begin
            out_reg_sync <= 0;
        end
        else if (O_CE == 1'b1)
        begin
            out_reg_sync <= alu_out;
        end
    end

    always @(alu_out or out_reg)
    begin
        if (OREG_CLK == "BYPASS")
        begin
            d_out = alu_out;
        end else
        begin
            d_out = out_reg;
        end
    end

    assign DOUT = d_out[47:0];
    assign CASO = d_out[47:0];

endmodule



//MULTALU27X18
module MULTALU27X18 (DOUT, CASO, SOA, A, B, C, D, SIA, CASI, PSEL, ASEL, CSEL, CASISEL, PADDSUB, ACCSEL, ADDSUB, CLK, CE, RESET);

parameter AREG_CLK = "BYPASS"; // "BYPASS","CLK0","CLK1"
parameter AREG_CE = "CE0"; // "CE0","CE1"
parameter AREG_RESET = "RESET0"; //"RESET0", "RESET1"

parameter BREG_CLK = "BYPASS"; // "BYPASS","CLK0","CLK1"
parameter BREG_CE = "CE0"; // "CE0","CE1"
parameter BREG_RESET = "RESET0"; //"RESET0", "RESET1"

parameter DREG_CLK = "BYPASS"; // "BYPASS","CLK0","CLK1"
parameter DREG_CE = "CE0"; // "CE0","CE1"
parameter DREG_RESET = "RESET0"; //"RESET0", "RESET1"

parameter C_IREG_CLK = "BYPASS"; // "BYPASS","CLK0","CLK1"
parameter C_IREG_CE = "CE0"; // "CE0","CE1"
parameter C_IREG_RESET = "RESET0"; //"RESET0", "RESET1"

parameter PSEL_IREG_CLK = "BYPASS"; // "BYPASS","CLK0","CLK1"
parameter PSEL_IREG_CE = "CE0"; // "CE0","CE1"
parameter PSEL_IREG_RESET = "RESET0"; //"RESET0", "RESET1"

parameter PADDSUB_IREG_CLK = "BYPASS"; // "BYPASS","CLK0","CLK1"
parameter PADDSUB_IREG_CE = "CE0"; // "CE0","CE1"
parameter PADDSUB_IREG_RESET = "RESET0"; //"RESET0", "RESET1"

parameter ADDSUB0_IREG_CLK = "BYPASS"; // "BYPASS","CLK0","CLK1"
parameter ADDSUB0_IREG_CE = "CE0"; // "CE0","CE1"
parameter ADDSUB0_IREG_RESET = "RESET0"; //"RESET0", "RESET1"

parameter ADDSUB1_IREG_CLK = "BYPASS"; // "BYPASS","CLK0","CLK1"
parameter ADDSUB1_IREG_CE = "CE0"; // "CE0","CE1"
parameter ADDSUB1_IREG_RESET = "RESET0"; //"RESET0", "RESET1"

parameter CSEL_IREG_CLK = "BYPASS"; // "BYPASS","CLK0","CLK1"
parameter CSEL_IREG_CE = "CE0"; // "CE0","CE1"
parameter CSEL_IREG_RESET = "RESET0"; //"RESET0", "RESET1"

parameter CASISEL_IREG_CLK = "BYPASS"; // "BYPASS","CLK0","CLK1"
parameter CASISEL_IREG_CE = "CE0"; // "CE0","CE1"
parameter CASISEL_IREG_RESET = "RESET0"; //"RESET0", "RESET1"

parameter ACCSEL_IREG_CLK = "BYPASS"; // "BYPASS","CLK0","CLK1"
parameter ACCSEL_IREG_CE = "CE0"; // "CE0","CE1"
parameter ACCSEL_IREG_RESET = "RESET0"; //"RESET0", "RESET1"

parameter PREG_CLK = "BYPASS"; // "BYPASS","CLK0","CLK1"
parameter PREG_CE = "CE0"; // "CE0","CE1"
parameter PREG_RESET = "RESET0"; //"RESET0", "RESET1"

parameter ADDSUB0_PREG_CLK = "BYPASS"; // "BYPASS","CLK0","CLK1"
parameter ADDSUB0_PREG_CE = "CE0"; // "CE0","CE1"
parameter ADDSUB0_PREG_RESET = "RESET0"; //"RESET0", "RESET1"

parameter ADDSUB1_PREG_CLK = "BYPASS"; // "BYPASS","CLK0","CLK1"
parameter ADDSUB1_PREG_CE = "CE0"; // "CE0","CE1"
parameter ADDSUB1_PREG_RESET = "RESET0"; //"RESET0", "RESET1"

parameter CSEL_PREG_CLK = "BYPASS"; // "BYPASS","CLK0","CLK1"
parameter CSEL_PREG_CE = "CE0"; // "CE0","CE1"
parameter CSEL_PREG_RESET = "RESET0"; //"RESET0", "RESET1"

parameter CASISEL_PREG_CLK = "BYPASS"; // "BYPASS","CLK0","CLK1"
parameter CASISEL_PREG_CE = "CE0"; // "CE0","CE1"
parameter CASISEL_PREG_RESET = "RESET0"; //"RESET0", "RESET1"

parameter ACCSEL_PREG_CLK = "BYPASS"; // "BYPASS","CLK0","CLK1"
parameter ACCSEL_PREG_CE = "CE0"; // "CE0","CE1"
parameter ACCSEL_PREG_RESET = "RESET0"; //"RESET0", "RESET1"

parameter C_PREG_CLK = "BYPASS"; // "BYPASS","CLK0","CLK1"
parameter C_PREG_CE = "CE0"; // "CE0","CE1"
parameter C_PREG_RESET = "RESET0"; //"RESET0", "RESET1"

parameter FB_PREG_EN = "FALSE"; // "FALSE";"TRUE"      //feedback acc pipeline register,same clk/ce/reset as OREG
parameter SOA_PREG_EN = "FALSE"; // "FALSE";"TRUE"      //soa pipeline register,,same clk/ce/reset as AREG

parameter OREG_CLK = "BYPASS"; // "BYPASS","CLK0","CLK1"
parameter OREG_CE = "CE0"; // "CE0","CE1"
parameter OREG_RESET = "RESET0"; //"RESET0", "RESET1"

parameter MULT_RESET_MODE = "SYNC";// SYNC,ASYNC
parameter PRE_LOAD = 48'h000000000000;

parameter DYN_P_SEL = "FALSE";//"TRUE","FALSE"
parameter P_SEL = 1'b0;//1'b0: select direct INA; 1'b1: select preadder
parameter DYN_P_ADDSUB = "FALSE";//"TRUE","FALSE"
parameter P_ADDSUB = 1'b0;//1'b0: '+'; 1'b1: '-'
parameter DYN_A_SEL = "FALSE";//"TRUE","FALSE"
parameter A_SEL = 1'b0;//1'b0:select A; 1'b1:select SIA.

parameter DYN_ADD_SUB_0 = "FALSE";//"TRUE","FALSE"
parameter ADD_SUB_0 = 1'b0;//1'b0: '+'; 1'b1: '-'
parameter DYN_ADD_SUB_1 = "FALSE";//"TRUE","FALSE"
parameter ADD_SUB_1 = 1'b0;//1'b0: '+'; 1'b1: '-'

parameter DYN_C_SEL = "FALSE";//"TRUE","FALSE"
parameter C_SEL = 1'b1;//1'b0: select 0; 1'b1: select C input
parameter DYN_CASI_SEL = "FALSE";//"TRUE","FALSE"
parameter CASI_SEL = 1'b0;//1'b0: select 0; 1'b1:select casi
parameter DYN_ACC_SEL = "FALSE";//"TRUE","FALSE"
parameter ACC_SEL = 1'b0;//1'b0: PRE_LOAD;1'b1: DOUT feedback;

parameter MULT12X12_EN = "FALSE";//"TRUE","FALSE"


output [47:0] DOUT, CASO;
output [26:0] SOA;
input  [26:0] A, SIA;
input  [17:0] B;
input  [47:0] C;
input  [25:0] D;
input  [47:0] CASI;
input  ACCSEL;
input  PSEL;
input  ASEL;
input  PADDSUB;
input  CSEL, CASISEL;
input  [1:0] ADDSUB;
input  [1:0] CLK, CE, RESET;

reg A_CLK,A_CE,A_RESET,B_CLK,B_CE,B_RESET,C_ICLK,C_ICE,C_IRESET,C_PCLK,C_PCE,C_PRESET,D_CLK,D_CE,D_RESET,PSEL_ICLK,PSEL_ICE,PSEL_IRESET,ACCSEL_ICLK,ACCSEL_ICE,ACCSEL_IRESET,CSEL_ICLK,CSEL_ICE,CSEL_IRESET,CASISEL_ICLK,CASISEL_ICE,CASISEL_IRESET,ADDSUB0_ICLK,ADDSUB0_ICE,ADDSUB0_IRESET,ADDSUB1_ICLK,ADDSUB1_ICE,ADDSUB1_IRESET,PADDSUB_ICLK,PADDSUB_ICE,PADDSUB_IRESET,P_CLK,P_CE,P_RESET,ACCSEL_PCLK,ACCSEL_PCE,ACCSEL_PRESET,CSEL_PCLK,CSEL_PCE,CSEL_PRESET,CASISEL_PCLK,CASISEL_PCE,CASISEL_PRESET,ADDSUB0_PCLK,ADDSUB0_PCE,ADDSUB0_PRESET,ADDSUB1_PCLK,ADDSUB1_PCE,ADDSUB1_PRESET,O_CLK,O_CE,O_RESET;
reg [26:0] ina_reg_async,ina_reg_sync,ina,ina_reg,a_src,a_in,ina_preg_async,ina_preg_sync,ina_preg,SOA;
wire [26:0] ina_ext,ind_ext;
wire [11:0] ina_12_ext, ind_12_ext;
reg [11:0] a_12_in;
reg [17:0] inb_reg_async,inb_reg_sync,inb,inb_reg;
reg [25:0] ind_reg_async,ind_reg_sync,ind,ind_reg;
reg [47:0] inc_ireg_async,inc_ireg_sync,inc_0,inc_ireg,inc_preg_async,inc_preg_sync,inc_1,inc_preg;
reg accsel0_reg_async,accsel0_reg_sync,accsel_0,accsel0_reg,accsel1_reg_async,accsel1_reg_sync,accsel_1,accsel1_reg;
reg addsub0_reg0_async,addsub0_reg0_sync,addsub0_reg0,addsub0_0,addsub0_reg1_async,addsub0_reg1_sync,addsub0_reg1,addsub0_1;
reg addsub1_reg0_async,addsub1_reg0_sync,addsub1_reg0,addsub1_0,addsub1_reg1_async,addsub1_reg1_sync,addsub1_reg1,addsub1_1;
reg casisel0_reg_async,casisel0_reg_sync,casisel_0,casisel0_reg,casisel1_reg_async,casisel1_reg_sync,casisel1_reg,casisel_1;
reg csel0_reg_async,csel0_reg_sync,csel_0,csel0_reg,csel1_reg_async,csel1_reg_sync,csel1_reg,csel_1;
wire [44:0] a0,b0,mult_out;
reg [44:0] out0_reg_async,out0_reg_sync,out0,out0_reg;
reg [48:0] d_out,out_preg_async,out_preg_sync,out_preg,dout_reg,alu_out;
wire [47:0] m_out0,acc_load,d_casi,c_sig;
reg [48:0] out_reg_async,out_reg_sync,out_reg;
wire preadd_en,p_addsub_sig;
reg paddsub_reg0_async,paddsub_reg0_sync,paddsub_reg0,paddsub_0;
reg psel_reg_async,psel_reg_sync,psel_reg,psel_0;
wire a_sel_sig,accsel_sig,casisel_sig,csel_sig,addsub0_sig,addsub1_sig;
reg [1:0] accsel_int;
reg [1:0] accsel_int0_reg_async,accsel_int0_reg_sync,accsel_int0,accsel_int0_reg,accsel_int1_reg_async,accsel_int1_reg_sync,accsel_int1,accsel_int1_reg;

wire grstn = GSR.GSRO;


always @(ina_reg_async or ina_reg_sync or inb_reg_async or inb_reg_sync or ind_reg_async or ind_reg_sync or inc_ireg_async or inc_ireg_sync or inc_preg_async or inc_preg_sync or psel_reg_async or psel_reg_sync or csel0_reg_async or csel0_reg_sync or csel1_reg_async or csel1_reg_sync or casisel0_reg_async or casisel0_reg_sync or casisel1_reg_async or casisel1_reg_sync or accsel0_reg_async or accsel0_reg_sync or accsel1_reg_async or accsel1_reg_sync or addsub0_reg0_async or addsub0_reg0_sync or addsub0_reg1_async or addsub0_reg1_sync or addsub1_reg0_async or addsub1_reg0_sync or addsub1_reg1_async or addsub1_reg1_sync or paddsub_reg0_async or paddsub_reg0_sync or out0_reg_async or out0_reg_sync or out_preg_async or out_preg_sync or ina_preg_sync or ina_preg_async or out_reg_sync or out_reg_async or accsel_int0_reg_async or accsel_int0_reg_sync or accsel_int0_reg or accsel_int1_reg_async or accsel_int1_reg_sync or accsel_int1_reg)
    begin
        if (MULT_RESET_MODE == "ASYNC")
        begin
            ina_reg <= ina_reg_async;
            inb_reg <= inb_reg_async;
            inc_ireg <= inc_ireg_async;
            inc_preg <= inc_preg_async;
            ind_reg <= ind_reg_async;
            psel_reg <= psel_reg_async;
            accsel0_reg <= accsel0_reg_async;
            accsel1_reg <= accsel1_reg_async;
            csel0_reg <= csel0_reg_async;
            csel1_reg <= csel1_reg_async;
            casisel0_reg <= casisel0_reg_async;
            casisel1_reg <= casisel1_reg_async;
            addsub0_reg0 <= addsub0_reg0_async;
            addsub0_reg1 <= addsub0_reg1_async;
            addsub1_reg0 <= addsub1_reg0_async;
            addsub1_reg1 <= addsub1_reg1_async;
            paddsub_reg0 <= paddsub_reg0_async;
            out0_reg <= out0_reg_async;
            out_preg <= out_preg_async;
            ina_preg <= ina_preg_async;
            out_reg <= out_reg_async;
            accsel_int0_reg <= accsel_int0_reg_async;
            accsel_int1_reg <= accsel_int1_reg_async;
         end
        else if (MULT_RESET_MODE == "SYNC")
        begin
            ina_reg <= ina_reg_sync;
            inb_reg <= inb_reg_sync;
            ind_reg <= ind_reg_sync;
            inc_ireg <= inc_ireg_sync;
            inc_preg <= inc_preg_sync;
            psel_reg <= psel_reg_sync;
            accsel0_reg <= accsel0_reg_sync;
            accsel1_reg <= accsel1_reg_sync;
            casisel0_reg <= casisel0_reg_sync;
            casisel1_reg <= casisel1_reg_sync;
            csel0_reg <= csel0_reg_sync;
            csel1_reg <= csel1_reg_sync;
            addsub0_reg0 <= addsub0_reg0_sync;
            addsub0_reg1 <= addsub0_reg1_sync;
            addsub1_reg0 <= addsub1_reg0_sync;
            addsub1_reg1 <= addsub1_reg1_sync;
            paddsub_reg0 <= paddsub_reg0_sync;
            out0_reg <= out0_reg_sync;
            out_preg <= out_preg_sync;
            ina_preg <= ina_preg_sync;
            out_reg <= out_reg_sync;
            accsel_int0_reg <= accsel_int0_reg_sync;
            accsel_int1_reg <= accsel_int1_reg_sync;
         end
    end

    //clk,ce,reset mux
    //AREG
    always @(CLK)
    begin
        if (AREG_CLK == "CLK0")
            A_CLK = CLK[0];
        else if (AREG_CLK == "CLK1")
            A_CLK = CLK[1];
    end

    always @(CE)
    begin
        if (AREG_CE == "CE0")
            A_CE = CE[0];
        else if (AREG_CE == "CE1")
            A_CE = CE[1];
    end

    always @(RESET)
    begin
        if (AREG_RESET == "RESET0")
            A_RESET = RESET[0];
        else if (AREG_RESET == "RESET1")
            A_RESET = RESET[1];
    end

    //BREG
    always @(CLK)
    begin
        if (BREG_CLK == "CLK0")
            B_CLK = CLK[0];
        else if (BREG_CLK == "CLK1")
            B_CLK = CLK[1];
    end

    always @(CE)
    begin
        if (BREG_CE == "CE0")
            B_CE = CE[0];
        else if (BREG_CE == "CE1")
            B_CE = CE[1];
    end

    always @(RESET)
    begin
        if (BREG_RESET == "RESET0")
            B_RESET = RESET[0];
        else if (BREG_RESET == "RESET1")
            B_RESET = RESET[1];
    end

    //CREG
    always @(CLK)
    begin
        if (C_IREG_CLK == "CLK0")
            C_ICLK = CLK[0];
        else if (C_IREG_CLK == "CLK1")
            C_ICLK = CLK[1];
    end

    always @(CE)
    begin
        if (C_IREG_CE == "CE0")
            C_ICE = CE[0];
        else if (C_IREG_CE == "CE1")
            C_ICE = CE[1];
    end

    always @(RESET)
    begin
        if (C_IREG_RESET == "RESET0")
            C_IRESET = RESET[0];
        else if (C_IREG_RESET == "RESET1")
            C_IRESET = RESET[1];
    end

    always @(CLK)
    begin
        if (C_PREG_CLK == "CLK0")
            C_PCLK = CLK[0];
        else if (C_PREG_CLK == "CLK1")
            C_PCLK = CLK[1];
    end

    always @(CE)
    begin
        if (C_PREG_CE == "CE0")
            C_PCE = CE[0];
        else if (C_PREG_CE == "CE1")
            C_PCE = CE[1];
    end

    always @(RESET)
    begin
        if (C_PREG_RESET == "RESET0")
            C_PRESET = RESET[0];
        else if (C_PREG_RESET == "RESET1")
            C_PRESET = RESET[1];
    end

    
    //DREG
    always @(CLK)
    begin
        if (DREG_CLK == "CLK0")
            D_CLK = CLK[0];
        else if (DREG_CLK == "CLK1")
            D_CLK = CLK[1];
    end

    always @(CE)
    begin
        if (DREG_CE == "CE0")
            D_CE = CE[0];
        else if (DREG_CE == "CE1")
            D_CE = CE[1];
    end

    always @(RESET)
    begin
        if (DREG_RESET == "RESET0")
            D_RESET = RESET[0];
        else if (DREG_RESET == "RESET1")
            D_RESET = RESET[1];
    end

    
    //IREG
    always @(CLK)
    begin
        if (ACCSEL_IREG_CLK == "CLK0")
            ACCSEL_ICLK = CLK[0];
        else if (ACCSEL_IREG_CLK == "CLK1")
            ACCSEL_ICLK = CLK[1];
    end

    always @(CE)
    begin
        if (ACCSEL_IREG_CE == "CE0")
            ACCSEL_ICE = CE[0];
        else if (ACCSEL_IREG_CE == "CE1")
            ACCSEL_ICE = CE[1];
    end

    always @(RESET)
    begin
        if (ACCSEL_IREG_RESET == "RESET0")
            ACCSEL_IRESET = RESET[0];
        else if (ACCSEL_IREG_RESET == "RESET1")
            ACCSEL_IRESET = RESET[1];
    end

    always @(CLK)
    begin
        if (ADDSUB0_IREG_CLK == "CLK0")
            ADDSUB0_ICLK = CLK[0];
        else if (ADDSUB0_IREG_CLK == "CLK1")
            ADDSUB0_ICLK = CLK[1];
    end

    always @(CE)
    begin
        if (ADDSUB0_IREG_CE == "CE0")
            ADDSUB0_ICE = CE[0];
        else if (ADDSUB0_IREG_CE == "CE1")
            ADDSUB0_ICE = CE[1];
    end

    always @(RESET)
    begin
        if (ADDSUB0_IREG_RESET == "RESET0")
            ADDSUB0_IRESET = RESET[0];
        else if (ADDSUB0_IREG_RESET == "RESET1")
            ADDSUB0_IRESET = RESET[1];
    end
    
    always @(CLK)
    begin
        if (ADDSUB1_IREG_CLK == "CLK0")
            ADDSUB1_ICLK = CLK[0];
        else if (ADDSUB1_IREG_CLK == "CLK1")
            ADDSUB1_ICLK = CLK[1];
    end

    always @(CE)
    begin
        if (ADDSUB1_IREG_CE == "CE0")
            ADDSUB1_ICE = CE[0];
        else if (ADDSUB1_IREG_CE == "CE1")
            ADDSUB1_ICE = CE[1];
    end

    always @(RESET)
    begin
        if (ADDSUB1_IREG_RESET == "RESET0")
            ADDSUB1_IRESET = RESET[0];
        else if (ADDSUB1_IREG_RESET == "RESET1")
            ADDSUB1_IRESET = RESET[1];
    end

    always @(CLK)
    begin
        if (PSEL_IREG_CLK == "CLK0")
            PSEL_ICLK = CLK[0];
        else if (PSEL_IREG_CLK == "CLK1")
            PSEL_ICLK = CLK[1];
    end

    always @(CE)
    begin
        if (PSEL_IREG_CE == "CE0")
            PSEL_ICE = CE[0];
        else if (PSEL_IREG_CE == "CE1")
            PSEL_ICE = CE[1];
    end

    always @(RESET)
    begin
        if (PSEL_IREG_RESET == "RESET0")
            PSEL_IRESET = RESET[0];
        else if (PSEL_IREG_RESET == "RESET1")
            PSEL_IRESET = RESET[1];
    end

    always @(CLK)
    begin
        if (PADDSUB_IREG_CLK == "CLK0")
            PADDSUB_ICLK = CLK[0];
        else if (PADDSUB_IREG_CLK == "CLK1")
            PADDSUB_ICLK = CLK[1];
    end

    always @(CE)
    begin
        if (PADDSUB_IREG_CE == "CE0")
            PADDSUB_ICE = CE[0];
        else if (PADDSUB_IREG_CE == "CE1")
            PADDSUB_ICE = CE[1];
    end

    always @(RESET)
    begin
        if (PADDSUB_IREG_RESET == "RESET0")
            PADDSUB_IRESET = RESET[0];
        else if (PADDSUB_IREG_RESET == "RESET1")
            PADDSUB_IRESET = RESET[1];
    end

    always @(CLK)
    begin
        if (CSEL_IREG_CLK == "CLK0")
            CSEL_ICLK = CLK[0];
        else if (CSEL_IREG_CLK == "CLK1")
            CSEL_ICLK = CLK[1];
    end

    always @(CE)
    begin
        if (CSEL_IREG_CE == "CE0")
            CSEL_ICE = CE[0];
        else if (CSEL_IREG_CE == "CE1")
            CSEL_ICE = CE[1];
    end

    always @(RESET)
    begin
        if (CSEL_IREG_RESET == "RESET0")
            CSEL_IRESET = RESET[0];
        else if (CSEL_IREG_RESET == "RESET1")
            CSEL_IRESET = RESET[1];
    end

    always @(CLK)
    begin
        if (CASISEL_IREG_CLK == "CLK0")
            CASISEL_ICLK = CLK[0];
        else if (CASISEL_IREG_CLK == "CLK1")
            CASISEL_ICLK = CLK[1];
    end

    always @(CE)
    begin
        if (CASISEL_IREG_CE == "CE0")
            CASISEL_ICE = CE[0];
        else if (CASISEL_IREG_CE == "CE1")
            CASISEL_ICE = CE[1];
    end

    always @(RESET)
    begin
        if (CASISEL_IREG_RESET == "RESET0")
            CASISEL_IRESET = RESET[0];
        else if (CASISEL_IREG_RESET == "RESET1")
            CASISEL_IRESET = RESET[1];
    end

    //PREG
    always @(CLK)
    begin
        if (PREG_CLK == "CLK0")
            P_CLK = CLK[0];
        else if (PREG_CLK == "CLK1")
            P_CLK = CLK[1];
    end

    always @(CE)
    begin
        if (PREG_CE == "CE0")
            P_CE = CE[0];
        else if (PREG_CE == "CE1")
            P_CE = CE[1];
    end

    always @(RESET)
    begin
        if (PREG_RESET == "RESET0")
            P_RESET = RESET[0];
        else if (PREG_RESET == "RESET1")
            P_RESET = RESET[1];
    end

    always @(CLK)
    begin
        if (ACCSEL_PREG_CLK == "CLK0")
            ACCSEL_PCLK = CLK[0];
        else if (ACCSEL_PREG_CLK == "CLK1")
            ACCSEL_PCLK = CLK[1];
    end

    always @(CE)
    begin
        if (ACCSEL_PREG_CE == "CE0")
            ACCSEL_PCE = CE[0];
        else if (ACCSEL_PREG_CE == "CE1")
            ACCSEL_PCE = CE[1];
    end

    always @(RESET)
    begin
        if (ACCSEL_PREG_RESET == "RESET0")
            ACCSEL_PRESET = RESET[0];
        else if (ACCSEL_PREG_RESET == "RESET1")
            ACCSEL_PRESET = RESET[1];
    end

    always @(CLK)
    begin
        if (ADDSUB0_PREG_CLK == "CLK0")
            ADDSUB0_PCLK = CLK[0];
        else if (ADDSUB0_PREG_CLK == "CLK1")
            ADDSUB0_PCLK = CLK[1];
    end

    always @(CE)
    begin
        if (ADDSUB0_PREG_CE == "CE0")
            ADDSUB0_PCE = CE[0];
        else if (ADDSUB0_PREG_CE == "CE1")
            ADDSUB0_PCE = CE[1];
    end

    always @(RESET)
    begin
        if (ADDSUB0_PREG_RESET == "RESET0")
            ADDSUB0_PRESET = RESET[0];
        else if (ADDSUB0_PREG_RESET == "RESET1")
            ADDSUB0_PRESET = RESET[1];
    end

    always @(CLK)
    begin
        if (ADDSUB1_PREG_CLK == "CLK0")
            ADDSUB1_PCLK = CLK[0];
        else if (ADDSUB1_PREG_CLK == "CLK1")
            ADDSUB1_PCLK = CLK[1];
    end

    always @(CE)
    begin
        if (ADDSUB1_PREG_CE == "CE0")
            ADDSUB1_PCE = CE[0];
        else if (ADDSUB1_PREG_CE == "CE1")
            ADDSUB1_PCE = CE[1];
    end

    always @(RESET)
    begin
        if (ADDSUB1_PREG_RESET == "RESET0")
            ADDSUB1_PRESET = RESET[0];
        else if (ADDSUB1_PREG_RESET == "RESET1")
            ADDSUB1_PRESET = RESET[1];
    end

    always @(CLK)
    begin
        if (CSEL_PREG_CLK == "CLK0")
            CSEL_PCLK = CLK[0];
        else if (CSEL_PREG_CLK == "CLK1")
            CSEL_PCLK = CLK[1];
    end

    always @(CE)
    begin
        if (CSEL_PREG_CE == "CE0")
            CSEL_PCE = CE[0];
        else if (CSEL_PREG_CE == "CE1")
            CSEL_PCE = CE[1];
    end

    always @(RESET)
    begin
        if (CSEL_PREG_RESET == "RESET0")
            CSEL_PRESET = RESET[0];
        else if (CSEL_PREG_RESET == "RESET1")
            CSEL_PRESET = RESET[1];
    end

    always @(CLK)
    begin
        if (CASISEL_PREG_CLK == "CLK0")
            CASISEL_PCLK = CLK[0];
        else if (CASISEL_PREG_CLK == "CLK1")
            CASISEL_PCLK = CLK[1];
    end

    always @(CE)
    begin
        if (CASISEL_PREG_CE == "CE0")
            CASISEL_PCE = CE[0];
        else if (CASISEL_PREG_CE == "CE1")
            CASISEL_PCE = CE[1];
    end

    always @(RESET)
    begin
        if (CASISEL_PREG_RESET == "RESET0")
            CASISEL_PRESET = RESET[0];
        else if (CASISEL_PREG_RESET == "RESET1")
            CASISEL_PRESET = RESET[1];
    end

    //OREG
    always @(CLK)
    begin
        if (OREG_CLK == "CLK0")
            O_CLK = CLK[0];
        else if (OREG_CLK == "CLK1")
            O_CLK = CLK[1];
    end

    always @(CE)
    begin
        if (OREG_CE == "CE0")
            O_CE = CE[0];
        else if (OREG_CE == "CE1")
            O_CE = CE[1];
    end

    always @(RESET)
    begin
        if (OREG_RESET == "RESET0")
            O_RESET = RESET[0];
        else if (OREG_RESET == "RESET1")
            O_RESET = RESET[1];
    end

    //PADD or not
    assign a_sel_sig = (DYN_A_SEL == "TRUE") ? ASEL : A_SEL;
    
    always @(A or SIA or a_sel_sig)
    begin
        if(a_sel_sig == 1'b0)
        begin
            a_src = A;
        end else begin
            a_src = SIA;
        end
    end

    assign preadd_en = (DYN_P_SEL == "TRUE")? PSEL : P_SEL;
    assign p_addsub_sig = (DYN_P_ADDSUB == "TRUE")? PADDSUB : P_ADDSUB;

    always @(posedge PADDSUB_ICLK or posedge PADDSUB_IRESET or negedge grstn)
    begin
        if (!grstn) begin
            paddsub_reg0_async <= 0;
        end else if (PADDSUB_IRESET == 1'b1)
        begin
            paddsub_reg0_async <= 0;
        end
        else if (PADDSUB_ICE == 1'b1)
        begin
            paddsub_reg0_async <= p_addsub_sig;
        end
    end

    always @(posedge PADDSUB_ICLK or negedge grstn)
    begin
        if (!grstn) begin
            paddsub_reg0_sync <= 0;
        end else if (PADDSUB_IRESET == 1'b1)
        begin
            paddsub_reg0_sync <= 0;
        end
        else if (PADDSUB_ICE == 1'b1)
        begin
            paddsub_reg0_sync <= p_addsub_sig;
        end
    end

    always @(p_addsub_sig or paddsub_reg0)
    begin
        if (PADDSUB_IREG_CLK == "BYPASS")
        begin
            paddsub_0 <= p_addsub_sig;
        end else
        begin
            paddsub_0 <= paddsub_reg0;
        end
    end

    always @(posedge PSEL_ICLK or posedge PSEL_IRESET or negedge grstn)
    begin
        if (!grstn) begin
            psel_reg_async <= 0;
        end else if (PSEL_IRESET == 1'b1)
        begin
            psel_reg_async <= 0;
        end
        else if (PSEL_ICE == 1'b1)
        begin
            psel_reg_async <= preadd_en;
        end
    end

    always @(posedge PSEL_ICLK or negedge grstn)
    begin
        if (!grstn) begin
            psel_reg_sync <= 0;
        end else if (PSEL_IRESET == 1'b1)
        begin
            psel_reg_sync <= 0;
        end
        else if (PSEL_ICE == 1'b1)
        begin
            psel_reg_sync <= preadd_en;
        end
    end

    always @(preadd_en or psel_reg)
    begin
        if (PSEL_IREG_CLK == "BYPASS")
        begin
            psel_0 <= preadd_en;
        end else
        begin
            psel_0 <= psel_reg;
        end
    end

    assign ina_ext = {ina[25],ina[25:0]};
    assign ind_ext = {ind[25],ind[25:0]};

    assign ina_12_ext = {ina[10],ina[10:0]};
    assign ind_12_ext = {ind[10],ind[10:0]};

    always@(ina_ext or ind_ext or ina or psel_0 or paddsub_0)
    begin
        if(MULT12X12_EN == "FALSE")
        begin
            if(psel_0 == 1'b1)
            begin
                if(paddsub_0 == 1'b0) begin
                    a_in = ina_ext + ind_ext;
                end else begin
                    a_in = ina_ext - ind_ext;
                end
            end else begin
                a_in = ina;
            end
        end else if(MULT12X12_EN == "TRUE")
        begin
            if(psel_0 == 1'b1)
            begin
                if(paddsub_0 == 1'b0) begin
                    a_12_in = ina_12_ext + ind_12_ext;
                end else begin
                    a_12_in = ina_12_ext - ind_12_ext;
                end
            end else begin
                a_12_in = ina[11:0];
            end
        end

    end

    // in reg
    always @(posedge A_CLK or posedge A_RESET or negedge grstn)
    begin
        if (!grstn) begin
            ina_reg_async <= 0;
        end else if (A_RESET == 1'b1)
        begin
            ina_reg_async <= 0;
        end
        else if (A_CE == 1'b1)
        begin
            ina_reg_async <= a_src;
        end
    end

    always @(posedge A_CLK or negedge grstn)
    begin
        if (!grstn) begin
            ina_reg_sync <= 0; 
        end else if (A_RESET == 1'b1)
        begin
            ina_reg_sync <= 0;
        end
        else if (A_CE == 1'b1)
        begin
            ina_reg_sync <= a_src;
        end
    end
    
    always @(a_src or ina_reg)
    begin
        if (AREG_CLK == "BYPASS")
        begin
            ina = a_src;
        end else
        begin
            ina = ina_reg;
        end
    end

    always @(posedge B_CLK or posedge B_RESET or negedge grstn)
    begin
        if (!grstn) begin
            inb_reg_async <= 0;
        end else if (B_RESET == 1'b1)
        begin
            inb_reg_async <= 0;
        end
        else if (B_CE == 1'b1)
        begin
            inb_reg_async <= B;
        end
    end

    always @(posedge B_CLK or negedge grstn)
    begin
        if (!grstn) begin
            inb_reg_sync <= 0; 
        end else if (B_RESET == 1'b1)
        begin
            inb_reg_sync <= 0;
        end
        else if (B_CE == 1'b1)
        begin
            inb_reg_sync <= B;
        end
    end

    always @(B or inb_reg)
    begin
        if (BREG_CLK == "BYPASS")
        begin
            inb = B;
        end else
        begin
            inb = inb_reg;
        end
    end

    always @(posedge C_ICLK or posedge C_IRESET or negedge grstn)
    begin
        if (!grstn) begin
            inc_ireg_async <= 0;
        end else if (C_IRESET == 1'b1)
        begin
            inc_ireg_async <= 0;
        end
        else if (C_ICE == 1'b1)
        begin
            inc_ireg_async <= C;
        end
    end

    always @(posedge C_ICLK or negedge grstn)
    begin
        if (!grstn) begin
            inc_ireg_sync <= 0;
        end else if (C_IRESET == 1'b1)
        begin
            inc_ireg_sync <= 0;
        end
        else if (C_ICE == 1'b1)
        begin
            inc_ireg_sync <= C;
        end
    end

    always @(C or inc_ireg)
    begin
        if (C_IREG_CLK == "BYPASS")
        begin
            inc_0 = C;
        end else
        begin
            inc_0 = inc_ireg;
        end
    end

    always @(posedge C_PCLK or posedge C_PRESET or negedge grstn)
    begin
        if (!grstn) begin
            inc_preg_async <= 0;
        end else if (C_PRESET == 1'b1)
        begin
            inc_preg_async <= 0;
        end
        else if (C_PCE == 1'b1)
        begin
            inc_preg_async <= inc_0;
        end
    end

    always @(posedge C_PCLK or negedge grstn)
    begin
        if (!grstn) begin
            inc_preg_sync <= 0;
        end else if (C_PRESET == 1'b1)
        begin
            inc_preg_sync <= 0;
        end
        else if (C_PCE == 1'b1)
        begin
            inc_preg_sync <= inc_0;
        end
    end

    always @(inc_0 or inc_preg)
    begin
        if (C_PREG_CLK == "BYPASS")
        begin
            inc_1 = inc_0;
        end else
        begin
            inc_1 = inc_preg;
        end
    end

    always @(posedge D_CLK or posedge D_RESET or negedge grstn)
    begin
        if (!grstn) begin
            ind_reg_async <= 0;
        end else if (D_RESET == 1'b1)
        begin
            ind_reg_async <= 0;
        end
        else if (D_CE == 1'b1)
        begin
            ind_reg_async <= D;
        end
    end

    always @(posedge D_CLK or negedge grstn)
    begin
        if (!grstn) begin
            ind_reg_sync <= 0; 
        end else if (D_RESET == 1'b1)
        begin
            ind_reg_sync <= 0;
        end
        else if (D_CE == 1'b1)
        begin
            ind_reg_sync <= D;
        end
    end

    always @(D or ind_reg)
    begin
        if (DREG_CLK == "BYPASS")
        begin
            ind = D;
        end else
        begin
            ind = ind_reg;
        end
    end

    assign accsel_sig = (DYN_ACC_SEL == "FALSE") ? ACC_SEL : ACCSEL;
    assign casisel_sig = (DYN_CASI_SEL == "FALSE") ? CASI_SEL : CASISEL;
    assign csel_sig = (DYN_C_SEL == "FALSE")?  C_SEL: CSEL;
    
    assign addsub0_sig = (DYN_ADD_SUB_0 == "FALSE")? ADD_SUB_0 : ADDSUB[0];
    assign addsub1_sig = (DYN_ADD_SUB_1 == "FALSE")? ADD_SUB_1 : ADDSUB[1];

    always@(accsel_sig)
    begin
        if(accsel_sig == 1'b0)
        begin
            accsel_int = 2'b01;
        end else if(accsel_sig == 1'b1)
        begin
            accsel_int = 2'b10;
        end
    end

    always @(posedge ACCSEL_ICLK or posedge ACCSEL_IRESET or negedge grstn)
    begin
        if (!grstn) begin
            accsel0_reg_async <= 1'b0;
            accsel_int0_reg_async <= 2'b00;
        end else if (ACCSEL_IRESET == 1'b1)
        begin
            accsel0_reg_async <= 1'b0;
            accsel_int0_reg_async <= 2'b0;
        end
        else if (ACCSEL_ICE == 1'b1)
        begin
            accsel0_reg_async <= accsel_sig;
            accsel_int0_reg_async <= accsel_int;
        end
    end

    always @(posedge ACCSEL_ICLK or negedge grstn)
    begin
        if (!grstn) begin
            accsel0_reg_sync <= 1'b0; 
            accsel_int0_reg_sync <= 2'b0; 
        end else if (ACCSEL_IRESET == 1'b1)
        begin
            accsel0_reg_sync <= 1'b0;
            accsel_int0_reg_sync <= 2'b0;
        end
        else if (ACCSEL_ICE == 1'b1)
        begin
            accsel0_reg_sync <= accsel_sig;
            accsel_int0_reg_sync <= accsel_int;
        end
    end

    always @(accsel_sig or accsel0_reg or accsel_int or accsel_int0_reg)
    begin
        if (ACCSEL_IREG_CLK == "BYPASS")
        begin
            accsel_0 <= accsel_sig;
            accsel_int0 <= accsel_int;
        end else
        begin
            accsel_0 <= accsel0_reg;
            accsel_int0 <= accsel_int0_reg;
        end
    end

    always @(posedge ACCSEL_PCLK or posedge ACCSEL_PRESET or negedge grstn)
    begin
        if (!grstn) begin
            accsel1_reg_async <= 1'b0;
            accsel_int1_reg_async <= 2'b0;
        end else if (ACCSEL_PRESET == 1'b1)
        begin
            accsel1_reg_async <= 1'b0;
            accsel_int1_reg_async <= 2'b0;
        end
        else if (ACCSEL_PCE == 1'b1)
        begin
            accsel1_reg_async <= accsel_0;
            accsel_int1_reg_async <= accsel_int0;
        end
    end

    always @(posedge ACCSEL_PCLK or negedge grstn)
    begin
        if (!grstn) begin
            accsel1_reg_sync <= 1'b0; 
            accsel_int1_reg_sync <= 2'b0; 
        end else if (ACCSEL_PRESET == 1'b1)
        begin
            accsel1_reg_sync <= 1'b0;
            accsel_int1_reg_sync <= 2'b0;
        end
        else if (ACCSEL_PCE == 1'b1)
        begin
            accsel1_reg_sync <= accsel_0;
            accsel_int1_reg_sync <= accsel_int0;
        end
    end

    always @(accsel_0 or accsel1_reg or accsel_int0 or accsel_int1_reg)
    begin
        if (ACCSEL_PREG_CLK == "BYPASS")
        begin
            accsel_1 <= accsel_0;
            accsel_int1 <= accsel_int0;
        end else
        begin
            accsel_1 <= accsel1_reg;
            accsel_int1 <= accsel_int1_reg;
        end
    end

    always @(posedge CASISEL_ICLK or posedge CASISEL_IRESET or negedge grstn)
    begin
        if (!grstn) begin
            casisel0_reg_async <= 0;
        end else if (CASISEL_IRESET == 1'b1)
        begin
            casisel0_reg_async <= 0;
        end
        else if (CASISEL_ICE == 1'b1)
        begin
            casisel0_reg_async <= casisel_sig;
        end
    end

    always @(posedge CASISEL_ICLK or negedge grstn)
    begin
        if (!grstn) begin
            casisel0_reg_sync <= 0; 
        end else if (CASISEL_IRESET == 1'b1)
        begin
            casisel0_reg_sync <= 0;
        end
        else if (CASISEL_ICE == 1'b1)
        begin
            casisel0_reg_sync <= casisel_sig;
        end
    end

    always @(casisel_sig or casisel0_reg)
    begin
        if (CASISEL_IREG_CLK == "BYPASS")
        begin
            casisel_0 <= casisel_sig;
        end else
        begin
            casisel_0 <= casisel0_reg;
        end
    end

    always @(posedge CASISEL_PCLK or posedge CASISEL_PRESET or negedge grstn)
    begin
        if (!grstn) begin
            casisel1_reg_async <= 0;
        end else if (CASISEL_PRESET == 1'b1)
        begin
            casisel1_reg_async <= 0;
        end
        else if (CASISEL_PCE == 1'b1)
        begin
            casisel1_reg_async <= casisel_0;
        end
    end

    always @(posedge CASISEL_PCLK or negedge grstn)
    begin
        if (!grstn) begin
            casisel1_reg_sync <= 0; 
        end else if (CASISEL_PRESET == 1'b1)
        begin
            casisel1_reg_sync <= 0;
        end
        else if (CASISEL_PCE == 1'b1)
        begin
            casisel1_reg_sync <= casisel_0;
        end
    end

    always @(casisel_0 or casisel1_reg)
    begin
        if (CASISEL_PREG_CLK == "BYPASS")
        begin
            casisel_1 <= casisel_0;
        end else
        begin
            casisel_1 <= casisel1_reg;
        end
    end

    always @(posedge CSEL_ICLK or posedge CSEL_IRESET or negedge grstn)
    begin
        if (!grstn) begin
            csel0_reg_async <= 0;
        end else if (CSEL_IRESET == 1'b1)
        begin
            csel0_reg_async <= 0;
        end
        else if (CSEL_ICE == 1'b1)
        begin
            csel0_reg_async <= csel_sig;
        end
    end

    always @(posedge CSEL_ICLK or negedge grstn)
    begin
        if (!grstn) begin
            csel0_reg_sync <= 0; 
        end else if (CSEL_IRESET == 1'b1)
        begin
            csel0_reg_sync <= 0;
        end
        else if (CSEL_ICE == 1'b1)
        begin
            csel0_reg_sync <= csel_sig;
        end
    end

    always @(csel_sig or csel0_reg)
    begin
        if (CSEL_IREG_CLK == "BYPASS")
        begin
            csel_0 <= csel_sig;
        end else
        begin
            csel_0 <= csel0_reg;
        end
    end

    always @(posedge CSEL_PCLK or posedge CSEL_PRESET or negedge grstn)
    begin
        if (!grstn) begin
            csel1_reg_async <= 0;
        end else if (CSEL_PRESET == 1'b1)
        begin
            csel1_reg_async <= 0;
        end
        else if (CSEL_PCE == 1'b1)
        begin
            csel1_reg_async <= csel_0;
        end
    end

    always @(posedge CSEL_PCLK or negedge grstn)
    begin
        if (!grstn) begin
            csel1_reg_sync <= 0; 
        end else if (CSEL_PRESET == 1'b1)
        begin
            csel1_reg_sync <= 0;
        end
        else if (CSEL_PCE == 1'b1)
        begin
            csel1_reg_sync <= csel_0;
        end
    end

    always @(csel_0 or csel1_reg)
    begin
        if (CSEL_PREG_CLK == "BYPASS")
        begin
            csel_1 <= csel_0;
        end else
        begin
            csel_1 <= csel1_reg;
        end
    end


    always @(posedge ADDSUB0_ICLK or posedge ADDSUB0_IRESET or negedge grstn)
    begin
        if (!grstn) begin
            addsub0_reg0_async <= 0;
        end else if (ADDSUB0_IRESET == 1'b1)
        begin
            addsub0_reg0_async <= 0;
        end
        else if (ADDSUB0_ICE == 1'b1)
        begin
            addsub0_reg0_async <= addsub0_sig;
        end
    end

    always @(posedge ADDSUB0_ICLK or negedge grstn)
    begin
        if (!grstn) begin
            addsub0_reg0_sync <= 0; 
        end else if (ADDSUB0_IRESET == 1'b1)
        begin
            addsub0_reg0_sync <= 0;
        end
        else if (ADDSUB0_ICE == 1'b1)
        begin
            addsub0_reg0_sync <= addsub0_sig;
        end
    end

    always @(addsub0_sig or addsub0_reg0)
    begin
        if (ADDSUB0_IREG_CLK == "BYPASS")
        begin
            addsub0_0 <= addsub0_sig;
        end else
        begin
            addsub0_0 <= addsub0_reg0;
        end
    end

    always @(posedge ADDSUB0_PCLK or posedge ADDSUB0_PRESET or negedge grstn)
    begin
        if (!grstn) begin
            addsub0_reg1_async <= 0;
        end else if (ADDSUB0_PRESET == 1'b1)
        begin
            addsub0_reg1_async <= 0;
        end
        else if (ADDSUB0_PCE == 1'b1)
        begin
            addsub0_reg1_async <= addsub0_0;
        end
    end

    always @(posedge ADDSUB0_PCLK or negedge grstn)
    begin
        if (!grstn) begin
            addsub0_reg1_sync <= 0; 
        end else if (ADDSUB0_PRESET == 1'b1)
        begin
            addsub0_reg1_sync <= 0;
        end
        else if (ADDSUB0_PCE == 1'b1)
        begin
            addsub0_reg1_sync <= addsub0_0;
        end
    end

    always @(addsub0_0 or addsub0_reg1)
    begin
        if (ADDSUB0_PREG_CLK == "BYPASS")
        begin
            addsub0_1 <= addsub0_0;
        end else
        begin
            addsub0_1 <= addsub0_reg1;
        end
    end

    always @(posedge ADDSUB1_ICLK or posedge ADDSUB1_IRESET or negedge grstn)
    begin
        if (!grstn) begin
            addsub1_reg0_async <= 0;
        end else if (ADDSUB1_IRESET == 1'b1)
        begin
            addsub1_reg0_async <= 0;
        end
        else if (ADDSUB1_ICE == 1'b1)
        begin
            addsub1_reg0_async <= addsub1_sig;
        end
    end

    always @(posedge ADDSUB1_ICLK or negedge grstn)
    begin
        if (!grstn) begin
            addsub1_reg0_sync <= 0; 
        end else if (ADDSUB1_IRESET == 1'b1)
        begin
            addsub1_reg0_sync <= 0;
        end
        else if (ADDSUB1_ICE == 1'b1)
        begin
            addsub1_reg0_sync <= addsub1_sig;
        end
    end

    always @(addsub1_sig or addsub1_reg0)
    begin
        if (ADDSUB1_IREG_CLK == "BYPASS")
        begin
            addsub1_0 <= addsub1_sig;
        end else
        begin
            addsub1_0 <= addsub1_reg0;
        end
    end

    always @(posedge ADDSUB1_PCLK or posedge ADDSUB1_PRESET or negedge grstn)
    begin
        if (!grstn) begin
            addsub1_reg1_async <= 0;
        end else if (ADDSUB1_PRESET == 1'b1)
        begin
            addsub1_reg1_async <= 0;
        end
        else if (ADDSUB1_PCE == 1'b1)
        begin
            addsub1_reg1_async <= addsub1_0;
        end
    end

    always @(posedge ADDSUB1_PCLK or negedge grstn)
    begin
        if (!grstn) begin
            addsub1_reg1_sync <= 0; 
        end else if (ADDSUB1_PRESET == 1'b1)
        begin
            addsub1_reg1_sync <= 0;
        end
        else if (ADDSUB1_PCE == 1'b1)
        begin
            addsub1_reg1_sync <= addsub1_0;
        end
    end

    always @(addsub1_0 or addsub1_reg1)
    begin
        if (ADDSUB1_PREG_CLK == "BYPASS")
        begin
            addsub1_1 <= addsub1_0;
        end else
        begin
            addsub1_1 <= addsub1_reg1;
        end
    end


    assign a0[44:0] = (MULT12X12_EN == "FALSE")? {{18{a_in[26]}},a_in[26:0]} : {{33{a_12_in[11]}},a_12_in[11:0]};
    assign b0[44:0] = (MULT12X12_EN == "FALSE")? {{27{inb[17]}},inb[17:0]} : {{33{inb[11]}}, inb[11:0]};

    assign mult_out = a0 * b0 ;

    // pipeline reg
    always @(posedge P_CLK or posedge P_RESET or negedge grstn)
    begin
        if (!grstn) begin
            out0_reg_async <= 0;
        end else if (P_RESET == 1'b1)
        begin
            out0_reg_async <= 0;
        end
        else if (P_CE == 1'b1)
        begin
            out0_reg_async <= mult_out;
        end
    end

    always @(posedge P_CLK or negedge grstn)
    begin
        if (!grstn) begin
            out0_reg_sync <= 0;
        end else if (P_RESET == 1'b1)
        begin
            out0_reg_sync <= 0;
        end
        else if (P_CE == 1'b1)
        begin
            out0_reg_sync <= mult_out;
        end
    end

    always @(posedge O_CLK or posedge O_RESET or negedge grstn)
    begin
        if (!grstn) begin
            out_preg_async <= 0;
        end else if (O_RESET == 1'b1)
        begin
            out_preg_async <= 0;
        end
        else if (O_CE == 1'b1)
        begin
            out_preg_async <= d_out;
        end
    end

    always @(posedge O_CLK or negedge grstn)
    begin
        if (!grstn) begin
            out_preg_sync <= 0;
        end else if (O_RESET == 1'b1)
        begin
            out_preg_sync <= 0;
        end
        else if (O_CE == 1'b1)
        begin
            out_preg_sync <= d_out;
        end
    end

    always @(mult_out or out0_reg)
    begin
        if (PREG_CLK == "BYPASS")
        begin
            out0 = mult_out;
        end else
        begin
            out0 = out0_reg;
        end
    end

    always @(d_out or out_preg)
    begin
        if (FB_PREG_EN == "FALSE")
        begin
            dout_reg = d_out;
        end else
        begin
            dout_reg = out_preg;
        end
    end

    assign m_out0 = {{3{out0[44]}},out0[44:0]};


    assign acc_load = (accsel_int1 == 2'b10 || accsel_int1 == 2'b11) ? dout_reg : ((accsel_int1 == 2'b01) ? PRE_LOAD : 48'b0);
    assign d_casi = (casisel_1 == 1'b1) ? CASI : 48'b0;
    assign c_sig = (csel_1 == 1'b1) ? inc_1 : 48'b0;

    always @(acc_load or m_out0 or d_casi or c_sig or addsub0_1 or addsub1_1)
    begin
        if(addsub0_1 == 1'b0 && addsub1_1 == 1'b0) begin
            alu_out = acc_load + m_out0 + c_sig + d_casi;
        end else if(addsub0_1 == 1'b0 && addsub1_1 == 1'b1) begin
            alu_out = acc_load + m_out0 - c_sig + d_casi;
        end else if(addsub0_1 == 1'b1 && addsub1_1 == 1'b0) begin
            alu_out = acc_load - m_out0 + c_sig + d_casi;
        end else if(addsub0_1 == 1'b1 && addsub1_1 == 1'b1) begin
            alu_out = acc_load - m_out0 - c_sig + d_casi;
        end

    end

    //SOA
    always @(posedge A_CLK or posedge A_RESET or negedge grstn)
    begin
        if (!grstn) begin
            ina_preg_async <= 0;
        end else if (A_RESET == 1'b1)
        begin
            ina_preg_async <= 0;
        end
        else if (A_CE == 1'b1)
        begin
            ina_preg_async <= ina;
        end
    end

    always @(posedge A_CLK or negedge grstn)
    begin
        if (!grstn) begin
            ina_preg_sync <= 0;
        end else if (A_RESET == 1'b1)
        begin
            ina_preg_sync <= 0;
        end
        else if (A_CE == 1'b1)
        begin
            ina_preg_sync <= ina;
        end
    end

    always @(ina or ina_preg)
    begin
        if (SOA_PREG_EN == "FALSE")
        begin
            SOA = ina;
        end else
        begin
            SOA = ina_preg;
        end
    end
      
    // output reg
    always @(posedge O_CLK or posedge O_RESET or negedge grstn)
    begin
        if (!grstn) begin
            out_reg_async <= 0;
        end else if (O_RESET == 1'b1)
        begin
            out_reg_async <= 0;
        end
        else if (O_CE == 1'b1)
        begin
            out_reg_async <= alu_out;
        end
    end

    always @(posedge O_CLK or negedge grstn)
    begin
        if (!grstn) begin
            out_reg_sync <= 0;
        end else if (O_RESET == 1'b1)
        begin
            out_reg_sync <= 0;
        end
        else if (O_CE == 1'b1)
        begin
            out_reg_sync <= alu_out;
        end
    end

    always @(alu_out or out_reg)
    begin
        if (OREG_CLK == "BYPASS")
        begin
            d_out = alu_out;
        end else
        begin
            d_out = out_reg;
        end
    end

    assign DOUT = d_out[47:0];
    assign CASO = d_out[47:0];

endmodule


//MULT12X12
module MULT12X12 (DOUT, A, B, CLK, CE, RESET);

parameter AREG_CLK = "BYPASS"; // "BYPASS","CLK0","CLK1"
parameter AREG_CE = "CE0"; // "CE0","CE1"
parameter AREG_RESET = "RESET0"; //"RESET0", "RESET1"

parameter BREG_CLK = "BYPASS"; // "BYPASS","CLK0","CLK1"
parameter BREG_CE = "CE0"; // "CE0","CE1"
parameter BREG_RESET = "RESET0"; //"RESET0", "RESET1"

parameter PREG_CLK = "BYPASS"; // "BYPASS","CLK0","CLK1"
parameter PREG_CE = "CE0"; // "CE0","CE1"
parameter PREG_RESET = "RESET0"; //"RESET0", "RESET1"

parameter OREG_CLK = "BYPASS"; // "BYPASS","CLK0","CLK1"
parameter OREG_CE = "CE0"; // "CE0","CE1"
parameter OREG_RESET = "RESET0"; //"RESET0", "RESET1"

parameter MULT_RESET_MODE = "SYNC";// SYNC,ASYNC

output [23:0] DOUT;
input  [11:0] A, B;
input  [1:0] CLK, CE, RESET;

reg A_CLK,A_CE,A_RESET,B_CLK,B_CE,B_RESET,P_CLK,P_CE,P_RESET,O_CLK,O_CE,O_RESET;
reg [11:0] ina_reg_async,ina_reg_sync,ina,ina_reg;
reg [11:0] inb_reg_async,inb_reg_sync,inb,inb_reg;
wire [23:0] a0,b0,mult_out0;
reg [23:0] out0_reg_async,out0_reg_sync,out0,out0_reg;
wire [23:0] m_out0;
reg [23:0] out_reg_async,out_reg_sync,out_reg,d_out;

wire grstn = GSR.GSRO;


    always @(ina_reg_async or ina_reg_sync or inb_reg_async or inb_reg_sync or out0_reg_async or out0_reg_sync or out_reg_sync or out_reg_async)
    begin
        if (MULT_RESET_MODE == "ASYNC")
        begin
            ina_reg <= ina_reg_async;
            inb_reg <= inb_reg_async;
            out0_reg <= out0_reg_async;
            out_reg <= out_reg_async;
        end
        else if (MULT_RESET_MODE == "SYNC")
        begin
            ina_reg <= ina_reg_sync;
            inb_reg <= inb_reg_sync;
            out0_reg <= out0_reg_sync;
            out_reg <= out_reg_sync;
        end
    end

    //clk,ce,reset mux
    //AREG
    always @(CLK)
    begin
        if (AREG_CLK == "CLK0")
            A_CLK = CLK[0];
        else if (AREG_CLK == "CLK1")
            A_CLK = CLK[1];
    end

    always @(CE)
    begin
        if (AREG_CE == "CE0")
            A_CE = CE[0];
        else if (AREG_CE == "CE1")
            A_CE = CE[1];
    end

    always @(RESET)
    begin
        if (AREG_RESET == "RESET0")
            A_RESET = RESET[0];
        else if (AREG_RESET == "RESET1")
            A_RESET = RESET[1];
    end

    //BREG
    always @(CLK)
    begin
        if (BREG_CLK == "CLK0")
            B_CLK = CLK[0];
        else if (BREG_CLK == "CLK1")
            B_CLK = CLK[1];
    end

    always @(CE)
    begin
        if (BREG_CE == "CE0")
            B_CE = CE[0];
        else if (BREG_CE == "CE1")
            B_CE = CE[1];
    end

    always @(RESET)
    begin
        if (BREG_RESET == "RESET0")
            B_RESET = RESET[0];
        else if (BREG_RESET == "RESET1")
            B_RESET = RESET[1];
    end

    //PREG
    always @(CLK)
    begin
        if (PREG_CLK == "CLK0")
            P_CLK = CLK[0];
        else if (PREG_CLK == "CLK1")
            P_CLK = CLK[1];
    end

    always @(CE)
    begin
        if (PREG_CE == "CE0")
            P_CE = CE[0];
        else if (PREG_CE == "CE1")
            P_CE = CE[1];
    end

    always @(RESET)
    begin
        if (PREG_RESET == "RESET0")
            P_RESET = RESET[0];
        else if (PREG_RESET == "RESET1")
            P_RESET = RESET[1];
    end

    //OREG
    always @(CLK)
    begin
        if (OREG_CLK == "CLK0")
            O_CLK = CLK[0];
        else if (OREG_CLK == "CLK1")
            O_CLK = CLK[1];
    end

    always @(CE)
    begin
        if (OREG_CE == "CE0")
            O_CE = CE[0];
        else if (OREG_CE == "CE1")
            O_CE = CE[1];
    end

    always @(RESET)
    begin
        if (OREG_RESET == "RESET0")
            O_RESET = RESET[0];
        else if (OREG_RESET == "RESET1")
            O_RESET = RESET[1];
    end

    // in reg
    always @(posedge A_CLK or posedge A_RESET or negedge grstn)
    begin
        if (!grstn) begin
            ina_reg_async <= 0;
        end else if (A_RESET == 1'b1)
        begin
            ina_reg_async <= 0;
        end
        else if (A_CE == 1'b1)
        begin
            ina_reg_async <= A;
        end
    end

    always @(posedge A_CLK or negedge grstn)
    begin
        if (!grstn) begin
            ina_reg_sync <= 0; 
        end else if (A_RESET == 1'b1)
        begin
            ina_reg_sync <= 0;
        end
        else if (A_CE == 1'b1)
        begin
            ina_reg_sync <= A;
        end
    end

    always @(A or ina_reg)
    begin
        if (AREG_CLK == "BYPASS")
        begin
            ina = A;
        end else
        begin
            ina = ina_reg;
        end
    end

    always @(posedge B_CLK or posedge B_RESET or negedge grstn)
    begin
        if (!grstn) begin
            inb_reg_async <= 0;
        end else if (B_RESET == 1'b1)
        begin
            inb_reg_async <= 0;
        end
        else if (B_CE == 1'b1)
        begin
            inb_reg_async <= B;
        end
    end

    always @(posedge B_CLK or negedge grstn)
    begin
        if (!grstn) begin
            inb_reg_sync <= 0; 
        end else if (B_RESET == 1'b1)
        begin
            inb_reg_sync <= 0;
        end
        else if (B_CE == 1'b1)
        begin
            inb_reg_sync <= B;
        end
    end

    always @(B or inb_reg)
    begin
        if (BREG_CLK == "BYPASS")
        begin
            inb = B;
        end else
        begin
            inb = inb_reg;
        end
    end

    assign a0[23:0] = {{12{ina[11]}},ina[11:0]};
    assign b0[23:0] = {{12{inb[11]}},inb[11:0]};

    assign mult_out0 = a0 * b0 ;

    // pipeline reg
    always @(posedge P_CLK or posedge P_RESET or negedge grstn)
    begin
        if (!grstn) begin
            out0_reg_async <= 0;
        end else if (P_RESET == 1'b1)
        begin
            out0_reg_async <= 0;
        end
        else if (P_CE == 1'b1)
        begin
            out0_reg_async <= mult_out0;
        end
    end

    always @(posedge P_CLK or negedge grstn)
    begin
        if (!grstn) begin
            out0_reg_sync <= 0;
        end else if (P_RESET == 1'b1)
        begin
            out0_reg_sync <= 0;
        end
        else if (P_CE == 1'b1)
        begin
            out0_reg_sync <= mult_out0;
        end
    end

    always @(mult_out0 or out0_reg)
    begin
        if (PREG_CLK == "BYPASS")
        begin
            out0 = mult_out0;
        end else
        begin
            out0 = out0_reg;
        end
    end

    // output reg
    always @(posedge O_CLK or posedge O_RESET or negedge grstn)
    begin
        if (!grstn) begin
            out_reg_async <= 0;
        end else if (O_RESET == 1'b1)
        begin
            out_reg_async <= 0;
        end
        else if (O_CE == 1'b1)
        begin
            out_reg_async <= out0;
        end
    end

    always @(posedge O_CLK or negedge grstn)
    begin
        if (!grstn) begin
            out_reg_sync <= 0;
        end else if (O_RESET == 1'b1)
        begin
            out_reg_sync <= 0;
        end
        else if (O_CE == 1'b1)
        begin
            out_reg_sync <= out0;
        end
    end

    always @(out0 or out_reg)
    begin
        if (OREG_CLK == "BYPASS")
        begin
            d_out = out0;
        end else
        begin
            d_out = out_reg;
        end
    end

    assign DOUT = d_out[23:0];

endmodule


//MULT27X36
module MULT27X36 (DOUT, A, B, D, PSEL, PADDSUB, CLK, CE, RESET);

parameter AREG_CLK = "BYPASS"; // "BYPASS","CLK0","CLK1"
parameter AREG_CE = "CE0"; // "CE0","CE1"
parameter AREG_RESET = "RESET0"; //"RESET0", "RESET1"

parameter BREG_CLK = "BYPASS"; // "BYPASS","CLK0","CLK1"
parameter BREG_CE = "CE0"; // "CE0","CE1"
parameter BREG_RESET = "RESET0"; //"RESET0", "RESET1"

parameter DREG_CLK = "BYPASS"; // "BYPASS","CLK0","CLK1"
parameter DREG_CE = "CE0"; // "CE0","CE1"
parameter DREG_RESET = "RESET0"; //"RESET0", "RESET1"

parameter PADDSUB_IREG_CLK = "BYPASS"; // "BYPASS","CLK0","CLK1"
parameter PADDSUB_IREG_CE = "CE0"; // "CE0","CE1"
parameter PADDSUB_IREG_RESET = "RESET0"; //"RESET0", "RESET1"

parameter PREG_CLK = "BYPASS"; // "BYPASS","CLK0","CLK1"
parameter PREG_CE = "CE0"; // "CE0","CE1"
parameter PREG_RESET = "RESET0"; //"RESET0", "RESET1"

parameter PSEL_IREG_CLK = "BYPASS"; // "BYPASS","CLK0","CLK1"
parameter PSEL_IREG_CE = "CE0"; // "CE0","CE1"
parameter PSEL_IREG_RESET = "RESET0"; //"RESET0", "RESET1"

parameter OREG_CLK = "BYPASS"; // "BYPASS","CLK0","CLK1"
parameter OREG_CE = "CE0"; // "CE0","CE1"
parameter OREG_RESET = "RESET0"; //"RESET0", "RESET1"

parameter MULT_RESET_MODE = "SYNC";// SYNC,ASYNC
parameter DYN_P_SEL = "FALSE";//"TRUE","FALSE"
parameter P_SEL = 1'b0;//1'b0: select direct INA; 1'b1: select preadder
parameter DYN_P_ADDSUB = "FALSE";//"TRUE","FALSE"
parameter P_ADDSUB = 1'b0;//1'b0:add; 1'b1:sub

output [62:0] DOUT;
input  [26:0] A;
input  [35:0] B;
input  [25:0] D;
input  [1:0] CLK, CE, RESET;
input  PSEL;
input  PADDSUB;

reg A_CLK,A_CE,A_RESET,B_CLK,B_CE,B_RESET,D_CLK,D_CE,D_RESET,PADDSUB_ICLK,PADDSUB_ICE,PADDSUB_IRESET,PSEL_ICLK,PSEL_ICE,PSEL_IRESET,P_CLK,P_CE,P_RESET,O_CLK,O_CE,O_RESET;
reg [26:0] ina_reg_async,ina_reg_sync,ina,ina_reg,a_in;
reg [35:0] inb_reg_async,inb_reg_sync,inb,inb_reg;
reg [25:0] ind_reg_async,ind_reg_sync,ind,ind_reg;
wire [26:0] ina_ext,ind_ext;
wire [62:0] a0,b0,mult_out0;
reg [62:0] out0_reg_async,out0_reg_sync,out0,out0_reg;
reg [62:0] out_reg_async,out_reg_sync,out_reg,d_out;
wire preadd_en,p_addsub_sig;
reg paddsub_reg0_async,paddsub_reg0_sync,paddsub_reg0,paddsub_0;
reg psel_reg_async,psel_reg_sync,psel_reg,psel_0;

wire grstn = GSR.GSRO;


always @(ina_reg_async or ina_reg_sync or inb_reg_async or inb_reg_sync or ind_reg_async or ind_reg_sync or paddsub_reg0_async or paddsub_reg0_sync or psel_reg_async or psel_reg_sync or out0_reg_async or out0_reg_sync or out_reg_sync or out_reg_async)
    begin
        if (MULT_RESET_MODE == "ASYNC")
        begin
            ina_reg <= ina_reg_async;
            inb_reg <= inb_reg_async;
            ind_reg <= ind_reg_async;
            paddsub_reg0 <= paddsub_reg0_async;
            psel_reg <= psel_reg_async;
            out0_reg <= out0_reg_async;
            out_reg <= out_reg_async;
        end
        else if (MULT_RESET_MODE == "SYNC")
        begin
            ina_reg <= ina_reg_sync;
            inb_reg <= inb_reg_sync;
            ind_reg <= ind_reg_sync;
            paddsub_reg0 <= paddsub_reg0_sync;
            psel_reg <= psel_reg_sync;
            out0_reg <= out0_reg_sync;
            out_reg <= out_reg_sync;
        end
    end

    //clk,ce,reset mux
    //AREG
    always @(CLK)
    begin
        if (AREG_CLK == "CLK0")
            A_CLK = CLK[0];
        else if (AREG_CLK == "CLK1")
            A_CLK = CLK[1];
    end

    always @(CE)
    begin
        if (AREG_CE == "CE0")
            A_CE = CE[0];
        else if (AREG_CE == "CE1")
            A_CE = CE[1];
    end

    always @(RESET)
    begin
        if (AREG_RESET == "RESET0")
            A_RESET = RESET[0];
        else if (AREG_RESET == "RESET1")
            A_RESET = RESET[1];
    end

    //BREG
    always @(CLK)
    begin
        if (BREG_CLK == "CLK0")
            B_CLK = CLK[0];
        else if (BREG_CLK == "CLK1")
            B_CLK = CLK[1];
    end

    always @(CE)
    begin
        if (BREG_CE == "CE0")
            B_CE = CE[0];
        else if (BREG_CE == "CE1")
            B_CE = CE[1];
    end

    always @(RESET)
    begin
        if (BREG_RESET == "RESET0")
            B_RESET = RESET[0];
        else if (BREG_RESET == "RESET1")
            B_RESET = RESET[1];
    end

    //DREG
    always @(CLK)
    begin
        if (DREG_CLK == "CLK0")
            D_CLK = CLK[0];
        else if (DREG_CLK == "CLK1")
            D_CLK = CLK[1];
    end

    always @(CE)
    begin
        if (DREG_CE == "CE0")
            D_CE = CE[0];
        else if (DREG_CE == "CE1")
            D_CE = CE[1];
    end

    always @(RESET)
    begin
        if (DREG_RESET == "RESET0")
            D_RESET = RESET[0];
        else if (DREG_RESET == "RESET1")
            D_RESET = RESET[1];
    end

    //PADDSUB_IREG
    always @(CLK)
    begin
        if (PADDSUB_IREG_CLK == "CLK0")
            PADDSUB_ICLK = CLK[0];
        else if (PADDSUB_IREG_CLK == "CLK1")
            PADDSUB_ICLK = CLK[1];
    end

    always @(CE)
    begin
        if (PADDSUB_IREG_CE == "CE0")
            PADDSUB_ICE = CE[0];
        else if (PADDSUB_IREG_CE == "CE1")
            PADDSUB_ICE = CE[1];
    end

    always @(RESET)
    begin
        if (PADDSUB_IREG_RESET == "RESET0")
            PADDSUB_IRESET = RESET[0];
        else if (PADDSUB_IREG_RESET == "RESET1")
            PADDSUB_IRESET = RESET[1];
    end

    //PSEL_IREG
    always @(CLK)
    begin
        if (PSEL_IREG_CLK == "CLK0")
            PSEL_ICLK = CLK[0];
        else if (PSEL_IREG_CLK == "CLK1")
            PSEL_ICLK = CLK[1];
    end

    always @(CE)
    begin
        if (PSEL_IREG_CE == "CE0")
            PSEL_ICE = CE[0];
        else if (PSEL_IREG_CE == "CE1")
            PSEL_ICE = CE[1];
    end

    always @(RESET)
    begin
        if (PSEL_IREG_RESET == "RESET0")
            PSEL_IRESET = RESET[0];
        else if (PSEL_IREG_RESET == "RESET1")
            PSEL_IRESET = RESET[1];
    end


    //PREG
    always @(CLK)
    begin
        if (PREG_CLK == "CLK0")
            P_CLK = CLK[0];
        else if (PREG_CLK == "CLK1")
            P_CLK = CLK[1];
    end

    always @(CE)
    begin
        if (PREG_CE == "CE0")
            P_CE = CE[0];
        else if (PREG_CE == "CE1")
            P_CE = CE[1];
    end

    always @(RESET)
    begin
        if (PREG_RESET == "RESET0")
            P_RESET = RESET[0];
        else if (PREG_RESET == "RESET1")
            P_RESET = RESET[1];
    end

    //OREG
    always @(CLK)
    begin
        if (OREG_CLK == "CLK0")
            O_CLK = CLK[0];
        else if (OREG_CLK == "CLK1")
            O_CLK = CLK[1];
    end

    always @(CE)
    begin
        if (OREG_CE == "CE0")
            O_CE = CE[0];
        else if (OREG_CE == "CE1")
            O_CE = CE[1];
    end

    always @(RESET)
    begin
        if (OREG_RESET == "RESET0")
            O_RESET = RESET[0];
        else if (OREG_RESET == "RESET1")
            O_RESET = RESET[1];
    end

    // in reg
    always @(posedge A_CLK or posedge A_RESET or negedge grstn)
    begin
        if (!grstn) begin
            ina_reg_async <= 0;
        end else if (A_RESET == 1'b1)
        begin
            ina_reg_async <= 0;
        end
        else if (A_CE == 1'b1)
        begin
            ina_reg_async <= A;
        end
    end

    always @(posedge A_CLK or negedge grstn)
    begin
        if (!grstn) begin
            ina_reg_sync <= 0; 
        end else if (A_RESET == 1'b1)
        begin
            ina_reg_sync <= 0;
        end
        else if (A_CE == 1'b1)
        begin
            ina_reg_sync <= A;
        end
    end

    always @(A or ina_reg)
    begin
        if (AREG_CLK == "BYPASS")
        begin
            ina = A;
        end else
        begin
            ina = ina_reg;
        end
    end

    always @(posedge B_CLK or posedge B_RESET or negedge grstn)
    begin
        if (!grstn) begin
            inb_reg_async <= 0;
        end else if (B_RESET == 1'b1)
        begin
            inb_reg_async <= 0;
        end
        else if (B_CE == 1'b1)
        begin
            inb_reg_async <= B;
        end
    end

    always @(posedge B_CLK or negedge grstn)
    begin
        if (!grstn) begin
            inb_reg_sync <= 0; 
        end else if (B_RESET == 1'b1)
        begin
            inb_reg_sync <= 0;
        end
        else if (B_CE == 1'b1)
        begin
            inb_reg_sync <= B;
        end
    end

    always @(B or inb_reg)
    begin
        if (BREG_CLK == "BYPASS")
        begin
            inb = B;
        end else
        begin
            inb = inb_reg;
        end
    end

    always @(posedge D_CLK or posedge D_RESET or negedge grstn)
    begin
        if (!grstn) begin
            ind_reg_async <= 0;
        end else if (D_RESET == 1'b1)
        begin
            ind_reg_async <= 0;
        end
        else if (D_CE == 1'b1)
        begin
            ind_reg_async <= D;
        end
    end

    always @(posedge D_CLK or negedge grstn)
    begin
        if (!grstn) begin
            ind_reg_sync <= 0; 
        end else if (D_RESET == 1'b1)
        begin
            ind_reg_sync <= 0;
        end
        else if (D_CE == 1'b1)
        begin
            ind_reg_sync <= D;
        end
    end

    always @(D or ind_reg)
    begin
        if (DREG_CLK == "BYPASS")
        begin
            ind = D;
        end else
        begin
            ind = ind_reg;
        end
    end

    //PADD or not
    assign ina_ext = {ina[25],ina[25:0]};
    assign ind_ext = {ind[25],ind[25:0]};

    assign preadd_en = (DYN_P_SEL == "TRUE")? PSEL : ((P_SEL == 1'b1)? 1'b1 : 1'b0);
    assign p_addsub_sig = (DYN_P_ADDSUB == "TRUE")? PADDSUB : P_ADDSUB;

    always @(posedge PADDSUB_ICLK or posedge PADDSUB_IRESET or negedge grstn)
    begin
        if (!grstn) begin
            paddsub_reg0_async <= 0;
        end else if (PADDSUB_IRESET == 1'b1)
        begin
            paddsub_reg0_async <= 0;
        end
        else if (PADDSUB_ICE == 1'b1)
        begin
            paddsub_reg0_async <= p_addsub_sig;
        end
    end

    always @(posedge PADDSUB_ICLK or negedge grstn)
    begin
        if (!grstn) begin
            paddsub_reg0_sync <= 0;
        end else if (PADDSUB_IRESET == 1'b1)
        begin
            paddsub_reg0_sync <= 0;
        end
        else if (PADDSUB_ICE == 1'b1)
        begin
            paddsub_reg0_sync <= p_addsub_sig;
        end
    end

    always @(p_addsub_sig or paddsub_reg0)
    begin
        if (PADDSUB_IREG_CLK == "BYPASS")
        begin
            paddsub_0 <= p_addsub_sig;
        end else
        begin
            paddsub_0 <= paddsub_reg0;
        end
    end

    always @(posedge PSEL_ICLK or posedge PSEL_IRESET or negedge grstn)
    begin
        if (!grstn) begin
            psel_reg_async <= 0;
        end else if (PSEL_IRESET == 1'b1)
        begin
            psel_reg_async <= 0;
        end
        else if (PSEL_ICE == 1'b1)
        begin
            psel_reg_async <= preadd_en;
        end
    end

    always @(posedge PSEL_ICLK or negedge grstn)
    begin
        if (!grstn) begin
            psel_reg_sync <= 0;
        end else if (PSEL_IRESET == 1'b1)
        begin
            psel_reg_sync <= 0;
        end
        else if (PSEL_ICE == 1'b1)
        begin
            psel_reg_sync <= preadd_en;
        end
    end

    always @(preadd_en or psel_reg)
    begin
        if (PSEL_IREG_CLK == "BYPASS")
        begin
            psel_0 <= preadd_en;
        end else
        begin
            psel_0 <= psel_reg;
        end
    end

    always@(ina_ext or ind_ext or ina or psel_0 or paddsub_0)
    begin
        if(psel_0 == 1'b1)
        begin
            if(paddsub_0 == 1'b0) begin
                a_in = ina_ext + ind_ext;
            end else begin
                a_in = ina_ext - ind_ext;
            end
        end else begin
            a_in = ina;
        end
    end

    assign a0[62:0] = {{36{a_in[26]}},a_in[26:0]};
    assign b0[62:0] = {{27{inb[35]}},inb[35:0]};

    assign mult_out0 = a0 * b0 ;

    // pipeline reg
    always @(posedge P_CLK or posedge P_RESET or negedge grstn)
    begin
        if (!grstn) begin
            out0_reg_async <= 0;
        end else if (P_RESET == 1'b1)
        begin
            out0_reg_async <= 0;
        end
        else if (P_CE == 1'b1)
        begin
            out0_reg_async <= mult_out0;
        end
    end

    always @(posedge P_CLK or negedge grstn)
    begin
        if (!grstn) begin
            out0_reg_sync <= 0;
        end else if (P_RESET == 1'b1)
        begin
            out0_reg_sync <= 0;
        end
        else if (P_CE == 1'b1)
        begin
            out0_reg_sync <= mult_out0;
        end
    end

    always @(mult_out0 or out0_reg)
    begin
        if (PREG_CLK == "BYPASS")
        begin
            out0 = mult_out0;
        end else
        begin
            out0 = out0_reg;
        end
    end

    // output reg
    always @(posedge O_CLK or posedge O_RESET or negedge grstn)
    begin
        if (!grstn) begin
            out_reg_async <= 0;
        end else if (O_RESET == 1'b1)
        begin
            out_reg_async <= 0;
        end
        else if (O_CE == 1'b1)
        begin
            out_reg_async <= out0;
        end
    end

    always @(posedge O_CLK or negedge grstn)
    begin
        if (!grstn) begin
            out_reg_sync <= 0;
        end else if (O_RESET == 1'b1)
        begin
            out_reg_sync <= 0;
        end
        else if (O_CE == 1'b1)
        begin
            out_reg_sync <= out0;
        end
    end

    always @(out0 or out_reg)
    begin
        if (OREG_CLK == "BYPASS")
        begin
            d_out = out0;
        end else
        begin
            d_out = out_reg;
        end
    end

    assign DOUT = d_out[62:0];

endmodule


//////Hardcore models
//Iologic
//IDDR
module IDDR(Q0, Q1, D, CLK);

input D;
input CLK;
output Q0;
output Q1;

parameter Q0_INIT = 1'b0;
parameter Q1_INIT = 1'b0;

wire gsrt = GSR.GSRO;

reg q0_oreg, q1_oreg,q0_reg, q1_reg;
reg q0_ireg, q1_ireg;

initial begin
	q0_reg = Q0_INIT;
	q1_reg = Q1_INIT;
    q0_oreg = Q0_INIT;
	q1_oreg = Q1_INIT;
	q0_ireg = Q0_INIT;
	q1_ireg = Q1_INIT;
end

assign Q0 = q0_reg;
assign Q1 = q1_reg;

always @(gsrt) begin
	if(!gsrt) begin
		assign q0_reg = Q0_INIT;
		assign q1_reg = Q1_INIT;
        assign q0_oreg = Q0_INIT;
		assign q1_oreg = Q1_INIT;
		assign q0_ireg = Q0_INIT;
		assign q1_ireg = Q1_INIT;
	end
	else begin
		deassign q0_reg;
		deassign q1_reg;
        deassign q0_oreg;
		deassign q1_oreg;
		deassign q0_ireg;
		deassign q1_ireg;
	end
end

always @(posedge CLK) begin
	q0_ireg <= D;
	q0_oreg <= q0_ireg;
    q0_reg <= q0_oreg;
    q1_oreg <= q1_ireg;
	q1_reg <= q1_oreg;
end

always @(negedge CLK) begin
	q1_ireg <= D;
end

endmodule //IDDR (ddr input)

//IDDRC
module IDDRC(Q0, Q1, D, CLK, CLEAR);

input D;
input CLK;
input CLEAR;
output Q0;
output Q1;

parameter Q0_INIT = 1'b0;
parameter Q1_INIT = 1'b0;

wire gsrt = GSR.GSRO;

reg q0_oreg, q1_oreg,q0_reg, q1_reg;
reg q0_ireg, q1_ireg;

initial begin
	q0_reg = Q0_INIT;
	q1_reg = Q1_INIT;
    q0_oreg = Q0_INIT;
	q1_oreg = Q1_INIT;
	q0_ireg = Q0_INIT;
	q1_ireg = Q1_INIT;
end

assign Q0 = q0_reg;
assign Q1 = q1_reg;

always @(gsrt or CLEAR) begin
	if(!gsrt) begin
		assign q0_reg = Q0_INIT;
		assign q1_reg = Q1_INIT;
        assign q0_oreg = Q0_INIT;
		assign q1_oreg = Q1_INIT;
		assign q0_ireg = Q0_INIT;
		assign q1_ireg = Q1_INIT;
	end
	else if (CLEAR) begin
		assign q0_reg = 1'b0;
		assign q1_reg = 1'b0;
        assign q0_oreg = 1'b0;
		assign q1_oreg = 1'b0;
		assign q0_ireg = 1'b0;
		assign q1_ireg = 1'b0;
	end
	else begin
		deassign q0_reg;
		deassign q1_reg;
        deassign q0_oreg;
		deassign q1_oreg;
		deassign q0_ireg;
		deassign q1_ireg;
	end
end

always @(posedge CLK) begin
	q0_ireg <= D;
	q0_oreg <= q0_ireg;
    q0_reg <= q0_oreg;
    q1_oreg <= q1_ireg;
	q1_reg <= q1_oreg;
end

always @(negedge CLK) begin
	q1_ireg <= D;
end

endmodule //IDDRC (ddr input, asynchronous clear)


//IDDR_MEM
module IDDR_MEM (Q0, Q1, D, WADDR, RADDR, PCLK, ICLK, RESET);

input D, ICLK, PCLK;
input [2:0] WADDR;
input [2:0] RADDR;
input RESET;
output  Q0,Q1;
wire grstn;
wire lrstn;
//synthesis translate_off
assign grstn = GSR.GSRO;
assign lrstn = (~RESET);

reg d0_reg;
reg [7:0] d0_mem;
reg [7:0] d1_mem;
reg [1:0] q_data;

always @(posedge ICLK or negedge grstn or negedge lrstn)
begin
    if (!grstn)
        d0_reg <= 0;
    else if (!lrstn)
        d0_reg <= 0;
    else 
        d0_reg <= D;
end

always @(negedge ICLK or negedge grstn or negedge lrstn)
begin
    if (!grstn)
        d0_mem <= 0;
    else if (!lrstn)
        d0_mem <= 0;
    else 
        d0_mem[WADDR] <= d0_reg;
end

always @(negedge ICLK or negedge grstn or negedge lrstn)
begin
    if (!grstn)
        d1_mem <= 0;
    else if (!lrstn)
        d1_mem <= 0;
    else 
        d1_mem[WADDR] <= D;
end

always @(posedge PCLK or negedge grstn or negedge lrstn)
begin
    if (!grstn)
        q_data <= 0;
    else if (!lrstn)
        q_data <= 0;
    else
        q_data <= {d1_mem[RADDR], d0_mem[RADDR]};
end

assign {Q1,Q0}= q_data;
endmodule // IDDR_MEM (ddr input with memory)


//ODDR
module ODDR (Q0, Q1, D0, D1, TX, CLK);

input D0;
input D1;
input TX;
input CLK;
output Q0;
output Q1;

parameter TXCLK_POL = 1'b0; //1'b0:Rising edge output; 1'b1:Falling edge output
parameter INIT = 1'b0;

reg d0_reg_0,d0_reg_1,d0_reg_2;
reg d1_reg_0,d1_reg_1,d1_reg_2;
reg tx_reg_0,tx_reg_1,tx_reg_p,tx_reg_n;
wire gsrt = GSR.GSRO;

initial begin
    d0_reg_0 = 1'b0;
    d0_reg_1 = 1'b0;
    d0_reg_2 = 1'b0;
    d1_reg_0 = 1'b0;
    d1_reg_1 = 1'b0;
    d1_reg_2 = 1'b0;
    tx_reg_0 = 1'b0;
    tx_reg_1 = 1'b0;
    tx_reg_p = 1'b0;
    tx_reg_n = 1'b0;
end

always @(gsrt) begin
	if(!gsrt) begin
        assign d1_reg_2 = INIT;
		assign d0_reg_2 = INIT;
        assign d1_reg_1 = INIT;
		assign d0_reg_1 = INIT;
        assign d1_reg_0 = INIT;
		assign d0_reg_0 = INIT;
        assign tx_reg_0 = INIT;
        assign tx_reg_1 = INIT;
        assign tx_reg_p = INIT;
        assign tx_reg_n = INIT;
	end
	else begin
		deassign d1_reg_2;
		deassign d0_reg_2;
        deassign d1_reg_1;
		deassign d0_reg_1;
        deassign d1_reg_0;
		deassign d0_reg_0;
		deassign tx_reg_0;
		deassign tx_reg_1;
		deassign tx_reg_p;
		deassign tx_reg_n;
	end
end

always @(posedge CLK) begin
	d0_reg_0 <= D0;
	d1_reg_0 <= D1;
    d0_reg_1 <= d0_reg_0;
	d1_reg_1 <= d1_reg_0;
    tx_reg_0 <= TX;
    tx_reg_1 <= tx_reg_0;
end

always @(posedge CLK) begin
	d1_reg_2 <= d1_reg_1;
    tx_reg_p <= tx_reg_n;
end

always @(negedge CLK) begin
	d0_reg_2 <= d0_reg_1;
    tx_reg_n <= tx_reg_1;
end

assign Q0 = (CLK)? d0_reg_2 : d1_reg_2;
assign Q1 = (TXCLK_POL == 1'b0) ? tx_reg_p : tx_reg_n;

endmodule // ODDR (ddr output)

//ODDRC
module ODDRC (Q0, Q1, D0, D1, TX, CLK, CLEAR);

input D0, D1, TX, CLK, CLEAR;
output Q0,Q1;

parameter TXCLK_POL = 1'b0; //1'b0:Rising edge output; 1'b1:Falling edge output
parameter INIT = 1'b0;

wire gsrt = GSR.GSRO;

reg d0_reg_0,d0_reg_1,d0_reg_2;
reg d1_reg_0,d1_reg_1,d1_reg_2;
reg tx_reg_0,tx_reg_1,tx_reg_p,tx_reg_n;

initial begin
    d0_reg_0 = 1'b0;
    d0_reg_1 = 1'b0;
    d0_reg_2 = 1'b0;
    d1_reg_0 = 1'b0;
    d1_reg_1 = 1'b0;
    d1_reg_2 = 1'b0;
    tx_reg_0 = 1'b0;
    tx_reg_1 = 1'b0;
    tx_reg_p = 1'b0;
    tx_reg_n = 1'b0;
end

always @(gsrt or CLEAR) begin
	if(!gsrt) begin
		assign d1_reg_2 = INIT;
		assign d0_reg_2 = INIT;
        assign d1_reg_1 = INIT;
		assign d0_reg_1 = INIT;
        assign d1_reg_0 = INIT;
		assign d0_reg_0 = INIT;
	    assign tx_reg_0 = INIT;
        assign tx_reg_1 = INIT;
        assign tx_reg_p = INIT;
        assign tx_reg_n = INIT;
    end
	else if(CLEAR) begin
		assign d1_reg_2 = 1'b0;
		assign d0_reg_2 = 1'b0;
        assign d1_reg_1 = 1'b0;
		assign d0_reg_1 = 1'b0;
        assign d1_reg_0 = 1'b0;
		assign d0_reg_0 = 1'b0;
        assign tx_reg_0 = 1'b0;
        assign tx_reg_1 = 1'b0;
        assign tx_reg_p = 1'b0;
        assign tx_reg_n = 1'b0;
	end
	else begin
		deassign d1_reg_2;
		deassign d0_reg_2;
        deassign d1_reg_1;
		deassign d0_reg_1;
        deassign d1_reg_0;
		deassign d0_reg_0;
        deassign tx_reg_0;
		deassign tx_reg_1;
		deassign tx_reg_p;
		deassign tx_reg_n;
	end
end

always @(posedge CLK) begin
	d0_reg_0 <= D0;
	d1_reg_0 <= D1;
    d0_reg_1 <= d0_reg_0;
	d1_reg_1 <= d1_reg_0;
    tx_reg_0 <= TX;
    tx_reg_1 <= tx_reg_0;
end

always @(posedge CLK) begin
	d1_reg_2 <= d1_reg_1;
    tx_reg_p <= tx_reg_n;
end

always @(negedge CLK) begin
	d0_reg_2 <= d0_reg_1;
    tx_reg_n <= tx_reg_1;    
end

assign Q0 = (CLK)? d0_reg_2 : d1_reg_2;
assign Q1 = (TXCLK_POL == 1'b0) ? tx_reg_p : tx_reg_n;

endmodule // ODDRC (ddr output with asynchronous clear)

//ODDR_MEM
module ODDR_MEM (Q0, Q1, D0, D1, TX, PCLK, TCLK, RESET);

parameter TCLK_SOURCE = "DQSW"; //"DQSW","DQSW270"
parameter TXCLK_POL = 1'b0; //1'b0:Rising edge output; 1'b1:Falling edge output

input D0, D1;
input TX, PCLK, TCLK, RESET;
output  Q0, Q1;

//synthesis translate_off
reg [1:0] d_reg_0;
reg tx_reg_1;
reg [1:0] d_reg_1;
reg tx_reg_2;
reg d_reg_p;
reg tx_reg_p,tx_reg_n;
reg d_reg_n;
wire tclk_sig;
wire grstn;
wire lrstn;

assign grstn = GSR.GSRO;
assign lrstn = (~RESET);
assign tclk_sig = (TCLK_SOURCE == "DQSW") ? TCLK : ~TCLK;

always @(posedge PCLK or negedge grstn or negedge lrstn)
begin
    if (!grstn) begin
        d_reg_0 <= 2'b0;
        tx_reg_1 <= 1'b0;
    end
    else if (!lrstn) begin
        d_reg_0 <= 0;
        tx_reg_1 <= 0;
    end
    else begin
      	d_reg_0 <= {D1, D0};
      	tx_reg_1 <= TX;
    end
end

always @(posedge tclk_sig or negedge grstn or negedge lrstn)
begin
    if (!grstn) begin
        d_reg_1 <= 2'b0;
        tx_reg_2 <= 1'b0;
    end
    else if (!lrstn) begin
        d_reg_1 <= 2'b0;
        tx_reg_2 <= 1'b0;
    end
    else begin
        d_reg_1 <= d_reg_0;
        tx_reg_2 <= tx_reg_1;
    end
end

always @(posedge tclk_sig or negedge grstn or negedge lrstn)
begin
    if (!grstn) begin
        d_reg_p <= 1'b0;
        tx_reg_p <= 1'b0;
    end
    else if (!lrstn) begin
        d_reg_p <= 1'b0;
        tx_reg_p <= 1'b0;
    end
    else begin
        d_reg_p <= d_reg_1[1];
        tx_reg_p <= tx_reg_n;
    end
end

always @(negedge tclk_sig or negedge grstn or negedge lrstn)
begin
    if (!grstn) begin
        d_reg_n <= 1'b0;
        tx_reg_n <= 1'b0;
    end
    else if (!lrstn) begin
        d_reg_n <= 1'b0;
        tx_reg_n <= 1'b0;
    end
    else begin
        d_reg_n <= d_reg_1[0];
        tx_reg_n <= tx_reg_2;
    end
end

assign Q0 = tclk_sig ? d_reg_n : d_reg_p;
assign Q1 = (TXCLK_POL == 1'b0) ? tx_reg_p : tx_reg_n;

//synthesis translate_on

endmodule // ODDR_MEM (ddr output with memory)

//IDES4
module IDES4 (Q0, Q1, Q2, Q3, D, CALIB, PCLK, FCLK, RESET);

input D, FCLK, PCLK, CALIB,RESET;
output Q0, Q1, Q2, Q3;

reg d0_reg;
reg d1_reg;
reg [3:0] D_data;
reg [3:0] data;
reg [3:0] Q_data;
reg d0_reg0,d0_reg1,d0_reg2,d0_reg3,d0_reg4;
reg d1_reg0,d1_reg1,d1_reg2,d1_reg3,d1_reg4;

reg reset_delay;
reg dcnt0;
reg calib_0,calib_1,calib_2;
reg calib_state;
reg d_up,d_sel;

wire grstn,lrstn;
wire calib_state_en,dcnt_en;
wire dsel_en,d_up_en;

assign grstn = GSR.GSRO;
assign lrstn = (~RESET);

initial begin
    d_sel = 1'b0;
    calib_state = 1'b0;
    dcnt0 = 1'b0;
end

always @(posedge FCLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        reset_delay <= 0;
    end else if(!lrstn) begin
        reset_delay <= 0;
    end else begin
        reset_delay <= 1;
    end
end

always @(posedge FCLK or negedge reset_delay) begin
    if(!reset_delay) begin
        calib_0 <= 0;
        calib_1 <= 0;
        calib_2 <= 0;
    end else begin
        calib_0 <= CALIB;
        calib_1 <= calib_0;
        calib_2 <= calib_1;
    end
end

assign dsel_en = calib_1 & ~calib_2;

always @(posedge FCLK or negedge reset_delay) begin
    if(!reset_delay) begin
        d_sel <= 0;
    end else begin
        if(dsel_en) begin
            d_sel <= ~d_sel;
        end else begin
            d_sel <= d_sel;
        end
    end
end

assign calib_state_en = dsel_en;

always @(posedge FCLK or negedge reset_delay) begin
    if(!reset_delay) begin
        calib_state <= 0;
    end else if(calib_state_en) begin
        calib_state <= ~calib_state;
    end else begin
        calib_state <= calib_state;
    end
end

assign dcnt_en = ~(calib_state & calib_state_en);

always @(posedge FCLK or negedge reset_delay) begin
    if(!reset_delay) begin
        dcnt0 <= 0;
    end else if(dcnt_en) begin
    	dcnt0 <= ~dcnt0;
    end else begin
        dcnt0 <= dcnt0;
    end
end

assign d_up_en = ~dcnt0;

always @(posedge FCLK or negedge reset_delay) begin
    if(!reset_delay) begin
        d_up <= 0;
    end else if(d_up_en) begin
        d_up <= 1;
    end else begin
        d_up <= 0;
    end
end

always @(posedge FCLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        d0_reg <= 0;
    end else if (!lrstn) begin
        d0_reg <= 0;
    end else begin
        d0_reg <= D;
    end
end

always @(negedge FCLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        d1_reg <= 0;
    end else if (!lrstn) begin
        d1_reg <= 0;
    end else begin
        d1_reg <= D;
    end
end

always @(posedge FCLK or negedge grstn  or negedge lrstn) begin
    if (!grstn) begin
        d0_reg0 <= 1'b0;
        d0_reg1 <= 1'b0;
        d0_reg2 <= 1'b0;
	    d0_reg3 <= 1'b0;
	    d0_reg4 <= 1'b0;
        d1_reg0 <= 1'b0;
        d1_reg1 <= 1'b0;
        d1_reg2 <= 1'b0;
	    d1_reg3 <= 1'b0;
	    d1_reg4 <= 1'b0;
    end else if(!lrstn) begin
        d0_reg0 <= 1'b0;
        d0_reg1 <= 1'b0;
        d0_reg2 <= 1'b0;
	    d0_reg3 <= 1'b0;
	    d0_reg4 <= 1'b0;
        d1_reg0 <= 1'b0;
        d1_reg1 <= 1'b0;
        d1_reg2 <= 1'b0;
	    d1_reg3 <= 1'b0;
	    d1_reg4 <= 1'b0;
    end else begin
        d0_reg0 <= d0_reg;
        d0_reg1 <= d0_reg0;
        d0_reg2 <= d0_reg1;
	    d0_reg3 <= d0_reg2;
	    d0_reg4 <= d0_reg3;
        d1_reg0 <= d1_reg;
        d1_reg1 <= d1_reg0;
        d1_reg2 <= d1_reg1;
	    d1_reg3 <= d1_reg2;
	    d1_reg4 <= d1_reg3;
    end
end

always @(d_sel or d0_reg0 or d0_reg1 or d0_reg2 or d0_reg3 or d0_reg4 or d1_reg0 or d1_reg2 or d1_reg3 or d1_reg4) begin
    if(d_sel) begin
        D_data[3] <= d0_reg2;
        D_data[2] <= d1_reg3;
        D_data[1] <= d0_reg3;
        D_data[0] <= d1_reg4;
    end else begin
        D_data[3] <= d1_reg3;
        D_data[2] <= d0_reg3;
        D_data[1] <= d1_reg4;
        D_data[0] <= d0_reg4;
    end
end

always @(posedge FCLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        data <= 0;
    end else if (!lrstn) begin
        data <= 0;
    end else if (d_up) begin
        data <= D_data;
    end else begin
        data <= data;
    end
end

always @(posedge PCLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        Q_data <= 0;
    end else if (!lrstn) begin
        Q_data <= 0;
    end else begin
        Q_data <= data;
    end
end

assign {Q3, Q2, Q1, Q0} = Q_data;

endmodule // IDES4 (4 to 1 deserializer)


//IDES8
module IDES8 (Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, D, CALIB, PCLK, FCLK, RESET);

input D, FCLK, PCLK, CALIB,RESET;
output Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7;

reg d0_reg;
reg d1_reg;
reg [7:0] D_data;
reg [7:0] data;
reg [7:0] Q_data;
reg d0_reg0,d0_reg1,d0_reg2,d0_reg3,d0_reg4;
reg d1_reg0,d1_reg1,d1_reg2,d1_reg3,d1_reg4;

reg reset_delay;
reg dcnt0,dcnt1;
reg calib_0,calib_1,calib_2;
reg calib_state;
reg d_up,d_sel;

wire grstn,lrstn;
wire calib_state_en,dcnt_en;
wire dsel_en,d_up_en;

assign grstn = GSR.GSRO;
assign lrstn = (~RESET);

initial begin
    d_sel = 1'b0;
    calib_state = 1'b0;
    dcnt0 = 1'b0;
    dcnt1 = 1'b0;
end

always @(posedge FCLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        reset_delay <= 0;
    end else if(!lrstn) begin
        reset_delay <= 0;
    end else begin
        reset_delay <= 1;
    end
end

always @(posedge FCLK or negedge reset_delay) begin
    if(!reset_delay) begin
        calib_0 <= 0;
        calib_1 <= 0;
        calib_2 <= 0;
    end else begin
        calib_0 <= CALIB;
        calib_1 <= calib_0;
        calib_2 <= calib_1;
    end
end

assign dsel_en = calib_1 & ~calib_2;

always @(posedge FCLK or negedge reset_delay) begin
    if(!reset_delay) begin
        d_sel <= 0;
    end else begin
        if(dsel_en) begin
            d_sel <= ~d_sel;
        end else begin
            d_sel <= d_sel;
        end
    end
end

assign calib_state_en = dsel_en;

always @(posedge FCLK or negedge reset_delay) begin
    if(!reset_delay) begin
        calib_state <= 0;
    end else if(calib_state_en) begin
        calib_state <= ~calib_state;
    end else begin
        calib_state <= calib_state;
    end
end

assign dcnt_en = ~(calib_state & calib_state_en);

always @(posedge FCLK or negedge reset_delay) begin
    if(!reset_delay) begin
        dcnt0 <= 0;
        dcnt1 <= 0;
    end else if(dcnt_en) begin
        dcnt0 <= ~dcnt0;
        dcnt1 <= dcnt0 ^ dcnt1;
    end else begin
        dcnt0 <= dcnt0;
        dcnt1 <= dcnt1;
    end
end

assign d_up_en = dcnt0 & (~dcnt1);

always @(posedge FCLK or negedge reset_delay) begin
    if(!reset_delay) begin
        d_up <= 0;
    end else if(d_up_en) begin
        d_up <= 1;
    end else begin
        d_up <= 0;
    end
end

always @(posedge FCLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        d0_reg <= 0;
    end else if (!lrstn) begin
        d0_reg <= 0;
    end else begin
        d0_reg <= D;
    end
end

always @(negedge FCLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        d1_reg <= 0;
    end else if (!lrstn) begin
        d1_reg <= 0;
    end else begin
        d1_reg <= D;
    end
end

always @(posedge FCLK or negedge grstn  or negedge lrstn) begin
    if (!grstn) begin
        d0_reg0 <= 1'b0;
        d0_reg1 <= 1'b0;
        d0_reg2 <= 1'b0;
        d0_reg3 <= 1'b0;
        d0_reg4 <= 1'b0;
        d1_reg0 <= 1'b0;
        d1_reg1 <= 1'b0;
        d1_reg2 <= 1'b0;
        d1_reg3 <= 1'b0;
        d1_reg4 <= 1'b0;
    end else if(!lrstn) begin
        d0_reg0 <= 1'b0;
        d0_reg1 <= 1'b0;
        d0_reg2 <= 1'b0;
        d0_reg3 <= 1'b0;
        d0_reg4 <= 1'b0;
        d1_reg0 <= 1'b0;
        d1_reg1 <= 1'b0;
        d1_reg2 <= 1'b0;
        d1_reg3 <= 1'b0;
        d1_reg4 <= 1'b0;
    end else begin
        d0_reg0 <= d0_reg;
        d0_reg1 <= d0_reg0;
        d0_reg2 <= d0_reg1;
        d0_reg3 <= d0_reg2;
        d0_reg4 <= d0_reg3;
        d1_reg0 <= d1_reg;
        d1_reg1 <= d1_reg0;
        d1_reg2 <= d1_reg1;
        d1_reg3 <= d1_reg2;
        d1_reg4 <= d1_reg3;
    end
end

always @(d_sel or d0_reg0 or d0_reg1 or d0_reg2 or d0_reg3 or d0_reg4 or d1_reg0 or d1_reg1 or d1_reg2 or d1_reg3 or d1_reg4) begin
    if(d_sel) begin
        D_data[7] <= d0_reg0;
        D_data[6] <= d1_reg1;
        D_data[5] <= d0_reg1;
        D_data[4] <= d1_reg2;
        D_data[3] <= d0_reg2;
        D_data[2] <= d1_reg3;
        D_data[1] <= d0_reg3;
        D_data[0] <= d1_reg4;
    end else begin
        D_data[7] <= d1_reg1;
        D_data[6] <= d0_reg1;
        D_data[5] <= d1_reg2;
        D_data[4] <= d0_reg2;
        D_data[3] <= d1_reg3;
        D_data[2] <= d0_reg3;
        D_data[1] <= d1_reg4;
        D_data[0] <= d0_reg4;
    end
end

always @(posedge FCLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        data <= 0;
    end else if (!lrstn) begin
        data <= 0;
    end else if (d_up) begin
        data <= D_data;
    end else begin
        data <= data;
    end
end

always @(posedge PCLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        Q_data <= 0;
    end else if (!lrstn) begin
        Q_data <= 0;
    end else begin
        Q_data <= data;
    end
end

assign {Q7, Q6, Q5, Q4, Q3, Q2, Q1, Q0} = Q_data;

endmodule // IDES8 (8 to 1 deserializer)

//IDES10
module IDES10 (Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, D, CALIB, PCLK, FCLK, RESET);

input D, FCLK, PCLK, CALIB,RESET;
output Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9;

reg d0_reg;
reg d1_reg;
reg [9:0] D_data;
reg [9:0] data;
reg [9:0] Q_data;
reg d0_reg0,d0_reg1,d0_reg2,d0_reg3,d0_reg4,d0_reg5;
reg d1_reg0,d1_reg1,d1_reg2,d1_reg3,d1_reg4,d1_reg5;

reg reset_delay;
reg dcnt0,dcnt1,dcnt2;
reg calib_0,calib_1,calib_2;
reg calib_state;
reg d_up,d_sel;

wire grstn,lrstn;
wire calib_state_en,dcnt_en;
wire dsel_en,d_up_en;

assign grstn = GSR.GSRO;
assign lrstn = (~RESET);

initial begin
    d_sel = 1'b0;
    calib_state = 1'b0;
    dcnt0 = 1'b0;
    dcnt1 = 1'b0;
    dcnt2 = 1'b0;
end

always @(posedge FCLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        reset_delay <= 0;
    end else if(!lrstn) begin
        reset_delay <= 0;
    end else begin
        reset_delay <= 1;
    end
end

always @(posedge FCLK or negedge reset_delay) begin
    if(!reset_delay) begin
        calib_0 <= 0;
        calib_1 <= 0;
        calib_2 <= 0;
    end else begin
        calib_0 <= CALIB;
        calib_1 <= calib_0;
        calib_2 <= calib_1;
    end
end

assign dsel_en = calib_1 & ~calib_2;

always @(posedge FCLK or negedge reset_delay) begin
    if(!reset_delay) begin
        d_sel <= 0;
    end else begin
        if(dsel_en) begin
            d_sel <= ~d_sel;
        end else begin
            d_sel <= d_sel;
        end
    end
end

assign calib_state_en = dsel_en;

always @(posedge FCLK or negedge reset_delay) begin
    if(!reset_delay) begin
        calib_state <= 0;
    end else if(calib_state_en) begin
        calib_state <= ~calib_state;
    end else begin
        calib_state <= calib_state;
    end
end

assign dcnt_en = ~(calib_state & calib_state_en);



always @(posedge FCLK or negedge reset_delay) begin
    if(!reset_delay) begin
        dcnt0 <= 0;
        dcnt1 <= 0;
        dcnt2 <= 0;
    end else if(dcnt_en) begin
      	dcnt0 <= ~(dcnt0 | ((~dcnt0) & (~dcnt1) & dcnt2));
        dcnt1 <= ~((~(dcnt1 ^ dcnt0)) | ((~dcnt0) & (~dcnt1) & dcnt2));
        dcnt2 <= ~((~(dcnt2 ^ (dcnt1 & dcnt0))) | ((~dcnt0) & (~dcnt1) & dcnt2));
    end else begin
        dcnt0 <= dcnt0;
        dcnt1 <= dcnt1;
        dcnt2 <= dcnt2;
    end
end


assign d_up_en = dcnt1 & (~dcnt0);

always @(posedge FCLK or negedge reset_delay) begin
    if(!reset_delay) begin
        d_up <= 0;
    end else if(d_up_en) begin
        d_up <= 1;
    end else begin
        d_up <= 0;
    end
end

always @(posedge FCLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        d0_reg <= 0;
    end else if (!lrstn) begin
        d0_reg <= 0;
    end else begin
        d0_reg <= D;
    end
end

always @(negedge FCLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        d1_reg <= 0;
    end else if (!lrstn) begin
        d1_reg <= 0;
    end else begin
        d1_reg <= D;
    end
end

always @(posedge FCLK or negedge grstn  or negedge lrstn) begin
    if (!grstn) begin
        d0_reg0 <= 1'b0;
        d0_reg1 <= 1'b0;
        d0_reg2 <= 1'b0;
        d0_reg3 <= 1'b0;
        d0_reg4 <= 1'b0;
        d0_reg5 <= 1'b0;
        d1_reg0 <= 1'b0;
        d1_reg1 <= 1'b0;
        d1_reg2 <= 1'b0;
        d1_reg3 <= 1'b0;
        d1_reg4 <= 1'b0;
        d1_reg5 <= 1'b0;
    end else if(!lrstn) begin
        d0_reg0 <= 1'b0;
        d0_reg1 <= 1'b0;
        d0_reg2 <= 1'b0;
        d0_reg3 <= 1'b0;
        d0_reg4 <= 1'b0;
        d0_reg5 <= 1'b0;
        d1_reg0 <= 1'b0;
        d1_reg1 <= 1'b0;
        d1_reg2 <= 1'b0;
        d1_reg3 <= 1'b0;
        d1_reg4 <= 1'b0;
        d1_reg5 <= 1'b0;
    end else begin
        d0_reg0 <= d0_reg;
        d0_reg1 <= d0_reg0;
        d0_reg2 <= d0_reg1;
        d0_reg3 <= d0_reg2;
        d0_reg4 <= d0_reg3;
        d0_reg5 <= d0_reg4;
        d1_reg0 <= d1_reg;
        d1_reg1 <= d1_reg0;
        d1_reg2 <= d1_reg1;
        d1_reg3 <= d1_reg2;
        d1_reg4 <= d1_reg3;
        d1_reg5 <= d1_reg4;
    end
end

always @(d_sel or d0_reg0 or d0_reg1 or d0_reg2 or d0_reg3 or d0_reg4 or d0_reg5 or d1_reg0 or d1_reg1 or d1_reg2 or d1_reg3 or d1_reg4 or d1_reg5) begin
    if(d_sel) begin
        D_data[9] <= d0_reg0;
        D_data[8] <= d1_reg1;
        D_data[7] <= d0_reg1;
        D_data[6] <= d1_reg2;
        D_data[5] <= d0_reg2;
        D_data[4] <= d1_reg3;
        D_data[3] <= d0_reg3;
        D_data[2] <= d1_reg4;
        D_data[1] <= d0_reg4;
        D_data[0] <= d1_reg5;
    end else begin
        D_data[9] <= d1_reg1;
        D_data[8] <= d0_reg1;
        D_data[7] <= d1_reg2;
        D_data[6] <= d0_reg2;
        D_data[5] <= d1_reg3;
        D_data[4] <= d0_reg3;
        D_data[3] <= d1_reg4;
        D_data[2] <= d0_reg4;
        D_data[1] <= d1_reg5;
        D_data[0] <= d0_reg5;
    end
end

always @(posedge FCLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        data <= 0;
    end else if (!lrstn) begin
        data <= 0;
    end else if (d_up) begin
        data <= D_data;
    end else begin
        data <= data;
    end
end

always @(posedge PCLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        Q_data <= 0;
    end else if (!lrstn) begin
        Q_data <= 0;
    end else begin
        Q_data <= data;
    end
end

assign {Q9, Q8, Q7, Q6, Q5, Q4, Q3, Q2, Q1, Q0} = Q_data;

endmodule // IDES10 (10 to 1 deserializer)

//IDES16
module IDES16 (Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15, D, CALIB, PCLK, FCLK, RESET);

input D, FCLK, PCLK, CALIB,RESET;
output Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15;

reg d0_reg;
reg d1_reg;
reg [15:0] D_data;
reg [15:0] data;
reg [15:0] Q_data;
reg d0_reg0,d0_reg1,d0_reg2,d0_reg3,d0_reg4,d0_reg5,d0_reg6,d0_reg7,d0_reg8;
reg d1_reg0,d1_reg1,d1_reg2,d1_reg3,d1_reg4,d1_reg5,d1_reg6,d1_reg7,d1_reg8;

reg reset_delay;
reg dcnt0,dcnt1,dcnt2;
reg calib_0,calib_1,calib_2;
reg calib_state;
reg d_up,d_sel;

wire grstn,lrstn;
wire calib_state_en,dcnt_en;
wire dsel_en,d_up_en;

assign grstn = GSR.GSRO;
assign lrstn = (~RESET);

initial begin
    d_sel = 1'b0;
    calib_state = 1'b0;
    dcnt0 = 1'b0;
    dcnt1 = 1'b0;
    dcnt2 = 1'b0;
end

always @(posedge FCLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        reset_delay <= 0;
    end else if(!lrstn) begin
        reset_delay <= 0;
    end else begin
        reset_delay <= 1;
    end
end

always @(posedge FCLK or negedge reset_delay) begin
    if(!reset_delay) begin
        calib_0 <= 0;
        calib_1 <= 0;
        calib_2 <= 0;
    end else begin
        calib_0 <= CALIB;
        calib_1 <= calib_0;
        calib_2 <= calib_1;
    end
end

assign dsel_en = calib_1 & ~calib_2;

always @(posedge FCLK or negedge reset_delay) begin
    if(!reset_delay) begin
        d_sel <= 0;
    end else begin
        if(dsel_en) begin
            d_sel <= ~d_sel;
        end else begin
            d_sel <= d_sel;
        end
    end
end

assign calib_state_en = dsel_en;

always @(posedge FCLK or negedge reset_delay) begin
    if(!reset_delay) begin
        calib_state <= 0;
    end else if(calib_state_en) begin
        calib_state <= ~calib_state;
    end else begin
        calib_state <= calib_state;
    end
end

assign dcnt_en = ~(calib_state & calib_state_en);

always @(posedge FCLK or negedge reset_delay) begin
    if(!reset_delay) begin
        dcnt0 <= 0;
        dcnt1 <= 0;
        dcnt2 <= 0;
    end else if(dcnt_en) begin
        dcnt0 <= ~dcnt0;
        dcnt1 <= dcnt0 ^ dcnt1;
        dcnt2 <= (dcnt0 & dcnt1) ^ dcnt2;
    end else begin
        dcnt0 <= dcnt0;
        dcnt1 <= dcnt1;
        dcnt2 <= dcnt2;
    end
end

assign d_up_en = (~dcnt2) & dcnt1 & dcnt0;

always @(posedge FCLK or negedge reset_delay) begin
    if(!reset_delay) begin
        d_up <= 0;
    end else if(d_up_en) begin
        d_up <= 1;
    end else begin
        d_up <= 0;
    end
end

always @(posedge FCLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        d0_reg <= 0;
    end else if (!lrstn) begin
        d0_reg <= 0;
    end else begin
        d0_reg <= D;
    end
end

always @(negedge FCLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        d1_reg <= 0;
    end else if (!lrstn) begin
        d1_reg <= 0;
    end else begin
        d1_reg <= D;
    end
end

always @(posedge FCLK or negedge grstn  or negedge lrstn) begin
    if (!grstn) begin
        d0_reg0 <= 1'b0;
        d0_reg1 <= 1'b0;
        d0_reg2 <= 1'b0;
        d0_reg3 <= 1'b0;
        d0_reg4 <= 1'b0;
        d0_reg5 <= 1'b0;
        d0_reg6 <= 1'b0;
        d0_reg7 <= 1'b0;
        d0_reg8 <= 1'b0;
        d1_reg0 <= 1'b0;
        d1_reg1 <= 1'b0;
        d1_reg2 <= 1'b0;
        d1_reg3 <= 1'b0;
        d1_reg4 <= 1'b0;
        d1_reg5 <= 1'b0;
        d1_reg6 <= 1'b0;
        d1_reg7 <= 1'b0;
        d1_reg8 <= 1'b0;
    end else if(!lrstn) begin
        d0_reg0 <= 1'b0;
        d0_reg1 <= 1'b0;
        d0_reg2 <= 1'b0;
        d0_reg3 <= 1'b0;
        d0_reg4 <= 1'b0;
        d0_reg5 <= 1'b0;
        d0_reg6 <= 1'b0;
        d0_reg7 <= 1'b0;
        d0_reg8 <= 1'b0;
        d1_reg0 <= 1'b0;
        d1_reg1 <= 1'b0;
        d1_reg2 <= 1'b0;
        d1_reg3 <= 1'b0;
        d1_reg4 <= 1'b0;
        d1_reg5 <= 1'b0;
        d1_reg6 <= 1'b0;
        d1_reg7 <= 1'b0;
        d1_reg8 <= 1'b0;
    end else begin
        d0_reg0 <= d0_reg;
        d0_reg1 <= d0_reg0;
        d0_reg2 <= d0_reg1;
        d0_reg3 <= d0_reg2;
        d0_reg4 <= d0_reg3;
        d0_reg5 <= d0_reg4;
        d0_reg6 <= d0_reg5;
        d0_reg7 <= d0_reg6;
        d0_reg8 <= d0_reg7;
        d1_reg0 <= d1_reg;
        d1_reg1 <= d1_reg0;
        d1_reg2 <= d1_reg1;
        d1_reg3 <= d1_reg2;
        d1_reg4 <= d1_reg3;
        d1_reg5 <= d1_reg4;
        d1_reg6 <= d1_reg5;
        d1_reg7 <= d1_reg6;
        d1_reg8 <= d1_reg7;
    end
end

always @(d_sel or d0_reg0 or d0_reg1 or d0_reg2 or d0_reg3 or d0_reg4 or d0_reg5 or d0_reg6 or d0_reg7 or d0_reg8 or d1_reg0 or d1_reg1 or d1_reg2 or d1_reg3 or d1_reg4 or d1_reg5 or d1_reg6 or d1_reg7 or d1_reg8) begin
    if(d_sel) begin
        D_data[15] <= d0_reg0;
        D_data[14] <= d1_reg1;
        D_data[13] <= d0_reg1;
        D_data[12] <= d1_reg2;
        D_data[11] <= d0_reg2;
        D_data[10] <= d1_reg3;
        D_data[9] <= d0_reg3;
        D_data[8] <= d1_reg4;
        D_data[7] <= d0_reg4;
        D_data[6] <= d1_reg5;
        D_data[5] <= d0_reg5;
        D_data[4] <= d1_reg6;
        D_data[3] <= d0_reg6;
        D_data[2] <= d1_reg7;
        D_data[1] <= d0_reg7;
        D_data[0] <= d1_reg8;
    end else begin
        D_data[15] <= d1_reg1;
        D_data[14] <= d0_reg1;
        D_data[13] <= d1_reg2;
        D_data[12] <= d0_reg2;
        D_data[11] <= d1_reg3;
        D_data[10] <= d0_reg3;
        D_data[9] <= d1_reg4;
        D_data[8] <= d0_reg4;
        D_data[7] <= d1_reg5;
        D_data[6] <= d0_reg5;
        D_data[5] <= d1_reg6;
        D_data[4] <= d0_reg6;
        D_data[3] <= d1_reg7;
        D_data[2] <= d0_reg7;
        D_data[1] <= d1_reg8;
        D_data[0] <= d0_reg8;
    end
end


always @(posedge FCLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        data <= 0;
    end else if (!lrstn) begin
        data <= 0;
    end else if (d_up) begin
        data <= D_data;
    end else begin
        data <= data;
    end
end

always @(posedge PCLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        Q_data <= 0;
    end else if (!lrstn) begin
        Q_data <= 0;
    end else begin
        Q_data <= data;
    end
end

assign {Q15, Q14, Q13, Q12, Q11, Q10, Q9, Q8, Q7, Q6, Q5, Q4, Q3, Q2, Q1, Q0} = Q_data;

endmodule // IDES16 (16 to 1 deserializer)

//IDES4_MEM
module IDES4_MEM (Q0, Q1, Q2, Q3, D, WADDR, RADDR, CALIB, PCLK, FCLK, ICLK, RESET);

input PCLK, D, ICLK, FCLK, RESET, CALIB;
input [2:0] WADDR;
input [2:0] RADDR;
output Q0,Q1,Q2,Q3;
wire grstn,lrstn;
reg d0_reg;
reg [3:0] D_data;
reg [3:0] Q_data;
reg [3:0] data;
reg data_en1,data_en;
reg data_sel,calib_state;
reg reset_delay;
wire calib_rising_p;
reg calib_0,calib_1,calib_2;
wire dcnt_en;
reg d0_reg1,d0_reg2,d0_reg3,d0_reg4,d1_reg1,d1_reg2,d1_reg3,d1_reg4;
reg [7:0] d0_mem;
reg [7:0] d1_mem;

initial begin
    calib_state = 1'b0;
    data_en1 = 1'b0;
    data_en = 1'b0;
    data_sel = 1'b0;
end

assign grstn = GSR.GSRO;
assign lrstn = (~RESET);

always @(posedge ICLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        d0_reg <= 0;
    end else if (!lrstn) begin
        d0_reg <= 0;
    end else begin
        d0_reg <= D;
    end
end

always @(negedge ICLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        d0_mem <= 0;
    end else if (!lrstn) begin
        d0_mem <= 0;
    end else begin
        d0_mem[WADDR] <= d0_reg;
    end
end

always @(negedge ICLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        d1_mem <= 0;
    end else if (!lrstn) begin
        d1_mem <= 0;
    end else begin
        d1_mem[WADDR] <= D;
    end
end

always @(posedge FCLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        d0_reg1 <= 1'b0;
		d0_reg2 <= 1'b0;
		d0_reg3 <= 1'b0;
		d0_reg4 <= 1'b0;
        d1_reg1 <= 1'b0;
		d1_reg2 <= 1'b0;
		d1_reg3 <= 1'b0;
		d1_reg4 <= 1'b0;
    end else if (!lrstn) begin
        d0_reg1 <= 1'b0;
		d0_reg2 <= 1'b0;
		d0_reg3 <= 1'b0;
		d0_reg4 <= 1'b0;
        d1_reg1 <= 1'b0;
		d1_reg2 <= 1'b0;
		d1_reg3 <= 1'b0;
		d1_reg4 <= 1'b0;
    end else begin
        d0_reg1 <= d0_mem[RADDR];
		d0_reg2 <= d0_reg1;
		d0_reg3 <= d0_reg2;
		d0_reg4 <= d0_reg3;
        d1_reg1 <= d1_mem[RADDR];
		d1_reg2 <= d1_reg1;
		d1_reg3 <= d1_reg2;
		d1_reg4 <= d1_reg3;
    end
end

always @(posedge FCLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        reset_delay <= 0;
    end else if (!lrstn) begin
        reset_delay <= 0;
    end else begin
        reset_delay <= 1;
    end
end

always @(posedge FCLK or negedge reset_delay) begin
    if (!reset_delay) begin
        calib_0 <= 0;
        calib_1 <= 0;
        calib_2 <= 0;
    end else begin
        calib_0 <= CALIB;
        calib_1 <= calib_0;
        calib_2 <= calib_1;
    end
end



assign calib_rising_p =  calib_1 & (~calib_2);
assign dcnt_en = ~(calib_rising_p & calib_state);

always @(posedge FCLK or negedge reset_delay) begin
    if (!reset_delay) begin
        calib_state <= 0;
        data_en1 <= 0;
        data_en  <= 0;
        data_sel <= 0;
    end else begin
        data_en <= ~data_en1;
        if (calib_rising_p) begin
            calib_state <= ~calib_state;
            data_sel <= ~data_sel;
        end else begin
            calib_state <= calib_state;
            data_sel <= data_sel;
        end
        
        if (dcnt_en) begin
            data_en1 <= ~data_en1;
        end else begin
            data_en1 <= data_en1;
        end
    end
end


always @(data_sel or d0_mem[RADDR] or d1_mem[RADDR]or d0_reg1 or d0_reg2 or d0_reg3 or d0_reg4 or d1_reg1 or d1_reg2 or d1_reg3 or d1_reg4) begin
    if(data_sel) begin
        D_data[3] = d0_reg2;
        D_data[2] = d1_reg3;
        D_data[1] = d0_reg3;
        D_data[0] = d1_reg4;
    end else begin
        D_data[3] = d1_reg3;
        D_data[2] = d0_reg3;
        D_data[1] = d1_reg4;
        D_data[0] = d0_reg4;
    end
end

always @(posedge FCLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        data <= 0;
    end else if (!lrstn) begin
        data <= 0;
    end else if (data_en) begin
        data <= D_data;
    end
end

always @(posedge PCLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        Q_data <= 0;
    end else if (!lrstn) begin
        Q_data <= 0;
    end else begin
        Q_data <= data;
    end
end

assign {Q3,Q2,Q1,Q0} = Q_data;

endmodule //IDES4_MEM (4 to 1 deserializer with memory)

module IVIDEO (Q0, Q1, Q2, Q3, Q4, Q5, Q6, D, CALIB, PCLK, FCLK, RESET);

input D, FCLK, PCLK, CALIB, RESET;
output Q0, Q1, Q2, Q3, Q4, Q5, Q6;
wire grstn;
wire lrstn; 
assign grstn = GSR.GSRO;
assign lrstn = (~RESET);

reg d0_reg;
reg d1_reg;
reg [6:0] D_data;
reg [6:0] data;
reg [6:0] Q_data;
reg data_sel;
reg reset_delay;
wire calib_rising_p;
reg [2:0] calib_data;
wire dcnt_en,dsel_en;
reg d0_reg0,d0_reg1,d0_reg2,d1_reg0,d1_reg1,d1_reg2,d1_reg3;
reg d0_ireg,d0_ireg0,d1_ireg,d1_ireg1;
reg data_en,data_en0,data_en1;

always @(negedge FCLK or negedge grstn or negedge lrstn)
begin
    if (!grstn)begin
		d0_ireg <= 0;
		d0_ireg0 <= d0_ireg;
        d0_reg <= d0_ireg0;
    end
    else if (!lrstn)begin
        d0_ireg <= 0;
		d0_ireg0 <= d0_ireg;
        d0_reg <= d0_ireg0;
    end
    else begin
		d0_ireg <= D;
		d0_ireg0 <= d0_ireg;
        d0_reg <= d0_ireg0;
    end
end

always @(posedge FCLK or negedge grstn or negedge lrstn)
begin
    if (!grstn)begin
		d1_ireg <= 0;
		d1_ireg1 <= d1_ireg;
        d1_reg <= d1_ireg1;
    end
    else if (!lrstn)begin
		d1_ireg <= 0;
		d1_ireg1 <= d1_ireg;
        d1_reg <= d1_ireg1;
    end
    else begin
        d1_ireg <= D;
		d1_ireg1 <= d1_ireg;
        d1_reg <= d1_ireg1;
    end
end

always @(posedge FCLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        reset_delay <= 1'b0;
    end else if (!lrstn) begin
        reset_delay <= 1'b0;
    end else begin
        reset_delay <= 1'b1;
    end
end

always @(posedge FCLK or negedge reset_delay) begin
    if (!reset_delay) begin
        calib_data <= 3'b0;
    end else begin
        calib_data <= {calib_data[1:0], CALIB};
    end
end

assign calib_rising_p =  ~(calib_data[1] && (~calib_data[2]));
assign dcnt_en = calib_rising_p;
assign dsel_en = ~(~(data_sel & data_en1 & (~data_en0) & calib_rising_p)) & (~(data_en0 & data_en1 & (~data_sel)));

always @(posedge FCLK or negedge reset_delay) begin
    if (!reset_delay) begin
        data_en1 <= 1'b0;
        data_en0 <= 1'b0;
        data_en  <= 1'b0;
        data_sel <= 1'b0;
    end
    else begin
		data_en <= ~(~(data_en0 & (~data_en1) & (~data_sel))&(~((~data_en0) & (~data_en1) & data_sel)));
        if (dsel_en) begin
            data_sel <= ~data_sel;
        end else begin
            data_sel <= data_sel;
        end
        
        if (dcnt_en) begin
            data_en0 <= ~data_en0;
        end else  begin
            data_en0 <= data_en0;
        end
                                                                                   
        if (dcnt_en) begin
            data_en1 <= data_en0 ^ data_en1;
        end else begin
            data_en1 <= data_en1;
        end
    end
end

always @(posedge FCLK or negedge grstn  or negedge lrstn) begin
    if (!grstn) begin
        d0_reg0 <= 1'b0;
        d0_reg1 <= 1'b0;
        d0_reg2 <= 1'b0;
        d1_reg0 <= 1'b0;
        d1_reg1 <= 1'b0;
        d1_reg2 <= 1'b0;
        d1_reg3 <= 1'b0;
    end else if(!lrstn) begin
        d0_reg0 <= 1'b0;
        d0_reg1 <= 1'b0;
        d0_reg2 <= 1'b0;
        d1_reg0 <= 1'b0;
        d1_reg1 <= 1'b0;
        d1_reg2 <= 1'b0;
        d1_reg3 <= 1'b0;
    end else begin
		d0_ireg0 <= d0_ireg;
		d0_reg <= d0_ireg0;
        d0_reg0 <= d0_reg;
        d0_reg1 <= d0_reg0;
        d0_reg2 <= d0_reg1;
		d1_ireg1 <= d1_ireg;
		d1_reg <= d1_ireg1;
        d1_reg0 <= d1_reg;
        d1_reg1 <= d1_reg0;
        d1_reg2 <= d1_reg1;
        d1_reg3 <= d1_reg2;
    end
end

always @(data_sel or d0_reg or d0_reg0 or d0_reg1 or d0_reg2 or d1_reg0 or d1_reg1 or d1_reg2 or d1_reg3) begin
    if(data_sel) begin
        D_data[6] <= d0_reg;
        D_data[5] <= d1_reg0;
        D_data[4] <= d0_reg0;
        D_data[3] <= d1_reg1;
        D_data[2] <= d0_reg1;
        D_data[1] <= d1_reg2;
        D_data[0] <= d0_reg2;
    end else begin
        D_data[6] <= d1_reg0;
        D_data[5] <= d0_reg0;
        D_data[4] <= d1_reg1;
        D_data[3] <= d0_reg1;
        D_data[2] <= d1_reg2;
        D_data[1] <= d0_reg2;
        D_data[0] <= d1_reg3;
    end
end

always @(posedge FCLK or negedge grstn or negedge lrstn)
begin
    if (!grstn)begin
        data <= 0;
    end
    else if (!lrstn)begin
        data <= 0;
    end
    else if (data_en)begin
        data <= D_data;
    end
end

always @(posedge PCLK or negedge grstn or negedge lrstn)
begin
    if (!grstn)begin
        Q_data <= 0;
    end
    else if (!lrstn)begin
        Q_data <= 0;
    end
    else begin
        Q_data <= data;
    end
end

assign {Q6, Q5, Q4, Q3, Q2, Q1, Q0} = Q_data;

endmodule //IVIDEO (7 to 1 deserializer)

//IDES8_MEM
module IDES8_MEM (Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, D, WADDR, RADDR, CALIB, PCLK, FCLK, ICLK, RESET);

input PCLK, D, ICLK, FCLK, RESET, CALIB;
input [2:0] WADDR;
input [2:0] RADDR;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
wire grstn,lrstn;
reg d0_reg;
reg [7:0] D_data;
reg [7:0] Q_data;
reg [7:0] data;
reg data_en0,data_en1,data_en;
reg data_sel,calib_state;
reg reset_delay;
wire calib_rising_p;
reg calib_0,calib_1,calib_2;
wire dcnt_en;
reg d0_reg1,d0_reg2,d0_reg3,d0_reg4,d1_reg1,d1_reg2,d1_reg3,d1_reg4;
reg [7:0] d0_mem;
reg [7:0] d1_mem;

initial begin
    calib_state = 1'b0;
    data_en0 = 1'b0;
    data_en1 = 1'b0;
    data_en = 1'b0;
    data_sel = 1'b0;
end

assign grstn = GSR.GSRO;
assign lrstn = (~RESET);

always @(posedge ICLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        d0_reg <= 0;
    end else if (!lrstn) begin
        d0_reg <= 0;
    end else begin
        d0_reg <= D;
    end
end

always @(negedge ICLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        d0_mem <= 0;
    end else if (!lrstn) begin
        d0_mem <= 0;
    end else begin
        d0_mem[WADDR] <= d0_reg;
    end
end

always @(negedge ICLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        d1_mem <= 0;
    end else if (!lrstn) begin
        d1_mem <= 0;
    end else begin
        d1_mem[WADDR] <= D;
    end
end

always @(posedge FCLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        d0_reg1 <= 1'b0;
        d0_reg2 <= 1'b0;
        d0_reg3 <= 1'b0;
	    d0_reg4 <= 1'b0;
        d1_reg1 <= 1'b0;
        d1_reg2 <= 1'b0;
        d1_reg3 <= 1'b0;
	    d1_reg4 <= 1'b0;
    end else if (!lrstn) begin
        d0_reg1 <= 1'b0;
        d0_reg2 <= 1'b0;
        d0_reg3 <= 1'b0;
	    d0_reg4 <= 1'b0;
        d1_reg1 <= 1'b0;
        d1_reg2 <= 1'b0;
        d1_reg3 <= 1'b0;
	    d1_reg4 <= 1'b0;
    end else begin
        d0_reg1 <= d0_mem[RADDR];
        d0_reg2 <= d0_reg1;
        d0_reg3 <= d0_reg2;
	    d0_reg4 <= d0_reg3;
        d1_reg1 <= d1_mem[RADDR];
        d1_reg2 <= d1_reg1;
        d1_reg3 <= d1_reg2;
	    d1_reg4 <= d1_reg3;
    end
end

always @(posedge FCLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        reset_delay <= 0;
    end else if (!lrstn) begin
        reset_delay <= 0;
    end else begin
        reset_delay <= 1;
    end
end

always @(posedge FCLK or negedge reset_delay) begin
    if (!reset_delay) begin
        calib_0 <= 0;
        calib_1 <= 0;
        calib_2 <= 0;
    end else begin
        calib_0 <= CALIB;
        calib_1 <= calib_0;
        calib_2 <= calib_1;
    end
end


assign calib_rising_p =  calib_1 & (~calib_2);
assign dcnt_en = ~(calib_rising_p & calib_state);


always @(posedge FCLK or negedge reset_delay) begin
    if (!reset_delay) begin
        calib_state <= 0;
        data_en0 <= 0;
        data_en1 <= 0;
        data_en  <= 0;
        data_sel <= 0;
    end else begin
        data_en <= ~data_en1 & data_en0;
        if (calib_rising_p) begin
            calib_state <= ~calib_state;
            data_sel <= ~data_sel;
        end else begin
            calib_state <= calib_state;
            data_sel <= data_sel;
        end
        
        if (dcnt_en) begin
            data_en0 <= ~data_en0;
        end else begin
            data_en0 <= data_en0;
        end

        if (dcnt_en) begin
            data_en1 <= data_en0 ^ data_en1;
        end else begin
            data_en1 <= data_en1;
        end
    end
end

always @(data_sel or d0_mem[RADDR] or d1_mem[RADDR]or d0_reg1 or d0_reg2 or d0_reg3 or d0_reg4 or d1_reg1 or d1_reg2 or d1_reg3 or d1_reg4) begin
    if(data_sel) begin
        D_data[7] <= d0_mem[RADDR];
        D_data[6] <= d1_reg1;
        D_data[5] <= d0_reg1;
        D_data[4] <= d1_reg2;
        D_data[3] <= d0_reg2;
        D_data[2] <= d1_reg3;
        D_data[1] <= d0_reg3;
        D_data[0] <= d1_reg4;
    end else begin
        D_data[7] <= d1_reg1;
        D_data[6] <= d0_reg1;
        D_data[5] <= d1_reg2;
        D_data[4] <= d0_reg2;
        D_data[3] <= d1_reg3;
        D_data[2] <= d0_reg3;
        D_data[1] <= d1_reg4;
        D_data[0] <= d0_reg4;
    end
end

always @(posedge FCLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        data <= 0;
    end else if (!lrstn) begin
        data <= 0;
    end else if (data_en) begin
        data <= D_data;
    end
end

always @(posedge PCLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        Q_data <= 0;
    end else if (!lrstn) begin
        Q_data <= 0;
    end else begin
        Q_data <= data;
    end
end

assign {Q7,Q6,Q5,Q4,Q3,Q2,Q1,Q0} = Q_data;

endmodule //IDES8_MEM (8 to 1 deserializer with memory)

//IDES4
module IDES14 (Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, D, CALIB, PCLK, FCLK, RESET);

input D, FCLK, PCLK, CALIB,RESET;
output Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13;

reg d0_reg;
reg d1_reg;
reg [13:0] D_data;
reg [13:0] data;
reg [13:0] Q_data;
reg d0_reg0,d0_reg1,d0_reg2,d0_reg3,d0_reg4,d0_reg5,d0_reg6,d0_reg7;
reg d1_reg0,d1_reg1,d1_reg2,d1_reg3,d1_reg4,d1_reg5,d1_reg6,d1_reg7;

reg reset_delay;
reg dcnt0,dcnt1,dcnt2;
reg calib_0,calib_1,calib_2;
reg calib_state;
reg d_up,d_sel;

wire grstn,lrstn;
wire calib_state_en,dcnt_en;
wire dsel_en,d_up_en;

assign grstn = GSR.GSRO;
assign lrstn = (~RESET);

initial begin
    d_sel = 1'b0;
    calib_state = 1'b0;
    dcnt0 = 1'b0;
    dcnt1 = 1'b0;
    dcnt2 = 1'b0;
end

always @(posedge FCLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        reset_delay <= 0;
    end else if(!lrstn) begin
        reset_delay <= 0;
    end else begin
        reset_delay <= 1;
    end
end

always @(posedge FCLK or negedge reset_delay) begin
    if(!reset_delay) begin
        calib_0 <= 0;
        calib_1 <= 0;
        calib_2 <= 0;
    end else begin
        calib_0 <= CALIB;
        calib_1 <= calib_0;
        calib_2 <= calib_1;
    end
end

assign dsel_en = calib_1 & ~calib_2;

always @(posedge FCLK or negedge reset_delay) begin
    if(!reset_delay) begin
        d_sel <= 0;
    end else begin
        if(dsel_en) begin
            d_sel <= ~d_sel;
        end else begin
            d_sel <= d_sel;
        end
    end
end

assign calib_state_en = dsel_en;

always @(posedge FCLK or negedge reset_delay) begin
    if(!reset_delay) begin
        calib_state <= 0;
    end else if(calib_state_en) begin
        calib_state <= ~calib_state;
    end else begin
        calib_state <= calib_state;
    end
end

assign dcnt_en = ~(calib_state & calib_state_en);

always @(posedge FCLK or negedge reset_delay) begin
    if(!reset_delay) begin
        dcnt0 <= 0;
        dcnt1 <= 0;
        dcnt2 <= 0;
    end else if(dcnt_en) begin
        dcnt0 <= ~(dcnt0 | ((~dcnt0)&dcnt1&dcnt2));
        dcnt1 <= ~((~(dcnt1 ^ dcnt0)) | ((~dcnt0)&dcnt1&dcnt2));
        dcnt2 <= ~((~(dcnt2 ^ (dcnt1 & dcnt0))) | ((~dcnt0)&dcnt1&dcnt2));
    end else begin
        dcnt0 <= dcnt0;
        dcnt1 <= dcnt1;
        dcnt2 <= dcnt2;
    end
end

assign d_up_en = ((~dcnt2) & dcnt1) & dcnt0;

always @(posedge FCLK or negedge reset_delay) begin
    if(!reset_delay) begin
        d_up <= 0;
    end else if(d_up_en) begin
        d_up <= 1;
    end else begin
        d_up <= 0;
    end
end

always @(posedge FCLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        d0_reg <= 0;
    end else if (!lrstn) begin
        d0_reg <= 0;
    end else begin
        d0_reg <= D;
    end
end

always @(negedge FCLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        d1_reg <= 0;
    end else if (!lrstn) begin
        d1_reg <= 0;
    end else begin
        d1_reg <= D;
    end
end

always @(posedge FCLK or negedge grstn  or negedge lrstn) begin
    if (!grstn) begin
        d0_reg0 <= 1'b0;
        d0_reg1 <= 1'b0;
        d0_reg2 <= 1'b0;
        d0_reg3 <= 1'b0;
        d0_reg4 <= 1'b0;
        d0_reg5 <= 1'b0;
        d0_reg6 <= 1'b0;
        d0_reg7 <= 1'b0;
        d1_reg0 <= 1'b0;
        d1_reg1 <= 1'b0;
        d1_reg2 <= 1'b0;
        d1_reg3 <= 1'b0;
        d1_reg4 <= 1'b0;
        d1_reg5 <= 1'b0;
        d1_reg6 <= 1'b0;
        d1_reg7 <= 1'b0;
    end else if(!lrstn) begin
        d0_reg0 <= 1'b0;
        d0_reg1 <= 1'b0;
        d0_reg2 <= 1'b0;
        d0_reg3 <= 1'b0;
        d0_reg4 <= 1'b0;
        d0_reg5 <= 1'b0;
        d0_reg6 <= 1'b0;
        d0_reg7 <= 1'b0;
        d1_reg0 <= 1'b0;
        d1_reg1 <= 1'b0;
        d1_reg2 <= 1'b0;
        d1_reg3 <= 1'b0;
        d1_reg4 <= 1'b0;
        d1_reg5 <= 1'b0;
        d1_reg6 <= 1'b0;
        d1_reg7 <= 1'b0;
    end else begin
        d0_reg0 <= d0_reg;
        d0_reg1 <= d0_reg0;
        d0_reg2 <= d0_reg1;
        d0_reg3 <= d0_reg2;
        d0_reg4 <= d0_reg3;
        d0_reg5 <= d0_reg4;
        d0_reg6 <= d0_reg5;
        d0_reg7 <= d0_reg6;
        d1_reg0 <= d1_reg;
        d1_reg1 <= d1_reg0;
        d1_reg2 <= d1_reg1;
        d1_reg3 <= d1_reg2;
        d1_reg4 <= d1_reg3;
        d1_reg5 <= d1_reg4;
        d1_reg6 <= d1_reg5;
        d1_reg7 <= d1_reg6;
    end
end

always @(d_sel or d0_reg0 or d0_reg1 or d0_reg2 or d0_reg3 or d0_reg4 or d0_reg5 or d0_reg6 or d0_reg7 or d1_reg0 or d1_reg1 or d1_reg2 or d1_reg3 or d1_reg4 or d1_reg5 or d1_reg6 or d1_reg7) begin
    if(d_sel) begin
        D_data[13] <= d0_reg0;
        D_data[12] <= d1_reg1;
        D_data[11] <= d0_reg1;
        D_data[10] <= d1_reg2;
        D_data[9] <= d0_reg2;
        D_data[8] <= d1_reg3;
        D_data[7] <= d0_reg3;
        D_data[6] <= d1_reg4;
        D_data[5] <= d0_reg4;
        D_data[4] <= d1_reg5;
        D_data[3] <= d0_reg5;
        D_data[2] <= d1_reg6;
        D_data[1] <= d0_reg6;
        D_data[0] <= d1_reg7;
    end else begin
        D_data[13] <= d1_reg1;
        D_data[12] <= d0_reg1;
        D_data[11] <= d1_reg2;
        D_data[10] <= d0_reg2;
        D_data[9] <= d1_reg3;
        D_data[8] <= d0_reg3;
        D_data[7] <= d1_reg4;
        D_data[6] <= d0_reg4;
        D_data[5] <= d1_reg5;
        D_data[4] <= d0_reg5;
        D_data[3] <= d1_reg6;
        D_data[2] <= d0_reg6;
        D_data[1] <= d1_reg7;
        D_data[0] <= d0_reg7;
    end
end

always @(posedge FCLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        data <= 0;
    end else if (!lrstn) begin
        data <= 0;
    end else if (d_up) begin
        data <= D_data;
    end else begin
        data <= data;
    end
end

always @(posedge PCLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        Q_data <= 0;
    end else if (!lrstn) begin
        Q_data <= 0;
    end else begin
        Q_data <= data;
    end
end

assign {Q13, Q12, Q11, Q10, Q9, Q8, Q7, Q6, Q5, Q4, Q3, Q2, Q1, Q0} = Q_data;

endmodule // IDES14 (14 to 1 deserializer)


//IDES32
module IDES32 (Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15, Q16, Q17, Q18, Q19, Q20, Q21, Q22, Q23, Q24, Q25, Q26, Q27, Q28, Q29, Q30, Q31, D, CALIB, PCLK, FCLK, RESET);

input D, FCLK, PCLK, CALIB,RESET;
output Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15, Q16, Q17, Q18, Q19, Q20, Q21, Q22, Q23, Q24, Q25, Q26, Q27, Q28, Q29, Q30, Q31;

reg d0_reg;
reg d1_reg;
reg [31:0] D_data;
reg [31:0] data;
reg [31:0] Q_data;
reg d0_reg0,d0_reg1,d0_reg2,d0_reg3,d0_reg4,d0_reg5,d0_reg6,d0_reg7,d0_reg8,d0_reg9,d0_reg10,d0_reg11,d0_reg12,d0_reg13,d0_reg14,d0_reg15,d0_reg16;
reg d1_reg0,d1_reg1,d1_reg2,d1_reg3,d1_reg4,d1_reg5,d1_reg6,d1_reg7,d1_reg8,d1_reg9,d1_reg10,d1_reg11,d1_reg12,d1_reg13,d1_reg14,d1_reg15,d1_reg16;

reg reset_delay;
reg dcnt0,dcnt1,dcnt2;
reg calib_0,calib_1,calib_2;
reg calib_state;
reg d_up,d_sel;

wire grstn,lrstn;
wire calib_state_en,dcnt_en;
wire dsel_en,d_up_en;

assign grstn = GSR.GSRO;
assign lrstn = (~RESET);

initial begin
    d_sel = 1'b0;
    calib_state = 1'b0;
    dcnt0 = 1'b0;
    dcnt1 = 1'b0;
    dcnt2 = 1'b0;
end

always @(posedge FCLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        reset_delay <= 0;
    end else if(!lrstn) begin
        reset_delay <= 0;
    end else begin
        reset_delay <= 1;
    end
end

always @(posedge FCLK or negedge reset_delay) begin
    if(!reset_delay) begin
        calib_0 <= 0;
        calib_1 <= 0;
        calib_2 <= 0;
    end else begin
        calib_0 <= CALIB;
        calib_1 <= calib_0;
        calib_2 <= calib_1;
    end
end

assign dsel_en = calib_1 & ~calib_2;

always @(posedge FCLK or negedge reset_delay) begin
    if(!reset_delay) begin
        d_sel <= 0;
    end else begin
        if(dsel_en) begin
            d_sel <= ~d_sel;
        end else begin
            d_sel <= d_sel;
        end
    end
end

assign calib_state_en = dsel_en;

always @(posedge FCLK or negedge reset_delay) begin
    if(!reset_delay) begin
        calib_state <= 0;
    end else if(calib_state_en) begin
        calib_state <= ~calib_state;
    end else begin
        calib_state <= calib_state;
    end
end

assign dcnt_en = ~(calib_state & calib_state_en);

always @(posedge FCLK or negedge reset_delay) begin
    if(!reset_delay) begin
        dcnt0 <= 0;
        dcnt1 <= 0;
        dcnt2 <= 0;
    end else if(dcnt_en) begin
        dcnt0 <= ~dcnt0;
        dcnt1 <= dcnt1 ^ dcnt0;
        dcnt2 <= dcnt2 ^ (dcnt1 & dcnt0);
    end else begin
        dcnt0 <= dcnt0;
        dcnt1 <= dcnt1;
        dcnt2 <= dcnt2;
    end
end

assign d_up_en = ((~dcnt2) & dcnt1) & dcnt0;

always @(posedge FCLK or negedge reset_delay) begin
    if(!reset_delay) begin
        d_up <= 0;
    end else if(d_up_en) begin
        d_up <= 1;
    end else begin
        d_up <= 0;
    end
end

always @(posedge FCLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        d0_reg <= 0;
    end else if (!lrstn) begin
        d0_reg <= 0;
    end else begin
        d0_reg <= D;
    end
end

always @(negedge FCLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        d1_reg <= 0;
    end else if (!lrstn) begin
        d1_reg <= 0;
    end else begin
        d1_reg <= D;
    end
end

always @(posedge FCLK or negedge grstn  or negedge lrstn) begin
    if (!grstn) begin
        d0_reg0 <= 1'b0;
        d0_reg1 <= 1'b0;
        d0_reg2 <= 1'b0;
        d0_reg3 <= 1'b0;
        d0_reg4 <= 1'b0;
        d0_reg5 <= 1'b0;
        d0_reg6 <= 1'b0;
        d0_reg7 <= 1'b0;
        d0_reg8 <= 1'b0;
        d0_reg9 <= 1'b0;
        d0_reg10 <= 1'b0;
        d0_reg11 <= 1'b0;
        d0_reg12 <= 1'b0;
        d0_reg13 <= 1'b0;
        d0_reg14 <= 1'b0;
        d0_reg15 <= 1'b0;
        d0_reg16 <= 1'b0;
        d1_reg0 <= 1'b0;
        d1_reg1 <= 1'b0;
        d1_reg2 <= 1'b0;
        d1_reg3 <= 1'b0;
        d1_reg4 <= 1'b0;
        d1_reg5 <= 1'b0;
        d1_reg6 <= 1'b0;
        d1_reg7 <= 1'b0;
        d1_reg8 <= 1'b0;
        d1_reg9 <= 1'b0;
        d1_reg10 <= 1'b0;
        d1_reg11 <= 1'b0;
        d1_reg12 <= 1'b0;
        d1_reg13 <= 1'b0;
        d1_reg14 <= 1'b0;
        d1_reg15 <= 1'b0;
        d1_reg16 <= 1'b0;
    end else if(!lrstn) begin
        d0_reg0 <= 1'b0;
        d0_reg1 <= 1'b0;
        d0_reg2 <= 1'b0;
        d0_reg3 <= 1'b0;
        d0_reg4 <= 1'b0;
        d0_reg5 <= 1'b0;
        d0_reg6 <= 1'b0;
        d0_reg7 <= 1'b0;
        d0_reg8 <= 1'b0;
        d0_reg9 <= 1'b0;
        d0_reg10 <= 1'b0;
        d0_reg11 <= 1'b0;
        d0_reg12 <= 1'b0;
        d0_reg13 <= 1'b0;
        d0_reg14 <= 1'b0;
        d0_reg15 <= 1'b0;
        d0_reg16 <= 1'b0;
        d1_reg0 <= 1'b0;
        d1_reg1 <= 1'b0;
        d1_reg2 <= 1'b0;
        d1_reg3 <= 1'b0;
        d1_reg4 <= 1'b0;
        d1_reg5 <= 1'b0;
        d1_reg6 <= 1'b0;
        d1_reg7 <= 1'b0;
        d1_reg8 <= 1'b0;
        d1_reg9 <= 1'b0;
        d1_reg10 <= 1'b0;
        d1_reg11 <= 1'b0;
        d1_reg12 <= 1'b0;
        d1_reg13 <= 1'b0;
        d1_reg14 <= 1'b0;
        d1_reg15 <= 1'b0;
        d1_reg16 <= 1'b0;
    end else begin
        d0_reg0 <= d0_reg;
        d0_reg1 <= d0_reg0;
        d0_reg2 <= d0_reg1;
        d0_reg3 <= d0_reg2;
        d0_reg4 <= d0_reg3;
        d0_reg5 <= d0_reg4;
        d0_reg6 <= d0_reg5;
        d0_reg7 <= d0_reg6;
        d0_reg8 <= d0_reg7;
        d0_reg9 <= d0_reg8;
        d0_reg10 <= d0_reg9;
        d0_reg11 <= d0_reg10;
        d0_reg12 <= d0_reg11;
        d0_reg13 <= d0_reg12;
        d0_reg14 <= d0_reg13;
        d0_reg15 <= d0_reg14;
        d0_reg16 <= d0_reg15;
        d1_reg0 <= d1_reg;
        d1_reg1 <= d1_reg0;
        d1_reg2 <= d1_reg1;
        d1_reg3 <= d1_reg2;
        d1_reg4 <= d1_reg3;
        d1_reg5 <= d1_reg4;
        d1_reg6 <= d1_reg5;
        d1_reg7 <= d1_reg6;
        d1_reg8 <= d1_reg7;
        d1_reg9 <= d1_reg8;
        d1_reg10 <= d1_reg9;
        d1_reg11 <= d1_reg10;
        d1_reg12 <= d1_reg11;
        d1_reg13 <= d1_reg12;
        d1_reg14 <= d1_reg13;
        d1_reg15 <= d1_reg14;
        d1_reg16 <= d1_reg15;
    end
end

always @(d_sel or d0_reg or d0_reg0 or d0_reg1 or d0_reg2 or d0_reg3 or d0_reg4 or d0_reg5 or d0_reg6 or d0_reg7 or d0_reg8 or d0_reg9 or d0_reg10 or d0_reg11 or d0_reg12 or d0_reg13 or d0_reg14 or d0_reg15 or d0_reg16 or d1_reg0 or d1_reg1 or d1_reg2 or d1_reg3 or d1_reg4 or d1_reg5 or d1_reg6 or d1_reg7 or d1_reg8 or d1_reg9 or d1_reg10 or d1_reg11 or d1_reg12 or d1_reg13 or d1_reg14 or d1_reg15 or d1_reg16) begin
    if(d_sel) begin
        D_data[31] <= d0_reg0;
        D_data[30] <= d1_reg1;
        D_data[29] <= d0_reg1;
        D_data[28] <= d1_reg2;
        D_data[27] <= d0_reg2;
        D_data[26] <= d1_reg3;
        D_data[25] <= d0_reg3;
        D_data[24] <= d1_reg4;
        D_data[23] <= d0_reg4;
        D_data[22] <= d1_reg5;
        D_data[21] <= d0_reg5;
        D_data[20] <= d1_reg6;
        D_data[19] <= d0_reg6;
        D_data[18] <= d1_reg7;
        D_data[17] <= d0_reg7;
        D_data[16] <= d1_reg8;
        D_data[15] <= d0_reg8;
        D_data[14] <= d1_reg9;
        D_data[13] <= d0_reg9;
        D_data[12] <= d1_reg10;
        D_data[11] <= d0_reg10;
        D_data[10] <= d1_reg11;
        D_data[9] <= d0_reg11;
        D_data[8] <= d1_reg12;
        D_data[7] <= d0_reg12;
        D_data[6] <= d1_reg13;
        D_data[5] <= d0_reg13;
        D_data[4] <= d1_reg14;
        D_data[3] <= d0_reg14;
        D_data[2] <= d1_reg15;
        D_data[1] <= d0_reg15;
        D_data[0] <= d1_reg16;
    end else begin
        D_data[31] <= d1_reg1;
        D_data[30] <= d0_reg1;
        D_data[29] <= d1_reg2;
        D_data[28] <= d0_reg2;
        D_data[27] <= d1_reg3;
        D_data[26] <= d0_reg3;
        D_data[25] <= d1_reg4;
        D_data[24] <= d0_reg4;
        D_data[23] <= d1_reg5;
        D_data[22] <= d0_reg5;
        D_data[21] <= d1_reg6;
        D_data[20] <= d0_reg6;
        D_data[19] <= d1_reg7;
        D_data[18] <= d0_reg7;
        D_data[17] <= d1_reg8;
        D_data[16] <= d0_reg8;
        D_data[15] <= d1_reg9;
        D_data[14] <= d0_reg9;
        D_data[13] <= d1_reg10;
        D_data[12] <= d0_reg10;
        D_data[11] <= d1_reg11;
        D_data[10] <= d0_reg11;
        D_data[9] <= d1_reg12;
        D_data[8] <= d0_reg12;
        D_data[7] <= d1_reg13;
        D_data[6] <= d0_reg13;
        D_data[5] <= d1_reg14;
        D_data[4] <= d0_reg14;
        D_data[3] <= d1_reg15;
        D_data[2] <= d0_reg15;
        D_data[1] <= d1_reg16;
        D_data[0] <= d0_reg16;
    end
end

always @(posedge FCLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        data <= 0;
    end else if (!lrstn) begin
        data <= 0;
    end else if (d_up) begin
        data <= D_data;
    end else begin
        data <= data;
    end
end

always @(posedge PCLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        Q_data <= 0;
    end else if (!lrstn) begin
        Q_data <= 0;
    end else begin
        Q_data <= data;
    end
end

assign {Q31, Q30, Q29, Q28, Q27, Q26, Q25, Q24, Q23, Q22, Q21, Q20, Q19, Q18, Q17, Q16, Q15, Q14, Q13, Q12, Q11, Q10, Q9, Q8, Q7, Q6, Q5, Q4, Q3, Q2, Q1, Q0} = Q_data;

endmodule // IDES32 (32 to 1 deserializer)


//OSER4
module OSER4 (Q0, Q1, D0, D1, D2, D3, TX0, TX1, PCLK, FCLK, RESET);

parameter HWL = "false";     //"true"; "false"
parameter TXCLK_POL = 1'b0; //1'b0:Rising edge output; 1'b1:Falling edge output

input D3, D2, D1, D0;
input TX1, TX0;
input PCLK, FCLK, RESET;
output  Q0, Q1;

//synthesis translate_off
reg [3:0] d_reg0,d_reg1,d_reg2;
reg [1:0] tx_reg0,tx_reg1,tx_reg2;
reg rstn_dsel,dsel,d_up0,d_up1;
wire d_en0,d_en1;
reg d_reg_n,tx_reg_n,d_reg_p,tx_reg_p;
wire grstn,lrstn;

initial begin
    dsel = 1'b0;
end

assign grstn = GSR.GSRO;
assign lrstn = (~RESET);

always @(posedge PCLK or negedge grstn or negedge lrstn)
begin
    if (!grstn) begin
        d_reg0 <= 4'b0;
        tx_reg0 <= 2'b0;
    end
    else if (!lrstn) begin
        d_reg0 <= 4'b0;
        tx_reg0 <= 2'b0;
    end
    else begin
        d_reg0 <= {D3,D2,D1,D0};
        tx_reg0 <= {TX1,TX0};
    end
end

always @(posedge FCLK or negedge grstn or negedge lrstn)
begin
    if(!grstn) begin
        rstn_dsel <= 1'b0;
    end
    else if (!lrstn) begin
        rstn_dsel <= 1'b0;        
    end
    else begin
        rstn_dsel <= 1'b1;
    end
end

always @(posedge FCLK or negedge rstn_dsel) 
begin
    if (!rstn_dsel) begin
        dsel <= 1'b0;
    end else begin
        dsel <= ~dsel;
    end
end

assign d_en0 = ~dsel;
assign d_en1 = (HWL == "true") ? (~dsel) : dsel;

always @(posedge FCLK or negedge rstn_dsel)
begin
    if (!rstn_dsel) begin
        d_up0 <= 1'b0;
        d_up1 <= 1'b0;
    end else begin
        if(d_en0)begin
            d_up0 <= 1'b1;
        end else begin
            d_up0 <= 1'b0;
        end

        if(d_en1)begin
            d_up1 <= 1'b1;
        end else begin
            d_up1 <= 1'b0;
        end
    end
end

always @(posedge FCLK or negedge grstn or negedge lrstn)
begin
    if (!grstn) begin
        d_reg1 <= 4'b0;
        tx_reg1 <= 2'b0;
    end else if (!lrstn) begin
        d_reg1 <= 4'b0;
        tx_reg1 <= 2'b0;
    end else begin
        if(d_up0)begin
            d_reg1 <= d_reg0;
            tx_reg1 <= tx_reg0;
        end else begin
            d_reg1 <= d_reg1;
            tx_reg1 <= tx_reg1;
        end
    end
end

always @(posedge FCLK or negedge grstn or negedge lrstn)begin
   if (!grstn) begin
      d_reg2 <= 4'b0;
      tx_reg2 <= 2'b0;
   end else if (!lrstn) begin
      d_reg2 <= 4'b0;
      tx_reg2 <= 2'b0;
   end else begin
        if(d_up1)begin
            d_reg2 <= d_reg1;
            tx_reg2 <= tx_reg1;
        end else begin
            d_reg2[0] <= d_reg2[2];
            d_reg2[2] <= 1'b0;
            d_reg2[1] <= d_reg2[3];
            d_reg2[3] <= 1'b0;
            tx_reg2[0] <= tx_reg2[1];
            tx_reg2[1] <= 1'b0;
        end
    end
end

always @(negedge FCLK or negedge grstn or negedge lrstn)
begin
    if (!grstn) begin
        d_reg_n <= 1'b0;
        tx_reg_n <= 1'b0; 
    end else if (!lrstn) begin
        d_reg_n <= 1'b0;
        tx_reg_n <= 1'b0; 
    end else begin
        d_reg_n <= d_reg2[0];
        tx_reg_n <= tx_reg2[0];
    end
end

always @(posedge FCLK or negedge grstn or negedge lrstn)
begin
    if (!grstn) begin
        d_reg_p <= 1'b0;
    end else if(!lrstn) begin
        d_reg_p <= 1'b0;
    end else begin
        d_reg_p <= d_reg2[1];
    end
end

always @(posedge FCLK or negedge grstn or negedge lrstn)
begin
    if (!grstn) begin
        tx_reg_p <= 1'b0;
    end else if (!lrstn) begin
        tx_reg_p <= 1'b0;
    end else begin
        tx_reg_p <= tx_reg_n;
    end
end

assign Q0 = FCLK ? d_reg_n : d_reg_p;
assign Q1 = (TXCLK_POL == 1'b0) ? tx_reg_p : tx_reg_n;

//synthesis translate_on

endmodule // OSER4 (4 to 1 serializer)


module OSER4_MEM (Q0, Q1, D0, D1, D2, D3, TX0, TX1, PCLK, FCLK, TCLK, RESET);

parameter HWL = "false";     //"true"; "false"
parameter TCLK_SOURCE = "DQSW"; //"DQSW","DQSW270"
parameter TXCLK_POL = 1'b0; //1'b0:Rising edge output; 1'b1:Falling edge output

input D0, D1, D2, D3;
input TX0, TX1;
input PCLK, FCLK, TCLK, RESET;
output  Q0,  Q1;

//synthesis translate_off
reg [3:0] d_reg0,d_reg1,d_reg2;
reg [1:0] tx_reg0,tx_reg1,tx_reg2;
reg rstn_dsel0,dsel0,d_up0;
reg rstn_dsel1,dsel1,d_up1;
wire d_en0,d_en1;
reg d_reg_n,tx_reg_n,d_reg_p,tx_reg_p;
wire tclk_sig;
wire grstn,lrstn;

initial begin
    dsel0 = 1'b0;
    dsel1 = 1'b0;
end

assign grstn = GSR.GSRO;
assign lrstn = (~RESET);
assign tclk_sig = (TCLK_SOURCE == "DQSW") ? TCLK : ~TCLK;

always @(posedge PCLK or negedge grstn or negedge lrstn)
begin
    if (!grstn) begin
        d_reg0 <= 4'b0;
        tx_reg0 <= 2'b0;
    end
    else if (!lrstn) begin
        d_reg0 <= 4'b0;
        tx_reg0 <= 2'b0;
    end
    else begin
        d_reg0 <= {D3,D2,D1,D0};
        tx_reg0 <= {TX1,TX0};
    end
end

always @(posedge FCLK or negedge grstn or negedge lrstn)
begin
    if(!grstn) begin
        rstn_dsel0 <= 1'b0;
    end
    else if (!lrstn) begin
        rstn_dsel0 <= 1'b0;        
    end
    else begin
        rstn_dsel0 <= 1'b1;
    end
end

always @(posedge FCLK or negedge rstn_dsel0) 
begin
    if (!rstn_dsel0) begin
        dsel0 <= 1'b0;
    end else begin
        dsel0 <= ~dsel0;
    end
end

assign d_en0 = ~dsel0;

always @(posedge FCLK or negedge rstn_dsel0) 
begin
    if (!rstn_dsel0) begin
        d_up0 <= 1'b0;
    end else begin
        if(d_en0)begin
            d_up0 <= 1'b1;
        end else begin
            d_up0 <= 1'b0;
        end
    end
end

always @(posedge tclk_sig or negedge grstn or negedge lrstn)
begin
    if(!grstn) begin
        rstn_dsel1 <= 1'b0;
    end
    else if (!lrstn) begin
        rstn_dsel1 <= 1'b0;
    end
    else begin
        rstn_dsel1 <= 1'b1;
    end
end

always @(posedge tclk_sig or negedge rstn_dsel1) 
begin
    if (!rstn_dsel1) begin
        dsel1 <= 1'b0;
    end else begin
        dsel1 <= ~dsel1;
    end
end

assign d_en1 = (HWL == "true") ? ~dsel1 : dsel1;

always @(posedge tclk_sig or negedge rstn_dsel1) 
begin
    if (!rstn_dsel1) begin
        d_up1 <= 1'b0;
    end else begin
        if(d_en1)begin
            d_up1 <= 1'b1;
        end else begin
            d_up1 <= 1'b0;
        end
    end
end

always @(posedge FCLK or negedge grstn or negedge lrstn)
begin 
    if (!grstn) begin
        d_reg1 <= 4'b0;
        tx_reg1 <= 2'b0;
    end else if (!lrstn) begin
        d_reg1 <= 4'b0;
        tx_reg1 <= 2'b0;
    end else begin
        if(d_up0)begin
            d_reg1 <= d_reg0;
            tx_reg1 <= tx_reg0;
        end else begin
            d_reg1 <= d_reg1;
            tx_reg1 <= tx_reg1;
        end
    end
end

always @(posedge tclk_sig or negedge grstn or negedge lrstn)begin
   if (!grstn) begin
      d_reg2 <= 4'b0;
      tx_reg2 <= 2'b0;
   end else if (!lrstn) begin
      d_reg2 <= 4'b0;
      tx_reg2 <= 2'b0;
   end else begin
        if(d_up1)begin
            d_reg2 <= d_reg1;
            tx_reg2 <= tx_reg1;
        end else begin
            d_reg2[0] <= d_reg2[2];
            d_reg2[2] <= 1'b0;
            d_reg2[1] <= d_reg2[3];
            d_reg2[3] <= 1'b0;
            tx_reg2[0] <= tx_reg2[1];
            tx_reg2[1] <= 1'b0;
        end
    end
end

always @(negedge tclk_sig or negedge grstn or negedge lrstn)
begin
    if (!grstn) begin
        d_reg_n <= 1'b0;
        tx_reg_n <= 1'b0; 
    end else if (!lrstn) begin
        d_reg_n <= 1'b0;
        tx_reg_n <= 1'b0; 
    end else begin
        d_reg_n <= d_reg2[0];
        tx_reg_n <= tx_reg2[0];
    end
end

always @(posedge tclk_sig or negedge grstn or negedge lrstn)
begin
    if (!grstn) begin
        d_reg_p <= 1'b0; 
    end else if(!lrstn) begin
        d_reg_p <= 1'b0;   
    end else begin
        d_reg_p <= d_reg2[1];
    end
end

always @(posedge tclk_sig or negedge grstn or negedge lrstn)
begin
    if (!grstn) begin
        tx_reg_p <= 1'b0; 
    end else if (!lrstn) begin
        tx_reg_p <= 1'b0; 
    end else begin
        tx_reg_p <= tx_reg_n;
    end
end

assign Q0 = tclk_sig ? d_reg_n : d_reg_p;
assign Q1 = (TXCLK_POL == 1'b0) ? tx_reg_p : tx_reg_n;

//synthesis translate_on

endmodule // OSER4_MEM (4 to 1 serializer with memory)

//OVIDEO
module OVIDEO (Q, D0, D1, D2, D3, D4, D5, D6, PCLK, FCLK, RESET);

input D6, D5, D4, D3, D2, D1, D0;
input PCLK, FCLK, RESET;
output  Q;

//synthesis translate_off
reg [6:0] d_reg0;
reg rstn_dsel,dcnt0,dcnt1,dsel;
wire dsel_en,dcnt_reset,d_en0,d_en1;
reg d_up0,d_up1;
reg [7:0] d_reg1,d_reg2,d_reg3;
reg d_reg_p,d_reg_n;
wire grstn;
wire lrstn; 

initial begin
    dcnt0 = 1'b0;
    dcnt1 = 1'b0;
    dsel = 1'b0;
end

assign grstn = GSR.GSRO;
assign lrstn = (~RESET);

always @(posedge PCLK or negedge grstn or negedge lrstn)
begin
    if (!grstn) begin
        d_reg0 <= 0;
    end else if (!lrstn) begin
        d_reg0 <= 0;
    end else begin
        d_reg0 <= {D6,D5,D4,D3,D2,D1,D0};
    end
end

always @(posedge FCLK or negedge grstn or negedge lrstn)
begin
    if(!grstn) begin
        rstn_dsel <= 1'b0;
    end
    else if (!lrstn) begin
        rstn_dsel <= 1'b0;        
    end
    else begin
        rstn_dsel <= 1'b1;
    end
end

always @(posedge FCLK or negedge rstn_dsel)
begin
    if (!rstn_dsel) begin
        dcnt0 <= 1'b0;
        dcnt1 <= 1'b0;
    end else begin
        dcnt0 <= ~(dcnt0 | dcnt_reset);
        dcnt1 <= ~((dcnt0 ^~ dcnt1) | dcnt_reset);
    end
end

assign dsel_en = (dsel & dcnt1 & (~dcnt0)) | ((~dsel) & dcnt1 & dcnt0);

always @(posedge FCLK or negedge rstn_dsel)
begin
    if (!rstn_dsel) begin
        dsel <= 1'b0;
    end else begin
        if(dsel_en) begin
            dsel <= ~dsel;
        end else begin
            dsel <= dsel;        
        end
    end
end

assign dcnt_reset = (~dcnt0) & dcnt1 & dsel;
assign d_en0 = ((~dsel) & (~dcnt1) & dcnt0) | (dsel & (~dcnt1) & (~dcnt0));

always @(posedge FCLK or negedge rstn_dsel) 
begin
    if (!rstn_dsel) begin
        d_up0 <= 1'b0;
    end else begin
        if(d_en0)begin
            d_up0 <= 1'b1;
        end else begin
            d_up0 <= 1'b0;
        end
    end
end

assign d_en1 = ((~dsel) & dcnt1 & (~dcnt0)) | (dsel & (~dcnt1) & dcnt0);

always @(posedge FCLK or negedge rstn_dsel) 
begin
    if (!rstn_dsel) begin
        d_up1 <= 1'b0;
    end else begin
        if(d_en1)begin
            d_up1 <= 1'b1;
        end else begin
            d_up1 <= 1'b0;
        end
    end
end

always @(d_reg0 or d_reg2 or dsel)
begin
    if(dsel) begin
        d_reg1[0] <= d_reg2[6];
        d_reg1[1] <= d_reg0[0];
        d_reg1[2] <= d_reg0[1];
        d_reg1[3] <= d_reg0[2];
        d_reg1[4] <= d_reg0[3];
        d_reg1[5] <= d_reg0[4];
        d_reg1[6] <= d_reg0[5];
        d_reg1[7] <= d_reg0[6];
    end else begin
        d_reg1[0] <= d_reg0[0];
        d_reg1[1] <= d_reg0[1];
        d_reg1[2] <= d_reg0[2];
        d_reg1[3] <= d_reg0[3];
        d_reg1[4] <= d_reg0[4];
        d_reg1[5] <= d_reg0[5];
        d_reg1[6] <= d_reg0[6];
        d_reg1[7] <= 1'b0;    
    end
end

always @(posedge FCLK or negedge grstn or negedge lrstn)
begin 
    if (!grstn) begin
        d_reg2 <= 8'b0;
    end else if (!lrstn) begin
        d_reg2 <= 8'b0;
    end else begin
        if(d_up0)begin
            d_reg2 <= d_reg1;
        end else begin
            d_reg2 <= d_reg2;
        end
    end
end

always @(posedge FCLK or negedge grstn or negedge lrstn)
begin 
    if (!grstn) begin
        d_reg3 <= 8'b0;
    end else if (!lrstn) begin
        d_reg3 <= 8'b0;
    end else begin
        if(d_up1)begin
            d_reg3 <= d_reg2;
        end else begin
            d_reg3[0] <= d_reg3[2];
            d_reg3[1] <= d_reg3[3];
            d_reg3[2] <= d_reg3[4];
            d_reg3[3] <= d_reg3[5];
            d_reg3[4] <= d_reg3[6];
            d_reg3[5] <= d_reg3[7];
            d_reg3[6] <= 1'b0;
            d_reg3[7] <= 1'b0;
        end
    end
end

always @(posedge FCLK or negedge grstn or negedge lrstn)
begin
    if (!grstn) begin
        d_reg_p <= 0;
    end else if (!lrstn) begin
        d_reg_p <= 0;
    end else begin
        d_reg_p <= d_reg3[1];
    end
end

always @(negedge FCLK or negedge grstn or negedge lrstn)
begin
    if (!grstn) begin
        d_reg_n <= 0;
    end else if (!lrstn) begin
        d_reg_n <= 0;
    end else begin
        d_reg_n <= d_reg3[0];
    end
end

assign Q = FCLK ? d_reg_n : d_reg_p;
//synthesis translate_on

endmodule // OVIDEO (7 to 1 serializer)

//OSER8
module OSER8 (Q0, Q1, D0, D1, D2, D3, D4, D5, D6, D7, TX0, TX1, TX2, TX3, PCLK, FCLK, RESET);

parameter HWL = "false";     //"true"; "false"
parameter TXCLK_POL = 1'b0; //1'b0:Rising edge output; 1'b1:Falling edge output

input D0, D1, D2, D3, D4, D5, D6, D7;
input TX0, TX1, TX2, TX3;
input PCLK, FCLK, RESET;
output  Q0,  Q1;

//synthesis translate_off
reg [7:0] d_reg0,d_reg1,d_reg2;
reg [3:0] tx_reg0,tx_reg1,tx_reg2;
reg rstn_dsel,dcnt0,dcnt1,d_up0,d_up1;
wire d_en0,d_en1;
reg d_reg_p,d_reg_n,tx_reg_p,tx_reg_n;
wire grstn,lrstn;

initial begin
    dcnt0 = 1'b0;
    dcnt1 = 1'b0;
end

assign grstn = GSR.GSRO;
assign lrstn = (~RESET);

always @(posedge PCLK or negedge grstn or negedge lrstn)
begin
    if (!grstn) begin
        d_reg0 <= 8'b0;
        tx_reg0 <= 4'b0;
    end
    else if (!lrstn) begin
        d_reg0 <= 8'b0;
        tx_reg0 <= 4'b0;
    end
    else begin
        d_reg0 <= {D7,D6,D5,D4,D3,D2,D1,D0};
        tx_reg0 <= {TX3,TX2,TX1,TX0};
    end
end

always @(posedge FCLK or negedge grstn or negedge lrstn)
begin
    if(!grstn) begin
        rstn_dsel <= 1'b0;
    end
    else if (!lrstn) begin
        rstn_dsel <= 1'b0;        
    end
    else begin
        rstn_dsel <= 1'b1;
    end
end

always @(posedge FCLK or negedge rstn_dsel) 
begin
    if (!rstn_dsel) begin
        dcnt0 <= 1'b0;
        dcnt1 <= 1'b0;
    end else begin
        dcnt0 <= ~dcnt0;
        dcnt1 <= dcnt0 ^ dcnt1;
    end
end

assign d_en0 = dcnt0 & (~dcnt1);
assign d_en1 = (HWL == "true") ? (dcnt0 & (~dcnt1)) : ((~dcnt0) & (~dcnt1));
   
always @(posedge FCLK or negedge rstn_dsel) 
begin
    if (!rstn_dsel) begin
        d_up0 <= 1'b0;
    end else begin
        if(d_en0)begin
            d_up0 <= 1'b1;
        end else begin
            d_up0 <= 1'b0;
        end
    end
end

always @(posedge FCLK or negedge rstn_dsel) 
begin
    if (!rstn_dsel) begin
        d_up1 <= 1'b0;
    end else begin
        if(d_en1)begin
            d_up1 <= 1'b1;
        end else begin
            d_up1 <= 1'b0;
        end
    end
end

always @(posedge FCLK or negedge grstn or negedge lrstn)
begin 
    if (!grstn) begin
        d_reg1 <= 8'b0;
        tx_reg1 <= 4'b0;
    end else if (!lrstn) begin
        d_reg1 <= 8'b0;
        tx_reg1 <= 4'b0;
    end else begin
        if(d_up0)begin
            d_reg1 <= d_reg0;
            tx_reg1 <= tx_reg0;
        end else begin
            d_reg1 <= d_reg1;
            tx_reg1 <= tx_reg1;
        end
    end
end

always @(posedge FCLK or negedge grstn or negedge lrstn)
begin 
    if (!grstn) begin
        d_reg2 <= 8'b0;
        tx_reg2 <= 4'b0;
    end else if (!lrstn) begin
        d_reg2 <= 8'b0;
        tx_reg2 <= 4'b0;
    end else begin
        if(d_up1)begin
            d_reg2 <= d_reg1;
            tx_reg2 <= tx_reg1;
        end else begin
            d_reg2[0] <= d_reg2[2];
            d_reg2[1] <= d_reg2[3];
            d_reg2[2] <= d_reg2[4];
            d_reg2[3] <= d_reg2[5];
            d_reg2[4] <= d_reg2[6];
            d_reg2[5] <= d_reg2[7];
            d_reg2[6] <= 1'b0;
            d_reg2[7] <= 1'b0;

            tx_reg2[0] <= tx_reg2[1];
            tx_reg2[1] <= tx_reg2[2];
            tx_reg2[2] <= tx_reg2[3];
            tx_reg2[3] <= 1'b0;
        end
    end
end

always @(posedge FCLK or negedge grstn or negedge lrstn)
begin
    if (!grstn) begin
        d_reg_p <= 1'b0;
        tx_reg_p <= 1'b0;
    end else if (!lrstn) begin
        d_reg_p <= 1'b0;
        tx_reg_p <= 1'b0;
    end else begin
        d_reg_p <= d_reg2[1];
        tx_reg_p <= tx_reg_n;
    end
end

always @(negedge FCLK or negedge grstn or negedge lrstn)
begin
    if (!grstn) begin
        d_reg_n <= 1'b0;
        tx_reg_n <= 1'b0;
    end else if (!lrstn) begin
        d_reg_n <= 1'b0;
        tx_reg_n <= 1'b0;
    end else begin
        d_reg_n <= d_reg2[0];
        tx_reg_n <= tx_reg2[0];
    end
end

assign Q0 = FCLK ? d_reg_n : d_reg_p;
assign Q1 = (TXCLK_POL == 1'b0) ? tx_reg_p : tx_reg_n;

//synthesis translate_on

endmodule // OSER8 (8 to 1 serializer)

//OSER8_MEM
module OSER8_MEM (Q0, Q1, D0, D1, D2, D3, D4, D5, D6, D7, TX0, TX1, TX2, TX3, PCLK, FCLK, TCLK, RESET);

parameter HWL = "false";    //"true"; "false"
parameter TCLK_SOURCE = "DQSW"; //"DQSW","DQSW270"
parameter TXCLK_POL = 1'b0; //1'b0:Rising edge output; 1'b1:Falling edge output

input D0, D1, D2, D3, D4, D5, D6, D7;
input TX0, TX1, TX2, TX3;
input PCLK, FCLK, TCLK, RESET;
output  Q0,  Q1;

//synthesis translate_off
reg [7:0] d_reg0,d_reg1,d_reg2;
reg [3:0] tx_reg0,tx_reg1,tx_reg2;
reg rstn_dsel0,dcnt0,dcnt1,d_up0;
reg rstn_dsel1,hcnt0,hcnt1,d_up1;
wire d_en0,d_en1;
reg d_reg_p,d_reg_n,tx_reg_p,tx_reg_n;
wire tclk_sig;
wire grstn,lrstn;

initial begin
    dcnt0 = 1'b0;
    dcnt1 = 1'b0;
    hcnt0 = 1'b0;
    hcnt1 = 1'b0;
end

assign grstn = GSR.GSRO;
assign lrstn = (~RESET);
assign tclk_sig = (TCLK_SOURCE == "DQSW") ? TCLK : ~TCLK;

always @(posedge PCLK or negedge grstn or negedge lrstn)
begin
    if (!grstn) begin
        d_reg0 <= 8'b0;
        tx_reg0 <= 4'b0;
    end
    else if (!lrstn) begin
        d_reg0 <= 8'b0;
        tx_reg0 <= 4'b0;
    end
    else begin
        d_reg0 <= {D7,D6,D5,D4,D3,D2,D1,D0};
        tx_reg0 <= {TX3,TX2,TX1,TX0};
    end
end

always @(posedge FCLK or negedge grstn or negedge lrstn)
begin
    if(!grstn) begin
        rstn_dsel0 <= 1'b0;
    end
    else if (!lrstn) begin
        rstn_dsel0 <= 1'b0;        
    end
    else begin
        rstn_dsel0 <= 1'b1;
    end
end

always @(posedge FCLK or negedge rstn_dsel0) 
begin
    if (!rstn_dsel0) begin
        dcnt0 <= 1'b0;
        dcnt1 <= 1'b0;
    end else begin
        dcnt0 <= ~dcnt0;
        dcnt1 <= dcnt0 ^ dcnt1;
    end
end

assign d_en0 = dcnt0 & (~dcnt1);

always @(posedge FCLK or negedge rstn_dsel0) 
begin
    if (!rstn_dsel0) begin
        d_up0 <= 1'b0;
    end else begin
        if(d_en0)begin
            d_up0 <= 1'b1;
        end else begin
            d_up0 <= 1'b0;
        end
    end
end

always @(posedge tclk_sig or negedge grstn or negedge lrstn)
begin
    if(!grstn) begin
        rstn_dsel1 <= 1'b0;
    end
    else if (!lrstn) begin
        rstn_dsel1 <= 1'b0;        
    end
    else begin
        rstn_dsel1 <= 1'b1;
    end
end

always @(posedge tclk_sig or negedge rstn_dsel1) 
begin
    if (!rstn_dsel1) begin
        hcnt0 <= 1'b0;
        hcnt1 <= 1'b0;
    end else begin
        hcnt0 <= ~hcnt0;
        hcnt1 <= hcnt0 ^ hcnt1;
    end
end

assign d_en1 = (HWL == "true") ? (hcnt0 & (~hcnt1)) : ((~hcnt0) & (~hcnt1));

always @(posedge tclk_sig or negedge rstn_dsel1) 
begin
    if (!rstn_dsel1) begin
        d_up1 <= 1'b0;
    end else begin
        if(d_en1)begin
            d_up1 <= 1'b1;
        end else begin
            d_up1 <= 1'b0;
        end
    end
end

always @(posedge FCLK or negedge grstn or negedge lrstn)
begin 
    if (!grstn) begin
        d_reg1 <= 8'b0;
        tx_reg1 <= 4'b0;
    end else if (!lrstn) begin
        d_reg1 <= 8'b0;
        tx_reg1 <= 4'b0;
    end else begin
        if(d_up0)begin
            d_reg1 <= d_reg0;
            tx_reg1 <= tx_reg0;
        end else begin
            d_reg1 <= d_reg1;
            tx_reg1 <= tx_reg1;
        end
    end
end

always @(posedge tclk_sig or negedge grstn or negedge lrstn)
begin 
    if (!grstn) begin
        d_reg2 <= 8'b0;
        tx_reg2 <= 4'b0;
    end else if (!lrstn) begin
        d_reg2 <= 8'b0;
        tx_reg2 <= 4'b0;
    end else begin
        if(d_up1)begin
            d_reg2 <= d_reg1;
            tx_reg2 <= tx_reg1;
        end else begin
            d_reg2[0] <= d_reg2[2];
            d_reg2[1] <= d_reg2[3];
            d_reg2[2] <= d_reg2[4];
            d_reg2[3] <= d_reg2[5];
            d_reg2[4] <= d_reg2[6];
            d_reg2[5] <= d_reg2[7];
            d_reg2[6] <= 1'b0;
            d_reg2[7] <= 1'b0;

            tx_reg2[0] <= tx_reg2[1];
            tx_reg2[1] <= tx_reg2[2];
            tx_reg2[2] <= tx_reg2[3];
            tx_reg2[3] <= 1'b0;
        end
    end
end

always @(posedge tclk_sig or negedge grstn or negedge lrstn)
begin
    if (!grstn) begin
        d_reg_p <= 1'b0;
        tx_reg_p <= 1'b0;
    end else if (!lrstn) begin
        d_reg_p <= 1'b0;
        tx_reg_p <= 1'b0;
    end else begin
        d_reg_p <= d_reg2[1];
        tx_reg_p <= tx_reg_n;
    end
end

always @(negedge tclk_sig or negedge grstn or negedge lrstn)
begin
    if (!grstn) begin
        d_reg_n <= 1'b0;
        tx_reg_n <= 1'b0;
    end else if (!lrstn) begin
        d_reg_n <= 1'b0;
        tx_reg_n <= 1'b0;
    end else begin
        d_reg_n <= d_reg2[0];
        tx_reg_n <= tx_reg2[0];
    end
end

assign Q0 = tclk_sig ? d_reg_n : d_reg_p;
assign Q1 = (TXCLK_POL == 1'b0) ? tx_reg_p : tx_reg_n;

//synthesis translate_on

endmodule // OSER8_MEM (8 to 1 serializer with memory)

//OSER10
module OSER10 (Q, D0, D1, D2, D3, D4, D5, D6, D7, D8, D9, PCLK, FCLK, RESET);

input D0, D1, D2, D3, D4, D5, D6, D7, D8, D9;
input PCLK, FCLK, RESET;
output Q;

//synthesis translate_off
reg [9:0] d_reg0,d_reg1,d_reg2;
reg rstn_dsel,dcnt0,dcnt1,dcnt2,d_up0,d_up1;
wire d_en,dcnt_reset;
reg d_reg_p,d_reg_n;
wire grstn,lrstn;

initial begin
    dcnt0 = 1'b0;
    dcnt1 = 1'b0;
    dcnt2 = 1'b0;
end

assign grstn = GSR.GSRO;
assign lrstn = (~RESET);

always @(posedge PCLK or negedge grstn or negedge lrstn)
begin
    if (!grstn) begin
        d_reg0 <= 0;
    end else if (!lrstn) begin
        d_reg0 <= 0;
    end else begin
        d_reg0 <= {D9,D8,D7,D6,D5,D4,D3,D2,D1,D0};
    end
end

always @(posedge FCLK or negedge grstn or negedge lrstn)
begin
    if(!grstn) begin
        rstn_dsel <= 1'b0;
    end
    else if (!lrstn) begin
        rstn_dsel <= 1'b0;        
    end
    else begin
        rstn_dsel <= 1'b1;
    end
end

always @(posedge FCLK or negedge rstn_dsel)
begin
    if (!rstn_dsel) begin
        dcnt0 <= 1'b0;
        dcnt1 <= 1'b0;
        dcnt2 <= 1'b0;
    end else begin
        dcnt0 <= ~(dcnt0 | dcnt_reset);
        dcnt1 <= (dcnt0 ^ dcnt1) & (~dcnt_reset);
        dcnt2 <= (dcnt2 ^ (dcnt0 & dcnt1)) & (~dcnt_reset);
    end
end

assign dcnt_reset = (~dcnt0) & (~dcnt1) & dcnt2;
assign d_en = (~dcnt0) & dcnt1;

always @(posedge FCLK or negedge rstn_dsel)
begin
    if (!rstn_dsel) begin
        d_up0 <= 1'b0;
        d_up1 <= 1'b0;
    end else begin
        if(d_en)begin
            d_up0 <= 1'b1;
            d_up1 <= 1'b1;
        end else begin
            d_up0 <= 1'b0;
            d_up1 <= 1'b0;
        end
    end
end

always @(posedge FCLK or negedge grstn or negedge lrstn)
begin
    if (!grstn) begin
        d_reg1 <= 10'b0;
    end else if (!lrstn) begin
        d_reg1 <= 10'b0;
    end else begin
        if(d_up0)begin
            d_reg1 <= d_reg0;
        end else begin
            d_reg1 <= d_reg1;
        end
    end
end

always @(posedge FCLK or negedge grstn or negedge lrstn)
begin
    if (!grstn) begin
        d_reg2 <= 10'b0;
    end else if (!lrstn) begin
        d_reg2 <= 10'b0;
    end else begin
        if(d_up1)begin
            d_reg2 <= d_reg1;
        end else begin
            d_reg2[0] <= d_reg2[2];
            d_reg2[1] <= d_reg2[3];
            d_reg2[2] <= d_reg2[4];
            d_reg2[3] <= d_reg2[5];
            d_reg2[4] <= d_reg2[6];
            d_reg2[5] <= d_reg2[7];
            d_reg2[6] <= d_reg2[8];
            d_reg2[7] <= d_reg2[9];
            d_reg2[8] <= 1'b0;
            d_reg2[9] <= 1'b0;
        end
    end
end

always @(posedge FCLK or negedge grstn or negedge lrstn)
begin
    if (!grstn) begin
        d_reg_p <= 1'b0;
    end else if (!lrstn) begin
        d_reg_p <= 1'b0;
    end else begin
        d_reg_p <= d_reg2[1];
    end
end

always @(negedge FCLK or negedge grstn or negedge lrstn)
begin
    if (!grstn) begin
        d_reg_n <= 1'b0;
    end else if (!lrstn) begin
        d_reg_n <= 1'b0;
    end else begin
        d_reg_n <= d_reg2[0];
    end
end

assign Q = FCLK ? d_reg_n : d_reg_p;

//synthesis translate_on
endmodule // OSER10 (10 to 1 serializer)

//OSER16
module OSER16 (Q, D0, D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13, D14, D15, PCLK, FCLK, RESET);

input D0, D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13, D14, D15;
input PCLK, FCLK, RESET;
output  Q;

//synthesis translate_off
reg [15:0] d_reg0,d_reg1,d_reg2;
reg rstn_dsel;
reg dcnt0,dcnt1,dcnt2;
reg d_up0,d_up1;
reg d_reg_p,d_reg_n;

wire grstn,lrstn;
wire d_en;

initial begin
    dcnt0 = 1'b0;
    dcnt1 = 1'b0;
    dcnt2 = 1'b0;
end

assign grstn = GSR.GSRO;
assign lrstn = (~RESET);

always @(posedge FCLK or negedge grstn or negedge lrstn) begin
    if (!grstn) begin
        rstn_dsel <= 0;
    end else if(!lrstn) begin
        rstn_dsel <= 0;
    end else begin
        rstn_dsel <= 1;
    end
end

always @(posedge FCLK or negedge rstn_dsel) begin
    if(!rstn_dsel) begin
        dcnt0 <= 0;
        dcnt1 <= 0;
        dcnt2 <= 0;
    end else begin
        dcnt0 <= ~dcnt0;
        dcnt1 <= dcnt1 ^ dcnt0;
        dcnt2 <= dcnt2 ^ (dcnt1 & dcnt0);
    end
end

assign d_en = ((~dcnt2) & dcnt1) & dcnt0;

always @(posedge FCLK or negedge rstn_dsel) begin
    if(!rstn_dsel) begin
        d_up0 <= 0;
        d_up1 <= 0;
    end else if(d_en) begin
        d_up0 <= 1;
        d_up1 <= 1;
    end else begin
        d_up0 <= 0;
        d_up1 <= 0;
    end
end

always @(posedge PCLK or negedge grstn or negedge lrstn)
begin
    if (!grstn) begin
        d_reg0 <= 16'b0;
    end
    else if (!lrstn) begin
        d_reg0 <= 16'b0;
    end
    else begin
        d_reg0 <= {D15,D14,D13,D12,D11,D10,D9,D8,D7,D6,D5,D4,D3,D2,D1,D0};
    end
end

always @(posedge FCLK or negedge grstn or negedge lrstn)
begin 
    if (!grstn) begin
        d_reg1 <= 16'b0;
    end else if (!lrstn) begin
        d_reg1 <= 16'b0;
    end else begin
        if(d_up0)begin
            d_reg1 <= d_reg0;
        end else begin
            d_reg1 <= d_reg1;
        end
    end
end

always @(posedge FCLK or negedge grstn or negedge lrstn)
begin 
    if (!grstn) begin
        d_reg2 <= 16'b0;
    end else if (!lrstn) begin
        d_reg2 <= 16'b0;
    end else begin
        if(d_up1)begin
            d_reg2 <= d_reg1;
        end else begin
            d_reg2[0] <= d_reg2[2];
            d_reg2[1] <= d_reg2[3];
            d_reg2[2] <= d_reg2[4];
            d_reg2[3] <= d_reg2[5];
            d_reg2[4] <= d_reg2[6];
            d_reg2[5] <= d_reg2[7];
            d_reg2[6] <= d_reg2[8];
            d_reg2[7] <= d_reg2[9];
            d_reg2[8] <= d_reg2[10];
            d_reg2[9] <= d_reg2[11];
            d_reg2[10] <= d_reg2[12];
            d_reg2[11] <= d_reg2[13];
            d_reg2[12] <= d_reg2[14];
            d_reg2[13] <= d_reg2[15];
            d_reg2[14] <= 1'b0;
            d_reg2[15] <= 1'b0;
        end
    end
end

always @(posedge FCLK or negedge grstn or negedge lrstn)
begin
    if (!grstn) begin
        d_reg_p <= 1'b0;
    end else if (!lrstn) begin
        d_reg_p <= 1'b0;
    end else begin
        d_reg_p <= d_reg2[1];
    end
end

always @(negedge FCLK or negedge grstn or negedge lrstn)
begin
    if (!grstn) begin
        d_reg_n <= 1'b0;
    end else if (!lrstn) begin
        d_reg_n <= 1'b0;
    end else begin
        d_reg_n <= d_reg2[0];
    end
end

assign Q = FCLK ? d_reg_n : d_reg_p;

//synthesis translate_on
endmodule

//IO delay
module IODELAY (DO, DF, DI, DLYSTEP, SDTAP, VALUE);

parameter C_STATIC_DLY = 0; //integer,0~255
parameter DYN_DLY_EN = "FALSE";//"TRUE","FALSE"
parameter ADAPT_EN = "FALSE";//"TRUE","FALSE"

input  DI;
input  SDTAP;
input  VALUE;
input  [7:0] DLYSTEP;
output DF;
output DO;

reg [7:0] delay_data,delay_data_adapt;
reg pre_value;
wire delay_out;
wire [7:0] delay_code;
wire [7:0] delay_data_real;
integer cnt_step,cnt_value;
reg cnt_start,cnt_step_start,cnt_value_start;

initial begin
    cnt_step = 0;
    cnt_value = 0;
    cnt_start = 1'b0;
    cnt_step_start = 1'b0;
    cnt_value_start = 1'b0;

end

assign delay_code = (DYN_DLY_EN == "FALSE")? C_STATIC_DLY : DLYSTEP;

always @(SDTAP or VALUE) begin
    if (!SDTAP) begin
        delay_data <= delay_code;
    end
end

always @(SDTAP or VALUE) begin
    if (SDTAP) begin
        if(pre_value == 1'b0 && VALUE == 1'b1) begin
            cnt_start <= 1'b1;
        end else begin
            cnt_start <= 1'b0;            
        end
    end
end
 
always @(negedge DI) begin
    if(cnt_start) begin
        if(cnt_value == 22) begin
            cnt_value <= 0;
            cnt_value_start <= 1'b1;
        end else  if(cnt_value == 15) begin
            cnt_step_start <= 1'b1;            
            cnt_value <= cnt_value + 1;
        end else begin
            cnt_value <= cnt_value + 1;
        end

        if(cnt_value_start == 1'b1) begin
            cnt_value <= 0;
        end
    end else begin
        cnt_value <= 0;
        cnt_value_start <= 1'b0;
        cnt_step_start <= 1'b0;            
    end
end

always @(negedge DI) begin
    if(cnt_step_start) begin
        if(cnt_step == 7) begin
            cnt_step <= 0;
        end else begin
            cnt_step <= cnt_step + 1;
        end
    end else begin
        cnt_step <= 0;    
    end
end


always @(SDTAP or VALUE or cnt_step or DLYSTEP or cnt_value_start) begin
    if (!SDTAP) begin
        delay_data_adapt <= C_STATIC_DLY;
    end else begin
        if(cnt_value_start == 1'b1) begin
   	        if (C_STATIC_DLY < DLYSTEP)
            begin
                if(delay_data_adapt != DLYSTEP) begin
                    if (cnt_step == 7) begin
      		            delay_data_adapt <= delay_data_adapt + 1;
                    end
                end
            end else if (C_STATIC_DLY > DLYSTEP) begin
                if(delay_data_adapt != DLYSTEP) begin
                    if (cnt_step == 7) begin
      		            delay_data_adapt <= delay_data_adapt - 1;
                    end
                end
            end
  	    end
    end
end

always @(VALUE) begin
    pre_value <= VALUE;
end

assign DF = ((C_STATIC_DLY > DLYSTEP) && (delay_data_adapt == DLYSTEP)) || ((C_STATIC_DLY < DLYSTEP) && (delay_data_adapt == DLYSTEP));

assign delay_data_real = (ADAPT_EN == "FALSE")? delay_data : delay_data_adapt;

assign #(0.0125*(delay_data_real+1)) delay_out = DI;

assign DO = delay_out;

endmodule // IODELAY (i/o delay in IOB)


module OSIDES32(Q, DF, D, PCLK, FCLKP, FCLKN, FCLKQP, FCLKQN, RESET, SDTAP, VALUE, DLYSTEP);
output [31:0] Q;
input D;
input PCLK, FCLKP, FCLKN, FCLKQP, FCLKQN;
input RESET;
output DF;
input  SDTAP;
input  VALUE;
input  [7:0] DLYSTEP;

parameter C_STATIC_DLY = 0; //integer,0~255
parameter DYN_DLY_EN = "FALSE";//"TRUE","FALSE"
parameter ADAPT_EN = "FALSE";//"TRUE","FALSE"


wire D_a,D_b;
reg d_p,dq_p,dq_n,d_n,d_qp,dq_qp,dq_qn,d_qn;
reg db_p,dqb_p,dqb_n,db_n,db_qp,dqb_qp,dqb_qn,db_qn;
reg rstn_syn,cnt_0,cnt_1,d_up;
wire d_up_en;
reg dqn_reg0,dqnb_reg0,dn_reg0,dnb_reg0,dqp_reg0,dqpb_reg0,dp_reg0,dpb_reg0,dqn_reg1,dqnb_reg1,dn_reg1,dnb_reg1,dqp_reg1,dqpb_reg1,dp_reg1,dpb_reg1,dqn_reg2,dqnb_reg2,dn_reg2,dnb_reg2,dqp_reg2,dqpb_reg2,dp_reg2,dpb_reg2,dqn_reg3,dqnb_reg3,dn_reg3,dnb_reg3,dqp_reg3,dqpb_reg3,dp_reg3,dpb_reg3;
reg [31:0] D_data;
reg [31:0] Q_data;

wire grstn;
assign grstn = GSR.GSRO;


wire DF0;
IODELAY dly_0 (
    .DO(D_a), 
    .DF(DF0), 
    .DI(D), 
    .DLYSTEP(8'b0),
    .SDTAP(1'b0),
    .VALUE(1'b0)
);
defparam dly_0.C_STATIC_DLY = 0;
defparam dly_0.DYN_DLY_EN = "FALSE";
defparam dly_0.ADAPT_EN = "FALSE";

IODELAY dly_1 (
    .DO(D_b), 
    .DF(DF), 
    .DI(D), 
    .DLYSTEP(DLYSTEP), 
    .SDTAP(SDTAP), 
    .VALUE(VALUE)
);
defparam dly_1.C_STATIC_DLY = C_STATIC_DLY;
defparam dly_1.DYN_DLY_EN = DYN_DLY_EN;
defparam dly_1.ADAPT_EN = ADAPT_EN;


always @(posedge FCLKP or negedge grstn or posedge RESET) begin
    if (!grstn) begin
        d_p <= 1'b0;
        dq_p <= 1'b0;
        dq_n <= 1'b0;
    end else if (RESET) begin
        d_p <= 1'b0;
        dq_p <= 1'b0;
        dq_n <= 1'b0;
    end else begin
        d_p <= D_a;
        dq_p <= d_p;
        dq_n <= d_n;
    end
end

always @(posedge FCLKN or negedge grstn or posedge RESET) begin
    if (!grstn) begin
        d_n <= 1'b0;
    end else if (RESET) begin
        d_n <= 1'b0;
    end else begin
        d_n <= D_a;
    end
end

always @(posedge FCLKQP or negedge grstn or posedge RESET) begin
    if (!grstn) begin
        d_qp <= 1'b0;
        dq_qp <= 1'b0;
        dq_qn <= 1'b0;
    end else if (RESET) begin
        d_qp <= 1'b0;
        dq_qp <= 1'b0;
        dq_qn <= 1'b0;
    end else begin
        d_qp <= D_a;
        dq_qp <= d_qp;
        dq_qn <= d_qn;
    end
end

always @(posedge FCLKQN or negedge grstn or posedge RESET) begin
    if (!grstn) begin
        d_qn <= 1'b0;
    end else if (RESET) begin
        d_qn <= 1'b0;
    end else begin
        d_qn <= D_a;
    end
end


always @(posedge FCLKP or negedge grstn or posedge RESET) begin
    if (!grstn) begin
        db_p <= 1'b0;
        dqb_p <= 1'b0;
        dqb_n <= 1'b0;
    end else if (RESET) begin
        db_p <= 1'b0;
        dqb_p <= 1'b0;
        dqb_n <= 1'b0;
    end else begin
        db_p <= D_b;
        dqb_p <= db_p;
        dqb_n <= db_n;
    end
end

always @(posedge FCLKN or negedge grstn or posedge RESET) begin
    if (!grstn) begin
        db_n <= 1'b0;
    end else if (RESET) begin
        db_n <= 1'b0;
    end else begin
        db_n <= D_b;
    end
end

always @(posedge FCLKQP or negedge grstn or posedge RESET) begin
    if (!grstn) begin
        db_qp <= 1'b0;
        dqb_qp <= 1'b0;
        dqb_qn <= 1'b0;
    end else if (RESET) begin
        db_qp <= 1'b0;
        dqb_qp <= 1'b0;
        dqb_qn <= 1'b0;
    end else begin
        db_qp <= D_b;
        dqb_qp <= db_qp;
        dqb_qn <= db_qn;
    end
end

always @(posedge FCLKQN or negedge grstn or posedge RESET) begin
    if (!grstn) begin
        db_qn <= 1'b0;
    end else if (RESET) begin
        db_qn <= 1'b0;
    end else begin
        db_qn <= D_b;
    end
end

always @(posedge FCLKP or negedge grstn or posedge RESET) begin
    if (!grstn) begin
        dn_reg0 <= 1'b0;
        dp_reg0 <= 1'b0;
        dn_reg1 <= 1'b0;
        dp_reg1 <= 1'b0;
        dn_reg2 <= 1'b0;
        dp_reg2 <= 1'b0;
        dn_reg3 <= 1'b0;
        dp_reg3 <= 1'b0;
        dqn_reg0 <= 1'b0;
        dqp_reg0 <= 1'b0;
        dqn_reg1 <= 1'b0;
        dqp_reg1 <= 1'b0;
        dqn_reg2 <= 1'b0;
        dqp_reg2 <= 1'b0;
        dqn_reg3 <= 1'b0;
        dqp_reg3 <= 1'b0;
        dnb_reg0 <= 1'b0;
        dpb_reg0 <= 1'b0;
        dnb_reg1 <= 1'b0;
        dpb_reg1 <= 1'b0;
        dnb_reg2 <= 1'b0;
        dpb_reg2 <= 1'b0;
        dnb_reg3 <= 1'b0;
        dpb_reg3 <= 1'b0;
        dqnb_reg0 <= 1'b0;
        dqpb_reg0 <= 1'b0;
        dqnb_reg1 <= 1'b0;
        dqpb_reg1 <= 1'b0;
        dqnb_reg2 <= 1'b0;
        dqpb_reg2 <= 1'b0;
        dqnb_reg3 <= 1'b0;
        dqpb_reg3 <= 1'b0;
    end else if (RESET) begin
        dn_reg0 <= 1'b0;
        dp_reg0 <= 1'b0;
        dn_reg1 <= 1'b0;
        dp_reg1 <= 1'b0;
        dn_reg2 <= 1'b0;
        dp_reg2 <= 1'b0;
        dn_reg3 <= 1'b0;
        dp_reg3 <= 1'b0;
        dqn_reg0 <= 1'b0;
        dqp_reg0 <= 1'b0;
        dqn_reg1 <= 1'b0;
        dqp_reg1 <= 1'b0;
        dqn_reg2 <= 1'b0;
        dqp_reg2 <= 1'b0;
        dqn_reg3 <= 1'b0;
        dqp_reg3 <= 1'b0;
        dnb_reg0 <= 1'b0;
        dpb_reg0 <= 1'b0;
        dnb_reg1 <= 1'b0;
        dpb_reg1 <= 1'b0;
        dnb_reg2 <= 1'b0;
        dpb_reg2 <= 1'b0;
        dnb_reg3 <= 1'b0;
        dpb_reg3 <= 1'b0;
        dqnb_reg0 <= 1'b0;
        dqpb_reg0 <= 1'b0;
        dqnb_reg1 <= 1'b0;
        dqpb_reg1 <= 1'b0;
        dqnb_reg2 <= 1'b0;
        dqpb_reg2 <= 1'b0;
        dqnb_reg3 <= 1'b0;
        dqpb_reg3 <= 1'b0;
    end else begin
        dn_reg0 <= dq_n;
        dp_reg0 <= dq_p;
        dn_reg1 <= dn_reg0;
        dp_reg1 <= dp_reg0;
        dn_reg2 <= dn_reg1;
        dp_reg2 <= dp_reg1;
        dn_reg3 <= dn_reg2;
        dp_reg3 <= dp_reg2;
        dqn_reg0 <= dq_qn;
        dqp_reg0 <= dq_qp;
        dqn_reg1 <= dqn_reg0;
        dqp_reg1 <= dqp_reg0;
        dqn_reg2 <= dqn_reg1;
        dqp_reg2 <= dqp_reg1;
        dqn_reg3 <= dqn_reg2;
        dqp_reg3 <= dqp_reg2;

        dnb_reg0 <= dqb_n;
        dpb_reg0 <= dqb_p;
        dnb_reg1 <= dnb_reg0;
        dpb_reg1 <= dpb_reg0;
        dnb_reg2 <= dnb_reg1;
        dpb_reg2 <= dpb_reg1;
        dnb_reg3 <= dnb_reg2;
        dpb_reg3 <= dpb_reg2;
        dqnb_reg0 <= dqb_qn;
        dqpb_reg0 <= dqb_qp;
        dqnb_reg1 <= dqnb_reg0;
        dqpb_reg1 <= dqpb_reg0;
        dqnb_reg2 <= dqnb_reg1;
        dqpb_reg2 <= dqpb_reg1;
        dqnb_reg3 <= dqnb_reg2;
        dqpb_reg3 <= dqpb_reg2;
    end
end

always @(posedge FCLKQP or negedge grstn or posedge RESET) begin
    if (!grstn) begin    
        rstn_syn <= 1'b0;
    end else if(RESET) begin    
        rstn_syn <= 1'b0;
    end else begin
        rstn_syn <= 1'b1;
    end
end

always @(posedge FCLKQP or negedge grstn or negedge rstn_syn) begin
    if (!grstn) begin    
        cnt_0 <= 1'b0;
        cnt_1 <= 1'b0;
    end else if(!rstn_syn) begin    
        cnt_0 <= 1'b0;
        cnt_1 <= 1'b0;
    end else begin
        cnt_0 <= ~cnt_0;
        cnt_1 <= cnt_0 ^ cnt_1;
    end
end

assign d_up_en = cnt_0 && (~cnt_1);

always @(posedge FCLKQP or negedge grstn or negedge rstn_syn) begin
    if (!grstn) begin    
        d_up <= 1'b0;
    end else if(!rstn_syn) begin    
        d_up <= 1'b0;
    end else begin
        if(d_up_en) begin
            d_up <= 1'b1;
        end else begin
            d_up <= 1'b0;
        end
    end
end

always @(posedge FCLKQP or negedge grstn or posedge RESET) begin
    if (!grstn) begin
        D_data <= 32'b0;
    end else if(RESET) begin
        D_data <= 32'b0;
    end else if(d_up) begin
        D_data[31] <= dqn_reg0;
        D_data[30] <= dqnb_reg0;
        D_data[29] <= dn_reg0;
        D_data[28] <= dnb_reg0;
        D_data[27] <= dqp_reg0;
        D_data[26] <= dqpb_reg0;
        D_data[25] <= dp_reg0;
        D_data[24] <= dpb_reg0;
        D_data[23] <= dqn_reg1;
        D_data[22] <= dqnb_reg1;
        D_data[21] <= dn_reg1;
        D_data[20] <= dnb_reg1;
        D_data[19] <= dqp_reg1;
        D_data[18] <= dqpb_reg1;
        D_data[17] <= dp_reg1;
        D_data[16] <= dpb_reg1;
        D_data[15] <= dqn_reg2;
        D_data[14] <= dqnb_reg2;
        D_data[13] <= dn_reg2;
        D_data[12] <= dnb_reg2;
        D_data[11] <= dqp_reg2;
        D_data[10] <= dqpb_reg2;
        D_data[9] <= dp_reg2;
        D_data[8] <= dpb_reg2;
        D_data[7] <= dqn_reg3;
        D_data[6] <= dqnb_reg3;
        D_data[5] <= dn_reg3;
        D_data[4] <= dnb_reg3;
        D_data[3] <= dqp_reg3;
        D_data[2] <= dqpb_reg3;
        D_data[1] <= dp_reg3;
        D_data[0] <= dpb_reg3;
    end
end

always @(posedge PCLK or negedge grstn or posedge RESET) begin
    if (!grstn) begin
        Q_data <= 32'b0;
    end else if (RESET) begin
        Q_data <= 32'b0;
    end else begin
        Q_data <= D_data;
    end
end

assign Q = Q_data;

endmodule

// DCE
module DCE(CLKOUT, CLKIN, CE);
input CLKIN;
input CE;
output CLKOUT;
reg ce_reg;

always @(CLKIN or CE) begin
    if(!CLKIN)
    begin
        ce_reg <= CE;
    end
end

assign CLKOUT = CLKIN & ce_reg;

endmodule

// DCS
module DCS (CLKOUT, CLKIN0, CLKIN1, CLKIN2, CLKIN3, CLKSEL, SELFORCE);
input CLKIN0, CLKIN1, CLKIN2, CLKIN3, SELFORCE;
input [3:0] CLKSEL;
output CLKOUT;

parameter DCS_MODE = "RISING";  //CLK0,CLK1,CLK2,CLK3,GND,VCC,RISING,FALLING,CLK0_GND,CLK0_VCC,CLK1_GND,CLK1_VCC,CLK2_GND,CLK2_VCC,CLK3_GND,CLK3_VCC

wire clk0_out,clk1_out,clk2_out,clk3_out,gnd_out,vcc_out;//CLK,GND,VCC
reg flag_g0,flag_v0,flag_g1,flag_v1,flag_g2,flag_v2,flag_g3,flag_v3;//CLK_GND,CLK_VCC
wire clk0_gnd,clk0_vcc,clk1_gnd,clk1_vcc,clk2_gnd,clk2_vcc,clk3_gnd,clk3_vcc,clk3_vc;

wire clkout_f0,clkout_f1,clkout_f2,clkout_f3,clkout_f;//FALLING
reg flag_f0,flag_f1,flag_f2,flag_f3;

wire clkout_r0,clkout_r1,clkout_r2,clkout_r3,clkout_r;//RISING
reg flag_r0,flag_r1,flag_r2,flag_r3;

wire selforce_out;
reg dcsout;
reg clkout;

initial begin
    flag_g0 = 1'b0;
    flag_v0 = 1'b0;
    flag_g1 = 1'b0;
    flag_v1 = 1'b0;
    flag_g2 = 1'b0;
    flag_v2 = 1'b0;
    flag_g3 = 1'b0;
    flag_v3 = 1'b0;

    flag_f0 = 1'b0;
    flag_f1 = 1'b0;
    flag_f2 = 1'b0;
    flag_f3 = 1'b0;
    flag_r0 = 1'b0;
    flag_r1 = 1'b0;
    flag_r2 = 1'b0;
    flag_r3 = 1'b0;
    clkout = 1'b0;
end

//CLK,GND,VCC
assign clk0_out = CLKIN0;
assign clk1_out = CLKIN1;
assign clk2_out = CLKIN2;
assign clk3_out = CLKIN3;

assign gnd_out = 1'b0;
assign vcc_out = 1'b1;

//FALLING
always @(negedge CLKIN0) begin
    if(CLKSEL[0] && !flag_f1 && !flag_f2 && !flag_f3) begin
        flag_f0 <= 1'b1;
    end else begin
        flag_f0 <= 1'b0;
    end
end
assign clkout_f0 = CLKIN0 & flag_f0;

always @(negedge CLKIN1) begin
    if(CLKSEL[1] && !flag_f0 && !flag_f2 && !flag_f3) begin
        flag_f1 <= 1'b1;
    end else begin
        flag_f1 <= 1'b0;
    end
end
assign clkout_f1 = CLKIN1 & flag_f1;

always @(negedge CLKIN2) begin
    if(CLKSEL[2] && !flag_f0 && !flag_f1 && !flag_f3) begin
        flag_f2 <= 1'b1;
    end else begin
        flag_f2 <= 1'b0;
    end
end
assign clkout_f2 = CLKIN2 & flag_f2;

always @(negedge CLKIN3) begin
    if(CLKSEL[3] && !flag_f0 && !flag_f1 && !flag_f2) begin
        flag_f3 <= 1'b1;
    end else begin
        flag_f3 <= 1'b0;
    end
end
assign clkout_f3 = CLKIN3 & flag_f3;

assign clkout_f = flag_f0 ? clkout_f0 : flag_f1 ? clkout_f1 : flag_f2 ? clkout_f2 : flag_f3 ? clkout_f3 : 0;

//RISING
always @(posedge CLKIN0) begin
    if(CLKSEL[0] && !flag_r1 && !flag_r2 && !flag_r3) begin
        flag_r0 <= 1'b1;
    end else begin
        flag_r0 <= 1'b0;
    end
end
assign clkout_r0 = ~(~CLKIN0 & flag_r0);

always @(posedge CLKIN1) begin
    if(CLKSEL[1] && !flag_r0 && !flag_r2 && !flag_r3) begin
        flag_r1 <= 1'b1;
    end else begin
        flag_r1 <= 1'b0;
    end
end
assign clkout_r1 = ~(~CLKIN1 & flag_r1);

always @(posedge CLKIN2) begin
    if(CLKSEL[2] && !flag_r0 && !flag_r1 && !flag_r3) begin
        flag_r2 <= 1'b1;
    end else begin
        flag_r2 <= 1'b0;
    end
end
assign clkout_r2 = ~(~CLKIN2 & flag_r2);

always @(posedge CLKIN3) begin
    if(CLKSEL[3] && !flag_r0 && !flag_r1 && !flag_r2) begin
        flag_r3 <= 1'b1;
    end else begin
        flag_r3 <= 1'b0;
    end
end
assign clkout_r3 = ~(~CLKIN3 & flag_r3);

assign clkout_r = flag_r0 ? clkout_r0 : flag_r1 ? clkout_r1 : flag_r2 ? clkout_r2 : flag_r3 ? clkout_r3 : 1;

//CLK0_GND
always @(negedge CLKIN0) begin
    if(CLKSEL[0]) begin
        flag_g0 <= 1'b1;
    end else begin
        flag_g0 <= 1'b0;
    end
end

assign clk0_gnd = flag_g0 & CLKIN0;

//CLK0_VCC
always @(posedge CLKIN0) begin
    if(CLKSEL[0]) begin
        flag_v0 <= 1'b1;
    end else begin
        flag_v0 <= 1'b0;
    end
end

assign clk0_vcc = ~(flag_v0 & (~CLKIN0));

//CLK1_GND
always @(negedge CLKIN1) begin
    if(CLKSEL[1]) begin
        flag_g1 <= 1'b1;
    end else begin
        flag_g1 <= 1'b0;
    end
end

assign clk1_gnd = flag_g1 & CLKIN1;

//CLK1_VCC
always @(posedge CLKIN1) begin
    if(CLKSEL[1]) begin
        flag_v1 <= 1'b1;
    end else begin
        flag_v1 <= 1'b0;
    end
end

assign clk1_vcc = ~(flag_v1 & (~CLKIN1));

//CLK2_GND
always @(negedge CLKIN2) begin
    if(CLKSEL[2]) begin
        flag_g2 <= 1'b1;
    end else begin
        flag_g2 <= 1'b0;
    end
end

assign clk2_gnd = flag_g2 & CLKIN2;

//CLK2_VCC
always @(posedge CLKIN2) begin
    if(CLKSEL[2]) begin
        flag_v2 <= 1'b1;
    end else begin
        flag_v2 <= 1'b0;
    end
end

assign clk2_vcc = ~(flag_v2 & (~CLKIN2));

//CLK3_GND
always @(negedge CLKIN3) begin
    if(CLKSEL[3]) begin
        flag_g3 <= 1'b1;
    end else begin
        flag_g3 <= 1'b0;
    end
end

assign clk3_gnd = flag_g3 & CLKIN3;

//CLK3_VCC
always @(posedge CLKIN3) begin
    if(CLKSEL[3]) begin
        flag_v3 <= 1'b1;
    end else begin
        flag_v3 <= 1'b0;
    end
end

assign clk3_vcc = ~(flag_v3 & (~CLKIN3));
assign clk3_vc = flag_v3 ? CLKIN3 : 1'b1;

//dcsout
always @(clk0_out,clk1_out,clk2_out,clk3_out,gnd_out,vcc_out,clk0_gnd,clk0_vcc,clk1_gnd,clk1_vcc,clk2_gnd,clk2_vcc,clk3_gnd,clk3_vcc,clkout_f,clkout_r) begin
    if(DCS_MODE == "CLK0") begin
        dcsout <= clk0_out;
    end else if(DCS_MODE == "CLK1") begin
        dcsout <= clk1_out;
    end else if(DCS_MODE == "CLK2") begin
        dcsout <= clk2_out;
    end else if(DCS_MODE == "CLK3") begin
        dcsout <= clk3_out;
    end else if(DCS_MODE == "GND") begin
        dcsout <= gnd_out;
    end else if(DCS_MODE == "VCC") begin
        dcsout <= vcc_out;
    end else if(DCS_MODE == "FALLING") begin
        dcsout <= clkout_f;
    end else if(DCS_MODE == "RISING") begin
        dcsout <= clkout_r;
    end else if(DCS_MODE == "CLK0_GND") begin
        dcsout <= clk0_gnd;
    end else if(DCS_MODE == "CLK0_VCC") begin
        dcsout <= clk0_vcc;
    end else if(DCS_MODE == "CLK1_GND") begin
        dcsout <= clk1_gnd;
    end else if(DCS_MODE == "CLK1_VCC") begin
        dcsout <= clk1_vcc;
    end else if(DCS_MODE == "CLK2_GND") begin
        dcsout <= clk2_gnd;
    end else if(DCS_MODE == "CLK2_VCC") begin
        dcsout <= clk2_vcc;
    end else if(DCS_MODE == "CLK3_GND") begin
        dcsout <= clk3_gnd;
    end else if(DCS_MODE == "CLK3_VCC") begin
        dcsout <= clk3_vcc;
    end else begin
        dcsout <= 0;
    end
end

//clkout
assign selforce_out = (CLKSEL == 4'b0001) ? CLKIN0 : (CLKSEL == 4'b0010) ? CLKIN1 : (CLKSEL == 4'b0100) ? CLKIN2 : (CLKSEL == 4'b1000) ? CLKIN3 : 0;
always @(dcsout or selforce_out or SELFORCE) begin
    if(!SELFORCE) begin
        clkout <= dcsout;
    end else begin
        clkout <= selforce_out;
    end
end
        
assign CLKOUT = clkout;

endmodule


// DDRDLL
module DDRDLL (STEP, LOCK, UPDNCNTL, STOP, CLKIN, RESET);

input CLKIN;
input STOP;
input UPDNCNTL;
input RESET;

output [7:0]STEP;
output LOCK;

parameter DLL_FORCE = "FALSE";//TRUE: force lock and code; FALSE: code/lock generated from DDRDLL loop
parameter CODESCAL = "000";//001 010 011 100 101 110 111
parameter SCAL_EN = "TRUE";//TRUE,FALSE
parameter DIV_SEL = 1'b0; // 1'b0,normal lock mode; 1'b1,fast lock mode

realtime clkin_edge,clkin_period,clkin_period_pre;
real del;
reg [7:0]step_reg,step_reg_sig;
reg stop_0,stop_1n;
integer cnt;
reg clk_effect,lock_reg;
wire reset_sig;
wire grstn = GSR.GSRO;
wire clk_out;

initial begin
    del=0.025;
    clk_effect = 1'b0;
    step_reg = 8'b00000000;
    lock_reg = 1'b0;
end

assign reset_sig = RESET | (~grstn);    

always @(posedge CLKIN or posedge reset_sig) begin
    if(reset_sig) begin
        clk_effect <= 0;
        clkin_period <= 0;
    end else begin
        clkin_edge<=$realtime;
        clkin_period<=$realtime-clkin_edge;
        clkin_period_pre<=clkin_period;
    end

    if(clkin_period > 0) begin    
        if((clkin_period-clkin_period_pre <0.001) &&(clkin_period-clkin_period_pre>-0.001)) begin
            clk_effect = 1;
        end else begin
            clk_effect = 0;
        end
    end
end

always @(negedge CLKIN or posedge reset_sig) begin
    if (reset_sig) begin
        stop_0 <= 1'b0;
    end else begin
        stop_0 <= STOP;
    end
end

always @(negedge CLKIN or posedge reset_sig) begin
    if (reset_sig) begin
        stop_1n <= 1'b1;
    end else begin
        stop_1n <= ~stop_0;
    end
end

assign clk_out = CLKIN && stop_1n;

always @(posedge clk_out or posedge reset_sig) begin
    if (reset_sig) begin
        cnt <= 0;
        lock_reg <= 1'b0;
    end else begin
        cnt <= cnt + 1;
        if(DIV_SEL == 1'b0) begin
            if(cnt >= 33600) begin
                lock_reg <= 1'b1;
            end else begin                
                lock_reg <= 1'b0;
            end               
        end

        if(DIV_SEL == 1'b1) begin
            if(cnt >= 2100) begin
                lock_reg <= 1'b1;
            end else begin                
                lock_reg <= 1'b0;
            end               
        end
    end
end

assign LOCK = (DLL_FORCE== "TRUE") ? 1'b1: lock_reg;

always @(*) begin
    if(clk_effect) begin
        if(SCAL_EN=="TRUE") begin
            case(CODESCAL)
                "000": step_reg<=clkin_period/del/360*101;
                "001": step_reg<=clkin_period/del/360*112;
                "010": step_reg<=clkin_period/del/360*123;
                "011": step_reg<=clkin_period/del/360*135;
                "100": step_reg<=clkin_period/del/360*79;
                "101": step_reg<=clkin_period/del/360*68;
                "110": step_reg<=clkin_period/del/360*57;
                "111": step_reg<=clkin_period/del/360*45;
            endcase
        end else begin
            step_reg<=clkin_period/del/360*90;
        end
    end
end

always @(step_reg or reset_sig or UPDNCNTL)
begin
    if(reset_sig == 1'b1) begin
        step_reg_sig <= 8'b00000000;
    end else if(UPDNCNTL==0) begin
        step_reg_sig <= step_reg;
    end
end

assign STEP = (DLL_FORCE=="TRUE") ? 255 : step_reg_sig;

endmodule

// DLLDLY
module DLLDLY (CLKOUT, FLAG, CLKIN, DLLSTEP, CSTEP, LOADN, MOVE);
input CLKIN;
input [7:0] DLLSTEP, CSTEP;
input LOADN,MOVE;
output CLKOUT;
output FLAG;

parameter DLY_SIGN = 1'b0; // 1'b0:'+',  1'b1: '-'
parameter DLY_ADJ = 0; // 0~255, dly_sign=0 :dly_adj; dly_sign=1: -dly_adj
parameter DYN_DLY_EN = "FALSE";//"TRUE","FALSE"
parameter ADAPT_EN = "FALSE";//"TRUE","FALSE"
parameter STEP_SEL = 1'b0;//1'b0:DLLSTEP; 1'b1:CSTEP

reg premove, clk_effect;
reg [7:0] dllstep_adj_pre,CSTEP_pre;
wire [7:0] dllstep_adj;
real dly_adj;
realtime del, step_dly;
realtime clkin_edge,clkin_period,clkin_period_pre;
reg [7:0] step_data,step_data_adapt;
wire [7:0] step_pre,step_cur,step_code;
wire [7:0] step_data_real;
integer cnt_step,cnt_value;
reg cnt_start,cnt_step_start,cnt_value_start;
reg flag_add,flag_sub;

reg CLKOUT;
wire grstn = GSR.GSRO;

initial begin
    step_data = 8'b00000000;
    step_data_adapt = 8'b00000000;
    del = 0.0125;
    clk_effect = 1'b0;
    dly_adj = 0;
    cnt_step = 0;
    cnt_value = 0;
    cnt_start = 1'b0;
    cnt_step_start = 1'b0;
    cnt_value_start = 1'b0;
    flag_add = 1'b0;
    flag_sub = 1'b0;
end

initial begin
    if(DLY_SIGN == 1'b0) begin
        dly_adj = DLY_ADJ;
    end else if(DLY_SIGN == 1'b1) begin
        dly_adj = -DLY_ADJ;
    end
end

always @(posedge CLKIN) begin
    if(!grstn) begin
        clkin_edge<=0;
    end else begin
        clkin_edge<=$realtime;
        clkin_period<=$realtime-clkin_edge;
        clkin_period_pre<=clkin_period;
    end

    if(clkin_period > 0) begin
        //if((clkin_period_pre-clkin_period<0.001) &&(clkin_period_pre-clkin_period>-0.001))
        if(clkin_period_pre == clkin_period) begin
            clk_effect = 1;
        end else begin
            clk_effect = 0;
        end
    end
end 

assign step_code = (DYN_DLY_EN == "FALSE")? DLY_ADJ : step_cur;

always @(LOADN or step_code or clk_effect) begin
    if (clk_effect == 1'b1) begin
        if (!LOADN) begin
            step_data <= step_code;
        end
    end
end

always @ (MOVE) begin
    premove <= MOVE;
end

always @(LOADN or MOVE) begin
    if (clk_effect == 1'b1) begin
        if (LOADN) begin
            if(premove == 1'b0 && MOVE == 1'b1) begin
                cnt_start <= 1'b1;
            end else begin
                cnt_start <= 1'b0;            
            end
        end
    end
end
 
always @(negedge CLKIN) begin
    if(cnt_start) begin
        if(cnt_value == 22) begin
            cnt_value <= 0;
            cnt_value_start <= 1'b1;
        end else  if(cnt_value == 15) begin
            cnt_step_start <= 1'b1;            
            cnt_value <= cnt_value + 1;
        end else begin
            cnt_value <= cnt_value + 1;
        end

        if(cnt_value_start == 1'b1) begin
            cnt_value <= 0;
        end
    end else begin
        cnt_value <= 0;
        cnt_value_start <= 1'b0;
        cnt_step_start <= 1'b0;            
    end
end

always @(negedge CLKIN) begin
    if(cnt_step_start) begin
        if(cnt_step == 7) begin
            cnt_step <= 0;
        end else begin
            cnt_step <= cnt_step + 1;
        end
    end else begin
        cnt_step <= 0;    
    end
end

assign dllstep_adj = ((DLLSTEP + dly_adj) <= 0) ? 0 : ((DLLSTEP + dly_adj) >= 255) ? 255 : (DLLSTEP + dly_adj);

always @ (dllstep_adj) begin
    dllstep_adj_pre <= dllstep_adj;
end

always @ (CSTEP) begin
    CSTEP_pre <= CSTEP;
end

assign step_pre = (STEP_SEL == 1'b0)? dllstep_adj_pre : CSTEP_pre;
assign step_cur = (STEP_SEL == 1'b0)? dllstep_adj : CSTEP;

always @(DLLSTEP, CSTEP, LOADN, MOVE, CLKIN, clk_effect) begin
    if (clk_effect == 1'b1) begin
        flag_add = 1'b0;
        flag_sub = 1'b0;

        if (LOADN == 1'b0) begin
            step_data_adapt <= step_pre;
        end else begin
            if(cnt_value_start == 1'b1) begin
   	            if (step_data_adapt < step_cur)
                begin
                    flag_add = 1'b1;
                    if(step_data_adapt != step_cur) begin
                        if (cnt_step == 7) begin
      		                step_data_adapt <= step_data_adapt + 1;
                        end
                    end
                end else if (step_data_adapt > step_cur) begin
                    flag_sub = 1'b1;
                    if(step_data_adapt != step_cur) begin
                        if (cnt_step == 7) begin
      		                step_data_adapt <= step_data_adapt - 1;
                        end
                    end
                end
  	        end
        end
    end
end

assign FLAG = (flag_add && (step_data_adapt == step_cur)) || (flag_sub && (step_data_adapt == step_cur));

assign step_data_real = (ADAPT_EN == "FALSE")? step_data : step_data_adapt;

always @(step_data_real) begin
    step_dly <= (step_data_real+1) * del;
end

always @(CLKIN) begin
    CLKOUT <= #(step_dly) CLKIN;
end
    
endmodule


// CLKDIV
module CLKDIV(CLKOUT, CALIB, HCLKIN, RESETN); 

input HCLKIN;
input RESETN;
input CALIB;
output CLKOUT;

parameter DIV_MODE = "2"; //"1","2","3","3.5","4","5","6","7","8"

reg reset_0;
reg calib_0,calib_1,calib_2,calib_state;
wire calib_en,calib_resetn,cnt_enable;
reg select_no_3p5,select3p5,select5,select3,select6,select7;
wire dsel_en,clk_div_0,clk_div2,clk_div7_8,clk_div;
reg d_sel,cnt_0,cnt_1,cnt_2,clk_div_1;
wire dsel_clk;

wire grstn;
assign grstn = GSR.GSRO;

initial begin
    cnt_0 = 1'b0;
    cnt_1 = 1'b0;
    cnt_2 = 1'b0;
    d_sel = 1'b0;
    calib_state = 1'b0;
    clk_div_1 = 1'b0;

    if (DIV_MODE == "3.5") begin
        select3p5 = 1'b1;
        select_no_3p5 = 1'b0;
    end else
    begin
        select_no_3p5 = 1'b1;
        select3p5 = 1'b0;
    end

    if (DIV_MODE == "5")
    begin
        select5 = 1'b1;
    end else begin
        select5 = 1'b0;        
    end
    if (DIV_MODE == "3")
    begin
        select3 = 1'b1;
    end else begin
        select3 = 1'b0;        
    end
    if (DIV_MODE == "6")
    begin
        select6 = 1'b1;
    end else begin
        select6 = 1'b0;        
    end
    if (DIV_MODE == "7")
    begin
        select7 = 1'b1;
    end else begin
        select7 = 1'b0;        
    end

end

always @(posedge HCLKIN or negedge grstn or negedge RESETN) begin
    if (!grstn) begin
        reset_0 <= 1'b0;
    end else if (!RESETN) begin
        reset_0 <= 1'b0;
    end else begin
        reset_0 <= 1'b1;
    end
end

always @(posedge HCLKIN or negedge reset_0) begin
    if (!reset_0) begin
        calib_0 <= 1'b0;
    end else begin
        calib_0 <= ~CALIB;
    end
end

always @(posedge HCLKIN or negedge reset_0) begin
    if (!reset_0) begin
        calib_1 <= 0;
    end else begin
        calib_1 <= calib_0;
    end
end

always @(posedge HCLKIN or negedge reset_0) begin
    if (!reset_0) begin
        calib_2 <= 1'b0;
    end else begin
        calib_2 <= calib_1;
    end
end

assign calib_resetn =  ~(calib_1 && (~calib_2));
assign calib_en = ~(calib_resetn | (~select_no_3p5));

always @ (posedge HCLKIN or negedge reset_0)
begin
    if (!reset_0)  begin
        calib_state <= 1'b0;
    end else begin
        if (calib_en == 1'b1) begin
            calib_state <= ~calib_state;
        end else begin
            calib_state <= calib_state;
        end
    end
end

assign cnt_enable = (~((~calib_resetn)&calib_state) & select_no_3p5) | (calib_resetn & select3p5);

assign dsel_en = (d_sel& cnt_0 & cnt_1 & select3p5) | (calib_resetn & (~d_sel) & (~cnt_0) & cnt_1 & select3p5);

assign dsel_clk = HCLKIN ^ d_sel;
always @(posedge dsel_clk or negedge reset_0) begin
    if (!reset_0) begin
        d_sel  <= 1'b0;
    end else if(dsel_en == 1'b1) begin
        d_sel  <= ~d_sel;
    end else if(dsel_en == 1'b0) begin
        d_sel <= d_sel;
    end
end

assign cnt_reset = ((select3&((~cnt_2)&cnt_1&(~cnt_0))) | (select6&(cnt_2&(~cnt_1)&cnt_0)) | (select7&(cnt_2&cnt_1&(~cnt_0))) | (select5&(cnt_2&(~cnt_1)&(~cnt_0)))) | (select3p5 & (~d_sel) & (~cnt_0) & cnt_1);

always @(posedge HCLKIN or negedge reset_0) begin
    if (!reset_0) begin
        cnt_0  <= 1'b1;
    end else if(cnt_enable == 1'b1) begin
        cnt_0  <= ~(cnt_0 | cnt_reset);
    end else if(cnt_enable == 1'b0) begin
        cnt_0 <= cnt_0;
    end
end

always @(posedge HCLKIN or negedge reset_0) begin
    if (!reset_0) begin
        cnt_1  <= 1'b1;
    end else if(cnt_enable == 1'b1) begin
        cnt_1  <= ~(cnt_reset | (cnt_0 ^~ cnt_1));
    end else if(cnt_enable == 1'b0) begin
        cnt_1 <= cnt_1;
    end
end

always @(posedge HCLKIN or negedge reset_0) begin
    if (!reset_0) begin
        cnt_2  <= 1'b0;
    end else if(cnt_enable == 1'b1) begin
        cnt_2  <= ~(cnt_reset | (cnt_2 ^~ (cnt_0 & cnt_1)));
    end else if(cnt_enable == 1'b0) begin
        cnt_2 <= cnt_2;
    end
end

assign clk_div_0 = ~cnt_1;
always @(negedge HCLKIN or negedge reset_0) begin
    if(!reset_0)
        clk_div_1 <= 1'b0;
    else
        clk_div_1 <= clk_div_0;
end

assign clk_div = (d_sel == 1'b1) ? clk_div_1 : clk_div_0;
assign clk_div2 = ~cnt_0;
assign clk_div7_8 = cnt_2;

assign CLKOUT = (DIV_MODE == "1")? HCLKIN: ((DIV_MODE == "2")? clk_div2 : (((DIV_MODE == "7") || (DIV_MODE == "8")) ? clk_div7_8 : clk_div));

endmodule


//CLKDIV2
module CLKDIV2(CLKOUT, HCLKIN, RESETN);

input HCLKIN, RESETN;
output CLKOUT;

reg reset_0;
reg clk_div2;
wire grstn;

initial begin
    clk_div2 = 1'b0;
    reset_0 = 1'b0;
end

assign grstn = GSR.GSRO;

always @(posedge HCLKIN or negedge grstn or negedge RESETN) begin
    if (!grstn) begin
        reset_0 <= 1'b0;
    end else if (!RESETN) begin
        reset_0 <= 1'b0;
    end else begin
        reset_0 <= 1'b0;
    end
end

always @(posedge HCLKIN or negedge grstn or negedge RESETN) begin
    if (!grstn) begin
        clk_div2 <= 1'b0;
    end else if (!RESETN) begin
        clk_div2 <= 1'b0;
    end else begin
        clk_div2 <= (clk_div2 ^ (~reset_0));
    end
end

assign CLKOUT = clk_div2;

endmodule

// DHCE
module DHCE (CLKOUT, CLKIN, CEN);
input CLKIN;
input CEN;//CEN,active low
output CLKOUT;

reg ce_reg0,ce_reg1,ce_reg2,ce_reg3;
wire grstn;
assign grstn = GSR.GSRO;

always @(negedge CLKIN or negedge grstn) begin
    if(!grstn) begin
        ce_reg0 <= 1'b0;
        ce_reg1 <= 1'b0;
        ce_reg2 <= 1'b0;
        ce_reg3 <= 1'b0;
    end else begin
        ce_reg0 <= ~CEN;
        ce_reg1 <= ce_reg0;
        ce_reg2 <= ce_reg1;
        ce_reg3 <= ce_reg2;
    end
end

assign CLKOUT = CLKIN & ce_reg3;

endmodule

//OSC
//Fosc = 210M/FREQ_DIV
module OSC (OSCOUT);
parameter  FREQ_DIV = 100; // 3, 2~126(only even num)
output OSCOUT;

reg oscr;
realtime half_clk;

initial  begin
    oscr = 1'b0;
    half_clk = 	2.381*FREQ_DIV;
end

assign OSCOUT = oscr;

always
       begin
            #half_clk;
            oscr = 1'b1;	   
            #half_clk;
            oscr = 1'b0;
       end

endmodule


//OSCA, gw5a-25
//Fosc = 210M/FREQ_DIV
module OSCA (OSCOUT, OSCEN);
parameter  FREQ_DIV = 100; // 3, 2~126(only even num)
output OSCOUT;
input OSCEN;
reg oscr;
realtime half_clk;

initial  begin
    oscr = 1'b0;
    half_clk = 	2.381*FREQ_DIV;
end

assign OSCOUT = OSCEN ? oscr : 1'b1;

always
       begin
            #half_clk;
            oscr = 1'b1;	   
            #half_clk;
            oscr = 1'b0;
       end

endmodule


//PLL
module PLL (CLKOUT0, CLKOUT1, CLKOUT2, CLKOUT3, CLKOUT4, CLKOUT5, CLKOUT6, CLKFBOUT, LOCK, CLKIN, CLKFB, ENCLK0, ENCLK1, ENCLK2, ENCLK3, ENCLK4, ENCLK5, ENCLK6, FBDSEL, IDSEL, MDSEL, MDSEL_FRAC, ODSEL0, ODSEL0_FRAC, ODSEL1, ODSEL2, ODSEL3, ODSEL4, ODSEL5, ODSEL6, DT0, DT1, DT2, DT3, PSSEL, PSDIR, PSPULSE, SSCPOL, SSCON, SSCMDSEL, SSCMDSEL_FRAC, ICPSEL, LPFRES, LPFCAP, RESET, PLLPWD, RESET_I, RESET_O);
input CLKIN;
input CLKFB;
input RESET;
input PLLPWD;
input RESET_I;
input RESET_O;
input [5:0] FBDSEL;
input [5:0] IDSEL;
input [6:0] MDSEL;
input [2:0] MDSEL_FRAC;
input [6:0] ODSEL0;
input [2:0] ODSEL0_FRAC;
input [6:0] ODSEL1;
input [6:0] ODSEL2;
input [6:0] ODSEL3;
input [6:0] ODSEL4;
input [6:0] ODSEL5;
input [6:0] ODSEL6;

input [3:0] DT0,DT1,DT2,DT3;
input [5:0] ICPSEL;
input [2:0] LPFRES;
input [1:0] LPFCAP;

input [2:0] PSSEL;
input PSDIR;
input PSPULSE;

input ENCLK0;
input ENCLK1;
input ENCLK2;
input ENCLK3;
input ENCLK4;
input ENCLK5;
input ENCLK6;

input SSCPOL;
input SSCON;
input [6:0] SSCMDSEL;
input [2:0] SSCMDSEL_FRAC;

output LOCK;
output CLKOUT0;
output CLKOUT1;
output CLKOUT2;
output CLKOUT3;
output CLKOUT4;
output CLKOUT5;
output CLKOUT6;
output CLKFBOUT;

parameter FCLKIN = "100.0"; // frequency of the CLKIN(M)
parameter DYN_IDIV_SEL= "FALSE";//TRUE:IDSEL; FALSE:IDIV_SEL
parameter IDIV_SEL = 1; // 1~64
parameter DYN_FBDIV_SEL= "FALSE";//TRUE:FBDSEL; FALSE:FBDIV_SEL
parameter FBDIV_SEL = 1; // 1~64

parameter DYN_ODIV0_SEL= "FALSE";//TRUE:ODSEL0; FALSE:ODIV0_SEL
parameter ODIV0_SEL = 8; // 1~128
parameter DYN_ODIV1_SEL= "FALSE";//TRUE:ODSEL1; FALSE:ODIV1_SEL
parameter ODIV1_SEL = 8; // 1~128
parameter DYN_ODIV2_SEL= "FALSE";//TRUE:ODSEL2; FALSE:ODIV2_SEL
parameter ODIV2_SEL = 8; // 1~128
parameter DYN_ODIV3_SEL= "FALSE";//TRUE:ODSEL3; FALSE:ODIV3_SEL
parameter ODIV3_SEL = 8; // 1~128
parameter DYN_ODIV4_SEL= "FALSE";//TRUE:ODSEL4; FALSE:ODIV4_SEL
parameter ODIV4_SEL = 8; // 1~128
parameter DYN_ODIV5_SEL= "FALSE";//TRUE:ODSEL5; FALSE:ODIV5_SEL
parameter ODIV5_SEL = 8; // 1~128
parameter DYN_ODIV6_SEL= "FALSE";//TRUE:ODSEL6; FALSE:ODIV6_SEL
parameter ODIV6_SEL = 8; // 1~128
parameter DYN_MDIV_SEL= "FALSE";//TRUE:MDSEL; FALSE:MDIV_SEL
parameter MDIV_SEL = 8; // 2~128
parameter MDIV_FRAC_SEL = 0; // 0~7
parameter ODIV0_FRAC_SEL = 0; // 0~7

parameter CLKOUT0_EN = "TRUE";//"TRUE","FALSE"
parameter CLKOUT1_EN = "FALSE";//"TRUE","FALSE"
parameter CLKOUT2_EN = "FALSE";//"TRUE","FALSE"
parameter CLKOUT3_EN = "FALSE";//"TRUE","FALSE"
parameter CLKOUT4_EN = "FALSE";//"TRUE","FALSE"
parameter CLKOUT5_EN = "FALSE";//"TRUE","FALSE"
parameter CLKOUT6_EN = "FALSE";//"TRUE","FALSE"

parameter CLKFB_SEL = "INTERNAL"; // "INTERNAL", "EXTERNAL";

parameter DYN_DT0_SEL = "FALSE"; //TRUE:DT0; FALSE:CLKOUT0_DT_DIR & CLKOUT0_DT_STEP
parameter DYN_DT1_SEL = "FALSE"; //TRUE:DT1; FALSE:CLKOUT1_DT_DIR & CLKOUT1_DT_STEP
parameter DYN_DT2_SEL = "FALSE"; //TRUE:DT2; FALSE:CLKOUT2_DT_DIR & CLKOUT2_DT_STEP
parameter DYN_DT3_SEL = "FALSE"; //TRUE:DT3; FALSE:CLKOUT3_DT_DIR & CLKOUT3_DT_STEP
parameter CLKOUT0_DT_DIR = 1'b1; // CLKOUT0 dutycycle adjust direction. 1'b1: + ; 1'b0: -
parameter CLKOUT1_DT_DIR = 1'b1; // CLKOUT1 dutycycle adjust direction. 1'b1: + ; 1'b0: -
parameter CLKOUT2_DT_DIR = 1'b1; // CLKOUT2 dutycycle adjust direction. 1'b1: + ; 1'b0: -
parameter CLKOUT3_DT_DIR = 1'b1; // CLKOUT3 dutycycle adjust direction. 1'b1: + ; 1'b0: -
parameter CLKOUT0_DT_STEP = 0; // 0,1,2,4; 50ps/step
parameter CLKOUT1_DT_STEP = 0; // 0,1,2,4; 50ps/step
parameter CLKOUT2_DT_STEP = 0; // 0,1,2,4; 50ps/step
parameter CLKOUT3_DT_STEP = 0; // 0,1,2,4; 50ps/step

parameter CLK0_IN_SEL = 1'b0;//ODIV0 input source select. 1'b0:from VCO;1'b1:from CLKIN
parameter CLK0_OUT_SEL = 1'b0;//CLKOUT0 output select. 1'b0:DIV0 output; 1'b1:CLKIN
parameter CLK1_IN_SEL = 1'b0;//ODIV1 input source select. 1'b0:from VCO;1'b1:from CLKIN
parameter CLK1_OUT_SEL = 1'b0;//CLKOUT1 output select. 1'b0:DIV1 output; 1'b1:CLKIN
parameter CLK2_IN_SEL = 1'b0;//ODIV2 input source select. 1'b0:from VCO;1'b1:from CLKIN
parameter CLK2_OUT_SEL = 1'b0;//CLKOUT2 output select. 1'b0:DIV2 output; 1'b1:CLKIN
parameter CLK3_IN_SEL = 1'b0;//ODIV3 input source select. 1'b0:from VCO;1'b1:from CLKIN
parameter CLK3_OUT_SEL = 1'b0;//CLKOUT3 output select. 1'b0:DIV3 output; 1'b1:CLKIN
parameter CLK4_IN_SEL = 2'b00;//ODIV4 input source select.2'b00:from VCO;2'b10:from CLKIN;2'b01:from CASCADE
parameter CLK4_OUT_SEL = 1'b0;//CLKOUT4 output select. 1'b0:DIV4 output; 1'b1:CLKIN
parameter CLK5_IN_SEL = 1'b0;//ODIV5 input source select. 1'b0:from VCO;1'b1:from CLKIN
parameter CLK5_OUT_SEL = 1'b0;//CLKOUT5 output select. 1'b0:DIV5 output; 1'b1:CLKIN
parameter CLK6_IN_SEL = 1'b0;//ODIV6 input source select. 1'b0:from VCO;1'b1:from CLKIN
parameter CLK6_OUT_SEL = 1'b0;//CLKOUT6 output select. 1'b0:DIV6 output; 1'b1:CLKIN

parameter DYN_DPA_EN = "FALSE";//dynamic phaseshift adjustment Enable."TRUE","FALSE"

parameter CLKOUT0_PE_COARSE = 0;//0~127
parameter CLKOUT0_PE_FINE = 0;//0~7
parameter CLKOUT1_PE_COARSE = 0;//0~127
parameter CLKOUT1_PE_FINE = 0;//0~7
parameter CLKOUT2_PE_COARSE = 0;//0~127
parameter CLKOUT2_PE_FINE = 0;//0~7
parameter CLKOUT3_PE_COARSE = 0;//0~127
parameter CLKOUT3_PE_FINE = 0;//0~7
parameter CLKOUT4_PE_COARSE = 0;//0~127
parameter CLKOUT4_PE_FINE = 0;//0~7
parameter CLKOUT5_PE_COARSE = 0;//0~127
parameter CLKOUT5_PE_FINE = 0;//0~7
parameter CLKOUT6_PE_COARSE = 0;//0~127
parameter CLKOUT6_PE_FINE = 0;//0~7

parameter DYN_PE0_SEL = "FALSE";//"TRUE": select dpa port as the dynamic control signal for ODIV0 phase shift. "FALSE":select CLKOUT0_PE_COARSE & CLKOUT0_PE_FINE as the static control signal for ODIV0 phase shift
parameter DYN_PE1_SEL = "FALSE";//"TRUE": select dpa port as the dynamic control signal for ODIV1 phase shift. "FALSE":select CLKOUT1_PE_COARSE & CLKOUT1_PE_FINE as the static control signal for ODIV1 phase shift
parameter DYN_PE2_SEL = "FALSE";//"TRUE": select dpa port as the dynamic control signal for ODIV2 phase shift. "FALSE":select CLKOUT2_PE_COARSE & CLKOUT2_PE_FINE as the static control signal for ODIV2 phase shift
parameter DYN_PE3_SEL = "FALSE";//"TRUE": select dpa port as the dynamic control signal for ODIV3 phase shift. "FALSE":select CLKOUT3_PE_COARSE & CLKOUT3_PE_FINE as the static control signal for ODIV3 phase shift
parameter DYN_PE4_SEL = "FALSE";//"TRUE": select dpa port as the dynamic control signal for ODIV4 phase shift. "FALSE":select CLKOUT4_PE_COARSE & CLKOUT4_PE_FINE as the static control signal for ODIV4 phase shift
parameter DYN_PE5_SEL = "FALSE";//"TRUE": select dpa port as the dynamic control signal for ODIV5 phase shift. "FALSE":select CLKOUT5_PE_COARSE & CLKOUT5_PE_FINE as the static control signal for ODIV5 phase shift
parameter DYN_PE6_SEL = "FALSE";//"TRUE": select dpa port as the dynamic control signal for ODIV6 phase shift. "FALSE":select CLKOUT6_PE_COARSE & CLKOUT6_PE_FINE as the static control signal for ODIV6 phase shift

parameter DE0_EN = "FALSE";//"FALSE":fixed 50% duty cycle for case odiv0=2~128; "TRUE":select CLKOUT0_PE_COARSE & CLKOUT0_PE_FINE as duty edge when DYN_PE0_SEL="TRUE" for case ODIV0=2~128
parameter DE1_EN = "FALSE";//"FALSE":fixed 50% duty cycle for case odiv1=2~128; "TRUE":select CLKOUT1_PE_COARSE & CLKOUT1_PE_FINE as duty edge when DYN_PE1_SEL="TRUE" for case ODIV1=2~128
parameter DE2_EN = "FALSE";//"FALSE":fixed 50% duty cycle for case odiv2=2~128; "TRUE":select CLKOUT2_PE_COARSE & CLKOUT2_PE_FINE as duty edge when DYN_PE2_SEL="TRUE" for case ODIV2=2~128
parameter DE3_EN = "FALSE";//"FALSE":fixed 50% duty cycle for case odiv3=2~128; "TRUE":select CLKOUT3_PE_COARSE & CLKOUT3_PE_FINE as duty edge when DYN_PE3_SEL="TRUE" for case ODIV3=2~128
parameter DE4_EN = "FALSE";//"FALSE":fixed 50% duty cycle for case odiv4=2~128; "TRUE":select CLKOUT4_PE_COARSE & CLKOUT4_PE_FINE as duty edge when DYN_PE4_SEL="TRUE" for case ODIV4=2~128
parameter DE5_EN = "FALSE";//"FALSE":fixed 50% duty cycle for case odiv5=2~128; "TRUE":select CLKOUT5_PE_COARSE & CLKOUT5_PE_FINE as duty edge when DYN_PE5_SEL="TRUE" for case ODIV5=2~128
parameter DE6_EN = "FALSE";//"FALSE":fixed 50% duty cycle for case odiv6=2~128; "TRUE":select CLKOUT6_PE_COARSE & CLKOUT6_PE_FINE as duty edge when DYN_PE6_SEL="TRUE" for case ODIV6=2~128

parameter RESET_I_EN = "FALSE";//"TRUE","FALSE". Enable RESET_I through the dedicated signal from ciu.
parameter RESET_O_EN =  "FALSE";//"TRUE","FALSE". Enable RESET_S through the dedicated signal from ciu.

parameter DYN_ICP_SEL= "FALSE";//TRUE:ICPSEL; FALSE:ICP_SEL
parameter ICP_SEL = 6'bXXXXXX;//X means that software will automatically calculate and set this parameter.If the user wants to set it, use 6'b000000~6'b111111
parameter DYN_LPF_SEL= "FALSE";//TRUE:LPFRES,LPFCAP; FALSE:LPF_RES,LPF_CAP
parameter LPF_RES = 3'bXXX;//X means that software will automatically calculate and set this parameter.If the user wants to set it, use 3'b000(R0)/3'b001(R1)/3'b010(R2)/3'b011(R3)/3'b100(R4)/3'b101(R5)/3'b110(R6)/3'b111(R7)
parameter LPF_CAP = 2'b00;// 2'b00,C0 ;2'b01,C1; 2'b10,C2

parameter SSC_EN = "FALSE";//"FALSE","TRUE".ssc mode enable

wire resetn;
wire [6:0] IDIV_dyn,FBDIV_dyn;
wire [7:0] ODIV0_dyn,ODIV1_dyn,ODIV2_dyn,ODIV3_dyn,ODIV4_dyn,ODIV5_dyn,ODIV6_dyn,MDIV_dyn;
wire [2:0] ODIV0_f_dyn,MDIV_f_dyn;
wire [6:0] IDIV_SEL_reg,FBDIV_SEL_reg;
wire [7:0] ODIV0_SEL_reg,ODIV1_SEL_reg,ODIV2_SEL_reg,ODIV3_SEL_reg,ODIV4_SEL_reg,ODIV5_SEL_reg,ODIV6_SEL_reg,MDIV_SEL_reg;
wire [2:0] ODIV0_f_reg,MDIV_f_reg;
reg [6:0] IDIV_dyn_reg,FBDIV_dyn_reg;
reg [7:0] ODIV0_dyn_reg,ODIV1_dyn_reg,ODIV2_dyn_reg,ODIV3_dyn_reg,ODIV4_dyn_reg,ODIV5_dyn_reg,ODIV6_dyn_reg,MDIV_dyn_reg;
wire div_dyn_change;
reg clk_effect,oclk_effect;
realtime curtime,pretime,fb_delay;
realtime clkin_cycle[4:0];
realtime clkin_period,clkin_period1,vco_period,clkout0_period,clkout1_period,clkout2_period,clkout3_period,clkout4_period,clkout5_period,clkout6_period,clkfbout_period;
realtime clkout0_half,clkout1_half,clkout2_half,clkout3_half,clkout4_half,clkout5_half,clkout6_half,clkfbout_half;
real real_phase0,real_duty0,real_phase1,real_duty1,real_phase2,real_duty2,real_phase3,real_duty3,real_phase4,real_duty4,real_phase5,real_duty5,real_phase6,real_duty6;
realtime phase_value0,clkout0_duty,clkout1_duty,tclk0_duty,tclk1_duty;
realtime phase_value1,phase_value2,phase_value3,clkout2_duty,clkout3_duty;
realtime phase_value4,phase_value5,phase_value6,clkout4_duty,clkout5_duty,clkout6_duty,tclk2_duty,tclk3_duty;
realtime clkfb_curtime,clkin_curtime,FB_dly,FB_dly0;
reg clkin_init,fb_clk_init;
reg clk0_reg,clk1_reg,clk2_reg,clk3_reg,clk4_reg,clk5_reg,clk6_reg,clkfb_reg,clk0,clk1,clk2,clk3,clk4,clk5,clk6,clkfb;
reg [2:0] fine_dyn_0,fine_dyn_1,fine_dyn_2,fine_dyn_3,fine_dyn_4,fine_dyn_5,fine_dyn_6;
integer coarse_dyn_0,coarse_dyn_1,coarse_dyn_2,coarse_dyn_3,coarse_dyn_4,coarse_dyn_5,coarse_dyn_6;
reg ps_pulse_pre;
reg clkout_0,clkout0_ps,clk0_out,clkout_1,clkout1_ps,clk1_out,clkout_2,clkout2_ps,clk2_out,clkout_3,clkout3_ps,clk3_out,clkout_4,clkout4_ps,clk4_out,clkout_5,clkout5_ps,clk5_out,clkout_6,clkout6_ps,clk6_out,clkfb_out,clkout_fb;
wire clk0_dt_dir,clk1_dt_dir,clk3_dt_dir,clk4_dt_dir;
wire [2:0] clk0_dt_step,clk1_dt_step,clk2_dt_step,clk3_dt_step;
realtime clk0_dt_delay,clk1_dt_delay,clk2_dt_delay,clk3_dt_delay;
reg clkout_dt_0,clkout_dt_1,clkout_dt_2,clkout_dt_3;

reg lock_reg;
reg [2:0] fine_0,fine_1,fine_2,fine_3,fine_4,fine_5,fine_6;
integer coarse_0,coarse_1,coarse_2,coarse_3,coarse_4,coarse_5,coarse_6;
real unit_duty=1.0, unit_phase=1.0;
real unit_div=1.0, real_fbdiv=1.0;
integer multi_clkin;
reg clkfb_init;
reg pssel_0_flag,pssel_1_flag,pssel_2_flag,pssel_3_flag,pssel_4_flag,pssel_5_flag,pssel_6_flag;
reg cken0,cken1,cken2,cken3,cken4,cken5,cken6;
wire reseti, reseto;

initial begin
clkin_cycle[0] = 0.0;
clkin_cycle[1] = 0.0;
clkin_cycle[2] = 0.0;
clkin_cycle[3] = 0.0;
clkin_cycle[4] = 0.0;
clkin_period = 0.0;
clkin_period1 = 0.0;
vco_period = 0.0;
clkout0_period = 0.0;
clkout1_period = 0.0;
clkout2_period = 0.0;
clkout3_period = 0.0;
clkout4_period = 0.0;
clkout5_period = 0.0;
clkout6_period = 0.0;
clkfbout_period = 0.0;
clkout0_half = 0.0;
clkout1_half = 0.0;
clkout2_half = 0.0;
clkout3_half = 0.0;
clkout4_half = 0.0;
clkout5_half = 0.0;
clkout6_half = 0.0;
clkfbout_half = 0.0;
clk_effect = 1'b0;
oclk_effect = 1'b0;
clk0_reg = 1'b0;
clk1_reg = 1'b0;
clk2_reg = 1'b0;
clk3_reg = 1'b0;
clk4_reg = 1'b0;
clk5_reg = 1'b0;
clk6_reg = 1'b0;
clkfb_reg = 1'b0;
clk0 = 1'b0;
clk1 = 1'b0;
clk2 = 1'b0;
clk3 = 1'b0;
clk4 = 1'b0;
clk5 = 1'b0;
clk6 = 1'b0;
clkfb = 1'b0;
clk0_out = 1'b0;
clk1_out = 1'b0;
clk2_out = 1'b0;
clk3_out = 1'b0;
clk4_out = 1'b0;
clk5_out = 1'b0;
clk6_out = 1'b0;
clkfb_out = 1'b0;
clkout0_ps = 1'b0;
clkout1_ps = 1'b0;
clkout2_ps = 1'b0;
clkout3_ps = 1'b0;
clkout4_ps = 1'b0;
clkout5_ps = 1'b0;
clkout6_ps = 1'b0;
clkout_fb = 1'b0;
clkout_0 = 1'b0;
clkout_1 = 1'b0;
clkout_2 = 1'b0;
clkout_3 = 1'b0;
clkout_4 = 1'b0;
clkout_5 = 1'b0;
clkout_6 = 1'b0;
clkin_init = 1'b1;
fb_clk_init = 1'b1;
clkfb_init = 1'b1;
FB_dly = 0.0;
FB_dly0 = 0.0;
clkin_curtime = 0.0;
clkfb_curtime = 0.0;
lock_reg = 0;
fine_dyn_0 = 0;
fine_dyn_1 = 0;
fine_dyn_2 = 0;
fine_dyn_4 = 0;
fine_dyn_5 = 0;
fine_dyn_6 = 0;
coarse_dyn_0 = 0;
coarse_dyn_1 = 0;
coarse_dyn_2 = 0;
coarse_dyn_3 = 0;
coarse_dyn_4 = 0;
coarse_dyn_5 = 0;
coarse_dyn_6 = 0;
fine_0 = 0;
fine_1 = 0;
fine_2 = 0;
fine_3 = 0;
fine_4 = 0;
fine_5 = 0;
fine_6 = 0;
coarse_0 = 0;
coarse_1 = 0;
coarse_2 = 0;
coarse_3 = 0;
coarse_4 = 0;
coarse_5 = 0;
coarse_6 = 0;

////////////
end

assign reseti = (RESET_I_EN == "TRUE") ? RESET_I : 1'b0;
assign reseto = (RESET_O_EN == "TRUE") ? RESET_O : 1'b0;

assign resetn = ~(RESET | PLLPWD | reseti);

// determine period of CLKIN and clkout
always @(posedge CLKIN or negedge resetn) begin
    if(!resetn) begin
        clk_effect <= 1'b0;
        clkin_cycle[0] <= 0;
    end else begin
        pretime <= curtime;
        curtime <= $realtime;

        if(pretime>0) begin
	        clkin_cycle[0] <= curtime -  pretime;
        end

        if(clkin_cycle[0] > 0) begin
            clkin_cycle[1] <= clkin_cycle[0];
	        clkin_cycle[2] <= clkin_cycle[1];
	        clkin_cycle[3] <= clkin_cycle[2];
            clkin_cycle[4] <= clkin_cycle[3];
        end
    
        if (clkin_cycle[0] > 0) begin
            if(((clkin_cycle[0] - clkin_period1 < 0.01) && (clkin_cycle[0] - clkin_period1 > -0.01)) &&(!div_dyn_change)) begin
                clk_effect <= 1'b1;
                clkin_period <= clkin_period1;
            end else begin
                clk_effect <= 1'b0;
            end
        end
    end
end

always @(clkin_cycle[0] or clkin_cycle[1] or clkin_cycle[2] or clkin_cycle[3] or clkin_cycle[4]  or clkin_period1) begin
    if(clkin_cycle[0]!=clkin_period1) begin
		clkin_period1 <= (clkin_cycle[0]+clkin_cycle[1]+clkin_cycle[2]+clkin_cycle[3]+clkin_cycle[4])/5;
    end
end

assign IDIV_dyn = 64 - IDSEL;
assign FBDIV_dyn = 64 - FBDSEL;
assign ODIV0_dyn = 128 - ODSEL0;
assign ODIV1_dyn = 128 - ODSEL1;
assign ODIV2_dyn = 128 - ODSEL2;
assign ODIV3_dyn = 128 - ODSEL3;
assign ODIV4_dyn = 128 - ODSEL4;
assign ODIV5_dyn = 128 - ODSEL5;
assign ODIV6_dyn = 128 - ODSEL6;
assign MDIV_dyn = 128 - MDSEL;
assign MDIV_f_dyn = 7 - MDSEL_FRAC;
assign ODIV0_f_dyn = 7 - ODSEL0_FRAC;

assign IDIV_SEL_reg = (DYN_IDIV_SEL == "TRUE") ? IDIV_dyn : IDIV_SEL;
assign FBDIV_SEL_reg = (DYN_FBDIV_SEL == "TRUE") ? FBDIV_dyn : FBDIV_SEL;
assign ODIV0_SEL_reg = (DYN_ODIV0_SEL == "TRUE") ? ODIV0_dyn : ODIV0_SEL;
assign ODIV1_SEL_reg = (DYN_ODIV1_SEL == "TRUE") ? ODIV1_dyn : ODIV1_SEL;
assign ODIV2_SEL_reg = (DYN_ODIV2_SEL == "TRUE") ? ODIV2_dyn : ODIV2_SEL;
assign ODIV3_SEL_reg = (DYN_ODIV3_SEL == "TRUE") ? ODIV3_dyn : ODIV3_SEL;
assign ODIV4_SEL_reg = (DYN_ODIV4_SEL == "TRUE") ? ODIV4_dyn : ODIV4_SEL;
assign ODIV5_SEL_reg = (DYN_ODIV5_SEL == "TRUE") ? ODIV5_dyn : ODIV5_SEL;
assign ODIV6_SEL_reg = (DYN_ODIV6_SEL == "TRUE") ? ODIV6_dyn : ODIV6_SEL;
assign MDIV_SEL_reg = (DYN_MDIV_SEL == "TRUE") ? MDIV_dyn : MDIV_SEL;
assign ODIV0_f_reg = (DYN_ODIV0_SEL == "TRUE") ? ODIV0_f_dyn : ODIV0_FRAC_SEL;
assign MDIV_f_reg = (DYN_MDIV_SEL == "TRUE") ? MDIV_f_dyn : MDIV_FRAC_SEL;


always @(posedge CLKIN) begin
    IDIV_dyn_reg <= IDIV_dyn;
    FBDIV_dyn_reg <= FBDIV_dyn;
    ODIV0_dyn_reg <= ODIV0_dyn;
    ODIV1_dyn_reg <= ODIV1_dyn;
    ODIV2_dyn_reg <= ODIV2_dyn;
    ODIV3_dyn_reg <= ODIV3_dyn;
    ODIV4_dyn_reg <= ODIV4_dyn;
    ODIV5_dyn_reg <= ODIV5_dyn;
    ODIV6_dyn_reg <= ODIV6_dyn;
    MDIV_dyn_reg <= MDIV_dyn;
end
assign div_dyn_change = (IDIV_dyn_reg != IDIV_dyn) || (FBDIV_dyn_reg != FBDIV_dyn) || (ODIV0_dyn_reg != ODIV0_dyn) || (ODIV1_dyn_reg != ODIV1_dyn) || (ODIV2_dyn_reg != ODIV2_dyn) || (ODIV3_dyn_reg != ODIV3_dyn) || (ODIV4_dyn_reg != ODIV4_dyn) || (ODIV5_dyn_reg != ODIV5_dyn) || (ODIV6_dyn_reg != ODIV6_dyn) || (MDIV_dyn_reg != MDIV_dyn);


always @(clkin_period or IDIV_SEL_reg or FBDIV_SEL_reg or ODIV0_SEL_reg) begin
    real_fbdiv = (FBDIV_SEL_reg * unit_div);
    if(CLKFB_SEL == "INTERNAL") 
    begin
        vco_period = ((clkin_period * IDIV_SEL_reg) / real_fbdiv) / (MDIV_SEL_reg + MDIV_f_reg/8.0);
    end else begin
        if(ODIV0_SEL_reg == 1) 
        begin
            vco_period = ((clkin_period * IDIV_SEL_reg) / real_fbdiv) / (ODIV0_SEL_reg);
        end else begin
            vco_period = ((clkin_period * IDIV_SEL_reg) / real_fbdiv) / (ODIV0_SEL_reg + ODIV0_f_reg/8.0);
        end
    end
end

always @(*)
begin
    if (CLK0_IN_SEL == 1'b0) begin
        if(ODIV0_SEL_reg == 1)
        begin
            clkout0_period = (vco_period * (ODIV0_SEL_reg));
        end else begin
            clkout0_period = (vco_period * (ODIV0_SEL_reg + ODIV0_f_reg/8.0));        
        end
    end else if (CLK0_IN_SEL == 1'b1) begin
        clkout0_period = (clkin_period * ODIV0_SEL_reg);
    end
end

always @(*)
begin
    if (CLK1_IN_SEL == 1'b0) begin
        clkout1_period = (vco_period * ODIV1_SEL_reg);
    end else if (CLK1_IN_SEL == 1'b1) begin
        clkout1_period = (clkin_period * ODIV1_SEL_reg);
    end
end

always @(*)
begin
    if (CLK2_IN_SEL == 1'b0) begin
        clkout2_period = (vco_period * ODIV2_SEL_reg);
    end else if (CLK2_IN_SEL == 1'b1) begin
        clkout2_period = (clkin_period * ODIV2_SEL_reg);
    end
end

always @(*)
begin
    if (CLK3_IN_SEL == 1'b0) begin
        clkout3_period = (vco_period * ODIV3_SEL_reg);
    end else if (CLK3_IN_SEL == 1'b1) begin
        clkout3_period = (clkin_period * ODIV3_SEL_reg);
    end
end
    
always @(*)
begin
    if (CLK4_IN_SEL == 2'b00) begin
        clkout4_period = (vco_period * ODIV4_SEL_reg);
    end else if (CLK4_IN_SEL == 2'b01) begin
        clkout4_period = (clkout6_period * ODIV4_SEL_reg);
    end else if (CLK4_IN_SEL == 2'b10) begin
        clkout4_period = (clkin_period * ODIV4_SEL_reg);
    end
end

always @(*)
begin
    if (CLK5_IN_SEL == 1'b0) begin
        clkout5_period = (vco_period * ODIV5_SEL_reg);
    end else if (CLK5_IN_SEL == 1'b1) begin
        clkout5_period = (clkin_period * ODIV5_SEL_reg);
    end
end

always @(*)
begin
    if (CLK6_IN_SEL == 1'b0) begin
        clkout6_period = (vco_period * ODIV6_SEL_reg);
    end else if (CLK6_IN_SEL == 1'b1) begin
        clkout6_period = (clkin_period * ODIV6_SEL_reg);
    end
end
 
always @(*)
begin
 clkfbout_period = (vco_period * (MDIV_SEL_reg + MDIV_f_reg/8.0));
end

always@(clkout0_period or clkout1_period or clkout2_period or clkout3_period or clkout4_period or clkout5_period or clkout6_period or clkfbout_period)
begin
    clkout0_half = (clkout0_period / 2.0);
    clkout1_half = (clkout1_period / 2.0);
    clkout2_half = (clkout2_period / 2.0);
    clkout3_half = (clkout3_period / 2.0);
    clkout4_half = (clkout4_period / 2.0);
    clkout5_half = (clkout5_period / 2.0);
    clkout6_half = (clkout6_period / 2.0);
    clkfbout_half = (clkfbout_period / 2.0);
end

realtime clk_tlock_cur;
realtime max_tlock;
integer cnt_lock;
initial begin
    clk_tlock_cur = 0.0;
    max_tlock = 0.0;
    cnt_lock = 0;
end

// lock time
assign rst = RESET | PLLPWD | reseti | reseto;

always @(posedge CLKIN or posedge rst) begin
    if (rst == 1'b1) begin
        max_tlock <= 0.0;
    end else begin
        if((clkin_cycle[0] >= 2) && (clkin_cycle[0] <= 40)) begin
            max_tlock <= 50000;
        end else if ((clkin_cycle[0] > 40) && (clkin_cycle[0] <= 500)) begin
            max_tlock <= 200000;
        end
    end
end

always @(posedge CLKIN or posedge rst) begin
    if (rst == 1'b1) begin
        lock_reg <= 1'b0;
        oclk_effect <= 1'b0;
    end else begin
        if(clk_effect == 1'b1) begin
            cnt_lock <= cnt_lock + 1;

            if(cnt_lock > ((max_tlock/clkin_period) - 10)) begin
                oclk_effect <= 1'b1;
            end else begin
                oclk_effect <= 1'b0;
            end

            if(cnt_lock > (max_tlock/clkin_period)) begin
                lock_reg <= 1'b1;
            end else begin
                lock_reg <= 1'b0;
            end
        end else begin
            oclk_effect <= 1'b0;
            cnt_lock <= 0;
            lock_reg <= 1'b0;
        end
    end
end

assign LOCK = (CLKFB_SEL == "EXTERNAL" && CLK0_IN_SEL == 1'b1)? 1'b0 : lock_reg; 

// calculate CLKFB feedback delay
always @(posedge CLKIN) begin
    if (clkin_init == 1'b1) begin
        clkin_curtime=$realtime;
        clkin_init = 1'b0;
    end
end

always @(posedge CLKFB) begin
    if (fb_clk_init == 1'b1) begin
        clkfb_curtime=$realtime;
        fb_clk_init = 1'b0;
    end
end

always @(CLKFB or CLKIN) begin
    if ((clkfb_curtime > 0) && (clkin_curtime > 0)) begin
        FB_dly0 = clkfb_curtime - clkin_curtime;
        if ((FB_dly0 >= 0) && (clkin_cycle[0] > 0)) begin
            multi_clkin = FB_dly0 / (clkin_cycle[0]);
            FB_dly = clkin_cycle[0] - (FB_dly0 - (clkin_cycle[0]) * multi_clkin);
        end
    end
end

always @(clk0_reg or clk1_reg or clk2_reg or clk3_reg or clk4_reg or clk5_reg or clk6_reg or clkfb_reg or oclk_effect) begin
    if(oclk_effect == 1'b0) begin
        clk0_reg = 1'b0;
        clk1_reg = 1'b0;
        clk2_reg = 1'b0;
        clk3_reg = 1'b0;
        clk4_reg = 1'b0;
        clk5_reg = 1'b0;
        clk6_reg = 1'b0;
        clkfb_reg = 1'b0;
    end
    else begin
        if(clkfb_init == 1'b1) begin
            clk0_reg <= 1'b1;
            clk1_reg <= 1'b1;
            clk2_reg <= 1'b1;
            clk3_reg <= 1'b1;
            clk4_reg <= 1'b1;
            clk5_reg <= 1'b1;
            clk6_reg <= 1'b1;
            clkfb_reg <= 1'b1;
            clkfb_init = 1'b0;
        end
        else begin
            clk0_reg <= #clkout0_half ~clk0_reg;
            clk1_reg <= #clkout1_half ~clk1_reg;
            clk2_reg <= #clkout2_half ~clk2_reg;
            clk3_reg <= #clkout3_half ~clk3_reg;
            clk4_reg <= #clkout4_half ~clk4_reg;
            clk5_reg <= #clkout5_half ~clk5_reg;
            clk6_reg <= #clkout6_half ~clk6_reg;
            clkfb_reg <= #clkfbout_half ~clkfb_reg;
         end
    end
end

always @(clk0_reg or clk1_reg or clk2_reg or clk3_reg or clk4_reg or clk5_reg or clk6_reg or clkfb_reg or FB_dly) begin
    if (CLKFB_SEL == "INTERNAL") begin
        clk0 <= clk0_reg;
        clk1 <= clk1_reg;
        clk2 <= clk2_reg;
        clk3 <= clk3_reg;
        clk4 <= clk4_reg;
        clk5 <= clk5_reg;
        clk6 <= clk6_reg;
        clkfb <= clkfb_reg;
     end else begin   
        clk0 <= #(FB_dly) clk0_reg;
        clk1 <= #(FB_dly) clk1_reg;
        clk2 <= #(FB_dly) clk2_reg;
        clk3 <= #(FB_dly) clk3_reg;
        clk4 <= #(FB_dly) clk4_reg;
        clk5 <= #(FB_dly) clk5_reg;
        clk6 <= #(FB_dly) clk6_reg;
        clkfb <= #(FB_dly) clkfb_reg;
     end
end

//dynamic phase shift
always @(*)
begin
    
    if(PSSEL == 3'b000)
    begin
        pssel_0_flag <= 1'b1;
        pssel_1_flag <= 1'b0;
        pssel_2_flag <= 1'b0;
        pssel_3_flag <= 1'b0;
        pssel_4_flag <= 1'b0;
        pssel_5_flag <= 1'b0;
        pssel_6_flag <= 1'b0;
        #1;
        pssel_0_flag <= 1'b0;
    end else if(PSSEL == 3'b001)
    begin
        pssel_0_flag <= 1'b0;
        pssel_1_flag <= 1'b1;
        pssel_2_flag <= 1'b0;
        pssel_3_flag <= 1'b0;
        pssel_4_flag <= 1'b0;
        pssel_5_flag <= 1'b0;
        pssel_6_flag <= 1'b0;
        #1;
        pssel_1_flag <= 1'b0;
    end else if(PSSEL == 3'b010)
    begin
        pssel_0_flag <= 1'b0;
        pssel_1_flag <= 1'b0;
        pssel_2_flag <= 1'b1;
        pssel_3_flag <= 1'b0;
        pssel_4_flag <= 1'b0;
        pssel_5_flag <= 1'b0;
        pssel_6_flag <= 1'b0;
         #1;
        pssel_2_flag <= 1'b0;
    end else if(PSSEL == 3'b011)
    begin
        pssel_0_flag <= 1'b0;
        pssel_1_flag <= 1'b0;
        pssel_2_flag <= 1'b0;
        pssel_3_flag <= 1'b1;
        pssel_4_flag <= 1'b0;
        pssel_5_flag <= 1'b0;
        pssel_6_flag <= 1'b0;
         #1;
        pssel_3_flag <= 1'b0;
    end else if(PSSEL == 3'b100)
    begin
        pssel_0_flag <= 1'b0;
        pssel_1_flag <= 1'b0;
        pssel_2_flag <= 1'b0;
        pssel_3_flag <= 1'b0;
        pssel_4_flag <= 1'b1;
        pssel_5_flag <= 1'b0;
        pssel_6_flag <= 1'b0;
         #1;
        pssel_4_flag <= 1'b0;
    end else if(PSSEL == 3'b101)
    begin
        pssel_0_flag <= 1'b0;
        pssel_1_flag <= 1'b0;
        pssel_2_flag <= 1'b0;
        pssel_3_flag <= 1'b0;
        pssel_4_flag <= 1'b0;
        pssel_5_flag <= 1'b1;
        pssel_6_flag <= 1'b0;
         #1;
        pssel_5_flag <= 1'b0;
    end else if(PSSEL == 3'b110)
    begin
        pssel_0_flag <= 1'b0;
        pssel_1_flag <= 1'b0;
        pssel_2_flag <= 1'b0;
        pssel_3_flag <= 1'b0;
        pssel_4_flag <= 1'b0;
        pssel_5_flag <= 1'b0;
        pssel_6_flag <= 1'b1;
         #1;
        pssel_6_flag <= 1'b0;
    end
end

always @(PSPULSE)
begin
    ps_pulse_pre <= PSPULSE;
end

always @(*)
begin
    if (resetn == 1'b0)
    begin
        fine_dyn_0 <= 0;
        fine_dyn_1<= 0;
        fine_dyn_2 <= 0;
        fine_dyn_3 <= 0;
        fine_dyn_4 <= 0;
        fine_dyn_5 <= 0;
        fine_dyn_6 <= 0;
        coarse_dyn_0 <= 0;
        coarse_dyn_1 <= 0;
        coarse_dyn_2 <= 0;
        coarse_dyn_3 <= 0;
        coarse_dyn_4 <= 0;
        coarse_dyn_5 <= 0;
        coarse_dyn_6 <= 0;
     end else
    begin
        
        if (PSSEL == 3'b000)
        begin
            if(pssel_0_flag == 1'b1)
            begin
                fine_dyn_0 <= 0;
                coarse_dyn_0 <= 0;
            end else begin
            if (PSPULSE === 1'b0 && ps_pulse_pre === 1'b1)
            begin
                if (PSDIR == 1'b0)
                begin
                    if(ODIV0_SEL_reg == 1)
                    begin
                        coarse_dyn_0 <= 0;
                    end else begin
                        if(fine_dyn_0 == 7)
                        begin
                            coarse_dyn_0 <= coarse_dyn_0 + 1;
                            if (coarse_dyn_0 == (ODIV0_SEL_reg - 1)) 
                            begin
                                coarse_dyn_0 <= 0;
                            end
                        end
                    end

                    fine_dyn_0 <= fine_dyn_0 + 1;
                end else
                begin
                    if(ODIV0_SEL_reg == 1)
                    begin
                        coarse_dyn_0 <= 0;
                    end else begin
                        if(fine_dyn_0 == 0)
                        begin
                            coarse_dyn_0 <= coarse_dyn_0 - 1;
                            if (coarse_dyn_0 == 0)
                            begin
                                coarse_dyn_0 <= (ODIV0_SEL_reg - 1); 
                            end
                        end
                    end

                    fine_dyn_0 <= fine_dyn_0 - 1;
                end
            end
        end     
        end else if (PSSEL == 3'b001)
        begin
            if(pssel_1_flag == 1'b1)
            begin
                fine_dyn_1 <= 0;
                coarse_dyn_1 <= 0;
            end else begin
            if (PSPULSE === 1'b0 && ps_pulse_pre === 1'b1)
            begin
                if (PSDIR == 1'b0)
                begin
                    if(ODIV1_SEL_reg == 1)
                    begin
                        coarse_dyn_1 <= 0;
                    end else begin
                        if(fine_dyn_1 == 7)
                        begin
                            coarse_dyn_1 <= coarse_dyn_1 + 1;
                            if (coarse_dyn_1 == (ODIV1_SEL_reg - 1))
                            begin
                                coarse_dyn_1 <= 0;
                            end
                        end
                    end

                    fine_dyn_1 <= fine_dyn_1 + 1;
                end else
                begin
                    if(ODIV1_SEL_reg == 1)
                    begin
                        coarse_dyn_1 <= 0;
                    end else begin
                        if(fine_dyn_1 == 0)
                        begin
                            coarse_dyn_1 <= coarse_dyn_1 - 1;
                            if (coarse_dyn_1 == 0)
                            begin
                                coarse_dyn_1 <= (ODIV1_SEL_reg - 1);
                            end
                        end
                    end

                    fine_dyn_1 <= fine_dyn_1 - 1;
                end
            end
        end     
        end else if (PSSEL == 3'b010)
        begin
            if(pssel_2_flag == 1'b1)
            begin
                fine_dyn_2 <= 0;
                coarse_dyn_2 <= 0;
            end else begin
            if (PSPULSE === 1'b0 && ps_pulse_pre === 1'b1)
            begin
                if (PSDIR == 1'b0)
                begin
                    if(ODIV2_SEL_reg == 1)
                    begin
                        coarse_dyn_2 <= 0;
                    end else begin
                        if(fine_dyn_2 == 7)
                        begin
                            coarse_dyn_2 <= coarse_dyn_2 + 1;
                            if (coarse_dyn_2 == (ODIV2_SEL_reg - 1))
                            begin
                                coarse_dyn_2 <= 0;
                            end
                        end
                    end

                    fine_dyn_2 <= fine_dyn_2 + 1;
                end else
                begin
                    if(ODIV2_SEL_reg == 1)
                    begin
                        coarse_dyn_2 <= 0;
                    end else begin
                        if(fine_dyn_2 == 0)
                        begin
                            coarse_dyn_2 <= coarse_dyn_2 - 1;
                            if (coarse_dyn_2 == 0)
                            begin
                                coarse_dyn_2 <= (ODIV2_SEL_reg - 1);
                            end
                        end
                    end

                    fine_dyn_2 <= fine_dyn_2 - 1;
                end
            end
        end
        end else if (PSSEL == 3'b011)
        begin
            if(pssel_3_flag == 1'b1)
            begin
                fine_dyn_3 <= 0;
                coarse_dyn_3 <= 0;
            end else begin
            if (PSPULSE === 1'b0 && ps_pulse_pre === 1'b1)
            begin
                if (PSDIR == 1'b0)
                begin
                    if(ODIV3_SEL_reg == 1)
                    begin
                        coarse_dyn_3 <= 0;
                    end else begin
                        if(fine_dyn_3 == 7)
                        begin
                            coarse_dyn_3 <= coarse_dyn_3 + 1;
                            if (coarse_dyn_3 == (ODIV3_SEL_reg - 1))
                            begin
                                coarse_dyn_3 <= 0;
                            end
                        end
                    end

                    fine_dyn_3 <= fine_dyn_3 + 1;
                end else
                begin
                    if(ODIV3_SEL_reg == 1) 
                    begin
                        coarse_dyn_3 <= 0;
                    end else begin
                        if(fine_dyn_3 == 0)
                        begin
                            coarse_dyn_3 <= coarse_dyn_3 - 1;
                            if (coarse_dyn_3 == 0)
                            begin
                                coarse_dyn_3 <= (ODIV3_SEL_reg - 1);
                            end
                        end
                    end

                    fine_dyn_3 <= fine_dyn_3 - 1;
                end
            end
        end
        end else if (PSSEL == 3'b100)
        begin
            if(pssel_4_flag == 1'b1)
            begin
                fine_dyn_4 <= 0;
                coarse_dyn_4 <= 0;
            end else begin
            if (PSPULSE === 1'b0 && ps_pulse_pre === 1'b1)
            begin
                if (PSDIR == 1'b0)
                begin
                    if(ODIV4_SEL_reg == 1)
                    begin
                        coarse_dyn_4 <= 0;
                    end else begin
                        if(fine_dyn_4 == 7)
                        begin
                            coarse_dyn_4 <= coarse_dyn_4 + 1;
                            if (coarse_dyn_4 == (ODIV4_SEL_reg - 1))
                            begin
                                coarse_dyn_4 <= 0;
                            end
                        end
                    end

                    fine_dyn_4 <= fine_dyn_4 + 1;
                end else
                begin
                    if(ODIV4_SEL_reg == 1) 
                    begin
                        coarse_dyn_4 <= 0;
                    end else begin
                        if(fine_dyn_4 == 0)
                        begin
                            coarse_dyn_4 <= coarse_dyn_4 - 1;
                            if (coarse_dyn_4 == 0)
                            begin
                                coarse_dyn_4 <= (ODIV4_SEL_reg - 1);
                            end
                        end
                    end

                    fine_dyn_4 <= fine_dyn_4 - 1;
                end
            end
        end
        end else if (PSSEL == 3'b101)
        begin
            if(pssel_5_flag == 1'b1)
            begin
                fine_dyn_5 <= 0;
                coarse_dyn_5 <= 0;
            end else begin
            if (PSPULSE === 1'b0 && ps_pulse_pre === 1'b1)
            begin
                if (PSDIR == 1'b0)
                begin
                    if(ODIV5_SEL_reg == 1)
                    begin
                        coarse_dyn_5 <= 0;
                    end else begin
                        if(fine_dyn_5 == 7)
                        begin
                            coarse_dyn_5 <= coarse_dyn_5 + 1;
                            if (coarse_dyn_5 == (ODIV5_SEL_reg - 1))
                            begin
                                coarse_dyn_5 <= 0;
                            end
                        end
                    end

                    fine_dyn_5 <= fine_dyn_5 + 1;
                end else
                begin
                    if(ODIV5_SEL_reg == 1) 
                    begin
                        coarse_dyn_5 <= 0;
                    end else begin
                        if(fine_dyn_5 == 0)
                        begin
                            coarse_dyn_5 <= coarse_dyn_5 - 1;
                            if (coarse_dyn_5 == 0)
                            begin
                                coarse_dyn_5 <= (ODIV5_SEL_reg - 1);
                            end
                        end
                    end

                    fine_dyn_5 <= fine_dyn_5 - 1;
                end
            end
        end
        end else if (PSSEL == 3'b110)
        begin
            if(pssel_6_flag == 1'b1)
            begin
                fine_dyn_6 <= 0;
                coarse_dyn_6 <= 0;
            end else begin
            if (PSPULSE === 1'b0 && ps_pulse_pre === 1'b1)
            begin
                if (PSDIR == 1'b0)
                begin
                    if(ODIV6_SEL_reg == 1)
                    begin
                        coarse_dyn_6 <= 0;
                    end else begin
                        if(fine_dyn_6 == 7)
                        begin
                            coarse_dyn_6 <= coarse_dyn_6 + 1;
                            if (coarse_dyn_6 == (ODIV6_SEL_reg - 1))
                            begin
                                coarse_dyn_6 <= 0;
                            end
                        end
                    end

                    fine_dyn_6 <= fine_dyn_6 + 1;
                end else
                begin
                    if(ODIV6_SEL_reg == 1) 
                    begin
                        coarse_dyn_6 <= 0;
                    end else begin
                        if(fine_dyn_6 == 0)
                        begin
                            coarse_dyn_6 <= coarse_dyn_6 - 1;
                            if (coarse_dyn_6 == 0)
                            begin
                                coarse_dyn_6 <= (ODIV6_SEL_reg - 1);
                            end
                        end
                    end

                    fine_dyn_6 <= fine_dyn_6 - 1;
                end
            end
            end
        end


    end
end

//clkfbout
//
always @(posedge clkfb) begin
    clkout_fb <= 1'b1;
    #clkfbout_half
    clkout_fb <= 1'b0;
end

always @(CLKIN or oclk_effect or clkout_fb or resetn or reseto) begin
    if (resetn == 1'b0) begin
        clkfb_out <= 1'b0;
    end else if (reseto == 1'b1) begin
        clkfb_out <= 1'b0;
    end else begin
        clkfb_out <= clkout_fb;
    end
end

assign CLKFBOUT = clkfb_out;

// clkout0
//
always @(*)
begin
    if(DYN_PE0_SEL == "TRUE" && DYN_DPA_EN == "TRUE")
    begin
        fine_0 = fine_dyn_0;
        coarse_0 = coarse_dyn_0;
    end else if(DYN_PE0_SEL == "FALSE")
    begin
        fine_0 = CLKOUT0_PE_FINE;
        coarse_0 = CLKOUT0_PE_COARSE;
    end
end

always @(coarse_0 or fine_0 or ODIV0_SEL_reg or ODIV0_f_reg or clkout0_period) begin
    real_phase0 = (coarse_0 + (unit_phase * fine_0/8));    
    if(ODIV0_SEL_reg == 1)
    begin
        phase_value0 = clkout0_period * (real_phase0/ODIV0_SEL_reg);
    end else begin
        phase_value0 = clkout0_period * (real_phase0/(ODIV0_SEL_reg + ODIV0_f_reg/8.0));
    end
end

//duty_cycle
integer h_level_0;
realtime clkout0_duty_odd;
always @(*)
begin
    h_level_0 = ODIV0_SEL_reg / 2;
    clkout0_duty_odd = (clkout0_period * h_level_0 / ODIV0_SEL_reg);
end

always @(clkout0_half or real_duty0 or real_phase0 or ODIV0_SEL_reg or clkout0_period or clkout0_duty_odd) 
begin
    real_duty0 = (CLKOUT0_PE_COARSE + (unit_duty * CLKOUT0_PE_FINE/8));

    if(CLK0_IN_SEL == 1'b1)
    begin
        if(ODIV0_SEL_reg == 1)
        begin
            clkout0_duty = clkout0_half;
        end else begin
            clkout0_duty = clkout0_duty_odd;
        end
    end else if((DYN_PE0_SEL == "FALSE") || (DE0_EN == "FALSE"))
    begin
        clkout0_duty = clkout0_half;
    end else if((DYN_DPA_EN == "TRUE") && (DE0_EN == "TRUE"))
    begin
        if(ODIV0_SEL_reg == 1)
        begin
            clkout0_duty = clkout0_half;
        end else begin
            if(real_duty0 > real_phase0)
            begin
                clkout0_duty = (clkout0_period * (real_duty0 - real_phase0))/(ODIV0_SEL_reg + ODIV0_f_reg/8.0);
            end else if(real_duty0 < real_phase0)
            begin
                clkout0_duty = (clkout0_period *((ODIV0_SEL_reg + ODIV0_f_reg/8.0) + (real_duty0 - real_phase0)))/(ODIV0_SEL_reg + ODIV0_f_reg/8.0);
            end
        end

    end
end


always @(posedge clk0) begin
    clkout_0 <= 1'b1;
    #tclk0_duty
    clkout_0 <= 1'b0;
end

always@(clkout_0,clk0_dt_dir) begin
    if(clk0_dt_dir == 1'b1)
    begin
        clkout_dt_0 <= clkout_0;
    end else begin
        clkout_dt_0 <= #(clk0_dt_delay) clkout_0;
    end
end

always @(clkout_dt_0) begin
    clkout0_ps <= #(phase_value0) clkout_dt_0;
end

wire rst_p;
assign rst_p = RESET | PLLPWD;
always @(CLKIN or oclk_effect or clkout0_ps or rst_p or reseti or reseto) begin
    if (rst_p == 1'b1) begin
        clk0_out <= 1'b0;
    end else if (reseti == 1'b1 && CLK0_IN_SEL == 1'b0) begin
        clk0_out <= 1'b0;
    end else if (reseto == 1'b1) begin
        clk0_out <= 1'b0;
    end else if(CLK0_OUT_SEL == 1'b0) begin
        clk0_out <= clkout0_ps;
    end
end

assign CLKOUT0 = (CLK0_OUT_SEL == 1'b1)? CLKIN : ((cken0 == 1'b1) ? clk0_out : 1'b0);

assign clk0_dt_dir = (DYN_DT0_SEL == "FALSE") ? CLKOUT0_DT_DIR : DT0[3];
assign clk1_dt_dir = (DYN_DT1_SEL == "FALSE") ? CLKOUT1_DT_DIR : DT1[3];
assign clk2_dt_dir = (DYN_DT2_SEL == "FALSE") ? CLKOUT2_DT_DIR : DT2[3];
assign clk3_dt_dir = (DYN_DT3_SEL == "FALSE") ? CLKOUT3_DT_DIR : DT3[3];
assign clk0_dt_step = (DYN_DT0_SEL == "FALSE") ? CLKOUT0_DT_STEP : (7 - DT0[2:0]);
assign clk1_dt_step = (DYN_DT1_SEL == "FALSE") ? CLKOUT1_DT_STEP : (7 - DT1[2:0]);
assign clk2_dt_step = (DYN_DT2_SEL == "FALSE") ? CLKOUT2_DT_STEP : (7 - DT2[2:0]);
assign clk3_dt_step = (DYN_DT3_SEL == "FALSE") ? CLKOUT3_DT_STEP : (7 - DT3[2:0]);

always @(*)
begin
    clk0_dt_delay <= (0.05 * clk0_dt_step);
    clk1_dt_delay <= (0.05 * clk1_dt_step);
    clk2_dt_delay <= (0.05 * clk2_dt_step);
    clk3_dt_delay <= (0.05 * clk3_dt_step);
end

always @(clkout0_duty or clkout1_duty or clkout2_duty or clkout3_duty or clk0_dt_dir or clk1_dt_dir or clk2_dt_dir or clk3_dt_dir or clk0_dt_step or clk1_dt_step or clk2_dt_step or clk3_dt_step) begin
    if (clk0_dt_dir == 1'b1) begin
        tclk0_duty <= clkout0_duty + clk0_dt_delay;
    end else begin
        tclk0_duty <= clkout0_duty - clk0_dt_delay;
    end

    if (clk1_dt_dir == 1'b1) begin
        tclk1_duty <= clkout1_duty + clk1_dt_delay;
	end else begin
        tclk1_duty <= clkout1_duty - clk1_dt_delay;
    end

    if (clk2_dt_dir == 1'b1) begin
        tclk2_duty <= clkout2_duty + clk2_dt_delay;
	end else begin
        tclk2_duty <= clkout2_duty - clk2_dt_delay;
    end

    if (clk3_dt_dir == 1'b1) begin
        tclk3_duty <= clkout3_duty + clk3_dt_delay;
	end else begin
        tclk3_duty <= clkout3_duty - clk3_dt_delay;
    end
end

//enclk
wire enclk_0,enclk_1,enclk_2,enclk_3,enclk_4,enclk_5,enclk_6;
assign enclk_0 = ((CLKOUT0_EN == "TRUE") && (ENCLK0 == 1'b1)) ? 1'b1 : 1'b0;
assign enclk_1 = ((CLKOUT1_EN == "TRUE") && (ENCLK1 == 1'b1)) ? 1'b1 : 1'b0;
assign enclk_2 = ((CLKOUT2_EN == "TRUE") && (ENCLK2 == 1'b1)) ? 1'b1 : 1'b0;
assign enclk_3 = ((CLKOUT3_EN == "TRUE") && (ENCLK3 == 1'b1)) ? 1'b1 : 1'b0;
assign enclk_4 = ((CLKOUT4_EN == "TRUE") && (ENCLK4 == 1'b1)) ? 1'b1 : 1'b0;
assign enclk_5 = ((CLKOUT5_EN == "TRUE") && (ENCLK5 == 1'b1)) ? 1'b1 : 1'b0;
assign enclk_6 = ((CLKOUT6_EN == "TRUE") && (ENCLK6 == 1'b1)) ? 1'b1 : 1'b0;

wire rsto;
assign rsto = RESET | PLLPWD | reseto;

always@(negedge clk0_out or posedge rsto)
begin
    if(rsto == 1'b1)
    begin
        cken0 <= 1'b0;
    end else 
    begin
        cken0 <= enclk_0;
    end
end

always@(negedge clk1_out or posedge rsto)
begin
    if(rsto == 1'b1)
    begin
        cken1 <= 1'b0;
    end else 
    begin
        cken1 <= enclk_1;
    end
end

always@(negedge clk2_out or posedge rsto)
begin
    if(rsto == 1'b1)
    begin
        cken2 <= 1'b0;
    end else 
    begin
        cken2 <= enclk_2;
    end
end

always@(negedge clk3_out or posedge rsto)
begin
    if(rsto == 1'b1)
    begin
        cken3 <= 1'b0;
    end else
    begin
        cken3 <= enclk_3;
    end
end

always@(negedge clk4_out or posedge rsto)
begin
    if(rsto == 1'b1)
    begin
        cken4 <= 1'b0;
    end else
    begin
        cken4 <= enclk_4;
    end
end

always@(negedge clk5_out or posedge rsto)
begin
    if(rsto == 1'b1)
    begin
        cken5 <= 1'b0;
    end else
    begin
        cken5 <= enclk_5;
    end
end

always@(negedge clk6_out or posedge rsto)
begin
    if(rsto == 1'b1)
    begin
        cken6 <= 1'b0;
    end else
    begin
        cken6 <= enclk_6;
    end
end

// clkout1
//
always @(*)
begin
    if(DYN_PE1_SEL == "TRUE" && DYN_DPA_EN == "TRUE")
    begin
        fine_1 = fine_dyn_1;
        coarse_1 = coarse_dyn_1;
    end else if(DYN_PE1_SEL == "FALSE")
    begin
        fine_1 = CLKOUT1_PE_FINE;
        coarse_1 = CLKOUT1_PE_COARSE;
    end
end

always @(coarse_1 or fine_1 or ODIV1_SEL_reg or clkout1_period) begin
    real_phase1 = (coarse_1 + (unit_phase * fine_1/8));    
    phase_value1 = clkout1_period * (real_phase1/ODIV1_SEL_reg);
end

//duty_cycle
integer h_level_1;
realtime clkout1_duty_odd;
always @(*)
begin
    h_level_1 = ODIV1_SEL_reg / 2;
    clkout1_duty_odd = (clkout1_period * h_level_1 / ODIV1_SEL_reg);
end

always @(clkout1_half or real_duty1 or real_phase1 or ODIV1_SEL_reg or clkout1_period or clkout1_duty_odd)
begin
    real_duty1 = (CLKOUT1_PE_COARSE + (unit_duty * CLKOUT1_PE_FINE/8));

    if(CLK1_IN_SEL == 1'b1)
    begin
        if(ODIV1_SEL_reg == 1)
        begin
            clkout1_duty = clkout1_half;
        end else begin
            clkout1_duty = clkout1_duty_odd;
        end
    end else if((DYN_PE1_SEL == "FALSE") || (DE1_EN == "FALSE"))
    begin
        clkout1_duty = clkout1_half;
    end else if((DYN_DPA_EN == "TRUE") && (DE1_EN == "TRUE"))
    begin
        if(ODIV1_SEL_reg == 1)
        begin
            clkout1_duty = clkout1_half;
        end else begin
            if(real_duty1 > real_phase1)
            begin
                clkout1_duty = (clkout1_period * (real_duty1 - real_phase1))/(ODIV1_SEL_reg);
            end else if(real_duty1 < real_phase1)
            begin
                clkout1_duty = (clkout1_period *((ODIV1_SEL_reg) + (real_duty1 - real_phase1)))/(ODIV1_SEL_reg);
            end
        end
    end
end


always @(posedge clk1) begin
    clkout_1 <= 1'b1;
    #tclk1_duty
    clkout_1 <= 1'b0;
end

always@(clkout_1,clk1_dt_dir) begin
    if(clk1_dt_dir == 1'b1)
    begin
        clkout_dt_1 <= clkout_1;
    end else begin
        clkout_dt_1 <= #(clk1_dt_delay) clkout_1;
    end
end

always @(clkout_dt_1) begin
    clkout1_ps <= #(phase_value1) clkout_dt_1;
end

always @(CLKIN or oclk_effect or clkout1_ps or reseti or reseto or rst_p) begin
    if (rst_p == 1'b1) begin
        clk1_out <= 1'b0;
    end else if (reseti == 1'b1 && CLK1_IN_SEL == 1'b0) begin
        clk1_out <= 1'b0;
    end else if (reseto == 1'b1) begin
        clk1_out <= 1'b0;
    end else if(CLK1_OUT_SEL == 1'b0) begin
        clk1_out <= clkout1_ps;
    end
end

assign CLKOUT1 = (CLK1_OUT_SEL == 1'b1)? CLKIN : ((cken1 == 1'b1) ? clk1_out : 1'b0);

// clkout2
//
always @(*)
begin
    if(DYN_PE2_SEL == "TRUE" && DYN_DPA_EN == "TRUE")
    begin
        fine_2 = fine_dyn_2;
        coarse_2 = coarse_dyn_2;
    end else if(DYN_PE2_SEL == "FALSE")
    begin
        fine_2 = CLKOUT2_PE_FINE;
        coarse_2 = CLKOUT2_PE_COARSE;
    end
end

always @(coarse_2 or fine_2 or ODIV2_SEL_reg or clkout2_period) begin
    real_phase2 = (coarse_2 + (unit_phase * fine_2/8));    
    phase_value2 = clkout2_period * (real_phase2/ODIV2_SEL_reg);
end

//duty_cycle
integer h_level_2;
realtime clkout2_duty_odd;
always @(*)
begin
    h_level_2 = ODIV2_SEL_reg / 2;
    clkout2_duty_odd = (clkout2_period * h_level_2 / ODIV2_SEL_reg);
end

always @(clkout2_half or real_duty2 or real_phase2 or ODIV2_SEL_reg or clkout2_period or clkout2_duty_odd)
begin
    real_duty2 = (CLKOUT2_PE_COARSE + (unit_duty * CLKOUT2_PE_FINE/8));

    if(CLK2_IN_SEL == 1'b1)
    begin
        if(ODIV2_SEL_reg == 1)
        begin
            clkout2_duty = clkout2_half;
        end else begin
            clkout2_duty = clkout2_duty_odd;
        end
    end else if((DYN_PE2_SEL == "FALSE") || (DE2_EN == "FALSE"))
    begin
        clkout2_duty = clkout2_half;
    end else if((DYN_DPA_EN == "TRUE") && (DE2_EN == "TRUE"))
    begin
        if(ODIV2_SEL_reg == 1)
        begin
            clkout2_duty = clkout2_half;
        end else begin
            if(real_duty2 > real_phase2)
            begin
                clkout2_duty = (clkout2_period * (real_duty2 - real_phase2))/(ODIV2_SEL_reg);
            end else if(real_duty2 < real_phase2)
            begin
                clkout2_duty = (clkout2_period *((ODIV2_SEL_reg) + (real_duty2 - real_phase2)))/(ODIV2_SEL_reg);
            end
        end
    end
end


always @(posedge clk2) begin
    clkout_2 <= 1'b1;
    #tclk2_duty
    clkout_2 <= 1'b0;
end

always@(clkout_2,clk2_dt_dir) begin
    if(clk2_dt_dir == 1'b1)
    begin
        clkout_dt_2 <= clkout_2;
    end else begin
        clkout_dt_2 <= #(clk2_dt_delay) clkout_2;
    end
end

always @(clkout_dt_2) begin
    clkout2_ps <= #(phase_value2) clkout_dt_2;
end

always @(CLKIN or oclk_effect or clkout2_ps or reseti or reseto or rst_p) begin
    if (rst_p == 1'b1) begin
        clk2_out <= 1'b0;
    end else if (reseti == 1'b1 && CLK2_IN_SEL == 1'b0) begin
        clk2_out <= 1'b0;
    end else if (reseto == 1'b1) begin
        clk2_out <= 1'b0;
    end else if(CLK2_OUT_SEL == 1'b0) begin
        clk2_out <= clkout2_ps;
    end
end

assign CLKOUT2 = (CLK2_OUT_SEL == 1'b1)? CLKIN : ((cken2 == 1'b1) ? clk2_out : 1'b0);

// clkout3
//
always @(*)
begin
    if(DYN_PE3_SEL == "TRUE" && DYN_DPA_EN == "TRUE")
    begin
        fine_3 = fine_dyn_3;
        coarse_3 = coarse_dyn_3;
    end else if(DYN_PE3_SEL == "FALSE")
    begin
        fine_3 = CLKOUT3_PE_FINE;
        coarse_3 = CLKOUT3_PE_COARSE;
    end
end

always @(coarse_3 or fine_3 or ODIV3_SEL_reg or clkout3_period) begin
    real_phase3 = (coarse_3 + (unit_phase * fine_3/8));    
    phase_value3 = clkout3_period * (real_phase3/ODIV3_SEL_reg);
end

//duty_cycle
integer h_level_3;
realtime clkout3_duty_odd;
always @(*)
begin
    h_level_3 = ODIV3_SEL_reg / 2;
    clkout3_duty_odd = (clkout3_period * h_level_3 / ODIV3_SEL_reg);
end

always @(clkout3_half or real_duty3 or real_phase3 or ODIV3_SEL_reg or clkout3_period or clkout3_duty_odd)
begin
    real_duty3 = (CLKOUT3_PE_COARSE + (unit_duty * CLKOUT3_PE_FINE/8));

    if(CLK3_IN_SEL == 1'b1)
    begin
        if(ODIV3_SEL_reg == 1)
        begin
            clkout3_duty = clkout3_half;
        end else begin
            clkout3_duty = clkout3_duty_odd;
        end
    end else if((DYN_PE3_SEL == "FALSE") || (DE3_EN == "FALSE"))
    begin
        clkout3_duty = clkout3_half;
    end else if((DYN_DPA_EN == "TRUE") && (DE3_EN == "TRUE"))
    begin
        if(ODIV3_SEL_reg == 1)
        begin
            clkout3_duty = clkout3_half;
        end else begin
            if(real_duty3 > real_phase3)
            begin
                clkout3_duty = (clkout3_period * (real_duty3 - real_phase3))/(ODIV3_SEL_reg);
            end else if(real_duty3 < real_phase3)
            begin
                clkout3_duty = (clkout3_period *((ODIV3_SEL_reg) + (real_duty3 - real_phase3)))/(ODIV3_SEL_reg);
            end
        end
    end
end


always @(posedge clk3) begin
    clkout_3 <= 1'b1;
    #tclk3_duty
    clkout_3 <= 1'b0;
end

always@(clkout_3,clk3_dt_dir) begin
    if(clk3_dt_dir == 1'b1)
    begin
        clkout_dt_3 <= clkout_3;
    end else begin
        clkout_dt_3 <= #(clk3_dt_delay) clkout_3;
    end
end

always @(clkout_dt_3) begin
    clkout3_ps <= #(phase_value3) clkout_dt_3;
end

always @(CLKIN or oclk_effect or clkout3_ps or reseti or reseto or rst_p) begin
    if (rst_p == 1'b1) begin
        clk3_out <= 1'b0;
    end else if (reseti == 1'b1 && CLK3_IN_SEL == 1'b0) begin
        clk3_out <= 1'b0;
    end else if (reseto == 1'b1) begin
        clk3_out <= 1'b0;
    end else if(CLK3_OUT_SEL == 1'b0) begin
        clk3_out <= clkout3_ps;
    end
end

assign CLKOUT3 = (CLK3_OUT_SEL == 1'b1)? CLKIN : ((cken3 == 1'b1) ? clk3_out : 1'b0);

// clkout4
//
always @(*)
begin
    if(DYN_PE4_SEL == "TRUE" && DYN_DPA_EN == "TRUE")
    begin
        fine_4 = fine_dyn_4;
        coarse_4 = coarse_dyn_4;
    end else if(DYN_PE4_SEL == "FALSE")
    begin
        fine_4 = CLKOUT4_PE_FINE;
        coarse_4 = CLKOUT4_PE_COARSE;
    end
end

always @(coarse_4 or fine_4 or ODIV4_SEL_reg or clkout4_period) begin
    real_phase4 = (coarse_4 + (unit_phase * fine_4/8));
    phase_value4 = clkout4_period * (real_phase4/ODIV4_SEL_reg);
end

//duty_cycle
integer h_level_4;
realtime clkout4_duty_odd;
always @(*)
begin
    h_level_4 = ODIV4_SEL_reg / 2;
    clkout4_duty_odd = (clkout4_period * h_level_4 / ODIV4_SEL_reg);
end

always @(clkout4_half or real_duty4 or real_phase4 or ODIV4_SEL_reg or clkout4_period or clkout4_duty_odd) 
begin
    real_duty4 = (CLKOUT4_PE_COARSE + (unit_duty * CLKOUT4_PE_FINE/8));
    if(CLK4_IN_SEL == 2'b10 || CLK4_IN_SEL == 2'b01)
    begin
        if(ODIV4_SEL_reg == 1)
        begin
            clkout4_duty = clkout4_half;
        end else begin
            clkout4_duty = clkout4_duty_odd;
        end
    end else if(DYN_PE4_SEL == "FALSE" || DE4_EN == "FALSE")
    begin
        clkout4_duty = clkout4_half;
    end else if(DYN_DPA_EN == "TRUE" && DE4_EN == "TRUE")
    begin
        if(ODIV4_SEL_reg == 1)
        begin
            clkout4_duty = clkout4_half;
        end else begin
            if(real_duty4 > real_phase4)
            begin
                clkout4_duty = (clkout4_period * (real_duty4 - real_phase4))/ODIV4_SEL_reg;
            end else if(real_duty4 < real_phase4)
            begin
                clkout4_duty = (clkout4_period *(ODIV4_SEL_reg + (real_duty4 - real_phase4)))/ODIV4_SEL_reg; 
            end
        end

    end
end

always @(posedge clk4) begin
    clkout_4 <= 1'b1;
    #clkout4_duty
    clkout_4 <= 1'b0;
end

always @(clkout_4) begin
    clkout4_ps <= #(phase_value4) clkout_4;
end

always @(CLKIN or oclk_effect or clkout4_ps or reseti or reseto or rst_p) begin
    if (rst_p == 1'b1) begin
        clk4_out <= 1'b0;
    end else if (reseti == 1'b1 && CLK4_IN_SEL == 2'b00) begin
        clk4_out <= 1'b0;
    end else if (reseto == 1'b1) begin
        clk4_out <= 1'b0;
    end else if(CLK4_OUT_SEL == 1'b0) begin
        clk4_out <= clkout4_ps;
    end
end

assign CLKOUT4 = (CLK4_OUT_SEL == 1'b1)? CLKIN : ((cken4 == 1'b1) ? clk4_out : 1'b0);


// clkout5
//
always @(*)
begin
    if(DYN_PE5_SEL == "TRUE" && DYN_DPA_EN == "TRUE")
    begin
        fine_5 = fine_dyn_5;
        coarse_5 = coarse_dyn_5;
    end else if(DYN_PE5_SEL == "FALSE")
    begin
        fine_5 = CLKOUT5_PE_FINE;
        coarse_5 = CLKOUT5_PE_COARSE;
    end
end

always @(coarse_5 or fine_5 or ODIV5_SEL_reg or clkout5_period) begin
    real_phase5 = (coarse_5 + (unit_phase * fine_5/8));
    phase_value5 = clkout5_period * (real_phase5/ODIV5_SEL_reg);
end

//duty_cycle
integer h_level_5;
realtime clkout5_duty_odd;
always @(*)
begin
    h_level_5 = ODIV5_SEL_reg / 2;
    clkout5_duty_odd = (clkout5_period * h_level_5 / ODIV5_SEL_reg);
end

always @(clkout5_half or real_duty5 or real_phase5 or ODIV5_SEL_reg or clkout5_period or clkout5_duty_odd) 
begin
    real_duty5 = (CLKOUT5_PE_COARSE + (unit_duty * CLKOUT5_PE_FINE/8));
    if(CLK5_IN_SEL == 1'b1)
    begin
        if(ODIV5_SEL_reg == 1)
        begin
            clkout5_duty = clkout5_half;
        end else begin
            clkout5_duty = clkout5_duty_odd;
        end
    end else if(DYN_PE5_SEL == "FALSE" || DE5_EN == "FALSE")
    begin
        clkout5_duty = clkout5_half;
    end else if(DYN_DPA_EN == "TRUE" && DE5_EN == "TRUE")
    begin
        if(ODIV5_SEL_reg == 1)
        begin
            clkout5_duty = clkout5_half;
        end else begin
            if(real_duty5 > real_phase5)
            begin
                clkout5_duty = (clkout5_period * (real_duty5 - real_phase5))/ODIV5_SEL_reg;
            end else if(real_duty5 < real_phase5)
            begin
                clkout5_duty = (clkout5_period *(ODIV5_SEL_reg + (real_duty5 - real_phase5)))/ODIV5_SEL_reg; 
            end
        end

    end
end

always @(posedge clk5) begin
    clkout_5 <= 1'b1;
    #clkout5_duty
    clkout_5 <= 1'b0;
end

always @(clkout_5) begin
    clkout5_ps <= #(phase_value5) clkout_5;
end

always @(CLKIN or oclk_effect or clkout5_ps or reseti or reseto or rst_p) begin
    if (rst_p == 1'b1) begin
        clk5_out <= 1'b0;
    end else if (reseti == 1'b1 && CLK5_IN_SEL == 1'b0) begin
        clk5_out <= 1'b0;
    end else if (reseto == 1'b1) begin
        clk5_out <= 1'b0;
    end else if(CLK5_OUT_SEL == 1'b0) begin
        clk5_out <= clkout5_ps;
    end
end

assign CLKOUT5 = (CLK5_OUT_SEL == 1'b1)? CLKIN : ((cken5 == 1'b1) ? clk5_out : 1'b0);


// clkout6
//
always @(*)
begin
    if(DYN_PE6_SEL == "TRUE" && DYN_DPA_EN == "TRUE")
    begin
        fine_6 = fine_dyn_6;
        coarse_6 = coarse_dyn_6;
    end else if(DYN_PE6_SEL == "FALSE")
    begin
        fine_6 = CLKOUT6_PE_FINE;
        coarse_6 = CLKOUT6_PE_COARSE;
    end
end

always @(coarse_6 or fine_6 or ODIV6_SEL_reg or clkout6_period) begin
    real_phase6 = (coarse_6 + (unit_phase * fine_6/8));
    phase_value6 = clkout6_period * (real_phase6/ODIV6_SEL_reg);
end

//duty_cycle
integer h_level_6;
realtime clkout6_duty_odd;
always @(*)
begin
    h_level_6 = ODIV6_SEL_reg / 2;
    clkout6_duty_odd = (clkout6_period * h_level_6 / ODIV6_SEL_reg);
end

always @(clkout6_half or real_duty6 or real_phase6 or ODIV6_SEL_reg or clkout6_period or clkout6_duty_odd) 
begin
    real_duty6 = (CLKOUT6_PE_COARSE + (unit_duty * CLKOUT6_PE_FINE/8));
    
    if(CLK6_IN_SEL == 1'b1)
    begin
        if(ODIV6_SEL_reg == 1)
        begin
            clkout6_duty = clkout6_half;
        end else begin    
            clkout6_duty = clkout6_duty_odd;
        end
    end else if(DYN_PE6_SEL == "FALSE" || DE6_EN == "FALSE")
    begin
        clkout6_duty = clkout6_half;
    end else if(DYN_DPA_EN == "TRUE" && DE6_EN == "TRUE")
    begin
        if(ODIV6_SEL_reg == 1)
        begin
            clkout6_duty = clkout6_half;
        end else begin
            if(real_duty6 > real_phase6)
            begin
                clkout6_duty = (clkout6_period * (real_duty6 - real_phase6))/ODIV6_SEL_reg;
            end else if(real_duty6 < real_phase6)
            begin
                clkout6_duty = (clkout6_period *(ODIV6_SEL_reg + (real_duty6 - real_phase6)))/ODIV6_SEL_reg; 
            end
        end

    end
end

always @(posedge clk6) begin
    clkout_6 <= 1'b1;
    #clkout6_duty
    clkout_6 <= 1'b0;
end

always @(clkout_6) begin
    clkout6_ps <= #(phase_value6) clkout_6;
end

always @(CLKIN or oclk_effect or clkout6_ps or reseti or reseto or rst_p) begin
    if (rst_p == 1'b1) begin
        clk6_out <= 1'b0;
    end else if (reseti == 1'b1 && CLK6_IN_SEL == 1'b0) begin
        clk6_out <= 1'b0;
    end else if (reseto == 1'b1) begin
        clk6_out <= 1'b0;
    end else if(CLK6_OUT_SEL == 1'b0) begin
        clk6_out <= clkout6_ps;
    end
end

assign CLKOUT6 = (CLK6_OUT_SEL == 1'b1)? CLKIN : ((cken6 == 1'b1) ? clk6_out : 1'b0);

endmodule


//PLLA,gw5a-25
module PLLA (CLKOUT0, CLKOUT1, CLKOUT2, CLKOUT3, CLKOUT4, CLKOUT5, CLKOUT6, CLKFBOUT, MDRDO, LOCK, CLKIN, CLKFB, PSSEL, PSDIR, PSPULSE, SSCPOL, SSCON, SSCMDSEL, SSCMDSEL_FRAC, MDWDI, MDCLK, MDOPC, MDAINC, RESET, PLLPWD, RESET_I, RESET_O);
input CLKIN;
input CLKFB;
input RESET;
input PLLPWD;
input RESET_I;
input RESET_O;
input [2:0] PSSEL;
input PSDIR;
input PSPULSE;

input SSCPOL;
input SSCON;
input [6:0] SSCMDSEL;
input [2:0] SSCMDSEL_FRAC;

//mini DRP port
input MDCLK;
input [1:0] MDOPC;
input MDAINC;
input [7:0] MDWDI;
output [7:0] MDRDO;

output LOCK;
output CLKOUT0;
output CLKOUT1;
output CLKOUT2;
output CLKOUT3;
output CLKOUT4;
output CLKOUT5;
output CLKOUT6;
output CLKFBOUT;

parameter FCLKIN = "100.0"; // frequency of the CLKIN(M)
parameter IDIV_SEL = 1; // 1~64
parameter FBDIV_SEL = 1; // 1~64

parameter ODIV0_SEL = 8; // 1~128
parameter ODIV1_SEL = 8; // 1~128
parameter ODIV2_SEL = 8; // 1~128
parameter ODIV3_SEL = 8; // 1~128
parameter ODIV4_SEL = 8; // 1~128
parameter ODIV5_SEL = 8; // 1~128
parameter ODIV6_SEL = 8; // 1~128
parameter MDIV_SEL = 8; // 2~128
parameter MDIV_FRAC_SEL = 0; // 0~7
parameter ODIV0_FRAC_SEL = 0; // 0~7

parameter CLKOUT0_EN = "TRUE";//"TRUE","FALSE"
parameter CLKOUT1_EN = "FALSE";//"TRUE","FALSE"
parameter CLKOUT2_EN = "FALSE";//"TRUE","FALSE"
parameter CLKOUT3_EN = "FALSE";//"TRUE","FALSE"
parameter CLKOUT4_EN = "FALSE";//"TRUE","FALSE"
parameter CLKOUT5_EN = "FALSE";//"TRUE","FALSE"
parameter CLKOUT6_EN = "FALSE";//"TRUE","FALSE"

parameter CLKFB_SEL = "INTERNAL"; // "INTERNAL", "EXTERNAL";

parameter CLKOUT0_DT_DIR = 1'b1; // CLKOUT0 dutycycle adjust direction. 1'b1: + ; 1'b0: -
parameter CLKOUT1_DT_DIR = 1'b1; // CLKOUT1 dutycycle adjust direction. 1'b1: + ; 1'b0: -
parameter CLKOUT2_DT_DIR = 1'b1; // CLKOUT2 dutycycle adjust direction. 1'b1: + ; 1'b0: -
parameter CLKOUT3_DT_DIR = 1'b1; // CLKOUT3 dutycycle adjust direction. 1'b1: + ; 1'b0: -
parameter CLKOUT0_DT_STEP = 0; // 0,1,2,4; 50ps/step
parameter CLKOUT1_DT_STEP = 0; // 0,1,2,4; 50ps/step
parameter CLKOUT2_DT_STEP = 0; // 0,1,2,4; 50ps/step
parameter CLKOUT3_DT_STEP = 0; // 0,1,2,4; 50ps/step

parameter CLK0_IN_SEL = 1'b0;//ODIV0 input source select. 1'b0:from VCO;1'b1:from CLKIN
parameter CLK0_OUT_SEL = 1'b0;//CLKOUT0 output select. 1'b0:DIV0 output; 1'b1:CLKIN
parameter CLK1_IN_SEL = 1'b0;//ODIV1 input source select. 1'b0:from VCO;1'b1:from CLKIN
parameter CLK1_OUT_SEL = 1'b0;//CLKOUT1 output select. 1'b0:DIV1 output; 1'b1:CLKIN
parameter CLK2_IN_SEL = 1'b0;//ODIV2 input source select. 1'b0:from VCO;1'b1:from CLKIN
parameter CLK2_OUT_SEL = 1'b0;//CLKOUT2 output select. 1'b0:DIV2 output; 1'b1:CLKIN
parameter CLK3_IN_SEL = 1'b0;//ODIV3 input source select. 1'b0:from VCO;1'b1:from CLKIN
parameter CLK3_OUT_SEL = 1'b0;//CLKOUT3 output select. 1'b0:DIV3 output; 1'b1:CLKIN
parameter CLK4_IN_SEL = 2'b00;//ODIV4 input source select.2'b00:from VCO;2'b10:from CLKIN;2'b01:from CASCADE
parameter CLK4_OUT_SEL = 1'b0;//CLKOUT4 output select. 1'b0:DIV4 output; 1'b1:CLKIN
parameter CLK5_IN_SEL = 1'b0;//ODIV5 input source select. 1'b0:from VCO;1'b1:from CLKIN
parameter CLK5_OUT_SEL = 1'b0;//CLKOUT5 output select. 1'b0:DIV5 output; 1'b1:CLKIN
parameter CLK6_IN_SEL = 1'b0;//ODIV6 input source select. 1'b0:from VCO;1'b1:from CLKIN
parameter CLK6_OUT_SEL = 1'b0;//CLKOUT6 output select. 1'b0:DIV6 output; 1'b1:CLKIN

parameter DYN_DPA_EN = "FALSE";//dynamic phaseshift adjustment Enable."TRUE","FALSE"

parameter CLKOUT0_PE_COARSE = 0;//0~127
parameter CLKOUT0_PE_FINE = 0;//0~7
parameter CLKOUT1_PE_COARSE = 0;//0~127
parameter CLKOUT1_PE_FINE = 0;//0~7
parameter CLKOUT2_PE_COARSE = 0;//0~127
parameter CLKOUT2_PE_FINE = 0;//0~7
parameter CLKOUT3_PE_COARSE = 0;//0~127
parameter CLKOUT3_PE_FINE = 0;//0~7
parameter CLKOUT4_PE_COARSE = 0;//0~127
parameter CLKOUT4_PE_FINE = 0;//0~7
parameter CLKOUT5_PE_COARSE = 0;//0~127
parameter CLKOUT5_PE_FINE = 0;//0~7
parameter CLKOUT6_PE_COARSE = 0;//0~127
parameter CLKOUT6_PE_FINE = 0;//0~7

parameter DYN_PE0_SEL = "FALSE";//"TRUE": select dpa port as the dynamic control signal for ODIV0 phase shift. "FALSE":select CLKOUT0_PE_COARSE & CLKOUT0_PE_FINE as the static control signal for ODIV0 phase shift
parameter DYN_PE1_SEL = "FALSE";//"TRUE": select dpa port as the dynamic control signal for ODIV1 phase shift. "FALSE":select CLKOUT1_PE_COARSE & CLKOUT1_PE_FINE as the static control signal for ODIV1 phase shift
parameter DYN_PE2_SEL = "FALSE";//"TRUE": select dpa port as the dynamic control signal for ODIV2 phase shift. "FALSE":select CLKOUT2_PE_COARSE & CLKOUT2_PE_FINE as the static control signal for ODIV2 phase shift
parameter DYN_PE3_SEL = "FALSE";//"TRUE": select dpa port as the dynamic control signal for ODIV3 phase shift. "FALSE":select CLKOUT3_PE_COARSE & CLKOUT3_PE_FINE as the static control signal for ODIV3 phase shift
parameter DYN_PE4_SEL = "FALSE";//"TRUE": select dpa port as the dynamic control signal for ODIV4 phase shift. "FALSE":select CLKOUT4_PE_COARSE & CLKOUT4_PE_FINE as the static control signal for ODIV4 phase shift
parameter DYN_PE5_SEL = "FALSE";//"TRUE": select dpa port as the dynamic control signal for ODIV5 phase shift. "FALSE":select CLKOUT5_PE_COARSE & CLKOUT5_PE_FINE as the static control signal for ODIV5 phase shift
parameter DYN_PE6_SEL = "FALSE";//"TRUE": select dpa port as the dynamic control signal for ODIV6 phase shift. "FALSE":select CLKOUT6_PE_COARSE & CLKOUT6_PE_FINE as the static control signal for ODIV6 phase shift

parameter DE0_EN = "FALSE";//"FALSE":fixed 50% duty cycle for case odiv0=2~128; "TRUE":select CLKOUT0_PE_COARSE & CLKOUT0_PE_FINE as duty edge when DYN_PE0_SEL="TRUE" for case ODIV0=2~128
parameter DE1_EN = "FALSE";//"FALSE":fixed 50% duty cycle for case odiv1=2~128; "TRUE":select CLKOUT1_PE_COARSE & CLKOUT1_PE_FINE as duty edge when DYN_PE1_SEL="TRUE" for case ODIV1=2~128
parameter DE2_EN = "FALSE";//"FALSE":fixed 50% duty cycle for case odiv2=2~128; "TRUE":select CLKOUT2_PE_COARSE & CLKOUT2_PE_FINE as duty edge when DYN_PE2_SEL="TRUE" for case ODIV2=2~128
parameter DE3_EN = "FALSE";//"FALSE":fixed 50% duty cycle for case odiv3=2~128; "TRUE":select CLKOUT3_PE_COARSE & CLKOUT3_PE_FINE as duty edge when DYN_PE3_SEL="TRUE" for case ODIV3=2~128
parameter DE4_EN = "FALSE";//"FALSE":fixed 50% duty cycle for case odiv4=2~128; "TRUE":select CLKOUT4_PE_COARSE & CLKOUT4_PE_FINE as duty edge when DYN_PE4_SEL="TRUE" for case ODIV4=2~128
parameter DE5_EN = "FALSE";//"FALSE":fixed 50% duty cycle for case odiv5=2~128; "TRUE":select CLKOUT5_PE_COARSE & CLKOUT5_PE_FINE as duty edge when DYN_PE5_SEL="TRUE" for case ODIV5=2~128
parameter DE6_EN = "FALSE";//"FALSE":fixed 50% duty cycle for case odiv6=2~128; "TRUE":select CLKOUT6_PE_COARSE & CLKOUT6_PE_FINE as duty edge when DYN_PE6_SEL="TRUE" for case ODIV6=2~128

parameter RESET_I_EN = "FALSE";//"TRUE","FALSE". Enable RESET_I through the dedicated signal from ciu.
parameter RESET_O_EN =  "FALSE";//"TRUE","FALSE". Enable RESET_S through the dedicated signal from ciu.

parameter ICP_SEL = 6'bXXXXXX;//X means that software will automatically calculate and set this parameter.If the user wants to set it, use 6'b000000~6'b111111
parameter LPF_RES = 3'bXXX;//X means that software will automatically calculate and set this parameter.If the user wants to set it, use 3'b000(R0)/3'b001(R1)/3'b010(R2)/3'b011(R3)/3'b100(R4)/3'b101(R5)/3'b110(R6)/3'b111(R7)
parameter LPF_CAP = 2'b00;// 2'b00,C0 ;2'b01,C1; 2'b10,C2

parameter SSC_EN = "FALSE";//"FALSE","TRUE".ssc mode enable


wire resetn;
wire [6:0] IDIV_SEL_reg,FBDIV_SEL_reg;
wire [7:0] ODIV0_SEL_reg,ODIV1_SEL_reg,ODIV2_SEL_reg,ODIV3_SEL_reg,ODIV4_SEL_reg,ODIV5_SEL_reg,ODIV6_SEL_reg,MDIV_SEL_reg;
wire [2:0] ODIV0_f_reg,MDIV_f_reg;
reg clk_effect,oclk_effect;
realtime curtime,pretime,fb_delay;
realtime clkin_cycle[4:0];
realtime clkin_period,clkin_period1,vco_period,clkout0_period,clkout1_period,clkout2_period,clkout3_period,clkout4_period,clkout5_period,clkout6_period,clkfbout_period;
realtime clkout0_half,clkout1_half,clkout2_half,clkout3_half,clkout4_half,clkout5_half,clkout6_half,clkfbout_half;
real real_phase0,real_duty0,real_phase1,real_duty1,real_phase2,real_duty2,real_phase3,real_duty3,real_phase4,real_duty4,real_phase5,real_duty5,real_phase6,real_duty6;
realtime phase_value0,clkout0_duty,clkout1_duty,tclk0_duty,tclk1_duty;
realtime phase_value1,phase_value2,phase_value3,clkout2_duty,clkout3_duty;
realtime phase_value4,phase_value5,phase_value6,clkout4_duty,clkout5_duty,clkout6_duty,tclk2_duty,tclk3_duty;
realtime clkfb_curtime,clkin_curtime,FB_dly,FB_dly0;
reg clkin_init,fb_clk_init;
reg clk0_reg,clk1_reg,clk2_reg,clk3_reg,clk4_reg,clk5_reg,clk6_reg,clkfb_reg,clk0,clk1,clk2,clk3,clk4,clk5,clk6,clkfb;
reg [2:0] fine_dyn_0,fine_dyn_1,fine_dyn_2,fine_dyn_3,fine_dyn_4,fine_dyn_5,fine_dyn_6;
integer coarse_dyn_0,coarse_dyn_1,coarse_dyn_2,coarse_dyn_3,coarse_dyn_4,coarse_dyn_5,coarse_dyn_6;
reg ps_pulse_pre;
reg clkout_0,clkout0_ps,clk0_out,clkout_1,clkout1_ps,clk1_out,clkout_2,clkout2_ps,clk2_out,clkout_3,clkout3_ps,clk3_out,clkout_4,clkout4_ps,clk4_out,clkout_5,clkout5_ps,clk5_out,clkout_6,clkout6_ps,clk6_out,clkfb_out,clkout_fb;
wire clk0_dt_dir,clk1_dt_dir,clk3_dt_dir,clk4_dt_dir;
wire [2:0] clk0_dt_step,clk1_dt_step,clk2_dt_step,clk3_dt_step;
realtime clk0_dt_delay,clk1_dt_delay,clk2_dt_delay,clk3_dt_delay;
reg clkout_dt_0,clkout_dt_1,clkout_dt_2,clkout_dt_3;

reg lock_reg;
reg [2:0] fine_0,fine_1,fine_2,fine_3,fine_4,fine_5,fine_6;
integer coarse_0,coarse_1,coarse_2,coarse_3,coarse_4,coarse_5,coarse_6;
real unit_duty=1.0, unit_phase=1.0;
real unit_div=1.0, real_fbdiv=1.0;
integer multi_clkin;
reg clkfb_init;
reg pssel_0_flag,pssel_1_flag,pssel_2_flag,pssel_3_flag,pssel_4_flag,pssel_5_flag,pssel_6_flag;
reg cken0,cken1,cken2,cken3,cken4,cken5,cken6;
wire reseti, reseto;

initial begin
clkin_cycle[0] = 0.0;
clkin_cycle[1] = 0.0;
clkin_cycle[2] = 0.0;
clkin_cycle[3] = 0.0;
clkin_cycle[4] = 0.0;
clkin_period = 0.0;
clkin_period1 = 0.0;
vco_period = 0.0;
clkout0_period = 0.0;
clkout1_period = 0.0;
clkout2_period = 0.0;
clkout3_period = 0.0;
clkout4_period = 0.0;
clkout5_period = 0.0;
clkout6_period = 0.0;
clkfbout_period = 0.0;
clkout0_half = 0.0;
clkout1_half = 0.0;
clkout2_half = 0.0;
clkout3_half = 0.0;
clkout4_half = 0.0;
clkout5_half = 0.0;
clkout6_half = 0.0;
clkfbout_half = 0.0;
clk_effect = 1'b0;
oclk_effect = 1'b0;
clk0_reg = 1'b0;
clk1_reg = 1'b0;
clk2_reg = 1'b0;
clk3_reg = 1'b0;
clk4_reg = 1'b0;
clk5_reg = 1'b0;
clk6_reg = 1'b0;
clkfb_reg = 1'b0;
clk0 = 1'b0;
clk1 = 1'b0;
clk2 = 1'b0;
clk3 = 1'b0;
clk4 = 1'b0;
clk5 = 1'b0;
clk6 = 1'b0;
clkfb = 1'b0;
clk0_out = 1'b0;
clk1_out = 1'b0;
clk2_out = 1'b0;
clk3_out = 1'b0;
clk4_out = 1'b0;
clk5_out = 1'b0;
clk6_out = 1'b0;
clkfb_out = 1'b0;
clkout0_ps = 1'b0;
clkout1_ps = 1'b0;
clkout2_ps = 1'b0;
clkout3_ps = 1'b0;
clkout4_ps = 1'b0;
clkout5_ps = 1'b0;
clkout6_ps = 1'b0;
clkout_fb = 1'b0;
clkout_0 = 1'b0;
clkout_1 = 1'b0;
clkout_2 = 1'b0;
clkout_3 = 1'b0;
clkout_4 = 1'b0;
clkout_5 = 1'b0;
clkout_6 = 1'b0;
clkin_init = 1'b1;
fb_clk_init = 1'b1;
clkfb_init = 1'b1;
FB_dly = 0.0;
FB_dly0 = 0.0;
clkin_curtime = 0.0;
clkfb_curtime = 0.0;
lock_reg = 0;
fine_dyn_0 = 0;
fine_dyn_1 = 0;
fine_dyn_2 = 0;
fine_dyn_4 = 0;
fine_dyn_5 = 0;
fine_dyn_6 = 0;
coarse_dyn_0 = 0;
coarse_dyn_1 = 0;
coarse_dyn_2 = 0;
coarse_dyn_3 = 0;
coarse_dyn_4 = 0;
coarse_dyn_5 = 0;
coarse_dyn_6 = 0;
fine_0 = 0;
fine_1 = 0;
fine_2 = 0;
fine_3 = 0;
fine_4 = 0;
fine_5 = 0;
fine_6 = 0;
coarse_0 = 0;
coarse_1 = 0;
coarse_2 = 0;
coarse_3 = 0;
coarse_4 = 0;
coarse_5 = 0;
coarse_6 = 0;

////////////
end

assign reseti = (RESET_I_EN == "TRUE") ? RESET_I : 1'b0;
assign reseto = (RESET_O_EN == "TRUE") ? RESET_O : 1'b0;

assign resetn = ~(RESET | PLLPWD | reseti);

// determine period of CLKIN and clkout
always @(posedge CLKIN or negedge resetn) begin
    if(!resetn) begin
        clk_effect <= 1'b0;
        clkin_cycle[0] <= 0;
    end else begin
        pretime <= curtime;
        curtime <= $realtime;

        if(pretime>0) begin
	        clkin_cycle[0] <= curtime -  pretime;
        end

        if(clkin_cycle[0] > 0) begin
            clkin_cycle[1] <= clkin_cycle[0];
	        clkin_cycle[2] <= clkin_cycle[1];
	        clkin_cycle[3] <= clkin_cycle[2];
            clkin_cycle[4] <= clkin_cycle[3];
        end
    
        if (clkin_cycle[0] > 0) begin
            if((clkin_cycle[0] - clkin_period1 < 0.01) && (clkin_cycle[0] - clkin_period1 > -0.01) ) begin
                clk_effect <= 1'b1;
                clkin_period <= clkin_period1;
            end else begin
                clk_effect <= 1'b0;
            end
        end
    end
end

always @(clkin_cycle[0] or clkin_cycle[1] or clkin_cycle[2] or clkin_cycle[3] or clkin_cycle[4]  or clkin_period1) begin
    if(clkin_cycle[0]!=clkin_period1) begin
		clkin_period1 <= (clkin_cycle[0]+clkin_cycle[1]+clkin_cycle[2]+clkin_cycle[3]+clkin_cycle[4])/5;
    end
end

assign IDIV_SEL_reg = IDIV_SEL;
assign FBDIV_SEL_reg = FBDIV_SEL;
assign ODIV0_SEL_reg = ODIV0_SEL;
assign ODIV1_SEL_reg = ODIV1_SEL;
assign ODIV2_SEL_reg = ODIV2_SEL;
assign ODIV3_SEL_reg = ODIV3_SEL;
assign ODIV4_SEL_reg = ODIV4_SEL;
assign ODIV5_SEL_reg = ODIV5_SEL;
assign ODIV6_SEL_reg = ODIV6_SEL;
assign MDIV_SEL_reg = MDIV_SEL;
assign ODIV0_f_reg = ODIV0_FRAC_SEL;
assign MDIV_f_reg = MDIV_FRAC_SEL;

always @(clkin_period or IDIV_SEL_reg or FBDIV_SEL_reg or ODIV0_SEL_reg) begin
    real_fbdiv = (FBDIV_SEL_reg * unit_div);
    if(CLKFB_SEL == "INTERNAL") 
    begin
        vco_period = ((clkin_period * IDIV_SEL_reg) / real_fbdiv) / (MDIV_SEL_reg + MDIV_f_reg/8.0);
    end else begin
        if(ODIV0_SEL_reg == 1) 
        begin
            vco_period = ((clkin_period * IDIV_SEL_reg) / real_fbdiv) / (ODIV0_SEL_reg);
        end else begin
            vco_period = ((clkin_period * IDIV_SEL_reg) / real_fbdiv) / (ODIV0_SEL_reg + ODIV0_f_reg/8.0);
        end
    end
end

always @(*)
begin
    if (CLK0_IN_SEL == 1'b0) begin
        if(ODIV0_SEL_reg == 1)
        begin
            clkout0_period = (vco_period * (ODIV0_SEL_reg));
        end else begin
            clkout0_period = (vco_period * (ODIV0_SEL_reg + ODIV0_f_reg/8.0));        
        end
    end else if (CLK0_IN_SEL == 1'b1) begin
        clkout0_period = (clkin_period * ODIV0_SEL_reg);
    end
end

always @(*)
begin
    if (CLK1_IN_SEL == 1'b0) begin
        clkout1_period = (vco_period * ODIV1_SEL_reg);
    end else if (CLK1_IN_SEL == 1'b1) begin
        clkout1_period = (clkin_period * ODIV1_SEL_reg);
    end
end

always @(*)
begin
    if (CLK2_IN_SEL == 1'b0) begin
        clkout2_period = (vco_period * ODIV2_SEL_reg);
    end else if (CLK2_IN_SEL == 1'b1) begin
        clkout2_period = (clkin_period * ODIV2_SEL_reg);
    end
end

always @(*)
begin
    if (CLK3_IN_SEL == 1'b0) begin
        clkout3_period = (vco_period * ODIV3_SEL_reg);
    end else if (CLK3_IN_SEL == 1'b1) begin
        clkout3_period = (clkin_period * ODIV3_SEL_reg);
    end
end
    
always @(*)
begin
    if (CLK4_IN_SEL == 2'b00) begin
        clkout4_period = (vco_period * ODIV4_SEL_reg);
    end else if (CLK4_IN_SEL == 2'b01) begin
        clkout4_period = (clkout6_period * ODIV4_SEL_reg);
    end else if (CLK4_IN_SEL == 2'b10) begin
        clkout4_period = (clkin_period * ODIV4_SEL_reg);
    end
end

always @(*)
begin
    if (CLK5_IN_SEL == 1'b0) begin
        clkout5_period = (vco_period * ODIV5_SEL_reg);
    end else if (CLK5_IN_SEL == 1'b1) begin
        clkout5_period = (clkin_period * ODIV5_SEL_reg);
    end
end

always @(*)
begin
    if (CLK6_IN_SEL == 1'b0) begin
        clkout6_period = (vco_period * ODIV6_SEL_reg);
    end else if (CLK6_IN_SEL == 1'b1) begin
        clkout6_period = (clkin_period * ODIV6_SEL_reg);
    end
end
 
always @(*)
begin
 clkfbout_period = (vco_period * (MDIV_SEL_reg + MDIV_f_reg/8.0));
end

always@(clkout0_period or clkout1_period or clkout2_period or clkout3_period or clkout4_period or clkout5_period or clkout6_period or clkfbout_period)
begin
    clkout0_half = (clkout0_period / 2.0);
    clkout1_half = (clkout1_period / 2.0);
    clkout2_half = (clkout2_period / 2.0);
    clkout3_half = (clkout3_period / 2.0);
    clkout4_half = (clkout4_period / 2.0);
    clkout5_half = (clkout5_period / 2.0);
    clkout6_half = (clkout6_period / 2.0);
    clkfbout_half = (clkfbout_period / 2.0);
end

realtime clk_tlock_cur;
realtime max_tlock;
integer cnt_lock;
initial begin
    clk_tlock_cur = 0.0;
    max_tlock = 0.0;
    cnt_lock = 0;
end

// lock time
assign rst = RESET | PLLPWD | reseti | reseto;

always @(posedge CLKIN or posedge rst) begin
    if (rst == 1'b1) begin
        max_tlock <= 0.0;
    end else begin
        if((clkin_cycle[0] >= 2) && (clkin_cycle[0] <= 40)) begin
            max_tlock <= 50000;
        end else if ((clkin_cycle[0] > 40) && (clkin_cycle[0] <= 500)) begin
            max_tlock <= 200000;
        end
    end
end

always @(posedge CLKIN or posedge rst) begin
    if (rst == 1'b1) begin
        lock_reg <= 1'b0;
        oclk_effect <= 1'b0;
    end else begin
        if(clk_effect == 1'b1) begin
            cnt_lock <= cnt_lock + 1;

            if(cnt_lock > ((max_tlock/clkin_period) - 10)) begin
                oclk_effect <= 1'b1;
            end else begin
                oclk_effect <= 1'b0;
            end

            if(cnt_lock > (max_tlock/clkin_period)) begin
                lock_reg <= 1'b1;
            end else begin
                lock_reg <= 1'b0;
            end
        end else begin
            oclk_effect <= 1'b0;
            cnt_lock <= 0;
            lock_reg <= 1'b0;
        end
    end
end

assign LOCK = (CLKFB_SEL == "EXTERNAL" && CLK0_IN_SEL == 1'b1)? 1'b0 : lock_reg; 

// calculate CLKFB feedback delay
always @(posedge CLKIN) begin
    if (clkin_init == 1'b1) begin
        clkin_curtime=$realtime;
        clkin_init = 1'b0;
    end
end

always @(posedge CLKFB) begin
    if (fb_clk_init == 1'b1) begin
        clkfb_curtime=$realtime;
        fb_clk_init = 1'b0;
    end
end

always @(CLKFB or CLKIN) begin
    if ((clkfb_curtime > 0) && (clkin_curtime > 0)) begin
        FB_dly0 = clkfb_curtime - clkin_curtime;
        if ((FB_dly0 >= 0) && (clkin_cycle[0] > 0)) begin
            multi_clkin = FB_dly0 / (clkin_cycle[0]);
            FB_dly = clkin_cycle[0] - (FB_dly0 - (clkin_cycle[0]) * multi_clkin);
        end
    end
end

always @(clk0_reg or clk1_reg or clk2_reg or clk3_reg or clk4_reg or clk5_reg or clk6_reg or clkfb_reg or oclk_effect) begin
    if(oclk_effect == 1'b0) begin
        clk0_reg = 1'b0;
        clk1_reg = 1'b0;
        clk2_reg = 1'b0;
        clk3_reg = 1'b0;
        clk4_reg = 1'b0;
        clk5_reg = 1'b0;
        clk6_reg = 1'b0;
        clkfb_reg = 1'b0;
    end
    else begin
        if(clkfb_init == 1'b1) begin
            clk0_reg <= 1'b1;
            clk1_reg <= 1'b1;
            clk2_reg <= 1'b1;
            clk3_reg <= 1'b1;
            clk4_reg <= 1'b1;
            clk5_reg <= 1'b1;
            clk6_reg <= 1'b1;
            clkfb_reg <= 1'b1;
            clkfb_init = 1'b0;
        end
        else begin
            clk0_reg <= #clkout0_half ~clk0_reg;
            clk1_reg <= #clkout1_half ~clk1_reg;
            clk2_reg <= #clkout2_half ~clk2_reg;
            clk3_reg <= #clkout3_half ~clk3_reg;
            clk4_reg <= #clkout4_half ~clk4_reg;
            clk5_reg <= #clkout5_half ~clk5_reg;
            clk6_reg <= #clkout6_half ~clk6_reg;
            clkfb_reg <= #clkfbout_half ~clkfb_reg;
         end
    end
end

always @(clk0_reg or clk1_reg or clk2_reg or clk3_reg or clk4_reg or clk5_reg or clk6_reg or clkfb_reg or FB_dly) begin
    if (CLKFB_SEL == "INTERNAL") begin
        clk0 <= clk0_reg;
        clk1 <= clk1_reg;
        clk2 <= clk2_reg;
        clk3 <= clk3_reg;
        clk4 <= clk4_reg;
        clk5 <= clk5_reg;
        clk6 <= clk6_reg;
        clkfb <= clkfb_reg;
     end else begin   
        clk0 <= #(FB_dly) clk0_reg;
        clk1 <= #(FB_dly) clk1_reg;
        clk2 <= #(FB_dly) clk2_reg;
        clk3 <= #(FB_dly) clk3_reg;
        clk4 <= #(FB_dly) clk4_reg;
        clk5 <= #(FB_dly) clk5_reg;
        clk6 <= #(FB_dly) clk6_reg;
        clkfb <= #(FB_dly) clkfb_reg;
     end
end

//dynamic phase shift
always @(*)
begin
    
    if(PSSEL == 3'b000)
    begin
        pssel_0_flag <= 1'b1;
        pssel_1_flag <= 1'b0;
        pssel_2_flag <= 1'b0;
        pssel_3_flag <= 1'b0;
        pssel_4_flag <= 1'b0;
        pssel_5_flag <= 1'b0;
        pssel_6_flag <= 1'b0;
        #1;
        pssel_0_flag <= 1'b0;
    end else if(PSSEL == 3'b001)
    begin
        pssel_0_flag <= 1'b0;
        pssel_1_flag <= 1'b1;
        pssel_2_flag <= 1'b0;
        pssel_3_flag <= 1'b0;
        pssel_4_flag <= 1'b0;
        pssel_5_flag <= 1'b0;
        pssel_6_flag <= 1'b0;
        #1;
        pssel_1_flag <= 1'b0;
    end else if(PSSEL == 3'b010)
    begin
        pssel_0_flag <= 1'b0;
        pssel_1_flag <= 1'b0;
        pssel_2_flag <= 1'b1;
        pssel_3_flag <= 1'b0;
        pssel_4_flag <= 1'b0;
        pssel_5_flag <= 1'b0;
        pssel_6_flag <= 1'b0;
         #1;
        pssel_2_flag <= 1'b0;
    end else if(PSSEL == 3'b011)
    begin
        pssel_0_flag <= 1'b0;
        pssel_1_flag <= 1'b0;
        pssel_2_flag <= 1'b0;
        pssel_3_flag <= 1'b1;
        pssel_4_flag <= 1'b0;
        pssel_5_flag <= 1'b0;
        pssel_6_flag <= 1'b0;
         #1;
        pssel_3_flag <= 1'b0;
    end else if(PSSEL == 3'b100)
    begin
        pssel_0_flag <= 1'b0;
        pssel_1_flag <= 1'b0;
        pssel_2_flag <= 1'b0;
        pssel_3_flag <= 1'b0;
        pssel_4_flag <= 1'b1;
        pssel_5_flag <= 1'b0;
        pssel_6_flag <= 1'b0;
         #1;
        pssel_4_flag <= 1'b0;
    end else if(PSSEL == 3'b101)
    begin
        pssel_0_flag <= 1'b0;
        pssel_1_flag <= 1'b0;
        pssel_2_flag <= 1'b0;
        pssel_3_flag <= 1'b0;
        pssel_4_flag <= 1'b0;
        pssel_5_flag <= 1'b1;
        pssel_6_flag <= 1'b0;
         #1;
        pssel_5_flag <= 1'b0;
    end else if(PSSEL == 3'b110)
    begin
        pssel_0_flag <= 1'b0;
        pssel_1_flag <= 1'b0;
        pssel_2_flag <= 1'b0;
        pssel_3_flag <= 1'b0;
        pssel_4_flag <= 1'b0;
        pssel_5_flag <= 1'b0;
        pssel_6_flag <= 1'b1;
         #1;
        pssel_6_flag <= 1'b0;
    end
end

always @(PSPULSE)
begin
    ps_pulse_pre <= PSPULSE;
end

always @(*)
begin
    if (resetn == 1'b0)
    begin
        fine_dyn_0 <= 0;
        fine_dyn_1<= 0;
        fine_dyn_2 <= 0;
        fine_dyn_3 <= 0;
        fine_dyn_4 <= 0;
        fine_dyn_5 <= 0;
        fine_dyn_6 <= 0;
        coarse_dyn_0 <= 0;
        coarse_dyn_1 <= 0;
        coarse_dyn_2 <= 0;
        coarse_dyn_3 <= 0;
        coarse_dyn_4 <= 0;
        coarse_dyn_5 <= 0;
        coarse_dyn_6 <= 0;
     end else
    begin
        
        if (PSSEL == 3'b000)
        begin
            if(pssel_0_flag == 1'b1)
            begin
                fine_dyn_0 <= 0;
                coarse_dyn_0 <= 0;
            end else begin
            if (PSPULSE === 1'b0 && ps_pulse_pre === 1'b1)
            begin
                if (PSDIR == 1'b0)
                begin
                    if(ODIV0_SEL_reg == 1)
                    begin
                        coarse_dyn_0 <= 0;
                    end else begin
                        if(fine_dyn_0 == 7)
                        begin
                            coarse_dyn_0 <= coarse_dyn_0 + 1;
                            if (coarse_dyn_0 == (ODIV0_SEL_reg - 1)) 
                            begin
                                coarse_dyn_0 <= 0;
                            end
                        end
                    end

                    fine_dyn_0 <= fine_dyn_0 + 1;
                end else
                begin
                    if(ODIV0_SEL_reg == 1)
                    begin
                        coarse_dyn_0 <= 0;
                    end else begin
                        if(fine_dyn_0 == 0)
                        begin
                            coarse_dyn_0 <= coarse_dyn_0 - 1;
                            if (coarse_dyn_0 == 0)
                            begin
                                coarse_dyn_0 <= (ODIV0_SEL_reg - 1); 
                            end
                        end
                    end

                    fine_dyn_0 <= fine_dyn_0 - 1;
                end
            end
        end     
        end else if (PSSEL == 3'b001)
        begin
            if(pssel_1_flag == 1'b1)
            begin
                fine_dyn_1 <= 0;
                coarse_dyn_1 <= 0;
            end else begin
            if (PSPULSE === 1'b0 && ps_pulse_pre === 1'b1)
            begin
                if (PSDIR == 1'b0)
                begin
                    if(ODIV1_SEL_reg == 1)
                    begin
                        coarse_dyn_1 <= 0;
                    end else begin
                        if(fine_dyn_1 == 7)
                        begin
                            coarse_dyn_1 <= coarse_dyn_1 + 1;
                            if (coarse_dyn_1 == (ODIV1_SEL_reg - 1))
                            begin
                                coarse_dyn_1 <= 0;
                            end
                        end
                    end

                    fine_dyn_1 <= fine_dyn_1 + 1;
                end else
                begin
                    if(ODIV1_SEL_reg == 1)
                    begin
                        coarse_dyn_1 <= 0;
                    end else begin
                        if(fine_dyn_1 == 0)
                        begin
                            coarse_dyn_1 <= coarse_dyn_1 - 1;
                            if (coarse_dyn_1 == 0)
                            begin
                                coarse_dyn_1 <= (ODIV1_SEL_reg - 1);
                            end
                        end
                    end

                    fine_dyn_1 <= fine_dyn_1 - 1;
                end
            end
        end     
        end else if (PSSEL == 3'b010)
        begin
            if(pssel_2_flag == 1'b1)
            begin
                fine_dyn_2 <= 0;
                coarse_dyn_2 <= 0;
            end else begin
            if (PSPULSE === 1'b0 && ps_pulse_pre === 1'b1)
            begin
                if (PSDIR == 1'b0)
                begin
                    if(ODIV2_SEL_reg == 1)
                    begin
                        coarse_dyn_2 <= 0;
                    end else begin
                        if(fine_dyn_2 == 7)
                        begin
                            coarse_dyn_2 <= coarse_dyn_2 + 1;
                            if (coarse_dyn_2 == (ODIV2_SEL_reg - 1))
                            begin
                                coarse_dyn_2 <= 0;
                            end
                        end
                    end

                    fine_dyn_2 <= fine_dyn_2 + 1;
                end else
                begin
                    if(ODIV2_SEL_reg == 1)
                    begin
                        coarse_dyn_2 <= 0;
                    end else begin
                        if(fine_dyn_2 == 0)
                        begin
                            coarse_dyn_2 <= coarse_dyn_2 - 1;
                            if (coarse_dyn_2 == 0)
                            begin
                                coarse_dyn_2 <= (ODIV2_SEL_reg - 1);
                            end
                        end
                    end

                    fine_dyn_2 <= fine_dyn_2 - 1;
                end
            end
        end
        end else if (PSSEL == 3'b011)
        begin
            if(pssel_3_flag == 1'b1)
            begin
                fine_dyn_3 <= 0;
                coarse_dyn_3 <= 0;
            end else begin
            if (PSPULSE === 1'b0 && ps_pulse_pre === 1'b1)
            begin
                if (PSDIR == 1'b0)
                begin
                    if(ODIV3_SEL_reg == 1)
                    begin
                        coarse_dyn_3 <= 0;
                    end else begin
                        if(fine_dyn_3 == 7)
                        begin
                            coarse_dyn_3 <= coarse_dyn_3 + 1;
                            if (coarse_dyn_3 == (ODIV3_SEL_reg - 1))
                            begin
                                coarse_dyn_3 <= 0;
                            end
                        end
                    end

                    fine_dyn_3 <= fine_dyn_3 + 1;
                end else
                begin
                    if(ODIV3_SEL_reg == 1) 
                    begin
                        coarse_dyn_3 <= 0;
                    end else begin
                        if(fine_dyn_3 == 0)
                        begin
                            coarse_dyn_3 <= coarse_dyn_3 - 1;
                            if (coarse_dyn_3 == 0)
                            begin
                                coarse_dyn_3 <= (ODIV3_SEL_reg - 1);
                            end
                        end
                    end

                    fine_dyn_3 <= fine_dyn_3 - 1;
                end
            end
        end
        end else if (PSSEL == 3'b100)
        begin
            if(pssel_4_flag == 1'b1)
            begin
                fine_dyn_4 <= 0;
                coarse_dyn_4 <= 0;
            end else begin
            if (PSPULSE === 1'b0 && ps_pulse_pre === 1'b1)
            begin
                if (PSDIR == 1'b0)
                begin
                    if(ODIV4_SEL_reg == 1)
                    begin
                        coarse_dyn_4 <= 0;
                    end else begin
                        if(fine_dyn_4 == 7)
                        begin
                            coarse_dyn_4 <= coarse_dyn_4 + 1;
                            if (coarse_dyn_4 == (ODIV4_SEL_reg - 1))
                            begin
                                coarse_dyn_4 <= 0;
                            end
                        end
                    end

                    fine_dyn_4 <= fine_dyn_4 + 1;
                end else
                begin
                    if(ODIV4_SEL_reg == 1) 
                    begin
                        coarse_dyn_4 <= 0;
                    end else begin
                        if(fine_dyn_4 == 0)
                        begin
                            coarse_dyn_4 <= coarse_dyn_4 - 1;
                            if (coarse_dyn_4 == 0)
                            begin
                                coarse_dyn_4 <= (ODIV4_SEL_reg - 1);
                            end
                        end
                    end

                    fine_dyn_4 <= fine_dyn_4 - 1;
                end
            end
        end
        end else if (PSSEL == 3'b101)
        begin
            if(pssel_5_flag == 1'b1)
            begin
                fine_dyn_5 <= 0;
                coarse_dyn_5 <= 0;
            end else begin
            if (PSPULSE === 1'b0 && ps_pulse_pre === 1'b1)
            begin
                if (PSDIR == 1'b0)
                begin
                    if(ODIV5_SEL_reg == 1)
                    begin
                        coarse_dyn_5 <= 0;
                    end else begin
                        if(fine_dyn_5 == 7)
                        begin
                            coarse_dyn_5 <= coarse_dyn_5 + 1;
                            if (coarse_dyn_5 == (ODIV5_SEL_reg - 1))
                            begin
                                coarse_dyn_5 <= 0;
                            end
                        end
                    end

                    fine_dyn_5 <= fine_dyn_5 + 1;
                end else
                begin
                    if(ODIV5_SEL_reg == 1) 
                    begin
                        coarse_dyn_5 <= 0;
                    end else begin
                        if(fine_dyn_5 == 0)
                        begin
                            coarse_dyn_5 <= coarse_dyn_5 - 1;
                            if (coarse_dyn_5 == 0)
                            begin
                                coarse_dyn_5 <= (ODIV5_SEL_reg - 1);
                            end
                        end
                    end

                    fine_dyn_5 <= fine_dyn_5 - 1;
                end
            end
        end
        end else if (PSSEL == 3'b110)
        begin
            if(pssel_6_flag == 1'b1)
            begin
                fine_dyn_6 <= 0;
                coarse_dyn_6 <= 0;
            end else begin
            if (PSPULSE === 1'b0 && ps_pulse_pre === 1'b1)
            begin
                if (PSDIR == 1'b0)
                begin
                    if(ODIV6_SEL_reg == 1)
                    begin
                        coarse_dyn_6 <= 0;
                    end else begin
                        if(fine_dyn_6 == 7)
                        begin
                            coarse_dyn_6 <= coarse_dyn_6 + 1;
                            if (coarse_dyn_6 == (ODIV6_SEL_reg - 1))
                            begin
                                coarse_dyn_6 <= 0;
                            end
                        end
                    end

                    fine_dyn_6 <= fine_dyn_6 + 1;
                end else
                begin
                    if(ODIV6_SEL_reg == 1) 
                    begin
                        coarse_dyn_6 <= 0;
                    end else begin
                        if(fine_dyn_6 == 0)
                        begin
                            coarse_dyn_6 <= coarse_dyn_6 - 1;
                            if (coarse_dyn_6 == 0)
                            begin
                                coarse_dyn_6 <= (ODIV6_SEL_reg - 1);
                            end
                        end
                    end

                    fine_dyn_6 <= fine_dyn_6 - 1;
                end
            end
            end
        end


    end
end

//clkfbout
//
always @(posedge clkfb) begin
    clkout_fb <= 1'b1;
    #clkfbout_half
    clkout_fb <= 1'b0;
end

always @(CLKIN or oclk_effect or clkout_fb or resetn or reseto) begin
    if (resetn == 1'b0) begin
        clkfb_out <= 1'b0;
    end else if (reseto == 1'b1) begin
        clkfb_out <= 1'b0;
    end else begin
        clkfb_out <= clkout_fb;
    end
end

assign CLKFBOUT = clkfb_out;

// clkout0
//
always @(*)
begin
    if(DYN_PE0_SEL == "TRUE" && DYN_DPA_EN == "TRUE")
    begin
        fine_0 = fine_dyn_0;
        coarse_0 = coarse_dyn_0;
    end else if(DYN_PE0_SEL == "FALSE")
    begin
        fine_0 = CLKOUT0_PE_FINE;
        coarse_0 = CLKOUT0_PE_COARSE;
    end
end

always @(coarse_0 or fine_0 or ODIV0_SEL_reg or ODIV0_f_reg or clkout0_period) begin
    real_phase0 = (coarse_0 + (unit_phase * fine_0/8));    
    if(ODIV0_SEL_reg == 1)
    begin
        phase_value0 = clkout0_period * (real_phase0/ODIV0_SEL_reg);
    end else begin
        phase_value0 = clkout0_period * (real_phase0/(ODIV0_SEL_reg + ODIV0_f_reg/8.0));
    end
end

//duty_cycle
integer h_level_0;
realtime clkout0_duty_odd;
always @(*)
begin
    h_level_0 = ODIV0_SEL_reg / 2;
    clkout0_duty_odd = (clkout0_period * h_level_0 / ODIV0_SEL_reg);
end

always @(clkout0_half or real_duty0 or real_phase0 or ODIV0_SEL_reg or clkout0_period or clkout0_duty_odd) 
begin
    real_duty0 = (CLKOUT0_PE_COARSE + (unit_duty * CLKOUT0_PE_FINE/8));

    if(CLK0_IN_SEL == 1'b1)
    begin
        if(ODIV0_SEL_reg == 1)
        begin
            clkout0_duty = clkout0_half;
        end else begin
            clkout0_duty = clkout0_duty_odd;
        end
    end else if((DYN_PE0_SEL == "FALSE") || (DE0_EN == "FALSE"))
    begin
        clkout0_duty = clkout0_half;
    end else if((DYN_DPA_EN == "TRUE") && (DE0_EN == "TRUE"))
    begin
        if(ODIV0_SEL_reg == 1)
        begin
            clkout0_duty = clkout0_half;
        end else begin
            if(real_duty0 > real_phase0)
            begin
                clkout0_duty = (clkout0_period * (real_duty0 - real_phase0))/(ODIV0_SEL_reg + ODIV0_f_reg/8.0);
            end else if(real_duty0 < real_phase0)
            begin
                clkout0_duty = (clkout0_period *((ODIV0_SEL_reg + ODIV0_f_reg/8.0) + (real_duty0 - real_phase0)))/(ODIV0_SEL_reg + ODIV0_f_reg/8.0);
            end
        end

    end
end


always @(posedge clk0) begin
    clkout_0 <= 1'b1;
    #tclk0_duty
    clkout_0 <= 1'b0;
end

always@(clkout_0,clk0_dt_dir) begin
    if(clk0_dt_dir == 1'b1)
    begin
        clkout_dt_0 <= clkout_0;
    end else begin
        clkout_dt_0 <= #(clk0_dt_delay) clkout_0;
    end
end

always @(clkout_dt_0) begin
    clkout0_ps <= #(phase_value0) clkout_dt_0;
end

wire rst_p;
assign rst_p = RESET | PLLPWD;
always @(CLKIN or oclk_effect or clkout0_ps or rst_p or reseti or reseto) begin
    if (rst_p == 1'b1) begin
        clk0_out <= 1'b0;
    end else if (reseti == 1'b1 && CLK0_IN_SEL == 1'b0) begin
        clk0_out <= 1'b0;
    end else if (reseto == 1'b1) begin
        clk0_out <= 1'b0;
    end else if(CLK0_OUT_SEL == 1'b0) begin
        clk0_out <= clkout0_ps;
    end
end

assign CLKOUT0 = (CLK0_OUT_SEL == 1'b1)? CLKIN : ((cken0 == 1'b1) ? clk0_out : 1'b0);

assign clk0_dt_dir = CLKOUT0_DT_DIR;
assign clk1_dt_dir = CLKOUT1_DT_DIR;
assign clk2_dt_dir = CLKOUT2_DT_DIR;
assign clk3_dt_dir = CLKOUT3_DT_DIR;
assign clk0_dt_step = CLKOUT0_DT_STEP;
assign clk1_dt_step = CLKOUT1_DT_STEP;
assign clk2_dt_step = CLKOUT2_DT_STEP;
assign clk3_dt_step = CLKOUT3_DT_STEP;

always @(*)
begin
    clk0_dt_delay <= (0.05 * clk0_dt_step);
    clk1_dt_delay <= (0.05 * clk1_dt_step);
    clk2_dt_delay <= (0.05 * clk2_dt_step);
    clk3_dt_delay <= (0.05 * clk3_dt_step);
end

always @(clkout0_duty or clkout1_duty or clkout2_duty or clkout3_duty or clk0_dt_dir or clk1_dt_dir or clk2_dt_dir or clk3_dt_dir or clk0_dt_step or clk1_dt_step or clk2_dt_step or clk3_dt_step) begin
    if (clk0_dt_dir == 1'b1) begin
        tclk0_duty <= clkout0_duty + clk0_dt_delay;
    end else begin
        tclk0_duty <= clkout0_duty - clk0_dt_delay;
    end

    if (clk1_dt_dir == 1'b1) begin
        tclk1_duty <= clkout1_duty + clk1_dt_delay;
	end else begin
        tclk1_duty <= clkout1_duty - clk1_dt_delay;
    end

    if (clk2_dt_dir == 1'b1) begin
        tclk2_duty <= clkout2_duty + clk2_dt_delay;
	end else begin
        tclk2_duty <= clkout2_duty - clk2_dt_delay;
    end

    if (clk3_dt_dir == 1'b1) begin
        tclk3_duty <= clkout3_duty + clk3_dt_delay;
	end else begin
        tclk3_duty <= clkout3_duty - clk3_dt_delay;
    end
end

//enclk
wire enclk_0,enclk_1,enclk_2,enclk_3,enclk_4,enclk_5,enclk_6;
assign enclk_0 = (CLKOUT0_EN == "TRUE") ? 1'b1 : 1'b0;
assign enclk_1 = (CLKOUT1_EN == "TRUE") ? 1'b1 : 1'b0;
assign enclk_2 = (CLKOUT2_EN == "TRUE") ? 1'b1 : 1'b0;
assign enclk_3 = (CLKOUT3_EN == "TRUE") ? 1'b1 : 1'b0;
assign enclk_4 = (CLKOUT4_EN == "TRUE") ? 1'b1 : 1'b0;
assign enclk_5 = (CLKOUT5_EN == "TRUE") ? 1'b1 : 1'b0;
assign enclk_6 = (CLKOUT6_EN == "TRUE") ? 1'b1 : 1'b0;

wire rsto;
assign rsto = RESET | PLLPWD | reseto;

always@(negedge clk0_out or posedge rsto)
begin
    if(rsto == 1'b1)
    begin
        cken0 <= 1'b0;
    end else 
    begin
        cken0 <= enclk_0;
    end
end

always@(negedge clk1_out or posedge rsto)
begin
    if(rsto == 1'b1)
    begin
        cken1 <= 1'b0;
    end else 
    begin
        cken1 <= enclk_1;
    end
end

always@(negedge clk2_out or posedge rsto)
begin
    if(rsto == 1'b1)
    begin
        cken2 <= 1'b0;
    end else 
    begin
        cken2 <= enclk_2;
    end
end

always@(negedge clk3_out or posedge rsto)
begin
    if(rsto == 1'b1)
    begin
        cken3 <= 1'b0;
    end else
    begin
        cken3 <= enclk_3;
    end
end

always@(negedge clk4_out or posedge rsto)
begin
    if(rsto == 1'b1)
    begin
        cken4 <= 1'b0;
    end else
    begin
        cken4 <= enclk_4;
    end
end

always@(negedge clk5_out or posedge rsto)
begin
    if(rsto == 1'b1)
    begin
        cken5 <= 1'b0;
    end else
    begin
        cken5 <= enclk_5;
    end
end

always@(negedge clk6_out or posedge rsto)
begin
    if(rsto == 1'b1)
    begin
        cken6 <= 1'b0;
    end else
    begin
        cken6 <= enclk_6;
    end
end

// clkout1
//
always @(*)
begin
    if(DYN_PE1_SEL == "TRUE" && DYN_DPA_EN == "TRUE")
    begin
        fine_1 = fine_dyn_1;
        coarse_1 = coarse_dyn_1;
    end else if(DYN_PE1_SEL == "FALSE")
    begin
        fine_1 = CLKOUT1_PE_FINE;
        coarse_1 = CLKOUT1_PE_COARSE;
    end
end

always @(coarse_1 or fine_1 or ODIV1_SEL_reg or clkout1_period) begin
    real_phase1 = (coarse_1 + (unit_phase * fine_1/8));    
    phase_value1 = clkout1_period * (real_phase1/ODIV1_SEL_reg);
end

//duty_cycle
integer h_level_1;
realtime clkout1_duty_odd;
always @(*)
begin
    h_level_1 = ODIV1_SEL_reg / 2;
    clkout1_duty_odd = (clkout1_period * h_level_1 / ODIV1_SEL_reg);
end

always @(clkout1_half or real_duty1 or real_phase1 or ODIV1_SEL_reg or clkout1_period or clkout1_duty_odd)
begin
    real_duty1 = (CLKOUT1_PE_COARSE + (unit_duty * CLKOUT1_PE_FINE/8));

    if(CLK1_IN_SEL == 1'b1)
    begin
        if(ODIV1_SEL_reg == 1)
        begin
            clkout1_duty = clkout1_half;
        end else begin
            clkout1_duty = clkout1_duty_odd;
        end
    end else if((DYN_PE1_SEL == "FALSE") || (DE1_EN == "FALSE"))
    begin
        clkout1_duty = clkout1_half;
    end else if((DYN_DPA_EN == "TRUE") && (DE1_EN == "TRUE"))
    begin
        if(ODIV1_SEL_reg == 1)
        begin
            clkout1_duty = clkout1_half;
        end else begin
            if(real_duty1 > real_phase1)
            begin
                clkout1_duty = (clkout1_period * (real_duty1 - real_phase1))/(ODIV1_SEL_reg);
            end else if(real_duty1 < real_phase1)
            begin
                clkout1_duty = (clkout1_period *((ODIV1_SEL_reg) + (real_duty1 - real_phase1)))/(ODIV1_SEL_reg);
            end
        end
    end
end


always @(posedge clk1) begin
    clkout_1 <= 1'b1;
    #tclk1_duty
    clkout_1 <= 1'b0;
end

always@(clkout_1,clk1_dt_dir) begin
    if(clk1_dt_dir == 1'b1)
    begin
        clkout_dt_1 <= clkout_1;
    end else begin
        clkout_dt_1 <= #(clk1_dt_delay) clkout_1;
    end
end

always @(clkout_dt_1) begin
    clkout1_ps <= #(phase_value1) clkout_dt_1;
end

always @(CLKIN or oclk_effect or clkout1_ps or reseti or reseto or rst_p) begin
    if (rst_p == 1'b1) begin
        clk1_out <= 1'b0;
    end else if (reseti == 1'b1 && CLK1_IN_SEL == 1'b0) begin
        clk1_out <= 1'b0;
    end else if (reseto == 1'b1) begin
        clk1_out <= 1'b0;
    end else if(CLK1_OUT_SEL == 1'b0) begin
        clk1_out <= clkout1_ps;
    end
end

assign CLKOUT1 = (CLK1_OUT_SEL == 1'b1)? CLKIN : ((cken1 == 1'b1) ? clk1_out : 1'b0);

// clkout2
//
always @(*)
begin
    if(DYN_PE2_SEL == "TRUE" && DYN_DPA_EN == "TRUE")
    begin
        fine_2 = fine_dyn_2;
        coarse_2 = coarse_dyn_2;
    end else if(DYN_PE2_SEL == "FALSE")
    begin
        fine_2 = CLKOUT2_PE_FINE;
        coarse_2 = CLKOUT2_PE_COARSE;
    end
end

always @(coarse_2 or fine_2 or ODIV2_SEL_reg or clkout2_period) begin
    real_phase2 = (coarse_2 + (unit_phase * fine_2/8));    
    phase_value2 = clkout2_period * (real_phase2/ODIV2_SEL_reg);
end

//duty_cycle
integer h_level_2;
realtime clkout2_duty_odd;
always @(*)
begin
    h_level_2 = ODIV2_SEL_reg / 2;
    clkout2_duty_odd = (clkout2_period * h_level_2 / ODIV2_SEL_reg);
end

always @(clkout2_half or real_duty2 or real_phase2 or ODIV2_SEL_reg or clkout2_period or clkout2_duty_odd)
begin
    real_duty2 = (CLKOUT2_PE_COARSE + (unit_duty * CLKOUT2_PE_FINE/8));

    if(CLK2_IN_SEL == 1'b1)
    begin
        if(ODIV2_SEL_reg == 1)
        begin
            clkout2_duty = clkout2_half;
        end else begin
            clkout2_duty = clkout2_duty_odd;
        end
    end else if((DYN_PE2_SEL == "FALSE") || (DE2_EN == "FALSE"))
    begin
        clkout2_duty = clkout2_half;
    end else if((DYN_DPA_EN == "TRUE") && (DE2_EN == "TRUE"))
    begin
        if(ODIV2_SEL_reg == 1)
        begin
            clkout2_duty = clkout2_half;
        end else begin
            if(real_duty2 > real_phase2)
            begin
                clkout2_duty = (clkout2_period * (real_duty2 - real_phase2))/(ODIV2_SEL_reg);
            end else if(real_duty2 < real_phase2)
            begin
                clkout2_duty = (clkout2_period *((ODIV2_SEL_reg) + (real_duty2 - real_phase2)))/(ODIV2_SEL_reg);
            end
        end
    end
end


always @(posedge clk2) begin
    clkout_2 <= 1'b1;
    #tclk2_duty
    clkout_2 <= 1'b0;
end

always@(clkout_2,clk2_dt_dir) begin
    if(clk2_dt_dir == 1'b1)
    begin
        clkout_dt_2 <= clkout_2;
    end else begin
        clkout_dt_2 <= #(clk2_dt_delay) clkout_2;
    end
end

always @(clkout_dt_2) begin
    clkout2_ps <= #(phase_value2) clkout_dt_2;
end

always @(CLKIN or oclk_effect or clkout2_ps or reseti or reseto or rst_p) begin
    if (rst_p == 1'b1) begin
        clk2_out <= 1'b0;
    end else if (reseti == 1'b1 && CLK2_IN_SEL == 1'b0) begin
        clk2_out <= 1'b0;
    end else if (reseto == 1'b1) begin
        clk2_out <= 1'b0;
    end else if(CLK2_OUT_SEL == 1'b0) begin
        clk2_out <= clkout2_ps;
    end
end

assign CLKOUT2 = (CLK2_OUT_SEL == 1'b1)? CLKIN : ((cken2 == 1'b1) ? clk2_out : 1'b0);

// clkout3
//
always @(*)
begin
    if(DYN_PE3_SEL == "TRUE" && DYN_DPA_EN == "TRUE")
    begin
        fine_3 = fine_dyn_3;
        coarse_3 = coarse_dyn_3;
    end else if(DYN_PE3_SEL == "FALSE")
    begin
        fine_3 = CLKOUT3_PE_FINE;
        coarse_3 = CLKOUT3_PE_COARSE;
    end
end

always @(coarse_3 or fine_3 or ODIV3_SEL_reg or clkout3_period) begin
    real_phase3 = (coarse_3 + (unit_phase * fine_3/8));    
    phase_value3 = clkout3_period * (real_phase3/ODIV3_SEL_reg);
end

//duty_cycle
integer h_level_3;
realtime clkout3_duty_odd;
always @(*)
begin
    h_level_3 = ODIV3_SEL_reg / 2;
    clkout3_duty_odd = (clkout3_period * h_level_3 / ODIV3_SEL_reg);
end

always @(clkout3_half or real_duty3 or real_phase3 or ODIV3_SEL_reg or clkout3_period or clkout3_duty_odd)
begin
    real_duty3 = (CLKOUT3_PE_COARSE + (unit_duty * CLKOUT3_PE_FINE/8));

    if(CLK3_IN_SEL == 1'b1)
    begin
        if(ODIV3_SEL_reg == 1)
        begin
            clkout3_duty = clkout3_half;
        end else begin
            clkout3_duty = clkout3_duty_odd;
        end
    end else if((DYN_PE3_SEL == "FALSE") || (DE3_EN == "FALSE"))
    begin
        clkout3_duty = clkout3_half;
    end else if((DYN_DPA_EN == "TRUE") && (DE3_EN == "TRUE"))
    begin
        if(ODIV3_SEL_reg == 1)
        begin
            clkout3_duty = clkout3_half;
        end else begin
            if(real_duty3 > real_phase3)
            begin
                clkout3_duty = (clkout3_period * (real_duty3 - real_phase3))/(ODIV3_SEL_reg);
            end else if(real_duty3 < real_phase3)
            begin
                clkout3_duty = (clkout3_period *((ODIV3_SEL_reg) + (real_duty3 - real_phase3)))/(ODIV3_SEL_reg);
            end
        end
    end
end


always @(posedge clk3) begin
    clkout_3 <= 1'b1;
    #tclk3_duty
    clkout_3 <= 1'b0;
end

always@(clkout_3,clk3_dt_dir) begin
    if(clk3_dt_dir == 1'b1)
    begin
        clkout_dt_3 <= clkout_3;
    end else begin
        clkout_dt_3 <= #(clk3_dt_delay) clkout_3;
    end
end

always @(clkout_dt_3) begin
    clkout3_ps <= #(phase_value3) clkout_dt_3;
end

always @(CLKIN or oclk_effect or clkout3_ps or reseti or reseto or rst_p) begin
    if (rst_p == 1'b1) begin
        clk3_out <= 1'b0;
    end else if (reseti == 1'b1 && CLK3_IN_SEL == 1'b0) begin
        clk3_out <= 1'b0;
    end else if (reseto == 1'b1) begin
        clk3_out <= 1'b0;
    end else if(CLK3_OUT_SEL == 1'b0) begin
        clk3_out <= clkout3_ps;
    end
end

assign CLKOUT3 = (CLK3_OUT_SEL == 1'b1)? CLKIN : ((cken3 == 1'b1) ? clk3_out : 1'b0);

// clkout4
//
always @(*)
begin
    if(DYN_PE4_SEL == "TRUE" && DYN_DPA_EN == "TRUE")
    begin
        fine_4 = fine_dyn_4;
        coarse_4 = coarse_dyn_4;
    end else if(DYN_PE4_SEL == "FALSE")
    begin
        fine_4 = CLKOUT4_PE_FINE;
        coarse_4 = CLKOUT4_PE_COARSE;
    end
end

always @(coarse_4 or fine_4 or ODIV4_SEL_reg or clkout4_period) begin
    real_phase4 = (coarse_4 + (unit_phase * fine_4/8));
    phase_value4 = clkout4_period * (real_phase4/ODIV4_SEL_reg);
end

//duty_cycle
integer h_level_4;
realtime clkout4_duty_odd;
always @(*)
begin
    h_level_4 = ODIV4_SEL_reg / 2;
    clkout4_duty_odd = (clkout4_period * h_level_4 / ODIV4_SEL_reg);
end

always @(clkout4_half or real_duty4 or real_phase4 or ODIV4_SEL_reg or clkout4_period or clkout4_duty_odd) 
begin
    real_duty4 = (CLKOUT4_PE_COARSE + (unit_duty * CLKOUT4_PE_FINE/8));
    if(CLK4_IN_SEL == 2'b10 || CLK4_IN_SEL == 2'b01)
    begin
        if(ODIV4_SEL_reg == 1)
        begin
            clkout4_duty = clkout4_half;
        end else begin
            clkout4_duty = clkout4_duty_odd;
        end
    end else if(DYN_PE4_SEL == "FALSE" || DE4_EN == "FALSE")
    begin
        clkout4_duty = clkout4_half;
    end else if(DYN_DPA_EN == "TRUE" && DE4_EN == "TRUE")
    begin
        if(ODIV4_SEL_reg == 1)
        begin
            clkout4_duty = clkout4_half;
        end else begin
            if(real_duty4 > real_phase4)
            begin
                clkout4_duty = (clkout4_period * (real_duty4 - real_phase4))/ODIV4_SEL_reg;
            end else if(real_duty4 < real_phase4)
            begin
                clkout4_duty = (clkout4_period *(ODIV4_SEL_reg + (real_duty4 - real_phase4)))/ODIV4_SEL_reg; 
            end
        end

    end
end

always @(posedge clk4) begin
    clkout_4 <= 1'b1;
    #clkout4_duty
    clkout_4 <= 1'b0;
end

always @(clkout_4) begin
    clkout4_ps <= #(phase_value4) clkout_4;
end

always @(CLKIN or oclk_effect or clkout4_ps or reseti or reseto or rst_p) begin
    if (rst_p == 1'b1) begin
        clk4_out <= 1'b0;
    end else if (reseti == 1'b1 && CLK4_IN_SEL == 2'b00) begin
        clk4_out <= 1'b0;
    end else if (reseto == 1'b1) begin
        clk4_out <= 1'b0;
    end else if(CLK4_OUT_SEL == 1'b0) begin
        clk4_out <= clkout4_ps;
    end
end

assign CLKOUT4 = (CLK4_OUT_SEL == 1'b1)? CLKIN : ((cken4 == 1'b1) ? clk4_out : 1'b0);


// clkout5
//
always @(*)
begin
    if(DYN_PE5_SEL == "TRUE" && DYN_DPA_EN == "TRUE")
    begin
        fine_5 = fine_dyn_5;
        coarse_5 = coarse_dyn_5;
    end else if(DYN_PE5_SEL == "FALSE")
    begin
        fine_5 = CLKOUT5_PE_FINE;
        coarse_5 = CLKOUT5_PE_COARSE;
    end
end

always @(coarse_5 or fine_5 or ODIV5_SEL_reg or clkout5_period) begin
    real_phase5 = (coarse_5 + (unit_phase * fine_5/8));
    phase_value5 = clkout5_period * (real_phase5/ODIV5_SEL_reg);
end

//duty_cycle
integer h_level_5;
realtime clkout5_duty_odd;
always @(*)
begin
    h_level_5 = ODIV5_SEL_reg / 2;
    clkout5_duty_odd = (clkout5_period * h_level_5 / ODIV5_SEL_reg);
end

always @(clkout5_half or real_duty5 or real_phase5 or ODIV5_SEL_reg or clkout5_period or clkout5_duty_odd) 
begin
    real_duty5 = (CLKOUT5_PE_COARSE + (unit_duty * CLKOUT5_PE_FINE/8));
    if(CLK5_IN_SEL == 1'b1)
    begin
        if(ODIV5_SEL_reg == 1)
        begin
            clkout5_duty = clkout5_half;
        end else begin
            clkout5_duty = clkout5_duty_odd;
        end
    end else if(DYN_PE5_SEL == "FALSE" || DE5_EN == "FALSE")
    begin
        clkout5_duty = clkout5_half;
    end else if(DYN_DPA_EN == "TRUE" && DE5_EN == "TRUE")
    begin
        if(ODIV5_SEL_reg == 1)
        begin
            clkout5_duty = clkout5_half;
        end else begin
            if(real_duty5 > real_phase5)
            begin
                clkout5_duty = (clkout5_period * (real_duty5 - real_phase5))/ODIV5_SEL_reg;
            end else if(real_duty5 < real_phase5)
            begin
                clkout5_duty = (clkout5_period *(ODIV5_SEL_reg + (real_duty5 - real_phase5)))/ODIV5_SEL_reg; 
            end
        end

    end
end

always @(posedge clk5) begin
    clkout_5 <= 1'b1;
    #clkout5_duty
    clkout_5 <= 1'b0;
end

always @(clkout_5) begin
    clkout5_ps <= #(phase_value5) clkout_5;
end

always @(CLKIN or oclk_effect or clkout5_ps or reseti or reseto or rst_p) begin
    if (rst_p == 1'b1) begin
        clk5_out <= 1'b0;
    end else if (reseti == 1'b1 && CLK5_IN_SEL == 1'b0) begin
        clk5_out <= 1'b0;
    end else if (reseto == 1'b1) begin
        clk5_out <= 1'b0;
    end else if(CLK5_OUT_SEL == 1'b0) begin
        clk5_out <= clkout5_ps;
    end
end

assign CLKOUT5 = (CLK5_OUT_SEL == 1'b1)? CLKIN : ((cken5 == 1'b1) ? clk5_out : 1'b0);


// clkout6
//
always @(*)
begin
    if(DYN_PE6_SEL == "TRUE" && DYN_DPA_EN == "TRUE")
    begin
        fine_6 = fine_dyn_6;
        coarse_6 = coarse_dyn_6;
    end else if(DYN_PE6_SEL == "FALSE")
    begin
        fine_6 = CLKOUT6_PE_FINE;
        coarse_6 = CLKOUT6_PE_COARSE;
    end
end

always @(coarse_6 or fine_6 or ODIV6_SEL_reg or clkout6_period) begin
    real_phase6 = (coarse_6 + (unit_phase * fine_6/8));
    phase_value6 = clkout6_period * (real_phase6/ODIV6_SEL_reg);
end

//duty_cycle
integer h_level_6;
realtime clkout6_duty_odd;
always @(*)
begin
    h_level_6 = ODIV6_SEL_reg / 2;
    clkout6_duty_odd = (clkout6_period * h_level_6 / ODIV6_SEL_reg);
end

always @(clkout6_half or real_duty6 or real_phase6 or ODIV6_SEL_reg or clkout6_period or clkout6_duty_odd) 
begin
    real_duty6 = (CLKOUT6_PE_COARSE + (unit_duty * CLKOUT6_PE_FINE/8));
    
    if(CLK6_IN_SEL == 1'b1)
    begin
        if(ODIV6_SEL_reg == 1)
        begin
            clkout6_duty = clkout6_half;
        end else begin    
            clkout6_duty = clkout6_duty_odd;
        end
    end else if(DYN_PE6_SEL == "FALSE" || DE6_EN == "FALSE")
    begin
        clkout6_duty = clkout6_half;
    end else if(DYN_DPA_EN == "TRUE" && DE6_EN == "TRUE")
    begin
        if(ODIV6_SEL_reg == 1)
        begin
            clkout6_duty = clkout6_half;
        end else begin
            if(real_duty6 > real_phase6)
            begin
                clkout6_duty = (clkout6_period * (real_duty6 - real_phase6))/ODIV6_SEL_reg;
            end else if(real_duty6 < real_phase6)
            begin
                clkout6_duty = (clkout6_period *(ODIV6_SEL_reg + (real_duty6 - real_phase6)))/ODIV6_SEL_reg; 
            end
        end

    end
end

always @(posedge clk6) begin
    clkout_6 <= 1'b1;
    #clkout6_duty
    clkout_6 <= 1'b0;
end

always @(clkout_6) begin
    clkout6_ps <= #(phase_value6) clkout_6;
end

always @(CLKIN or oclk_effect or clkout6_ps or reseti or reseto or rst_p) begin
    if (rst_p == 1'b1) begin
        clk6_out <= 1'b0;
    end else if (reseti == 1'b1 && CLK6_IN_SEL == 1'b0) begin
        clk6_out <= 1'b0;
    end else if (reseto == 1'b1) begin
        clk6_out <= 1'b0;
    end else if(CLK6_OUT_SEL == 1'b0) begin
        clk6_out <= clkout6_ps;
    end
end

assign CLKOUT6 = (CLK6_OUT_SEL == 1'b1)? CLKIN : ((cken6 == 1'b1) ? clk6_out : 1'b0);

endmodule


//AE350_SOC
module AE350_SOC (
            POR_N,          //Power on reset, 0 is reset state
            HW_RSTN,        //Hardware reset input, 0 is reset state
            CORE_CLK,       //CPU core clock, up to 800MHz, dedicated clock path.        
            //ADD DDR_CLK AND DDR_CE
            DDR_CLK,        //DDR bus clock in, up to 250MHz
            AHB_CLK,        //AHB bus clock in, up to 250MHz
            APB_CLK,        //APB bus clock in, up to 250MHz
            DBG_TCK,        //JTAG tck clock input
            RTC_CLK,        //RTC clock input, this clock should be alive while CPU waiting for wake up
            CORE_CE,        //CPU core_clk enable. CPU clock is gated when 0.
            AXI_CE,         //Internal AXI bus clock enable, gated when 0.
            DDR_CE,         //DDR bus clock enable, gated when 0.
            AHB_CE,         //AHB bus clock enable, gated when 0.
            APB_CE,         //APB bus and peripherals clock enable, gated when 0.
            APB2AHB_CE,     //APB to AHB clock valid enable. 1 when apb_clk_in = ahb_clk_in. 
            PRESETN,        //apb_clk_in synced reset_n output
            HRESETN,        //ahb_clk_in synced reset_n output
            //ADD DDR_RSTN
            DDR_RSTN,       //ddr_clk_in synced reset_n output
            
            GP_INT,         //16 user interrupt input.
            DMA_REQ,        //8 dma requests input.
            DMA_ACK,        //8 dma ack output.

            CORE0_WFI_MODE, //CPU going into WFI mode, posedge is WFI valid
            WAKEUP_IN,      //input to wake up CPU, 0 is wake up
            RTC_WAKEUP,     //Output to wake up RTC clock, 1 is wake up
            SCAN_TEST,      //scan test, to SPI and clock gen
            SCAN_EN,        //scan enable, to SPI and clock gen
            TEST_CLK,       //Test mode clock
            TEST_MODE,      //Test mode, 1 is enable
            TEST_RSTN,      //Test mode resetn, 0 is reset state
            //AHB PORT FOR ROM       
            ROM_HADDR ,     //rom AHB address 
            ROM_HRDATA,     //rom AHB read data
            ROM_HREADY,     //rom AHB hready
            ROM_HRESP ,     //rom AHB hresp
            ROM_HTRANS,     //rom AHB htrans control 
            ROM_HWRITE,     //rom AHB hwrite control
            //APB PORT FOR FABRIC
            APB_PADDR    ,  //APB signals
            APB_PENABLE  ,
            APB_PRDATA   ,
            APB_PREADY   ,
            APB_PSEL     ,
            APB_PWDATA   ,
            APB_PWRITE   ,
            APB_PSLVERR  ,
            APB_PPROT    ,
            APB_PSTRB    ,
            //EXT AHB SLV PORT(MCU BUS IS MASTER)
            EXTS_HRDATA,    //EXT AHB slave read data
            EXTS_HREADYIN,  //EXT AHB slave ready input
            EXTS_HRESP,     //EXT AHB slave read response
            EXTS_HADDR,     //EXT AHB slave address
            EXTS_HBURST,    //EXT AHB slave burst
            EXTS_HPROT,     //EXT AHB slave prot
            EXTS_HSEL,      //EXT AHB slave select
            EXTS_HSIZE,     //EXT AHB slave size
            EXTS_HTRANS,    //EXT AHB slave trans
            EXTS_HWDATA,    //EXT AHB slave write data
            EXTS_HWRITE,    //EXT AHB slave write control
            //EXT AHB MST PORT(MCU BUS IS SLAVE)
            EXTM_HADDR,     //EXT AHB master address input
            EXTM_HBURST,    //EXT AHB master burst input
            EXTM_HPROT,     //EXT AHB master prot input
            EXTM_HRDATA,    //EXT AHB master read data output
            EXTM_HREADY,    //EXT AHB master ready input
            EXTM_HREADYOUT, //EXT AHB master ready output
            EXTM_HRESP,     //EXT AHB master read response output
            EXTM_HSEL,      //EXT AHB master select input
            EXTM_HSIZE,     //EXT AHB master size input
            EXTM_HTRANS,    //EXT AHB master trans input
            EXTM_HWDATA,    //EXT AHB master write data input
            EXTM_HWRITE,    //EXT AHB master write control input
            //SRAM PORT FOR FABRIC
            DDR_HADDR,      //ddr/sram AHB access address
            DDR_HBURST,     //ddr/sram AHB burst
            DDR_HPROT,      //ddr/sram AHB prot
            DDR_HRDATA,     //ddr/sram AHB read data
            DDR_HREADY,     //ddr/sram AHB ready
            DDR_HRESP,      //ddr/sram AHB response
            DDR_HSIZE,      //ddr/sram AHB size
            DDR_HTRANS,     //ddr/sram AHB trans
            DDR_HWDATA,     //ddr/sram AHB write data
            DDR_HWRITE,     //ddr/sram AHB write control

            //JTAG
            TMS_IN,     //JTAG tms input
            TRST_IN,    //JTAG trst input
            TDI_IN,     //JTAG tdi input
            TDO_OUT,    //JTAG tdo output
            TDO_OE,     //JTAG tdo_en output
            
            //SPI
            SPI2_HOLDN_IN,  //SPI hold
            SPI2_WPN_IN,    //SPI wpn
            SPI2_CLK_IN,    //SPI clk_in
            SPI2_CSN_IN,    //SPI csn_in
            SPI2_MISO_IN,   //SPI miso_in
            SPI2_MOSI_IN,   //SPI mosi_in
            SPI2_HOLDN_OUT, //SPI holdn_out
            SPI2_HOLDN_OE,  //SPI holdn out enable
            SPI2_WPN_OUT,   //SPI wpn_out
            SPI2_WPN_OE,    //SPI wpn out enable
            SPI2_CLK_OUT,   //SPI clk_out
            SPI2_CLK_OE,    //SPI clk out enable
            SPI2_CSN_OUT,   //SPI csn_out
            SPI2_CSN_OE,    //SPI csn out enable
            SPI2_MISO_OUT,  //SPI miso_out
            SPI2_MISO_OE,   //SPI miso out enable
            SPI2_MOSI_OUT,  //SPI mosi_out
            SPI2_MOSI_OE,   //SPI mosi out enable
            //I2C
            I2C_SCL_IN,     //I2C SCL input
            I2C_SDA_IN,     //I2C SDA input
            I2C_SCL,        //I2C SCL output
            I2C_SDA,        //I2C SDA output
            //UART1
            UART1_TXD,      //UART1 txd
            UART1_RTSN,     //UART1 rtsn
            UART1_RXD,      //UART1 rxd
            UART1_CTSN,     //UART1 ctsn
            UART1_DSRN,     //UART1 dsrn
            UART1_DCDN,     //UART1 dcdn
            UART1_RIN,      //UART1 rin
            UART1_DTRN,     //UART1 dtrn
            UART1_OUT1N,    //UART1 out1n
            UART1_OUT2N,    //UART1 out2n
            //UART2
            UART2_TXD,      //UART2 txd
            UART2_RTSN,     //UART2 rtsn
            UART2_RXD,      //UART2 rxd
            UART2_CTSN,     //UART2 ctsn
            UART2_DCDN,     //UART2 dcdn
            UART2_DSRN,     //UART2 dsrn
            UART2_RIN,      //UART2 rin
            UART2_DTRN,     //UART2 dtrn
            UART2_OUT1N,    //UART2 out1n
            UART2_OUT2N,    //UART2 out2n
            //PIT
            CH0_PWM,        //Channel 0 output
            CH0_PWMOE,      //Channel 0 output enable
            CH1_PWM,        //Channel 1 output
            CH1_PWMOE,      //Channel 1 output enable
            CH2_PWM,        //Channel 2 output
            CH2_PWMOE,      //Channel 2 output enable
            CH3_PWM,        //Channel 3 output
            CH3_PWMOE,      //Channel 3 output enable

            //SRAM
            PGEN_CHAIN_I,
            PRDYN_CHAIN_O,
                            //VDD         0.8   0.9  1.0
            EMA,            //EMA[2:0]    100   011  011
            EMAW,           //EMAW[1:0]   01    01   01
            EMAS,           //EMAS        0     0    0
            RET1N,
            RET2N,
            //MBIST
            SCAN_IN,
            INTEG_TCK,
            INTEG_TDI,
            INTEG_TMS,
            INTEG_TRST,
            INTEG_TDO,
            SCAN_OUT,           

            //GPIO
            GPIO_IN,        //GPIO input
            GPIO_OE,        //GPIO output enable
            GPIO_OUT        //GPIO output
);


input               POR_N;
input               HW_RSTN;
input               CORE_CLK;
input               DDR_CLK;
input               AHB_CLK;
input               APB_CLK;
input               DBG_TCK;
input               RTC_CLK;
input               CORE_CE;
input               AXI_CE;
input               DDR_CE;
input               AHB_CE;
input     [7:0]     APB_CE;
input               APB2AHB_CE;
input               SCAN_TEST;
input               SCAN_EN;
output              PRESETN;
output              HRESETN;
//ADD DDR_RSTN
output              DDR_RSTN;

input       [15:0]  GP_INT;
input       [ 7:0]  DMA_REQ;
output      [ 7:0]  DMA_ACK;

output              CORE0_WFI_MODE;
input               WAKEUP_IN;           
output              RTC_WAKEUP;           

input               TEST_CLK;
input               TEST_MODE;
input               TEST_RSTN;
//AHB PORT FOR ROM, ONLY READ, NO SIZE NO BURST NO SEL
output  [31:0]      ROM_HADDR;
input   [31:0]      ROM_HRDATA;
input               ROM_HREADY;
input               ROM_HRESP;
output   [1:0]      ROM_HTRANS;
output              ROM_HWRITE;
//APB PORT FOR FABRIC
output  [31:0]      APB_PADDR;
output              APB_PENABLE;
input   [31:0]      APB_PRDATA;
input               APB_PREADY;
output              APB_PSEL;
output  [31:0]      APB_PWDATA;
output              APB_PWRITE;
input               APB_PSLVERR;
output   [2:0]      APB_PPROT;
output   [3:0]      APB_PSTRB;
//EXT AHB SLV PORT(MCU BUS IS MASTER)
input   [31:0]      EXTS_HRDATA;
input               EXTS_HREADYIN;
input               EXTS_HRESP;
output  [31:0]      EXTS_HADDR;
output   [2:0]      EXTS_HBURST;
output   [3:0]      EXTS_HPROT;
output              EXTS_HSEL;
output   [2:0]      EXTS_HSIZE;
output   [1:0]      EXTS_HTRANS;
output  [31:0]      EXTS_HWDATA;
output              EXTS_HWRITE;
//EXT AHB MST PORT(MCU BUS IS SLAVE)
input   [31:0]      EXTM_HADDR;
input    [2:0]      EXTM_HBURST;
input    [3:0]      EXTM_HPROT;
output  [63:0]      EXTM_HRDATA;
input               EXTM_HREADY;
output              EXTM_HREADYOUT;
output              EXTM_HRESP;
input               EXTM_HSEL;
input    [2:0]      EXTM_HSIZE;
input    [1:0]      EXTM_HTRANS;
input   [63:0]      EXTM_HWDATA;
input               EXTM_HWRITE;
//DDR PORT FOR FABRIC
output  [31:0]      DDR_HADDR;
output   [2:0]      DDR_HBURST;
output   [3:0]      DDR_HPROT;
input   [63:0]      DDR_HRDATA;
input               DDR_HREADY;
input               DDR_HRESP;
output   [2:0]      DDR_HSIZE;
output   [1:0]      DDR_HTRANS;
output  [63:0]      DDR_HWDATA;
output              DDR_HWRITE;

//GENERAL PINS
input               TMS_IN;           
input               TRST_IN;
input               TDI_IN;
output              TDO_OUT;
output              TDO_OE;


input               SPI2_HOLDN_IN;
input               SPI2_WPN_IN;
input               SPI2_CLK_IN;
input               SPI2_CSN_IN;
input               SPI2_MISO_IN;
input               SPI2_MOSI_IN;
output              SPI2_HOLDN_OUT;
output              SPI2_HOLDN_OE;
output              SPI2_WPN_OUT;
output              SPI2_WPN_OE;
output              SPI2_CLK_OUT;
output              SPI2_CLK_OE;
output              SPI2_CSN_OUT;
output              SPI2_CSN_OE;
output              SPI2_MISO_OUT;
output              SPI2_MISO_OE;
output              SPI2_MOSI_OUT;
output              SPI2_MOSI_OE;

input               I2C_SCL_IN;
input               I2C_SDA_IN;
output              I2C_SCL;
output              I2C_SDA;

output              UART1_TXD;
output              UART1_RTSN;
input               UART1_RXD;
input               UART1_CTSN;
input               UART1_DSRN;
input               UART1_DCDN;
input               UART1_RIN;
output              UART1_DTRN;
output              UART1_OUT1N;
output              UART1_OUT2N;

output              UART2_TXD;
output              UART2_RTSN;
input               UART2_RXD;
input               UART2_CTSN;
input               UART2_DCDN;
input               UART2_DSRN;
input               UART2_RIN;
output              UART2_DTRN;
output              UART2_OUT1N;
output              UART2_OUT2N;

output              CH0_PWM;
output              CH0_PWMOE;
output              CH1_PWM;
output              CH1_PWMOE;
output              CH2_PWM;
output              CH2_PWMOE;
output              CH3_PWM;
output              CH3_PWMOE;

input     [31:0]    GPIO_IN;
output    [31:0]    GPIO_OE;
output    [31:0]    GPIO_OUT;

//MBIST		
input	 [19:0]	SCAN_IN;
input		INTEG_TCK;
input		INTEG_TDI;
input		INTEG_TMS;
input		INTEG_TRST;
output		INTEG_TDO;
output   [19:0]	SCAN_OUT;

//SRAM
input		PGEN_CHAIN_I;
output		PRDYN_CHAIN_O;
input	[2:0]	EMA;
input	[1:0]	EMAW;
input		EMAS;
input		RET1N;
input		RET2N;


/******************************************************************/

endmodule

//AE350_RAM
module AE350_RAM (
            POR_N,          //Power on reset, 0 is reset state
            HW_RSTN,        //Hardware reset input, 0 is reset state
            CORE_CLK,       //CPU core clock, up to 800MHz, dedicated clock path.        
            AHB_CLK,        //AHB bus clock in, up to 250MHz
            APB_CLK,        //APB bus clock in, up to 250MHz
            RTC_CLK,        //RTC clock input, this clock should be alive while CPU waiting for wake up
            CORE_CE,        //CPU core_clk enable. CPU clock is gated when 0.
            AXI_CE,         //Internal AXI bus clock enable, gated when 0.
            AHB_CE,         //AHB bus clock enable, gated when 0.
            
            //EXT AHB MST PORT(MCU BUS IS SLAVE)
            EXTM_HADDR,     //EXT AHB master address input
            EXTM_HBURST,    //EXT AHB master burst input
            EXTM_HPROT,     //EXT AHB master prot input
            EXTM_HRDATA,    //EXT AHB master read data output
            EXTM_HREADY,    //EXT AHB master ready input
            EXTM_HREADYOUT, //EXT AHB master ready output
            EXTM_HRESP,     //EXT AHB master read response output
            EXTM_HSEL,      //EXT AHB master select input
            EXTM_HSIZE,     //EXT AHB master size input
            EXTM_HTRANS,    //EXT AHB master trans input
            EXTM_HWDATA,    //EXT AHB master write data input
            EXTM_HWRITE,    //EXT AHB master write control input

                            //VDD         0.8   0.9  1.0
            EMA,            //EMA[2:0]    100   011  011
            EMAW,           //EMAW[1:0]   01    01   01
            EMAS,           //EMAS        0     0    0
            RET1N,
            RET2N
     
);

input               POR_N;
input               HW_RSTN;
input               CORE_CLK;
input               AHB_CLK;
input               APB_CLK;
input               RTC_CLK;
input               CORE_CE;
input               AXI_CE;
input               AHB_CE;

//EXT AHB MST PORT(MCU BUS IS SLAVE)
input   [31:0]      EXTM_HADDR;
input    [2:0]      EXTM_HBURST;
input    [3:0]      EXTM_HPROT;
output  [63:0]      EXTM_HRDATA;
input               EXTM_HREADY;
output              EXTM_HREADYOUT;
output              EXTM_HRESP;
input               EXTM_HSEL;
input    [2:0]      EXTM_HSIZE;
input    [1:0]      EXTM_HTRANS;
input   [63:0]      EXTM_HWDATA;
input               EXTM_HWRITE;

//SRAM
input	[2:0]	EMA;
input	[1:0]	EMAW;
input		EMAS;
input		RET1N;
input		RET2N;

/******************************************************************/

endmodule


//SAMB,spi address for multi boot
module SAMB(SPIAD, LOAD, ADWSEL);
parameter MODE = 2'b00; //00,normal mode; 01, fast mode; 10,dual mode; 11,quad mode

input [23:0] SPIAD;//spi flash address
input LOAD;//Select dynamic address signal SPIAD at high level
input ADWSEL; //0, the address is 24-bit; 1, the address is 32-bit(add 0 to the low 8-bit address)

endmodule

//OTP,One-Time-Programming
module OTP (DOUT, READ, SHIFT);
parameter MODE = 1'b0; //1'b0,read DNA info; 1'b1, read usr info

input READ, SHIFT;
output DOUT;

endmodule

//CMSER(Configuration Memory Soft Error Recovery),GW5AT-138
module CMSER(RUNNING,CRCERR,CRCDONE,ECCCORR,ECCUNCORR,ERRLOC,ECCDEC,DSRRD,DSRWR,ASRRESET,ASRINC,REFCLK,CLK,SEREN,ERRINJECT,ERRINJLOC);
output RUNNING;//The high level of this signal indicates CMSER is running
output CRCERR;//one cycle high pulse to indicate the CRC error event
output CRCDONE;//one cycle high pulse to indicate the completion of CRC calculation and comparison
output ECCCORR;//one cycle high pulse to indicate the correctable ECC error event
output ECCUNCORR; //one cycle high pulse to indicate the uncorrectable ECC error event
output [27:0] ERRLOC;//the location of ECC error.
output ECCDEC;//The indication of ECC block decoding is running.1: one ECC block is decoding at that clock cycle;0: no ECC decoding at that clock cycle
output DSRRD;//one cycle high pulse to indicate the reading operation of DSR
output DSRWR; //one cycle high pulse to indicate the writing operation of DSR
output ASRRESET;//one cycle high pulse to indicate the reset of ASR
output ASRINC;//one cycle high pulse to indicate the increase of ASR address
output REFCLK;//the output reference clock for the generation of user CMSER interface design.

input CLK;//SER clock
input [2:0] SEREN;//(the critical signal using TMR scheme for error reduction).rising edge (at least two of three bits are detected to transit from "0" to "1") to start CMSER; falling edge (at least two bites are detected to transit from "1" to "0") to stop CMSER
input ERRINJECT;//one cycle high pulse to indicate that an error is required to be injected into a ECC block; the pulse must arise at the same clock cycle as the target ECC block is under decoding
input [6:0] ERRINJLOC;//the location of error within a 72-bit ECC block
                      //0_nnnnnn: the location of 64-bit data, for example:
                      //0_000000: the ECC data bit[0]
                      //0_111111: the ECC data bit[63]
                      //1_xxxnnn: the location of 8-bit parity
                      //(x means “don’t care), for example:
                      //1_xxx000: the ECC parity bit[0]
                      //1_xxx111: the ECC parity bit[7]


endmodule


//CMSERA,GW5A-25
module CMSERA(RUNNING, CRCERR, CRCDONE, ECCCORR, ECCUNCORR, ERR0LOC, ERR1LOC, ECCDEC, DSRRD, DSRWR, ASRRESET, ASRINC, REFCLK, CLK, SEREN, ERR0INJECT, ERR1INJECT, ERRINJ0LOC, ERRINJ1LOC);
output RUNNING;//The high level of this signal indicates CMSER is running
output CRCERR;//one cycle high pulse to indicate the CRC error event
output CRCDONE;//one cycle high pulse to indicate the completion of CRC calculation and comparison
output ECCCORR;//one cycle high pulse to indicate the correctable ECC error event
output ECCUNCORR; //one cycle high pulse to indicate the uncorrectable ECC error event
output [26:0] ERR0LOC;//the location of ECC error 0.
output [26:0] ERR1LOC;//the location of ECC error 1.
output ECCDEC;//The indication of ECC block decoding is running.1: one ECC block is decoding at that clock cycle;0: no ECC decoding at that clock cycle
output DSRRD;//one cycle high pulse to indicate the reading operation of DSR
output DSRWR; //one cycle high pulse to indicate the writing operation of DSR
output ASRRESET;//one cycle high pulse to indicate the reset of ASR
output ASRINC;//one cycle high pulse to indicate the increase of ASR address
output REFCLK;//the output reference clock for the generation of user CMSER interface design.

input CLK;//SER clock
input [2:0] SEREN;//(the critical signal using TMR scheme for error reduction).rising edge (at least two of three bits are detected to transit from "0" to "1") to start CMSER; falling edge (at least two bites are detected to transit from "1" to "0") to stop CMSER
input ERR0INJECT,ERR1INJECT;
input [6:0] ERRINJ0LOC,ERRINJ1LOC;


endmodule


/********ADC***********/
//ADC for LRC,GW5AT-138K
module ADCLRC (
//Voltage signal source, /mV
  input  ADCINBK2A,       //input from bank2 IO, adc_in_b is the reference
  input  ADCINBK2B,       //input from bank2 IO, adc_in_b is the reference
  input  ADCINBK3A,       //input from bank3 IO, adc_in_b is the reference
  input  ADCINBK3B,       //input from bank3 IO, adc_in_b is the reference
  input  ADCINBK4A,       //input from bank4 IO, adc_in_b is the reference
  input  ADCINBK4B,       //input from bank4 IO, adc_in_b is the reference
  input  ADCINBK5A,       //input from bank5 IO, adc_in_b is the reference
  input  ADCINBK5B,       //input from bank5 IO, adc_in_b is the reference

//control signal
  input  [2:0] VSENCTL,    //Input source selection (ciu), from 0 to 7: adcv, adct, vdd09_0, vdd09_1, vdd18_0, vdd18_1, vdd33_0, vdd33_1   
  
  input [9:0] FSCAL_VALUE,   // temperature mode 510~948, typical value 730; Voltage mode 452~840, typical value 653
  input [11:0] OFFSET_VALUE, //signed number, temperature mode - 1560~- 760, typical value - 1180; Voltage mode - 410~410, typical value 0

  input  ADCEN,         //Enable signal, active high
  input  CLK,           //clk input，1/2 shared
  input  DRSTN,         //0/1 shared, Digital part reset signal, active low
  input  ADCREQI,       //Measurement request signal, valid rising edge, asynchronous signal
  //input  ADCREGI,       //Measurement request signal, valid rising edge, asynchronous signal

  //output
  output ADCRDY,          //The measurement completion signal, active high
  output [13:0] ADCVALUE //The measurement result output, signed number. In voltage mode,/2048 is the actual measured value; In temperature mode,/4 is the actual measured value

);

  parameter DYN_BKEN = "FALSE";//"FALSE","TRUE"."TRUE",BUF_BK2_EN[0]&BUF_BK3_EN[0]=1
//Input source selection，1/2 shared
  parameter BUF_SERDES_Q1_EN = 3'b000;    //[1:0] does not support "11"
  parameter BUF_BK2_EN       = 6'b000000; //[3:0] Only one bit can be 1 at the same time
  parameter BUF_BK3_EN       = 6'b000000; //[3:0] Only one bit can be 1 at the same time
  parameter BUF_BK4_EN       = 6'b000000; //[3:0] Only one bit can be 1 at the same time
  parameter BUF_BK5_EN       = 6'b000000; //[3:0] Only one bit can be 1 at the same time
  parameter BUF_BK10_EN      = 5'b00000;  //[3:1] Only one bit can be 1 at the same time
  parameter BUF_BK11_EN      = 5'b00000;  //[3:1] Only one bit can be 1 at the same time
//Analog terminal option
  parameter CLK_SEL          = 1'b0;      //Clock source selection. 0,PIOCLK_SEL，1,ciu_clk
  parameter PIOCLK_SEL       = 1'b0;      //Clock source selection. 1/2 shared，0,mck_adc_clk_osc，1,io_clk
  parameter VSEN_CTL         = 3'b000;    //Input source selection 
  parameter VSEN_CTL_SEL     = 1'b0;      //vsen_ctl source selection，0,VSEN_CTL，1,ciu_vsen_ctl
  parameter ADC_MODE      = 1'b0;      //Mode selection
  parameter DIV_CTL       = 2'd0;      //clock division，0:/1，1:/2，2:/4，3:/8，Clock after frequency division, 500kHz~8MHz
  
  //Digital terminal options
  parameter SAMPLE_CNT_SEL   = 3'd4;      //total samples configuration, 0~4:64, 128, 256, 512, 1024 sampling points, and the other values are 2048 sampling points.The total number of samples shall be greater than 7 * sampling period, i.e.  SAMPLR_CNT_SEL >= RATE_CHANGE_CTRL-1
  parameter RATE_CHANGE_CTRL = 3'd4;      //Sampling period configuration, 0~4:4、8、16、32、64，other values are 128
  
  
endmodule

//ADCULC,GW5AT-138K
module ADCULC (

  //Voltage signal source, /mV
  input  ADCINBK6A,       //input from bank6 IO, adc_in_b is the reference
  input  ADCINBK6B,       //input from bank6 IO, adc_in_b is the reference
  input  ADCINBK7A,       //input from bank7 IO, adc_in_b is the reference
  input  ADCINBK7B,       //input from bank7 IO, adc_in_b is the reference

  //control signal
  input  [2:0] VSENCTL,    //Input source selection(cib)，0~7: vtest, vdd09_0, vdd09_1, vdd09_2, vdd18_0, vdd18_1, reserved, vdd33
  
  input [9:0] FSCAL_VALUE,   // temperature mode 510~948, typical value 730; Voltage mode 452~840, typical value 653
  input [11:0] OFFSET_VALUE, //signed number, temperature mode - 1560~- 760, typical value - 1180; Voltage mode - 410~410, typical value 0

  input  ADCEN,         //Enable signal, active high
  input  CLK,           //clk input
  input  DRSTN,         //0/1 shared, Digital part reset signal, active low
  input   ADCREQI,      //Measurement request signal, valid rising edge, asynchronous signal
  output  ADCRDY,       //The measurement completion signal, active high
  output  [13:0] ADCVALUE //The measurement result output, signed number. In voltage mode,/2048 is the actual measured value; In temperature mode,/4 is the actual measured value

);
  parameter DYN_BKEN = "FALSE";//"FALSE","TRUE"."TRUE",BUF_BK6_EN[0]&BUF_BK7_EN[0]=1

//Input source selection
  parameter BUF_VCC_EN       = 1'b0;      //ulc
  parameter BUF_VCCM_EN      = 1'b0;      //ulc
  parameter BUF_MIPI_M0_EN   = 3'b000;    //ulc,[1:0] Only one bit can be 1 at the same time
  parameter BUF_MIPI_M1_EN   = 3'b000;    //ulc,[1:0] Only one bit can be 1 at the same time
  parameter BUF_SERDES_Q0_EN = 3'b000;    //ulc,[1:0] Only one bit can be 1 at the same time
  parameter BUF_BK6_EN       = 6'b000000; //bk6,[3:0] Only one bit can be 1 at the same time
  parameter BUF_BK7_EN       = 6'b000000; //bk7,[3:0] Only one bit can be 1 at the same time
//Analog terminal option
  parameter CLK_SEL          = 1'b0;      //Clock source selection. 0,PIOCLK_SEL，1,ciu_clk
  parameter PIOCLK_SEL       = 1'b0;      //Clock source selection. 1/2 shared，0,mck_adc_clk_osc，1,io_clk
  parameter VSEN_CTL         = 3'b000;    //Input source selection 
  parameter VSEN_CTL_SEL     = 1'b0;      //vsen_ctl source selection，0,VSEN_CTL，1,ciu_vsen_ctl
  parameter ADC_MODE      = 1'b0;      //Mode selection
  parameter DIV_CTL          = 2'd0;      //clock division，0:/1，1:/2，2:/4，3:/8，Clock after frequency division, 500kHz~8MHz
  
//Digital terminal options
  parameter SAMPLE_CNT_SEL   = 3'd4;      //total samples configuration, 0~4:64, 128, 256, 512, 1024 sampling points, and the other values are 2048 sampling points.The total number of samples shall be greater than 7 * sampling period, i.e.  SAMPLR_CNT_SEL >= RATE_CHANGE_CTRL-1
  parameter RATE_CHANGE_CTRL = 3'd4;      //Sampling period configuration, 0~4:4、8、16、32、64，other values are 128

endmodule


//ADC,GW5A-25
module ADC (

  //control signal
  input  CLK,               //clk input
  input  [2:0] VSENCTL,     //Input source selection (ciu), from 0 to 7: glo_left,glo_right,loc_left,vtest,vcc_rt,vccc_rt,vccm_rt,vccx_buf
  input  ADCMODE,           //Mode selection,0:temperature mode，1:voltage mode
  input  DRSTN,             //Digital part reset signal, active low
  input  ADCREQI,           //Measurement request signal, valid rising edge, asynchronous signal
  output ADCRDY,          //The measurement completion signal, active high
  output [13:0] ADCVALUE, //The measurement result output, signed number. In voltage mode,/2048 is the actual measured value; In temperature mode,/4 is the actual measured value
  //mdrp
  input  MDRP_CLK,              //mdrp clock
  input  [7:0] MDRP_WDATA,      //mdrp write data
  input  MDRP_A_INC,            //mdrp self-increased address
  input  [1:0] MDRP_OPCODE,     //mdrp opcode
  output [7:0] MDRP_RDATA,       //mdrp read data
  input  ADCEN              //Enable signal, active high

);

  //Analog terminal option
  parameter CLK_SEL         = 1'b0;      //时钟源选择，0:osc(2.5MHz)，1:CLK
  parameter DIV_CTL         = 2'd0;      //clock division，0:/1，1:/2，2:/4，3:/8，Clock after frequency division, 500kHz~8MHz

  //Input source selection
  parameter BUF_EN          = 12'b000000000000; //
  parameter BUF_BK0_VREF_EN = 1'b0;  //
  parameter BUF_BK1_VREF_EN = 1'b0;  //
  parameter BUF_BK2_VREF_EN = 1'b0;  //
  parameter BUF_BK3_VREF_EN = 1'b0;  //
  parameter BUF_BK4_VREF_EN = 1'b0;  //
  parameter BUF_BK5_VREF_EN = 1'b0;  //
  parameter BUF_BK6_VREF_EN = 1'b0;  //
  parameter BUF_BK7_VREF_EN = 1'b0;  //

  //Digital terminal options
  parameter CSR_ADC_MODE      = 1'b1;       // Mode selection
  parameter CSR_VSEN_CTRL        = 3'd0;       // signal source:vccx/vccio_*/vcc_reg -> 7, signal source:vcc_ext -> 4, others -> 0
  parameter CSR_SAMPLE_CNT_SEL   = 3'd4;       // total samples configuration, 0~4:64, 128, 256, 512, 1024 sampling points, and the other values are 2048 sampling points.The total number of samples shall be greater than 7 * sampling period, i.e.  SAMPLR_CNT_SEL >= RATE_CHANGE_CTRL-1
  parameter CSR_RATE_CHANGE_CTRL = 3'd4;       // Sampling period configuration, 0~4:4、8、16、32、64，other values are 128
  parameter CSR_FSCAL            = 10'd730;    // Parameter 1: temperature mode 510~948, typical value 730; Voltage mode 452~840, typical value 653
  parameter CSR_OFFSET           = -12'd1180;  // Parameter 2, signed number, temperature mode - 1560~- 760, typical value - 1180; Voltage mode - 410~410, typical value 0


endmodule


//MIPI_DPHY_RX for 5AT138K
module MIPI_DPHY_RX (D0LN_HSRXD, D1LN_HSRXD, D2LN_HSRXD, D3LN_HSRXD, D0LN_HSRXD_VLD, D1LN_HSRXD_VLD, D2LN_HSRXD_VLD, D3LN_HSRXD_VLD, D0LN_DESKEW_DONE, D1LN_DESKEW_DONE, D2LN_DESKEW_DONE, D3LN_DESKEW_DONE, DI_LPRX0_N, DI_LPRX0_P, DI_LPRX1_N, DI_LPRX1_P, DI_LPRX2_N, DI_LPRX2_P, DI_LPRX3_N, DI_LPRX3_P, DI_LPRXCK_N, DI_LPRXCK_P, RX_CLK_O, DESKEW_ERROR, CK_N, CK_P, RX0_N, RX0_P, RX1_N, RX1_P, RX2_N, RX2_P, RX3_N, RX3_P, LPRX_EN_CK, LPRX_EN_D0, LPRX_EN_D1, LPRX_EN_D2, LPRX_EN_D3, HSRX_ODTEN_CK, HSRX_ODTEN_D0,  HSRX_ODTEN_D1, HSRX_ODTEN_D2, HSRX_ODTEN_D3, D0LN_HSRX_DREN,  D1LN_HSRX_DREN, D2LN_HSRX_DREN, D3LN_HSRX_DREN, HSRX_EN_CK, DESKEW_REQ, HS_8BIT_MODE, RX_CLK_1X, RX_INVERT, LALIGN_EN, WALIGN_BY, DO_LPTX0_N, DO_LPTX0_P, DO_LPTX1_N, DO_LPTX1_P, DO_LPTX2_N, DO_LPTX2_P, DO_LPTX3_N, DO_LPTX3_P, DO_LPTXCK_N, DO_LPTXCK_P, LPTX_EN_CK, LPTX_EN_D0, LPTX_EN_D1, LPTX_EN_D2, LPTX_EN_D3, BYTE_LENDIAN, HSRX_STOP, PWRON, RESET, DESKEW_BY,DESKEW_EN_OEDGE, DESKEW_HALF_OPENING, DESKEW_LSB_MODE, DESKEW_LNSEL, DESKEW_MTH, DESKEW_M, DESKEW_MSET, DESKEW_OCLKEDG_EN, DESKEW_OWVAL, DRST_N, ONE_BYTE0_MATCH, WORD_LENDIAN, FIFO_RD_STD, EQCS_LANE0, EQCS_LANE1, EQCS_LANE2, EQCS_LANE3, EQCS_CK, EQRS_LANE0, EQRS_LANE1, EQRS_LANE2, EQRS_LANE3, EQRS_CK, HSRX_DLYDIR_LANE0, HSRX_DLYDIR_LANE1, HSRX_DLYDIR_LANE2, HSRX_DLYDIR_LANE3, HSRX_DLYDIR_CK, HSRX_DLYLDN_LANE0, HSRX_DLYLDN_LANE1, HSRX_DLYLDN_LANE2, HSRX_DLYLDN_LANE3, HSRX_DLYLDN_CK, HSRX_DLYMV_LANE0, HSRX_DLYMV_LANE1, HSRX_DLYMV_LANE2, HSRX_DLYMV_LANE3, HSRX_DLYMV_CK, WALIGN_DVLD);
output D0LN_DESKEW_DONE,D1LN_DESKEW_DONE,D2LN_DESKEW_DONE,D3LN_DESKEW_DONE;

output [15:0] D0LN_HSRXD, D1LN_HSRXD, D2LN_HSRXD, D3LN_HSRXD;//data lane HS data output to fabric     
output D0LN_HSRXD_VLD,D1LN_HSRXD_VLD,D2LN_HSRXD_VLD,D3LN_HSRXD_VLD;//data lane HS data output valid to fabric
output DI_LPRX0_N, DI_LPRX0_P, DI_LPRX1_N, DI_LPRX1_P, DI_LPRX2_N, DI_LPRX2_P, DI_LPRX3_N, DI_LPRX3_P;//Data Lane Complement/True Pad LPRX input
output DI_LPRXCK_N, DI_LPRXCK_P;
output RX_CLK_O;          //HSRX Clock output 
output DESKEW_ERROR;      //4 data lane deskew result error report

inout  CK_N, CK_P, RX0_N, RX0_P, RX1_N, RX1_P, RX2_N, RX2_P, RX3_N, RX3_P;


input BYTE_LENDIAN;       //bit data Littlendian/Bigendian of 8bit
input [2:0] FIFO_RD_STD;  //FIFO read threadhold; Can only be 1 in 8bit mode.
input HSRX_STOP;          //HSRX Clock Stop Signal for synchronization
input PWRON;              //PowerOn Control: 1'b1: HSRX on; 1'b0: HSRX off to standby in low power state
input RESET;              //Reset signal: 1'b1: reset all; 

input D0LN_HSRX_DREN,  D1LN_HSRX_DREN, D2LN_HSRX_DREN, D3LN_HSRX_DREN;//Data Lane HSRX driver enabled

input DESKEW_BY,DESKEW_EN_OEDGE;
input [5:0] DESKEW_HALF_OPENING;

input [2:0] DESKEW_LNSEL; //selection of lane to config delay overwrite value and make lane in deskew delay overwrite mode

input [1:0] DESKEW_LSB_MODE;
input [2:0] DESKEW_M;//counter threathold for confirming edge
input [12:0] DESKEW_MTH;   //counter threathold for searching one edge
input [6:0] DESKEW_MSET;
input DESKEW_OCLKEDG_EN;
input [6:0] DESKEW_OWVAL;
input DESKEW_REQ;         //deskew function request to all data lanes

input DO_LPTX0_N, DO_LPTX0_P, DO_LPTX1_N, DO_LPTX1_P, DO_LPTX2_N, DO_LPTX2_P, DO_LPTX3_N, DO_LPTX3_P;// Complement/True Pad LPTX output
input DO_LPTXCK_N, DO_LPTXCK_P;
input DRST_N;             //digital reset, active low

input [2:0] EQCS_LANE0,EQCS_LANE1,EQCS_LANE2,EQCS_LANE3,EQCS_CK;
input [2:0] EQRS_LANE0,EQRS_LANE1,EQRS_LANE2,EQRS_LANE3,EQRS_CK;

input HS_8BIT_MODE;       //Selection of data width to Fabric

input HSRX_DLYDIR_LANE0, HSRX_DLYDIR_LANE1,HSRX_DLYDIR_LANE2,HSRX_DLYDIR_LANE3,HSRX_DLYDIR_CK;
input HSRX_DLYLDN_LANE0, HSRX_DLYLDN_LANE1,HSRX_DLYLDN_LANE2,HSRX_DLYLDN_LANE3,HSRX_DLYLDN_CK;
input HSRX_DLYMV_LANE0, HSRX_DLYMV_LANE1,HSRX_DLYMV_LANE2,HSRX_DLYMV_LANE3,HSRX_DLYMV_CK;

input HSRX_EN_CK;         //CK Lane: 1'b1 HSRX enabled
input HSRX_ODTEN_CK, HSRX_ODTEN_D0,  HSRX_ODTEN_D1, HSRX_ODTEN_D2, HSRX_ODTEN_D3;//CK/Data Lane HSRX ODT enabled
input LALIGN_EN;          //lane aligner enable
input LPRX_EN_CK, LPRX_EN_D0, LPRX_EN_D1, LPRX_EN_D2, LPRX_EN_D3;
input LPTX_EN_CK, LPTX_EN_D0, LPTX_EN_D1, LPTX_EN_D2, LPTX_EN_D3;//1'b1 LPTX enabled
input ONE_BYTE0_MATCH;    //byte count match in word aligner
input RX_CLK_1X;          //1X clock from fabric, max 93.75MHz@1.5Gbps
input RX_INVERT;          //data polarity selection
input WALIGN_BY;          //word aligner bypass
input WALIGN_DVLD;
input WORD_LENDIAN;       //data little/big endian of dual word(16bit, 8bit/word). Not used in 8bit data output mode


parameter ALIGN_BYTE = 8'b10111000;//KEY for word aligner and lane aligner
parameter EN_CLKB1X = 1'b1;//1'b1: enable CLK2X to Fabric
parameter EQ_ADPSEL_LANE0 = 1'b0;
parameter EQ_ADPSEL_LANE1 = 1'b0;
parameter EQ_ADPSEL_LANE2 = 1'b0;
parameter EQ_ADPSEL_LANE3 = 1'b0;
parameter EQ_ADPSEL_CK = 1'b0;
parameter EQ_CS_LANE0 = 3'b100;
parameter EQ_CS_LANE1 = 3'b100;
parameter EQ_CS_LANE2 = 3'b100;
parameter EQ_CS_LANE3 = 3'b100;
parameter EQ_CS_CK = 3'b100;

parameter EQ_PBIAS_LANE0 = 4'b0100;//Equalizer source current setting: 4'b0000(80uA)~4'b0111(360uA), 40uA/step
parameter EQ_PBIAS_LANE1 = 4'b0100;//Equalizer source current setting: 4'b0000(80uA)~4'b0111(360uA), 40uA/step
parameter EQ_PBIAS_LANE2 = 4'b0100;//Equalizer source current setting: 4'b0000(80uA)~4'b0111(360uA), 40uA/step
parameter EQ_PBIAS_LANE3 = 4'b0100;//Equalizer source current setting: 4'b0000(80uA)~4'b0111(360uA), 40uA/step
parameter EQ_PBIAS_CK = 4'b0100;//Equalizer source current setting: 4'b0000(80uA)~4'b0111(360uA), 40uA/step

parameter EQ_RS_LANE0 = 3'b100;
parameter EQ_RS_LANE1 = 3'b100;
parameter EQ_RS_LANE2 = 3'b100;
parameter EQ_RS_LANE3 = 3'b100;
parameter EQ_RS_CK = 3'b100;

parameter EQ_ZLD_LANE0 = 4'b1000;//Preamplifier Resistive Load Setting: 4'b0000 3K; 4'b0001 2.5K; 4'b0011 2K; 4'b0111 1.5K; 4'b1111 1K
parameter EQ_ZLD_LANE1 = 4'b1000;//Preamplifier Resistive Load Setting: 4'b0000 3K; 4'b0001 2.5K; 4'b0011 2K; 4'b0111 1.5K; 4'b1111 1K
parameter EQ_ZLD_LANE2 = 4'b1000;//Preamplifier Resistive Load Setting: 4'b0000 3K; 4'b0001 2.5K; 4'b0011 2K; 4'b0111 1.5K; 4'b1111 1K
parameter EQ_ZLD_LANE3 = 4'b1000;//Preamplifier Resistive Load Setting: 4'b0000 3K; 4'b0001 2.5K; 4'b0011 2K; 4'b0111 1.5K; 4'b1111 1K
parameter EQ_ZLD_CK = 4'b1000;//Preamplifier Resistive Load Setting: 4'b0000 3K; 4'b0001 2.5K; 4'b0011 2K; 4'b0111 1.5K; 4'b1111 1K

parameter HIGH_BW_LANE0 = 1'b1;
parameter HIGH_BW_LANE1 = 1'b1;
parameter HIGH_BW_LANE2 = 1'b1;
parameter HIGH_BW_LANE3 = 1'b1;
parameter HIGH_BW_CK = 1'b1;

parameter HSRX_DLYCTL_CK = 7'b0000000;
parameter HSRX_DLYCTL_LANE0 = 7'b0000000;
parameter HSRX_DLYCTL_LANE1 = 7'b0000000;
parameter HSRX_DLYCTL_LANE2 = 7'b0000000;
parameter HSRX_DLYCTL_LANE3 = 7'b0000000;

parameter HSRX_DLY_SEL = 1'b0;

parameter HSRX_DUTY_LANE0 = 4'b1000;
parameter HSRX_DUTY_LANE1 = 4'b1000;
parameter HSRX_DUTY_LANE2 = 4'b1000;
parameter HSRX_DUTY_LANE3 = 4'b1000;
parameter HSRX_DUTY_CK = 4'b1000;

parameter HSRX_EN = 1'b1;

parameter HSRX_EQ_EN_LANE0 = 1'b1;//Equalizer Enable of HSRX: 1'b0 disable; 1'b1 enable
parameter HSRX_EQ_EN_LANE1 = 1'b1;//Equalizer Enable of HSRX: 1'b0 disable; 1'b1 enable
parameter HSRX_EQ_EN_LANE2 = 1'b1;//Equalizer Enable of HSRX: 1'b0 disable; 1'b1 enable
parameter HSRX_EQ_EN_LANE3 = 1'b1;//Equalizer Enable of HSRX: 1'b0 disable; 1'b1 enable
parameter HSRX_EQ_EN_CK = 1'b1;//Equalizer Enable of HSRX: 1'b0 disable; 1'b1 enable

parameter HSRX_IBIAS = 4'b0011;//HSRX current bias setting: default 4'b0011, available(4'b0000~4'b0111) 2uA/step

parameter HSRX_IMARG_EN = 1'b1;

parameter MIPI_LANE0_EN = 1'b0;// 1'b1, Lane0 on; 
parameter MIPI_LANE1_EN = 1'b0;// 1'b1, Lane1 on; 
parameter MIPI_LANE2_EN = 1'b0;// 1'b1, Lane2 on;  
parameter MIPI_LANE3_EN = 1'b0;// 1'b1, Lane3 on;  
parameter MIPI_CK_EN = 1'b1;//CK Lane Select: 1'b1 CK Lane on

parameter HSRX_ODT_EN = 1'b1;//HSRX ODT enable for CIB control: 1'b1 enable
parameter HSRX_ODT_TST = 4'b0000;
parameter HSRX_ODT_TST_CK = 1'b0;

parameter HSRX_STOP_EN = 1'b0;//Enable HSRX clock stop sync: 1'b1: enable
parameter HSRX_TST = 4'b0000;
parameter HSRX_TST_CK = 1'b0;

parameter HSRX_WAIT4EDGE = 1'b0;
parameter HYST_NCTL = 2'b01;//LPRX hysterisis control of VTH_N: 2'b00~2'b11 minimum~maximum
parameter HYST_PCTL = 2'b01;//LPRX hysterisis control for VTH_P: 2'b00~2'b11 minimum~maximum

parameter LOW_LPRX_VTH = 1'b0;

parameter LPRX_EN = 1'b1;//1'b1: LPRX enabled for CIB control
parameter LPRX_TST = 4'b0000;
parameter LPRX_TST_CK = 1'b0;

parameter LPTX_EN = 1'b1;//1'b1: LPTX enabled for CIB control
parameter LPTX_SW_LANE0 = 3'b100;
parameter LPTX_SW_LANE1 = 3'b100;
parameter LPTX_SW_LANE2 = 3'b100;
parameter LPTX_SW_LANE3 = 3'b100;
parameter LPTX_SW_CK = 3'b100;
parameter LPTX_TST = 4'b0000;
parameter LPTX_TST_CK = 1'b0;

parameter MIPI_DIS_N = 1'b1;

parameter PGA_BIAS_LANE0 =  4'b1000;
parameter PGA_BIAS_LANE1 =  4'b1000;
parameter PGA_BIAS_LANE2 =  4'b1000;
parameter PGA_BIAS_LANE3 =  4'b1000;
parameter PGA_BIAS_CK =  4'b1000;

parameter PGA_GAIN_LANE0 =  4'b1000;
parameter PGA_GAIN_LANE1 =  4'b1000;
parameter PGA_GAIN_LANE2 =  4'b1000;
parameter PGA_GAIN_LANE3 =  4'b1000;
parameter PGA_GAIN_CK =  4'b1000;

parameter RX_CLK1X_SYNC_SEL = 1'b0;

parameter RX_ODT_TRIM_LANE0 = 4'b0111;//100ohm ODT trimming, ~4ohm/step
parameter RX_ODT_TRIM_LANE1 = 4'b0111;//100ohm ODT trimming, ~4ohm/step
parameter RX_ODT_TRIM_LANE2 = 4'b0111;//100ohm ODT trimming, ~4ohm/step
parameter RX_ODT_TRIM_LANE3 = 4'b0111;//100ohm ODT trimming, ~4ohm/step
parameter RX_ODT_TRIM_CK = 4'b0111;//100ohm ODT trimming, ~4ohm/step

parameter STP_UNIT = 2'b00;

parameter SYNC_CLK_SEL = 1'b1;//select clock source for HS lane output data:0,select fabric input clock rx_clk_1x; 1,select output clock RX_CLK_O

parameter WALIGN_DVLD_SRC_SEL = 1'b0;


endmodule


//MIPI_DPHY for GW5A-25
module MIPI_DPHY ( ALPEDO_LANE0, ALPEDO_LANE1, ALPEDO_LANE2, ALPEDO_LANE3, ALPEDO_LANECK,  RX_CLK_O, TX_CLK_O, D0LN_DESKEW_DONE, D0LN_DESKEW_ERROR, D0LN_HSRXD, D0LN_HSRXD_VLD, D1LN_DESKEW_DONE, D1LN_DESKEW_ERROR, D1LN_HSRXD, D1LN_HSRXD_VLD, D2LN_DESKEW_DONE, D2LN_DESKEW_ERROR, D2LN_HSRXD, D2LN_HSRXD_VLD, D3LN_DESKEW_DONE, D3LN_DESKEW_ERROR, D3LN_HSRXD, D3LN_HSRXD_VLD, DI_LPRX0_N, DI_LPRX0_P, DI_LPRX1_N, DI_LPRX1_P, DI_LPRX2_N, DI_LPRX2_P, DI_LPRX3_N, DI_LPRX3_P, DI_LPRXCK_N, DI_LPRXCK_P, MRDATA, CK_N, CK_P, D0_N, D0_P, D1_N, D1_P, D2_N, D2_P, D3_N, D3_P, ALP_EDEN_LANE0, ALP_EDEN_LANE1, ALP_EDEN_LANE2, ALP_EDEN_LANE3, ALP_EDEN_LANECK, ALPEN_LN0, ALPEN_LN1, ALPEN_LN2, ALPEN_LN3, ALPEN_LNCK, HSRX_STOP, HSTXEN_LN0, HSTXEN_LN1, HSTXEN_LN2, HSTXEN_LN3, HSTXEN_LNCK, LPTXEN_LN0, LPTXEN_LN1, LPTXEN_LN2, LPTXEN_LN3, LPTXEN_LNCK, PWRON_RX, PWRON_TX, RESET, RX_CLK_1X, TX_CLK_1X, TXDPEN_LN0, TXDPEN_LN1, TXDPEN_LN2, TXDPEN_LN3, TXDPEN_LNCK, TXHCLK_EN, CKLN_HSTXD, D0LN_DESKEW_REQ, D0LN_HSRX_DREN, D0LN_HSTXD, D1LN_DESKEW_REQ, D1LN_HSRX_DREN, D1LN_HSTXD, D2LN_DESKEW_REQ, D2LN_HSRX_DREN, D2LN_HSTXD, D3LN_DESKEW_REQ, D3LN_HSRX_DREN, D3LN_HSTXD,HSTXD_VLD, DO_LPTX0_N, DO_LPTX1_N, DO_LPTX2_N, DO_LPTX3_N,  DO_LPTXCK_N, DO_LPTX0_P, DO_LPTX1_P,  DO_LPTX2_P, DO_LPTX3_P, DO_LPTXCK_P, HSRX_DLYDIR_LANE0, HSRX_DLYDIR_LANE1, HSRX_DLYDIR_LANE2, HSRX_DLYDIR_LANE3, HSRX_DLYDIR_LANECK, HSRX_DLYLDN_LANE0, HSRX_DLYLDN_LANE1, HSRX_DLYLDN_LANE2, HSRX_DLYLDN_LANE3, HSRX_DLYLDN_LANECK, HSRX_DLYMV_LANE0, HSRX_DLYMV_LANE1, HSRX_DLYMV_LANE2, HSRX_DLYMV_LANE3, HSRX_DLYMV_LANECK, HSRX_EN_CK, HSRX_EN_D0, HSRX_EN_D1, HSRX_EN_D2, HSRX_EN_D3, HSRX_ODTEN_CK, HSRX_ODTEN_D0, HSRX_ODTEN_D1, HSRX_ODTEN_D2, HSRX_ODTEN_D3, LPRX_EN_CK, LPRX_EN_D0, LPRX_EN_D1, LPRX_EN_D2, LPRX_EN_D3, MA_INC, MCLK, MOPCODE, MWDATA, RX_DRST_N, TX_DRST_N, WALIGN_DVLD, CK0, CK90, CK180, CK270);

output RX_CLK_O, TX_CLK_O;
output [15:0] D0LN_HSRXD, D1LN_HSRXD, D2LN_HSRXD, D3LN_HSRXD;//data lane HS data output to fabric
output D0LN_HSRXD_VLD,D1LN_HSRXD_VLD,D2LN_HSRXD_VLD,D3LN_HSRXD_VLD;//data lane HS data output valid to fabric

input  D0LN_HSRX_DREN, D1LN_HSRX_DREN,  D2LN_HSRX_DREN,  D3LN_HSRX_DREN;
  
output  DI_LPRX0_N, DI_LPRX0_P, DI_LPRX1_N, DI_LPRX1_P, DI_LPRX2_N,  DI_LPRX2_P, DI_LPRX3_N, DI_LPRX3_P, DI_LPRXCK_N, DI_LPRXCK_P;

inout  CK_N, CK_P, D0_N, D0_P, D1_N, D1_P, D2_N, D2_P, D3_N, D3_P;

input HSRX_STOP, HSTXEN_LN0, HSTXEN_LN1, HSTXEN_LN2, HSTXEN_LN3, HSTXEN_LNCK,
     LPTXEN_LN0, LPTXEN_LN1, LPTXEN_LN2, LPTXEN_LN3, LPTXEN_LNCK;
input PWRON_RX, PWRON_TX, RESET, RX_CLK_1X, TX_CLK_1X;
input TXDPEN_LN0, TXDPEN_LN1, TXDPEN_LN2, TXDPEN_LN3, TXDPEN_LNCK, TXHCLK_EN;
input [15:0]  CKLN_HSTXD,D0LN_HSTXD,D1LN_HSTXD,D2LN_HSTXD,D3LN_HSTXD;
input HSTXD_VLD;
input CK0, CK90, CK180, CK270;
   
input DO_LPTX0_N, DO_LPTX1_N, DO_LPTX2_N, DO_LPTX3_N, DO_LPTXCK_N, DO_LPTX0_P, DO_LPTX1_P, DO_LPTX2_P, DO_LPTX3_P, DO_LPTXCK_P;
input HSRX_EN_CK, HSRX_EN_D0, HSRX_EN_D1, HSRX_EN_D2, HSRX_EN_D3, HSRX_ODTEN_CK, 
     HSRX_ODTEN_D0, HSRX_ODTEN_D1, HSRX_ODTEN_D2, HSRX_ODTEN_D3, LPRX_EN_CK,
     LPRX_EN_D0, LPRX_EN_D1, LPRX_EN_D2, LPRX_EN_D3; 
input RX_DRST_N, TX_DRST_N, WALIGN_DVLD;

output [7:0] MRDATA;
input MA_INC, MCLK;
input [1:0] MOPCODE;
input [7:0] MWDATA;

/********Reserved port********/
output  ALPEDO_LANE0, ALPEDO_LANE1, ALPEDO_LANE2, ALPEDO_LANE3, ALPEDO_LANECK;
output D1LN_DESKEW_DONE,D2LN_DESKEW_DONE,D3LN_DESKEW_DONE,D0LN_DESKEW_DONE;
output D1LN_DESKEW_ERROR, D2LN_DESKEW_ERROR, D3LN_DESKEW_ERROR, D0LN_DESKEW_ERROR;
input D0LN_DESKEW_REQ, D1LN_DESKEW_REQ, D2LN_DESKEW_REQ, D3LN_DESKEW_REQ;
input HSRX_DLYDIR_LANE0, HSRX_DLYDIR_LANE1, HSRX_DLYDIR_LANE2, HSRX_DLYDIR_LANE3, HSRX_DLYDIR_LANECK;
input HSRX_DLYLDN_LANE0, HSRX_DLYLDN_LANE1, HSRX_DLYLDN_LANE2, HSRX_DLYLDN_LANE3, HSRX_DLYLDN_LANECK;
input HSRX_DLYMV_LANE0, HSRX_DLYMV_LANE1,  HSRX_DLYMV_LANE2, HSRX_DLYMV_LANE3, HSRX_DLYMV_LANECK;
input  ALP_EDEN_LANE0, ALP_EDEN_LANE1, ALP_EDEN_LANE2, ALP_EDEN_LANE3, ALP_EDEN_LANECK, ALPEN_LN0, ALPEN_LN1, ALPEN_LN2, ALPEN_LN3, ALPEN_LNCK;


parameter        TX_PLLCLK = "NONE"; //"NONE", "SLOW", "FAST"  
parameter        RX_ALIGN_BYTE                  = 8'b10111000 ; 
parameter        RX_HS_8BIT_MODE                = 1'b0 ; 
parameter        RX_LANE_ALIGN_EN               = 1'b0 ; 
parameter        TX_HS_8BIT_MODE                = 1'b0 ; 
parameter        HSREG_EN_LN0                   = 1'b0;  
parameter        HSREG_EN_LN1                   = 1'b0;  
parameter        HSREG_EN_LN2                   = 1'b0;  
parameter        HSREG_EN_LN3                   = 1'b0;  
parameter        HSREG_EN_LNCK                  = 1'b0;  
parameter        LANE_DIV_SEL                   = 2'b00;  
parameter        HSRX_EN                        = 1'b1 ;  
parameter        HSRX_LANESEL                   = 4'b1111 ;   
parameter        HSRX_LANESEL_CK                = 1'b1 ;   
parameter        HSTX_EN_LN0                    = 1'b0 ;   
parameter        HSTX_EN_LN1                    = 1'b0 ;   
parameter        HSTX_EN_LN2                    = 1'b0 ;   
parameter        HSTX_EN_LN3                    = 1'b0 ;   
parameter        HSTX_EN_LNCK                   = 1'b0 ;   
parameter        LPTX_EN_LN0                    = 1'b1 ;   
parameter        LPTX_EN_LN1                    = 1'b1 ;   
parameter        LPTX_EN_LN2                    = 1'b1 ;   
parameter        LPTX_EN_LN3                    = 1'b1 ;   
parameter        LPTX_EN_LNCK                   = 1'b1 ;   
parameter        TXDP_EN_LN0                    = 1'b0 ;  
parameter        TXDP_EN_LN1                    = 1'b0 ;   
parameter        TXDP_EN_LN2                    = 1'b0 ;   
parameter        TXDP_EN_LN3                    = 1'b0 ;   
parameter        TXDP_EN_LNCK                   = 1'b0 ;

/********Reserved parameters********/
parameter        CKLN_DELAY_EN                  = 1'b0;  
parameter        CKLN_DELAY_OVR_VAL             = 7'b0000000; 
parameter        D0LN_DELAY_EN                  = 1'b0;  
parameter        D0LN_DELAY_OVR_VAL             = 7'b0000000; 
parameter        D0LN_DESKEW_BYPASS             = 1'b0;  
parameter        D1LN_DELAY_EN                  = 1'b0;  
parameter        D1LN_DELAY_OVR_VAL             = 7'b0000000; 
parameter        D1LN_DESKEW_BYPASS             = 1'b0;  
parameter        D2LN_DELAY_EN                  = 1'b0;  
parameter        D2LN_DELAY_OVR_VAL             = 7'b0000000; 
parameter        D2LN_DESKEW_BYPASS             = 1'b0;  
parameter        D3LN_DELAY_EN                  = 1'b0;  
parameter        D3LN_DELAY_OVR_VAL             = 7'b0000000; 
parameter        D3LN_DESKEW_BYPASS             = 1'b0;  
parameter        DESKEW_EN_LOW_DELAY            = 1'b0;  
parameter        DESKEW_EN_ONE_EDGE             = 1'b0;  
parameter        DESKEW_FAST_LOOP_TIME          = 4'b0000;  
parameter        DESKEW_FAST_MODE               = 1'b0;  
parameter        DESKEW_HALF_OPENING            = 6'b010110; 
parameter        DESKEW_LSB_MODE                = 2'b00;  
parameter        DESKEW_M                       = 3'b011;  
parameter        DESKEW_M_TH                    = 13'b0000110100110; 
parameter        DESKEW_MAX_SETTING           = 7'b0100001; 
parameter        DESKEW_ONE_CLK_EDGE_EN       = 1'b0 ; 
parameter        DESKEW_RST_BYPASS              = 1'b0 ; 
parameter        RX_BYTE_LITTLE_ENDIAN          = 1'b1 ; 
parameter        RX_CLK_1X_SYNC_SEL             = 1'b0 ; 
parameter        RX_INVERT                      = 1'b0 ; 
parameter        RX_ONE_BYTE0_MATCH             = 1'b0 ; 
parameter        RX_RD_START_DEPTH              = 5'b00001; 
parameter        RX_SYNC_MODE                   = 1'b0 ; 
parameter        RX_WORD_ALIGN_BYPASS           = 1'b0 ; 
parameter        RX_WORD_ALIGN_DATA_VLD_SRC_SEL = 1'b0 ; 
parameter        RX_WORD_LITTLE_ENDIAN          = 1'b0 ; 
parameter        TX_BYPASS_MODE                 = 1'b0 ; 
parameter        TX_BYTECLK_SYNC_MODE           = 1'b0 ; 
parameter        TX_OCLK_USE_CIBCLK             = 1'b0 ; 
parameter        TX_RD_START_DEPTH              = 5'b00001; 
parameter        TX_SYNC_MODE                   = 1'b0 ; 
parameter        TX_WORD_LITTLE_ENDIAN          = 1'b1 ; 
parameter        EQ_CS_LANE0                    = 3'b100;  
parameter        EQ_CS_LANE1                    = 3'b100;  
parameter        EQ_CS_LANE2                    = 3'b100;  
parameter        EQ_CS_LANE3                    = 3'b100;  
parameter        EQ_CS_LANECK                   = 3'b100;  
parameter        EQ_RS_LANE0                    = 3'b100;  
parameter        EQ_RS_LANE1                    = 3'b100;  
parameter        EQ_RS_LANE2                    = 3'b100;  
parameter        EQ_RS_LANE3                    = 3'b100;  
parameter        EQ_RS_LANECK                   = 3'b100;  
parameter        HSCLK_LANE_LN0                 = 1'b0;  
parameter        HSCLK_LANE_LN1                 = 1'b0;  
parameter        HSCLK_LANE_LN2                 = 1'b0;  
parameter        HSCLK_LANE_LN3                 = 1'b0;  
parameter        HSCLK_LANE_LNCK                = 1'b1;  
parameter        ALP_ED_EN_LANE0                = 1'b1 ; 
parameter        ALP_ED_EN_LANE1                = 1'b1 ;  
parameter        ALP_ED_EN_LANE2                = 1'b1 ;  
parameter        ALP_ED_EN_LANE3                = 1'b1 ;  
parameter        ALP_ED_EN_LANECK               = 1'b1 ; 
parameter        ALP_ED_TST_LANE0               = 1'b0 ;  
parameter        ALP_ED_TST_LANE1               = 1'b0 ;  
parameter        ALP_ED_TST_LANE2               = 1'b0 ;  
parameter        ALP_ED_TST_LANE3               = 1'b0 ;  
parameter        ALP_ED_TST_LANECK              = 1'b0 ;  
parameter        ALP_EN_LN0                     = 1'b0 ; 
parameter        ALP_EN_LN1                     = 1'b0 ;  
parameter        ALP_EN_LN2                     = 1'b0 ;  
parameter        ALP_EN_LN3                     = 1'b0 ; 
parameter        ALP_EN_LNCK                    = 1'b0 ; 
parameter        ALP_HYS_EN_LANE0               = 1'b1 ;  
parameter        ALP_HYS_EN_LANE1               = 1'b1 ;  
parameter        ALP_HYS_EN_LANE2               = 1'b1 ;  
parameter        ALP_HYS_EN_LANE3               = 1'b1 ;  
parameter        ALP_HYS_EN_LANECK              = 1'b1 ;  
parameter        ALP_TH_LANE0                   = 4'b1000 ;   
parameter        ALP_TH_LANE1                   = 4'b1000 ;   
parameter        ALP_TH_LANE2                   = 4'b1000 ;   
parameter        ALP_TH_LANE3                   = 4'b1000 ;   
parameter        ALP_TH_LANECK                  = 4'b1000 ;   
parameter        ANA_BYTECLK_PH                 = 2'b00 ;  
parameter        BIT_REVERSE_LN0                = 1'b0 ;  
parameter        BIT_REVERSE_LN1                = 1'b0 ;  
parameter        BIT_REVERSE_LN2                = 1'b0 ;  
parameter        BIT_REVERSE_LN3                = 1'b0 ;  
parameter        BIT_REVERSE_LNCK               = 1'b0 ;  
parameter        BYPASS_TXHCLKEN                = 1'b1 ;  
parameter        BYPASS_TXHCLKEN_SYNC           = 1'b0 ;  
parameter        BYTE_CLK_POLAR                 = 1'b0 ;  
parameter        BYTE_REVERSE_LN0               = 1'b0 ;  
parameter        BYTE_REVERSE_LN1               = 1'b0 ;  
parameter        BYTE_REVERSE_LN2               = 1'b0 ;  
parameter        BYTE_REVERSE_LN3               = 1'b0 ;  
parameter        BYTE_REVERSE_LNCK              = 1'b0 ;  
parameter        EN_CLKB1X                      = 1'b1 ;  
parameter        EQ_PBIAS_LANE0                 = 4'b1000 ;   
parameter        EQ_PBIAS_LANE1                 = 4'b1000 ;   
parameter        EQ_PBIAS_LANE2                 = 4'b1000 ;   
parameter        EQ_PBIAS_LANE3                 = 4'b1000 ;   
parameter        EQ_PBIAS_LANECK                = 4'b1000 ;   
parameter        EQ_ZLD_LANE0                   = 4'b1000 ;   
parameter        EQ_ZLD_LANE1                   = 4'b1000 ;   
parameter        EQ_ZLD_LANE2                   = 4'b1000 ;   
parameter        EQ_ZLD_LANE3                   = 4'b1000 ;   
parameter        EQ_ZLD_LANECK                  = 4'b1000 ;   
parameter        HIGH_BW_LANE0                  = 1'b1 ;   
parameter        HIGH_BW_LANE1                  = 1'b1 ;   
parameter        HIGH_BW_LANE2                  = 1'b1 ;   
parameter        HIGH_BW_LANE3                  = 1'b1 ;   
parameter        HIGH_BW_LANECK                 = 1'b1 ;   
parameter        HSREG_VREF_CTL                 = 3'b100 ;   
parameter        HSREG_VREF_EN                  = 1'b1 ;  
parameter        HSRX_DLY_CTL_CK                = 7'b0000000 ;   
parameter        HSRX_DLY_CTL_LANE0             = 7'b0000000 ;   
parameter        HSRX_DLY_CTL_LANE1             = 7'b0000000 ;   
parameter        HSRX_DLY_CTL_LANE2             = 7'b0000000 ;   
parameter        HSRX_DLY_CTL_LANE3             = 7'b0000000 ;   
parameter        HSRX_DLY_SEL_LANE0             = 1'b0 ;  
parameter        HSRX_DLY_SEL_LANE1             = 1'b0 ;   
parameter        HSRX_DLY_SEL_LANE2             = 1'b0 ;   
parameter        HSRX_DLY_SEL_LANE3             = 1'b0 ;   
parameter        HSRX_DLY_SEL_LANECK            = 1'b0 ;   
parameter        HSRX_DUTY_LANE0                = 4'b1000 ;  
parameter        HSRX_DUTY_LANE1                = 4'b1000 ;  
parameter        HSRX_DUTY_LANE2                = 4'b1000 ;  
parameter        HSRX_DUTY_LANE3                = 4'b1000 ;  
parameter        HSRX_DUTY_LANECK               = 4'b1000 ;  
parameter        HSRX_EQ_EN_LANE0               = 1'b1 ;  
parameter        HSRX_EQ_EN_LANE1               = 1'b1 ;  
parameter        HSRX_EQ_EN_LANE2               = 1'b1 ;  
parameter        HSRX_EQ_EN_LANE3               = 1'b1 ;  
parameter        HSRX_EQ_EN_LANECK              = 1'b1 ;  
parameter        HSRX_IBIAS                     = 4'b0011 ;   
parameter        HSRX_IBIAS_TEST_EN             = 1'b0 ;   
parameter        HSRX_IMARG_EN                  = 1'b0 ;   
parameter        HSRX_ODT_EN                    = 1'b1 ;   
parameter        HSRX_ODT_TST                   = 4'b0000 ;   
parameter        HSRX_ODT_TST_CK                = 1'b0 ;   
parameter        HSRX_SEL                       = 4'b0000 ;   
parameter        HSRX_STOP_EN                   = 1'b0 ; 
parameter        HSRX_TST                       = 4'b0000 ;   
parameter        HSRX_TST_CK                    = 1'b0 ;   
parameter        HSRX_WAIT4EDGE                 = 1'b1 ;   
parameter        HYST_NCTL                      = 2'b01 ;  
parameter        HYST_PCTL                      = 2'b01 ;  
parameter        IBIAS_TEST_EN                  = 1'b0 ;   
parameter        LB_CH_SEL                      = 1'b0 ;   
parameter        LB_EN_LN0                      = 1'b0 ;   
parameter        LB_EN_LN1                      = 1'b0 ;   
parameter        LB_EN_LN2                      = 1'b0 ;   
parameter        LB_EN_LN3                      = 1'b0 ;   
parameter        LB_EN_LNCK                     = 1'b0 ;   
parameter        LB_POLAR_LN0                   = 1'b0 ;   
parameter        LB_POLAR_LN1                   = 1'b0 ;   
parameter        LB_POLAR_LN2                   = 1'b0 ;   
parameter        LB_POLAR_LN3                   = 1'b0 ;   
parameter        LB_POLAR_LNCK                  = 1'b0 ;   
parameter        LOW_LPRX_VTH                   = 1'b0 ;   
parameter        LPBK_DATA2TO1                  = 4'b0000;  
parameter        LPBK_DATA2TO1_CK               = 1'b0 ;   
parameter        LPBK_EN                        = 1'b0 ;   
parameter        LPBK_SEL                       = 4'b0000;  
parameter        LPBKTST_EN                     = 4'b0000;  
parameter        LPBKTST_EN_CK                  = 1'b0 ;   
parameter        LPRX_EN                        = 1'b1 ;   
parameter        LPRX_TST                       = 4'b0000;  
parameter        LPRX_TST_CK                    = 1'b0 ;   
parameter        LPTX_DAT_POLAR_LN0             = 1'b0 ;   
parameter        LPTX_DAT_POLAR_LN1             = 1'b0 ;   
parameter        LPTX_DAT_POLAR_LN2             = 1'b0 ;   
parameter        LPTX_DAT_POLAR_LN3             = 1'b0 ;   
parameter        LPTX_DAT_POLAR_LNCK            = 1'b0 ;   
parameter        LPTX_NIMP_LN0                  = 3'b100 ; 
parameter        LPTX_NIMP_LN1                  = 3'b100 ; 
parameter        LPTX_NIMP_LN2                  = 3'b100 ; 
parameter        LPTX_NIMP_LN3                  = 3'b100 ; 
parameter        LPTX_NIMP_LNCK                 = 3'b100 ; 
parameter        LPTX_PIMP_LN0                  = 3'b100 ; 
parameter        LPTX_PIMP_LN1                  = 3'b100 ; 
parameter        LPTX_PIMP_LN2                  = 3'b100 ; 
parameter        LPTX_PIMP_LN3                  = 3'b100 ; 
parameter        LPTX_PIMP_LNCK                 = 3'b100 ; 
parameter        MIPI_PMA_DIS_N                 = 1'b1 ;   
parameter        PGA_BIAS_LANE0                 = 4'b1000 ;   
parameter        PGA_BIAS_LANE1                 = 4'b1000 ;   
parameter        PGA_BIAS_LANE2                 = 4'b1000 ;   
parameter        PGA_BIAS_LANE3                 = 4'b1000 ;   
parameter        PGA_BIAS_LANECK                = 4'b1000 ;   
parameter        PGA_GAIN_LANE0                 = 4'b1000 ;   
parameter        PGA_GAIN_LANE1                 = 4'b1000 ;   
parameter        PGA_GAIN_LANE2                 = 4'b1000 ;   
parameter        PGA_GAIN_LANE3                 = 4'b1000 ;   
parameter        PGA_GAIN_LANECK                = 4'b1000 ;   
parameter        RX_ODT_TRIM_LANE0              = 4'b1000 ;   
parameter        RX_ODT_TRIM_LANE1              = 4'b1000 ;   
parameter        RX_ODT_TRIM_LANE2              = 4'b1000 ;   
parameter        RX_ODT_TRIM_LANE3              = 4'b1000 ;   
parameter        RX_ODT_TRIM_LANECK             = 4'b1000 ;   
parameter        SLEWN_CTL_LN0                  = 4'b1111 ;  
parameter        SLEWN_CTL_LN1                  = 4'b1111 ;   
parameter        SLEWN_CTL_LN2                  = 4'b1111 ;   
parameter        SLEWN_CTL_LN3                  = 4'b1111 ;   
parameter        SLEWN_CTL_LNCK                 = 4'b1111 ;   
parameter        SLEWP_CTL_LN0                  = 4'b1111 ;   
parameter        SLEWP_CTL_LN1                  = 4'b1111 ;   
parameter        SLEWP_CTL_LN2                  = 4'b1111 ;   
parameter        SLEWP_CTL_LN3                  = 4'b1111 ;   
parameter        SLEWP_CTL_LNCK                 = 4'b1111 ;   
parameter        STP_UNIT                       = 2'b01 ;  
parameter        TERMN_CTL_LN0                  = 4'b1000 ;   
parameter        TERMN_CTL_LN1                  = 4'b1000 ;   
parameter        TERMN_CTL_LN2                  = 4'b1000 ;   
parameter        TERMN_CTL_LN3                  = 4'b1000 ;   
parameter        TERMN_CTL_LNCK                 = 4'b1000 ;   
parameter        TERMP_CTL_LN0                  = 4'b1000 ;   
parameter        TERMP_CTL_LN1                  = 4'b1000 ;   
parameter        TERMP_CTL_LN2                  = 4'b1000 ;   
parameter        TERMP_CTL_LN3                  = 4'b1000 ;   
parameter        TERMP_CTL_LNCK                 = 4'b1000 ;   
parameter        TEST_EN_LN0                    = 1'b0 ;   
parameter        TEST_EN_LN1                    = 1'b0 ;   
parameter        TEST_EN_LN2                    = 1'b0 ;   
parameter        TEST_EN_LN3                    = 1'b0 ;   
parameter        TEST_EN_LNCK                   = 1'b0 ;   
parameter        TEST_N_IMP_LN0                 = 1'b0 ;   
parameter        TEST_N_IMP_LN1                 = 1'b0 ;   
parameter        TEST_N_IMP_LN2                 = 1'b0 ;   
parameter        TEST_N_IMP_LN3                 = 1'b0 ;   
parameter        TEST_N_IMP_LNCK                = 1'b0 ;   
parameter        TEST_P_IMP_LN0                 = 1'b0 ;   
parameter        TEST_P_IMP_LN1                 = 1'b0 ;   
parameter        TEST_P_IMP_LN2                 = 1'b0 ;   
parameter        TEST_P_IMP_LN3                 = 1'b0 ;   
parameter        TEST_P_IMP_LNCK                = 1'b0 ;   

endmodule



////Serdes
//GTR12_QUAD
module GTR12_QUAD(
// ports to fabric
    output              LN0_TXM_O                                       ,
    output              LN0_TXP_O                                       ,
    output              LN1_TXM_O                                       ,
    output              LN1_TXP_O                                       ,
    output              LN2_TXM_O                                       ,
    output              LN2_TXP_O                                       ,
    output              LN3_TXM_O                                       ,
    output              LN3_TXP_O                                       ,
    input               LN0_RXM_I                                       ,
    input               LN0_RXP_I                                       ,
    input               LN1_RXM_I                                       ,
    input               LN1_RXP_I                                       ,
    input               LN2_RXM_I                                       ,
    input               LN2_RXP_I                                       ,
    input               LN3_RXM_I                                       ,
    input               LN3_RXP_I                                       ,
    input   [1:0]       FABRIC_CLK_LIFE_DIV_I                           ,
    input               FABRIC_CM0_RXCLK_OE_L_I                         ,
    input               FABRIC_CM0_RXCLK_OE_R_I                         ,
    output              FABRIC_LN0_RXDET_RESULT                         ,
    output              FABRIC_LN1_RXDET_RESULT                         ,
    output              FABRIC_LN2_RXDET_RESULT                         ,
    output              FABRIC_LN3_RXDET_RESULT                         ,
    output              FABRIC_PMA_CM0_DR_REFCLK_DET_O                  ,
    output              FABRIC_PMA_CM1_DR_REFCLK_DET_O                  ,
    input               FABRIC_PMA_PD_REFHCLK_I                         ,
    input   [2:0]       FABRIC_REFCLK1_INPUT_SEL_I                      ,
    input   [2:0]       FABRIC_REFCLK_INPUT_SEL_I                       ,
    input               FABRIC_REFCLK_OE_L_I                            ,
    input               FABRIC_REFCLK_OE_R_I                            ,
    input   [4:0]       FABRIC_REFCLK_OUTPUT_SEL_I                      ,
    input               REFCLKM0_I                                      ,
    input               REFCLKM1_I                                      ,
    input               REFCLKP0_I                                      ,
    input               REFCLKP1_I                                      ,
    input               FABRIC_BURN_IN_I                                ,
    input   [1:0]       FABRIC_CK_SOC_DIV_I                             ,
    input               FABRIC_CLK_REF_CORE_I                           ,
    output              FABRIC_CM1_LIFE_CLK_O                           ,
    output              FABRIC_CM_LIFE_CLK_O                            ,
    output              FABRIC_CMU1_CK_REF_O                            ,
    output              FABRIC_CMU1_OK_O                                ,
    output              FABRIC_CMU1_REFCLK_GATE_ACK_O                   ,
    input               FABRIC_CMU1_REFCLK_GATE_I                       ,
    output              FABRIC_CMU_CK_REF_O                             ,
    output              FABRIC_CMU_OK_O                                 ,
    output              FABRIC_CMU_REFCLK_GATE_ACK_O                    ,
    input               FABRIC_CMU_REFCLK_GATE_I                        ,
    input               FABRIC_GLUE_MAC_INIT_INFO_I                     ,
    output              FABRIC_LANE0_CMU_CK_REF_O                       ,
    output              FABRIC_LANE1_CMU_CK_REF_O                       ,
    output              FABRIC_LANE2_CMU_CK_REF_O                       ,
    output              FABRIC_LANE3_CMU_CK_REF_O                       ,
    output  [5:0]       FABRIC_LN0_ASTAT_O                              ,
    output              FABRIC_LN0_BURN_IN_TOGGLE_O                     ,
    input   [42:0]      FABRIC_LN0_CTRL_I                               ,
    input               FABRIC_LN0_IDDQ_I                               ,
    input   [2:0]       FABRIC_LN0_PD_I                                 ,
    output              FABRIC_LN0_PMA_RX_LOCK_O                        ,
    input   [1:0]       FABRIC_LN0_RATE_I                               ,
    input               FABRIC_LN0_RSTN_I                               ,
    output  [87:0]      FABRIC_LN0_RXDATA_O                             ,
    output  [12:0]      FABRIC_LN0_STAT_O                               ,
    input   [79:0]      FABRIC_LN0_TXDATA_I                             ,
    output  [5:0]       FABRIC_LN1_ASTAT_O                              ,
    output              FABRIC_LN1_BURN_IN_TOGGLE_O                     ,
    input   [42:0]      FABRIC_LN1_CTRL_I                               ,
    input               FABRIC_LN1_IDDQ_I                               ,
    input   [2:0]       FABRIC_LN1_PD_I                                 ,
    output              FABRIC_LN1_PMA_RX_LOCK_O                        ,
    input   [1:0]       FABRIC_LN1_RATE_I                               ,
    input               FABRIC_LN1_RSTN_I                               ,
    output  [87:0]      FABRIC_LN1_RXDATA_O                             ,
    output  [12:0]      FABRIC_LN1_STAT_O                               ,
    input   [79:0]      FABRIC_LN1_TXDATA_I                             ,
    output  [5:0]       FABRIC_LN2_ASTAT_O                              ,
    output              FABRIC_LN2_BURN_IN_TOGGLE_O                     ,
    input   [42:0]      FABRIC_LN2_CTRL_I                               ,
    input               FABRIC_LN2_IDDQ_I                               ,
    input   [2:0]       FABRIC_LN2_PD_I                                 ,
    output              FABRIC_LN2_PMA_RX_LOCK_O                        ,
    input   [1:0]       FABRIC_LN2_RATE_I                               ,
    input               FABRIC_LN2_RSTN_I                               ,
    output  [87:0]      FABRIC_LN2_RXDATA_O                             ,
    output  [12:0]      FABRIC_LN2_STAT_O                               ,
    input   [79:0]      FABRIC_LN2_TXDATA_I                             ,
    output  [5:0]       FABRIC_LN3_ASTAT_O                              ,
    output              FABRIC_LN3_BURN_IN_TOGGLE_O                     ,
    input   [42:0]      FABRIC_LN3_CTRL_I                               ,
    input               FABRIC_LN3_IDDQ_I                               ,
    input   [2:0]       FABRIC_LN3_PD_I                                 ,
    output              FABRIC_LN3_PMA_RX_LOCK_O                        ,
    input   [1:0]       FABRIC_LN3_RATE_I                               ,
    input               FABRIC_LN3_RSTN_I                               ,
    output  [87:0]      FABRIC_LN3_RXDATA_O                             ,
    output  [12:0]      FABRIC_LN3_STAT_O                               ,
    input   [79:0]      FABRIC_LN3_TXDATA_I                             ,
    output              FABRIC_REFCLK_GATE_ACK_O                        ,
    input               FABRIC_REFCLK_GATE_I                            ,
    input               LANE0_PCS_RX_RST                                ,
    input               LANE1_PCS_RX_RST                                ,
    input               LANE2_PCS_RX_RST                                ,
    input               LANE3_PCS_RX_RST                                ,
    input               LANE0_ALIGN_TRIGGER                             ,
    input               LANE1_ALIGN_TRIGGER                             ,
    input               LANE2_ALIGN_TRIGGER                             ,
    input               LANE3_ALIGN_TRIGGER                             ,
    input               LANE0_CHBOND_START                              ,
    input               LANE1_CHBOND_START                              ,
    input               LANE2_CHBOND_START                              ,
    input               LANE3_CHBOND_START                              ,
    output              LANE0_ALIGN_LINK                                ,
    output              LANE0_K_LOCK                                    ,
    output  [1:0]       LANE0_DISP_ERR_O                                ,
    output  [1:0]       LANE0_DEC_ERR_O                                 ,
    output  [1:0]       LANE0_CUR_DISP_O                                ,
    output              LANE1_ALIGN_LINK                                ,
    output              LANE1_K_LOCK                                    ,
    output  [1:0]       LANE1_DISP_ERR_O                                ,
    output  [1:0]       LANE1_DEC_ERR_O                                 ,
    output  [1:0]       LANE1_CUR_DISP_O                                ,
    output              LANE2_ALIGN_LINK                                ,
    output              LANE2_K_LOCK                                    ,
    output  [1:0]       LANE2_DISP_ERR_O                                ,
    output  [1:0]       LANE2_DEC_ERR_O                                 ,
    output  [1:0]       LANE2_CUR_DISP_O                                ,
    output              LANE3_ALIGN_LINK                                ,
    output              LANE3_K_LOCK                                    ,
    output  [1:0]       LANE3_DISP_ERR_O                                ,
    output  [1:0]       LANE3_DEC_ERR_O                                 ,
    output  [1:0]       LANE3_CUR_DISP_O                                ,
    input               LANE0_PCS_TX_RST                                ,
    input               LANE1_PCS_TX_RST                                ,
    input               LANE2_PCS_TX_RST                                ,
    input               LANE3_PCS_TX_RST                                ,
    input               LANE0_FABRIC_RX_CLK                             ,
    input               LANE1_FABRIC_RX_CLK                             ,
    input               LANE2_FABRIC_RX_CLK                             ,
    input               LANE3_FABRIC_RX_CLK                             ,
    input               LANE0_FABRIC_C2I_CLK                            ,
    input               LANE1_FABRIC_C2I_CLK                            ,
    input               LANE2_FABRIC_C2I_CLK                            ,
    input               LANE3_FABRIC_C2I_CLK                            ,
    output              LANE0_PCS_RX_O_FABRIC_CLK                       ,
    output              LANE1_PCS_RX_O_FABRIC_CLK                       ,
    output              LANE2_PCS_RX_O_FABRIC_CLK                       ,
    output              LANE3_PCS_RX_O_FABRIC_CLK                       ,
    input               LANE0_FABRIC_TX_CLK                             ,
    input               LANE1_FABRIC_TX_CLK                             ,
    input               LANE2_FABRIC_TX_CLK                             ,
    input               LANE3_FABRIC_TX_CLK                             ,
    output              LANE0_PCS_TX_O_FABRIC_CLK                       ,
    output              LANE1_PCS_TX_O_FABRIC_CLK                       ,
    output              LANE2_PCS_TX_O_FABRIC_CLK                       ,
    output              LANE3_PCS_TX_O_FABRIC_CLK                       ,
    output              FABRIC_CMU0_CLK                                 ,
    output              FABRIC_CMU1_CLK                                 ,
    output              FABRIC_QUAD_CLK_RX                              ,
    input               LANE0_RX_IF_FIFO_RDEN                           ,
    input               LANE1_RX_IF_FIFO_RDEN                           ,
    input               LANE2_RX_IF_FIFO_RDEN                           ,
    input               LANE3_RX_IF_FIFO_RDEN                           ,
    output  [4:0]       LANE0_RX_IF_FIFO_RDUSEWD                        ,
    output              LANE0_RX_IF_FIFO_AEMPTY                         ,
    output              LANE0_RX_IF_FIFO_EMPTY                          ,
    output  [4:0]       LANE1_RX_IF_FIFO_RDUSEWD                        ,
    output              LANE1_RX_IF_FIFO_AEMPTY                         ,
    output              LANE1_RX_IF_FIFO_EMPTY                          ,
    output  [4:0]       LANE2_RX_IF_FIFO_RDUSEWD                        ,
    output              LANE2_RX_IF_FIFO_AEMPTY                         ,
    output              LANE2_RX_IF_FIFO_EMPTY                          ,
    output  [4:0]       LANE3_RX_IF_FIFO_RDUSEWD                        ,
    output              LANE3_RX_IF_FIFO_AEMPTY                         ,
    output              LANE3_RX_IF_FIFO_EMPTY                          ,
    output  [4:0]       LANE0_TX_IF_FIFO_WRUSEWD                        ,
    output              LANE0_TX_IF_FIFO_AFULL                          ,
    output              LANE0_TX_IF_FIFO_FULL                           ,
    output  [4:0]       LANE1_TX_IF_FIFO_WRUSEWD                        ,
    output              LANE1_TX_IF_FIFO_AFULL                          ,
    output              LANE1_TX_IF_FIFO_FULL                           ,
    output  [4:0]       LANE2_TX_IF_FIFO_WRUSEWD                        ,
    output              LANE2_TX_IF_FIFO_AFULL                          ,
    output              LANE2_TX_IF_FIFO_FULL                           ,
    output  [4:0]       LANE3_TX_IF_FIFO_WRUSEWD                        ,
    output              LANE3_TX_IF_FIFO_AFULL                          ,
    output              LANE3_TX_IF_FIFO_FULL                           ,
    input               FABRIC_CMU0_RESETN_I                            ,
    input               FABRIC_CMU0_PD_I                                ,
    input               FABRIC_CMU0_IDDQ_I                              ,
    input               FABRIC_CMU1_RESETN_I                            ,
    input               FABRIC_CMU1_PD_I                                ,
    input               FABRIC_CMU1_IDDQ_I                              ,
    input               FABRIC_PLL_CDN_I                                ,
    input               FABRIC_LN0_CPLL_RESETN_I                        ,
    input               FABRIC_LN0_CPLL_PD_I                            ,
    input               FABRIC_LN0_CPLL_IDDQ_I                          ,
    input               FABRIC_LN1_CPLL_RESETN_I                        ,
    input               FABRIC_LN1_CPLL_PD_I                            ,
    input               FABRIC_LN1_CPLL_IDDQ_I                          ,
    input               FABRIC_LN2_CPLL_RESETN_I                        ,
    input               FABRIC_LN2_CPLL_PD_I                            ,
    input               FABRIC_LN2_CPLL_IDDQ_I                          ,
    input               FABRIC_LN3_CPLL_RESETN_I                        ,
    input               FABRIC_LN3_CPLL_PD_I                            ,
    input               FABRIC_LN3_CPLL_IDDQ_I                          ,
    input               FABRIC_CM1_PD_REFCLK_DET_I                      ,
    input               FABRIC_CM0_PD_REFCLK_DET_I                      ,
    output              FABRIC_CLK_MON_O                                ,
    output              FABRIC_GEARFIFO_ERR_RPT                         ,
    input   [42:0]      FABRIC_LN0_CTRL_I_H                             ,
    input   [2:0]       FABRIC_LN0_PD_I_H                               ,
    input   [1:0]       FABRIC_LN0_RATE_I_H                             ,
    output              FABRIC_LN0_RX_VLD_OUT                           ,
    output              FABRIC_LN0_RXELECIDLE_O                         ,
    output              FABRIC_LN0_RXELECIDLE_O_H                       ,
    output  [12:0]      FABRIC_LN0_STAT_O_H                             ,
    input               FABRIC_LN0_TX_VLD_IN                            ,
    input   [42:0]      FABRIC_LN1_CTRL_I_H                             ,
    input   [2:0]       FABRIC_LN1_PD_I_H                               ,
    input   [1:0]       FABRIC_LN1_RATE_I_H                             ,
    output              FABRIC_LN1_RX_VLD_OUT                           ,
    output              FABRIC_LN1_RXELECIDLE_O                         ,
    output              FABRIC_LN1_RXELECIDLE_O_H                       ,
    output  [12:0]      FABRIC_LN1_STAT_O_H                             ,
    input               FABRIC_LN1_TX_VLD_IN                            ,
    input   [42:0]      FABRIC_LN2_CTRL_I_H                             ,
    input   [2:0]       FABRIC_LN2_PD_I_H                               ,
    input   [1:0]       FABRIC_LN2_RATE_I_H                             ,
    output              FABRIC_LN2_RX_VLD_OUT                           ,
    output              FABRIC_LN2_RXELECIDLE_O                         ,
    output              FABRIC_LN2_RXELECIDLE_O_H                       ,
    output  [12:0]      FABRIC_LN2_STAT_O_H                             ,
    input               FABRIC_LN2_TX_VLD_IN                            ,
    input   [42:0]      FABRIC_LN3_CTRL_I_H                             ,
    input   [2:0]       FABRIC_LN3_PD_I_H                               ,
    input   [1:0]       FABRIC_LN3_RATE_I_H                             ,
    output              FABRIC_LN3_RX_VLD_OUT                           ,
    output              FABRIC_LN3_RXELECIDLE_O                         ,
    output              FABRIC_LN3_RXELECIDLE_O_H                       ,
    output  [12:0]      FABRIC_LN3_STAT_O_H                             ,
    input               FABRIC_LN3_TX_VLD_IN                            ,
    input               FABRIC_POR_N_I                                  ,
    input               FABRIC_QUAD_MCU_REQ_I                           ,
//ports that are special
    input               CK_AHB_I                                        ,
    input               AHB_RSTN                                        ,
    input               TEST_DEC_EN                                     ,
    output              FABRIC_LANE0_CMU_OK_O                           ,
    output              FABRIC_LANE1_CMU_OK_O                           ,
    output              FABRIC_LANE2_CMU_OK_O                           ,
    output              FABRIC_LANE3_CMU_OK_O                           ,
    input               QUAD_PCIE_CLK                                   ,
    input               PCIE_DIV2_REG                                   ,
    input               PCIE_DIV4_REG                                   ,
    input               PMAC_LN_RSTN                                    ,
//ports for interconnection of hardwire
    inout   [91:0]      INET_Q0_Q1                          ,
    inout   [531:0]     INET_Q_PMAC                         ,
    inout   [227:0]     INET_Q_TEST                         ,
    inout   [420:0]     INET_Q_UPAR                          
);

    parameter POSITION = "Q0";

endmodule

//GTR12_UPAR
module GTR12_UPAR (
// ports to fabric
    input               CSR_TCK                                         ,
    input               CSR_TMS                                         ,
    input               CSR_TDI                                         ,
    output              CSR_TDO                                         ,
    input               UPAR_CLK                                        ,
    input               UPAR_RST                                        ,
    input               SPI_CLK                                         ,
    input               UPAR_WREN_S                                     ,
    input   [23:0]      UPAR_ADDR_S                                     ,
    input   [31:0]      UPAR_WRDATA_S                                   ,
    input               UPAR_RDEN_S                                     ,
    input   [7:0]       UPAR_STRB_S                                     ,
    input               UPAR_BUS_WIDTH_S                                ,
    output  [31:0]      UPAR_RDDATA_S                                   ,
    output              UPAR_RDVLD_S                                    ,
    output              UPAR_READY_S                                    ,
    input               SPI_MOSI                                        ,
    output              SPI_MISO                                        ,
    input               SPI_SS                                          ,
    output              AHB_CLK_O                                       ,
    input   [4:0]       CSR_MODE                                        ,
    input               FABRIC_DFT_EDT_UPDATE                           ,
    input               FABRIC_DFT_IJTAG_CE                             ,
    input               FABRIC_DFT_IJTAG_RESET                          ,
    input               FABRIC_DFT_IJTAG_SE                             ,
    input               FABRIC_DFT_IJTAG_SEL                            ,
    input               FABRIC_DFT_IJTAG_SI                             ,
    input               FABRIC_DFT_IJTAG_TCK                            ,
    input               FABRIC_DFT_IJTAG_UE                             ,
    input               FABRIC_DFT_PLL_BYPASS_CLK                       ,
    input               FABRIC_DFT_PLL_BYPASS_MODE                      ,
    input               FABRIC_DFT_SCAN_CLK                             ,
    input               FABRIC_DFT_SCAN_EN                              ,
    input               FABRIC_DFT_SCAN_IN0                             ,
    input               FABRIC_DFT_SCAN_IN1                             ,
    input               FABRIC_DFT_SCAN_IN2                             ,
    input               FABRIC_DFT_SCAN_IN3                             ,
    input               FABRIC_DFT_SCAN_IN4                             ,
    input               FABRIC_DFT_SCAN_IN5                             ,
    input               FABRIC_DFT_SCAN_IN6                             ,
    input               FABRIC_DFT_SCAN_RSTN                            ,
    input               FABRIC_DFT_SHIFT_SCAN_EN                        ,
//ports that are special
    output              QUAD_CFG_TEST_DEC_EN                            ,
    output              AHB_RSTN_O                                      ,
    output              TL_CLKP_I                                       ,
//ports for interconnection of hardwire
    inout   [5466:0]    INET_UPAR_PMAC                      ,
    inout   [420:0]     INET_UPAR_Q0                        ,
    inout   [420:0]     INET_UPAR_Q1                        ,
    inout   [1328:0]    INET_UPAR_TEST                      
);

endmodule


//GTR12_PMAC
module GTR12_PMAC (
// ports to fabric
    output  [3:0]       PL_EXIT                                         ,
    output  [64:0]      TL_FLR_REQ0                                     ,
    input   [64:0]      TL_FLR_ACK0                                     ,
    output  [64:0]      TL_FLR_REQ1                                     ,
    input   [64:0]      TL_FLR_ACK1                                     ,
    output  [64:0]      TL_FLR_REQ2                                     ,
    input   [64:0]      TL_FLR_ACK2                                     ,
    output  [64:0]      TL_FLR_REQ3                                     ,
    input   [64:0]      TL_FLR_ACK3                                     ,
    input   [21:0]      TL_CLOCK_FREQ                                   ,
    output              PL_WAKE_OEN                                     ,
    input               PL_WAKE_IN                                      ,
    output              PL_CLKREQ_OEN                                   ,
    input               PL_CLKREQ_IN                                    ,
    input               PL_LTSSM_ENABLE                                 ,
    output              TL_RX_SOP0                                      ,
    output              TL_RX_EOP0                                      ,
    output  [255:0]     TL_RX_DATA0                                     ,
    output  [7:0]       TL_RX_VALID0                                    ,
    output  [31:0]      TL_RX_PROT0                                     ,
    output  [19:0]      TL_RX_BARDEC0                                   ,
    output  [15:0]      TL_RX_MCHIT0                                    ,
    output  [7:0]       TL_RX_ERR0                                      ,
    input               TL_RX_MASKNP0                                   ,
    input               TL_RX_WAIT0                                     ,
    input               TL_TX_SOP0                                      ,
    input               TL_TX_EOP0                                      ,
    input   [255:0]     TL_TX_DATA0                                     ,
    input   [7:0]       TL_TX_VALID0                                    ,
    input   [31:0]      TL_TX_PROT0                                     ,
    input               TL_TX_STREAM0                                   ,
    input   [7:0]       TL_TX_ERR0                                      ,
    output              TL_TX_WAIT0                                     ,
    output  [95:0]      TL_TX_CREDITS0                                  ,
    output  [31:0]      TL_TX_PROTERR0                                  ,
    input               TL_TX_PROTACK0                                  ,
    input   [7:0]       TL_BRSW_IN                                      ,
    output  [7:0]       TL_BRSW_OUT                                     ,
    input               TL_INT_STATUS0                                  ,
    input               TL_INT_REQ0                                     ,
    input   [4:0]       TL_INT_MSINUM0                                  ,
    input   [6:0]       TL_INT_VFNUM0                                   ,
    output              TL_INT_ACK0                                     ,
    input               TL_INT_STATUS1                                  ,
    input               TL_INT_REQ1                                     ,
    input   [4:0]       TL_INT_MSINUM1                                  ,
    input   [6:0]       TL_INT_VFNUM1                                   ,
    output              TL_INT_ACK1                                     ,
    input               TL_INT_STATUS2                                  ,
    input               TL_INT_REQ2                                     ,
    input   [4:0]       TL_INT_MSINUM2                                  ,
    input   [6:0]       TL_INT_VFNUM2                                   ,
    output              TL_INT_ACK2                                     ,
    input               TL_INT_STATUS3                                  ,
    input               TL_INT_REQ3                                     ,
    input   [4:0]       TL_INT_MSINUM3                                  ,
    input   [6:0]       TL_INT_VFNUM3                                   ,
    output              TL_INT_ACK3                                     ,
    output  [3:0]       TL_INT_PINSTATE                                 ,
    input   [3:0]       TL_INT_PINCONTROL                               ,
    input               TL_PM_EVENT0                                    ,
    input   [9:0]       TL_PM_DATA0                                     ,
    input               TL_PM_EVENT1                                    ,
    input   [9:0]       TL_PM_DATA1                                     ,
    input               TL_PM_EVENT2                                    ,
    input   [9:0]       TL_PM_DATA2                                     ,
    input               TL_PM_EVENT3                                    ,
    input   [9:0]       TL_PM_DATA3                                     ,
    input               TL_PM_CLKCONTROL                                ,
    output  [3:0]       TL_PM_CLKSTATUS                                 ,
    input   [7:0]       TL_PM_BWCHANGE                                  ,
    input               TL_PM_TOCONTROL                                 ,
    output              TL_PM_TOSTATUS                                  ,
    input               TL_PM_AUXPWR                                    ,
    input   [3:0]       TL_PM_OBFFCONTROL                               ,
    output  [3:0]       TL_PM_OBFFSTATUS                                ,
    input   [38:0]      TL_REPORT_ERROR0                                ,
    input   [7:0]       TL_REPORT_STATE0                                ,
    input   [64:0]      TL_REPORT_CPLPENDING0                           ,
    input   [255:0]     TL_REPORT_HEADER0                               ,
    input   [38:0]      TL_REPORT_ERROR1                                ,
    input   [7:0]       TL_REPORT_STATE1                                ,
    input   [64:0]      TL_REPORT_CPLPENDING1                           ,
    input   [255:0]     TL_REPORT_HEADER1                               ,
    input   [38:0]      TL_REPORT_ERROR2                                ,
    input   [7:0]       TL_REPORT_STATE2                                ,
    input   [64:0]      TL_REPORT_CPLPENDING2                           ,
    input   [255:0]     TL_REPORT_HEADER2                               ,
    input   [38:0]      TL_REPORT_ERROR3                                ,
    input   [7:0]       TL_REPORT_STATE3                                ,
    input   [64:0]      TL_REPORT_CPLPENDING3                           ,
    input   [255:0]     TL_REPORT_HEADER3                               ,
    output  [7:0]       TL_REPORT_EVENT                                 ,
    input   [7:0]       TL_REPORT_HOTPLUG                               ,
    output  [3:0]       TL_REPORT_TIMER                                 ,
    input   [32:0]      TL_REPORT_LATENCY                               ,
    input               FABRIC_PL_NPOR                                  ,
    input               FABRIC_PL_RSTN                                  ,
    input               FABRIC_PL_RSTNP                                 ,
    input               FABRIC_PL_SRST                                  ,
    input               FABRIC_TL_NPOR                                  ,
    input               FABRIC_TL_RSTN                                  ,
    input               FABRIC_TL_RSTNP                                 ,
    input               FABRIC_TL_CRSTN                                 ,
    input               FABRIC_TL_SRST                                  ,
    input               FABRIC_TL_CRST                                  ,
    input               FABRIC_PL_PCLK_STOP                             ,
    input               FABRIC_CTRL_GATE_TL_CLK                         ,
    output              PCIE_HALF_CLK                                   ,
    input   [7:0]       FABRIC_PHY_ACKLOCAL                             ,
    input   [7:0]       FABRIC_PHY_ACKLOCAL_H                           ,
    output  [7:0]       FABRIC_PHY_INVALIDREQ                           ,
    output  [7:0]       FABRIC_PHY_INVALIDREQ_H                         ,
    output  [7:0]       FABRIC_PHY_REQLOCAL                             ,
    output  [7:0]       FABRIC_PHY_REQLOCAL_H                           ,
    output  [31:0]      FABRIC_PHY_REQLOCALIDX                          ,
    output  [31:0]      FABRIC_PHY_REQLOCALIDX_H                        ,
    output  [7:0]       FABRIC_PHY_RXEQEVAL                             ,
    output  [7:0]       FABRIC_PHY_RXEQEVAL_H                           ,
    output  [7:0]       FABRIC_PHY_RXEQINPROGRESS                       ,
    output  [7:0]       FABRIC_PHY_RXEQINPROGRESS_H                     ,
    output  [23:0]      FABRIC_PHY_RXPREHINT                            ,
    output  [23:0]      FABRIC_PHY_RXPREHINT_H                          ,
    output  [15:0]      FABRIC_PHY_TXDEEMPH                             ,
    output  [15:0]      FABRIC_PHY_TXDEEMPH_H                           ,
    output              FABRIC_PL_BLOCKALIGNCONTROL                     ,
    output              FABRIC_PL_BLOCKALIGNCONTROL_H                   ,
    input   [7:0]       FABRIC_PL_PHYSTATUS                             ,
    input   [7:0]       FABRIC_PL_PHYSTATUS_H                           ,
    output  [1:0]       FABRIC_PL_POWERDOWN                             ,
    output  [1:0]       FABRIC_PL_POWERDOWN_H                           ,
    output  [1:0]       FABRIC_PL_RATE                                  ,
    output  [1:0]       FABRIC_PL_RATE_H                                ,
    input   [127:0]     FABRIC_PL_RXDATA                                ,
    input   [127:0]     FABRIC_PL_RXDATA_H                              ,
    input   [15:0]      FABRIC_PL_RXDATAK                               ,
    input   [15:0]      FABRIC_PL_RXDATAK_H                             ,
    input   [7:0]       FABRIC_PL_RXDATAVALID                           ,
    input   [7:0]       FABRIC_PL_RXDATAVALID_H                         ,
    input   [7:0]       FABRIC_PL_RXELECIDLE                            ,
    input   [7:0]       FABRIC_PL_RXELECIDLE_H                          ,
    output  [7:0]       FABRIC_PL_RXPOLARITY                            ,
    output  [7:0]       FABRIC_PL_RXPOLARITY_H                          ,
    output  [7:0]       FABRIC_PL_RXSTANDBY                             ,
    output  [7:0]       FABRIC_PL_RXSTANDBY_H                           ,
    input   [7:0]       FABRIC_PL_RXSTARTBLOCK                          ,
    input   [7:0]       FABRIC_PL_RXSTARTBLOCK_H                        ,
    input   [23:0]      FABRIC_PL_RXSTATUS                              ,
    input   [23:0]      FABRIC_PL_RXSTATUS_H                            ,
    input   [15:0]      FABRIC_PL_RXSYNCHEADER                          ,
    input   [15:0]      FABRIC_PL_RXSYNCHEADER_H                        ,
    input   [7:0]       FABRIC_PL_RXVALID                               ,
    input   [7:0]       FABRIC_PL_RXVALID_H                             ,
    output  [7:0]       FABRIC_PL_TXCOMPLIANCE                          ,
    output  [7:0]       FABRIC_PL_TXCOMPLIANCE_H                        ,
    output  [127:0]     FABRIC_PL_TXDATA                                ,
    output  [127:0]     FABRIC_PL_TXDATA_H                              ,
    output  [15:0]      FABRIC_PL_TXDATAK                               ,
    output  [15:0]      FABRIC_PL_TXDATAK_H                             ,
    output  [7:0]       FABRIC_PL_TXDATAVALID                           ,
    output  [7:0]       FABRIC_PL_TXDATAVALID_H                         ,
    output  [7:0]       FABRIC_PL_TXDETECTRX                            ,
    output  [7:0]       FABRIC_PL_TXDETECTRX_H                          ,
    output  [7:0]       FABRIC_PL_TXELECIDLE                            ,
    output  [7:0]       FABRIC_PL_TXELECIDLE_H                          ,
    output  [2:0]       FABRIC_PL_TXMARGIN                              ,
    output  [2:0]       FABRIC_PL_TXMARGIN_H                            ,
    output  [7:0]       FABRIC_PL_TXSTARTBLOCK                          ,
    output  [7:0]       FABRIC_PL_TXSTARTBLOCK_H                        ,
    output              FABRIC_PL_TXSWING                               ,
    output              FABRIC_PL_TXSWING_H                             ,
    output  [15:0]      FABRIC_PL_TXSYNCHEADER                          ,
    output  [15:0]      FABRIC_PL_TXSYNCHEADER_H                        ,
    output  [1:0]       FABRIC_PL_WIDTH                                 ,
    output  [1:0]       FABRIC_PL_WIDTH_H                               ,
    output  [31:0]      FABRIC_TEST_BUS_MON                             ,
    output  [18:0]      TL_CFGEXPADDR0                                  ,
    output  [18:0]      TL_CFGEXPADDR1                                  ,
    output  [18:0]      TL_CFGEXPADDR2                                  ,
    output  [18:0]      TL_CFGEXPADDR3                                  ,
    input   [31:0]      TL_CFGEXPRDATA0                                 ,
    input   [31:0]      TL_CFGEXPRDATA1                                 ,
    input   [31:0]      TL_CFGEXPRDATA2                                 ,
    input   [31:0]      TL_CFGEXPRDATA3                                 ,
    output              TL_CFGEXPREAD0                                  ,
    output              TL_CFGEXPREAD1                                  ,
    output              TL_CFGEXPREAD2                                  ,
    output              TL_CFGEXPREAD3                                  ,
    output  [3:0]       TL_CFGEXPSTRB0                                  ,
    output  [3:0]       TL_CFGEXPSTRB1                                  ,
    output  [3:0]       TL_CFGEXPSTRB2                                  ,
    output  [3:0]       TL_CFGEXPSTRB3                                  ,
    input               TL_CFGEXPVALID0                                 ,
    input               TL_CFGEXPVALID1                                 ,
    input               TL_CFGEXPVALID2                                 ,
    input               TL_CFGEXPVALID3                                 ,
    output  [31:0]      TL_CFGEXPWDATA0                                 ,
    output  [31:0]      TL_CFGEXPWDATA1                                 ,
    output  [31:0]      TL_CFGEXPWDATA2                                 ,
    output  [31:0]      TL_CFGEXPWDATA3                                 ,
    output              TL_CFGEXPWRITE0                                 ,
    output              TL_CFGEXPWRITE1                                 ,
    output              TL_CFGEXPWRITE2                                 ,
    output              TL_CFGEXPWRITE3                                 ,
    output  [12:0]      TLCFG_BUSDEV                                    ,
//ports that are special
    input               TL_CLKP                                         ,
    output              PCIE_CLK                                        ,
    output              PMAC_LN_RSTN                                    ,
    input               Q0_CPLL0_OK_I                                   ,
    input               Q0_CPLL1_OK_I                                   ,
    input               Q0_CPLL2_OK_I                                   ,
    input               Q0_CPLL3_OK_I                                   ,
    input               Q1_CPLL0_OK_I                                   ,
    input               Q1_CPLL1_OK_I                                   ,
    input               Q1_CPLL2_OK_I                                   ,
    input               Q1_CPLL3_OK_I                                   ,
    input               FABRIC_PCLK_I                                   ,
    output              PCIE_DIV2_REG                                   ,
    output              PCIE_DIV4_REG                                   ,
//ports for interconnection of hardwire
    inout   [531:0]     INET_PMAC_Q0                        ,
    inout   [531:0]     INET_PMAC_Q1                        ,
    inout   [780:0]     INET_PMAC_TEST                      ,
    inout   [5466:0]    INET_PMAC_UPAR                       
);
endmodule


// DQS
module DQS(DQSR90, DQSW0, DQSW270, RPOINT, WPOINT, RVALID, RBURST, RFLAG, WFLAG, DQSIN, DLLSTEP, WSTEP, READ, RLOADN, RMOVE, RDIR, WLOADN, WMOVE, WDIR, HOLD, RCLKSEL, PCLK, FCLK, RESET);
input DQSIN,PCLK,FCLK,RESET;
input [3:0] READ;
input [2:0] RCLKSEL;
input [7:0] DLLSTEP;
input [7:0] WSTEP;
input RLOADN, RMOVE, RDIR, WLOADN, WMOVE, WDIR, HOLD;
output DQSR90, DQSW0, DQSW270; 
output [2:0] RPOINT, WPOINT;
output RVALID,RBURST, RFLAG, WFLAG;

parameter FIFO_MODE_SEL = 1'b0; // FIFO mode select,1'b0: DDR memory mode;1'b1: GDDR mode
parameter RD_PNTR = 3'b000; // FIFO read pointer setting
parameter DQS_MODE = "X1"; // "X1", "X2_DDR2", "X2_DDR3","X4","X2_DDR3_EXT"
parameter HWL = "false";   //"true"; "false"

endmodule