module RegisterFile 	#(parameter N_REG = 32,
							parameter N = 32)
							(
							input logic 	clk,
							input logic 	reset,
							input logic 	WE,
							input logic 	[4:0]A1,
							input logic 	[4:0]A2,
							input logic 	[N-1:0]WD,
							output logic	[N-1:0]RD1,
							output logic	[N-1:0]RD2);

	
	logic [31:0]regArr[31:0];
	logic [31:0]en;
	
	WriteEnable writeEnable(WE, A1, en);
	
	flop r0(clk, en[0], reset, WD, regArr[0]);
	flop r1(clk, en[1], reset, WD, regArr[1]);
	flop r2(clk, en[2], reset, WD, regArr[2]);
	flop r3(clk, en[3], reset, WD, regArr[3]);
	flop r4(clk, en[4], reset, WD, regArr[4]);
	flop r5(clk, en[5], reset, WD, regArr[5]);
	flop r6(clk, en[6], reset, WD, regArr[6]);
	flop r7(clk, en[7], reset, WD, regArr[7]);
	flop r8(clk, en[8], reset, WD, regArr[8]);
	flop r9(clk, en[9], reset, WD, regArr[9]);
	flop r10(clk, en[10], reset, WD, regArr[10]);
	flop r11(clk, en[11], reset, WD, regArr[11]);
	flop r12(clk, en[12], reset, WD, regArr[12]);
	flop r13(clk, en[13], reset, WD, regArr[13]);
	flop r14(clk, en[14], reset, WD, regArr[14]);
	flop r15(clk, en[15], reset, WD, regArr[15]);
	flop r16(clk, en[16], reset, WD, regArr[16]);
	flop r17(clk, en[17], reset, WD, regArr[17]);
	flop r18(clk, en[18], reset, WD, regArr[18]);
	flop r19(clk, en[19], reset, WD, regArr[19]);
	flop r20(clk, en[20], reset, WD, regArr[20]);
	flop r21(clk, en[21], reset, WD, regArr[21]);
	flop r22(clk, en[22], reset, WD, regArr[22]);
	flop r23(clk, en[23], reset, WD, regArr[23]);
	flop r24(clk, en[24], reset, WD, regArr[24]);
	flop r25(clk, en[25], reset, WD, regArr[25]);
	flop r26(clk, en[26], reset, WD, regArr[26]);
	flop r27(clk, en[27], reset, WD, regArr[27]);
	flop r28(clk, en[28], reset, WD, regArr[28]);
	flop r29(clk, en[29], reset, WD, regArr[29]);
	flop r30(clk, en[30], reset, WD, regArr[30]);
	flop r31(clk, en[31], reset, WD, regArr[31]);
	


	always_comb begin
		case(A1)
			5'd0:			RD1 = regArr[0];
			5'd1:			RD1 = regArr[1];
			5'd2:			RD1 = regArr[2];
			5'd3:			RD1 = regArr[3];
			5'd4:			RD1 = regArr[4];
			5'd5:			RD1 = regArr[5];
			5'd6:			RD1 = regArr[6];
			5'd7:			RD1 = regArr[7];
			5'd8:			RD1 = regArr[8];
			5'd9:			RD1 = regArr[9];
			5'd10:		RD1 = regArr[10];
			5'd11:		RD1 = regArr[11];
			5'd12:		RD1 = regArr[12];
			5'd13:		RD1 = regArr[13];
			5'd14:		RD1 = regArr[14];
			5'd15:		RD1 = regArr[15];
			5'd16:		RD1 = regArr[16];
			5'd17:		RD1 = regArr[17];
			5'd18:		RD1 = regArr[18];
			5'd19:		RD1 = regArr[19];
			5'd20:		RD1 = regArr[20];
			5'd21:		RD1 = regArr[21];
			5'd22:		RD1 = regArr[22];
			5'd23:		RD1 = regArr[23];
			5'd24:		RD1 = regArr[24];
			5'd25:		RD1 = regArr[25];
			5'd26:		RD1 = regArr[26];
			5'd27:		RD1 = regArr[27];
			5'd28:		RD1 = regArr[28];
			5'd29:		RD1 = regArr[29];
			5'd30:		RD1 = regArr[30];
			5'd31:		RD1 = regArr[31];
		endcase
	end
	
	
	always_comb begin
		case(A2)
			5'd0:			RD2 = regArr[0];
			5'd1:			RD2 = regArr[1];
			5'd2:			RD2 = regArr[2];
			5'd3:			RD2 = regArr[3];
			5'd4:			RD2 = regArr[4];
			5'd5:			RD2 = regArr[5];
			5'd6:			RD2 = regArr[6];
			5'd7:			RD2 = regArr[7];
			5'd8:			RD2 = regArr[8];
			5'd9:			RD2 = regArr[9];
			5'd10:		RD2 = regArr[10];
			5'd11:		RD2 = regArr[11];
			5'd12:		RD2 = regArr[12];
			5'd13:		RD2 = regArr[13];
			5'd14:		RD2 = regArr[14];
			5'd15:		RD2 = regArr[15];
			5'd16:		RD2 = regArr[16];
			5'd17:		RD2 = regArr[17];
			5'd18:		RD2 = regArr[18];
			5'd19:		RD2 = regArr[19];
			5'd20:		RD2 = regArr[20];
			5'd21:		RD2 = regArr[21];
			5'd22:		RD2 = regArr[22];
			5'd23:		RD2 = regArr[23];
			5'd24:		RD2 = regArr[24];
			5'd25:		RD2 = regArr[25];
			5'd26:		RD2 = regArr[26];
			5'd27:		RD2 = regArr[27];
			5'd28:		RD2 = regArr[28];
			5'd29:		RD2 = regArr[29];
			5'd30:		RD2 = regArr[30];
			5'd31:		RD2 = regArr[31];
		endcase
	end

endmodule 










module flop #(parameter N = 32)
			(input logic 	clk,
			 input logic	enable,
			 input logic 	reset,
			 input logic	[N-1:0]d,
			 output logic	[N-1:0]q);
			 
always_ff @(posedge clk, posedge reset) begin
	if(reset) q <= 32'b0;
	else if(enable) q <= d;
end

endmodule 



module WriteEnable(	input logic WE,
							input logic [4:0]A1,
							output logic [31:0]en
							);

	logic [31:0]dOut;
	
	Decoder dec(A1,dOut);				
	
	
	assign en[0] = dOut[0] & WE;
	assign en[1] = dOut[1] & WE;
	assign en[2] = dOut[2] & WE;
	assign en[3] = dOut[3] & WE;
	assign en[4] = dOut[4] & WE;
	assign en[5] = dOut[5] & WE;
	assign en[6] = dOut[6] & WE;
	assign en[7] = dOut[7] & WE;
	assign en[8] = dOut[8] & WE;
	assign en[9] = dOut[9] & WE;
	assign en[10] = dOut[10] & WE;
	assign en[11] = dOut[11] & WE;
	assign en[12] = dOut[12] & WE;
	assign en[13] = dOut[13] & WE;
	assign en[14] = dOut[14] & WE;
	assign en[15] = dOut[15] & WE;
	assign en[16] = dOut[16] & WE;
	assign en[17] = dOut[17] & WE;
	assign en[18] = dOut[18] & WE;
	assign en[19] = dOut[19] & WE;
	assign en[20] = dOut[20] & WE;
	assign en[21] = dOut[21] & WE;
	assign en[22] = dOut[22] & WE;
	assign en[23] = dOut[23] & WE;
	assign en[24] = dOut[24] & WE;
	assign en[25] = dOut[25] & WE;
	assign en[26] = dOut[26] & WE;
	assign en[27] = dOut[27] & WE;
	assign en[28] = dOut[28] & WE;
	assign en[29] = dOut[29] & WE;
	assign en[30] = dOut[30] & WE;
	assign en[31] = dOut[31] & WE;
							
							
							
endmodule
							
							

module Decoder 	#(parameter N = 32)
							( input logic [4:0]A,
							output logic [N-1:0]y);	
	always_comb begin
		case ( A )
			5'd0:		y = 32'd1;
			5'd1:		y = 32'd2;
			5'd2:		y = 32'd4;
			5'd3:		y = 32'd8;
			5'd4: 	y = 32'd16;
			5'd5:		y = 32'd32;
			5'd6:		y = 32'd64;
			5'd7:		y = 32'd128;
			5'd8:		y = 32'd256;
			5'd9:		y = 32'd512;
			5'd10:	y = 32'd1024;
			5'd11:	y = 32'd2048;
			5'd12:	y = 32'd4096;
			5'd13: 	y = 32'd8192;
			5'd14:	y = 32'd16384;
			5'd15:	y = 32'd32768;
			5'd16:	y = 32'd65536;
			5'd17:	y = 32'd131072;
			5'd18:	y = 32'd262144;
			5'd19:	y = 32'd524288;
			5'd20:	y = 32'd1048576;
			5'd21:	y = 32'd2097152;
			5'd22:	y = 32'd4194304;
			5'd23:	y = 32'd8388608;
			5'd24:	y = 32'd16777216;
			5'd25:	y = 32'd33554432;
			5'd26:	y = 32'd67108864;
			5'd27:	y = 32'd134217728;
			5'd28:	y = 32'd268435456;
			5'd29:	y = 32'd536870912;
			5'd30:	y = 32'd1073741824;
			5'd31:	y = 32'd2147483648;
		endcase
	end
			
endmodule

