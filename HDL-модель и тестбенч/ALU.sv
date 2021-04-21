module ALU #(parameter N = 32)
			(
			input logic [N-1:0]dataIn0,
			input logic [N-1:0]dataIn1,
			input logic [3:0]ctrlALU,
			output logic cmp,
			output logic [N-1:0]dataOut
			);
			
	logic [N-1:0]adderOut;
	logic cmpOut;
	logic [N-1:0]substrOut;
	logic [N-1:0]andOut,orOut,xorOut,notOut;
	logic [N-1:0]rotrOut,shrOut;
	
	
	ALU_Adder adder_instance(.a(dataIn0), .b(dataIn1), .y(adderOut) );
	Substractor substactor_instance(dataIn0, dataIn1, substrOut);
	Comparator comparator_instance(dataIn0, dataIn1, cmpOut);
	LogicShifter logicShifter_instance(dataIn0, dataIn1[4:0], shrOut);
	ArifmeticShifter arifmeticShifter_instance(dataIn0, dataIn1[4:0], rotrOut);
	assign andOut = dataIn0 & dataIn1;
	assign orOut  = dataIn0 | dataIn1;
	assign xorOut = dataIn0 ^ dataIn1;
	assign notOut = ~dataIn0;
	assign cmp = cmpOut;
	
	always_comb begin
		case(ctrlALU)
			1:		dataOut = adderOut;
			2:		dataOut = substrOut;
			3:		dataOut = andOut;
			4:		dataOut = orOut;
			5:		dataOut = xorOut;
			6:		dataOut = rotrOut;
			7:		dataOut = shrOut;
			8:		dataOut = notOut;
			9:		dataOut = cmpOut;
			default:dataOut = 0;
		endcase
	
	end
			
endmodule 




module ALU_Adder #(parameter N = 32)
			(input logic [N-1:0] a,b,
			output logic [N-1:0] y);
	assign y = a + b;
endmodule





module Substractor #(parameter N = 32)
					(input logic [N-1:0]a,b,
					output logic [N-1:0]y
					);
					
	assign y = a - b;
	
endmodule





module Comparator #(parameter N = 32)
				(	input logic [N-1:0]dataIn0, dataIn1,
					output logic cmp );
					
	logic [N-1:0]outXNOR;
	
	assign outXNOR = ~(dataIn0 ^ dataIn1);
	
	assign cmp = & outXNOR;
	
		
endmodule



module LogicShifter #(parameter N = 32)
					(input logic [N-1:0]dataIn,
					input logic [4:0]n,
					output logic [N-1:0]dataOut
					);
	
	/////////////////////////0////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[0] = dataIn[0];
		1:		dataOut[0] = dataIn[1];
		2:		dataOut[0] = dataIn[2];
		3:		dataOut[0] = dataIn[3];
		4:		dataOut[0] = dataIn[4];
		5:		dataOut[0] = dataIn[5];
		6:		dataOut[0] = dataIn[6];
		7:		dataOut[0] = dataIn[7];
		8:		dataOut[0] = dataIn[8];
		9:		dataOut[0] = dataIn[9];
		10:		dataOut[0] = dataIn[10];
		11:		dataOut[0] = dataIn[11];
		12:		dataOut[0] = dataIn[12];
		13:		dataOut[0] = dataIn[13];
		14:		dataOut[0] = dataIn[14];
		15:		dataOut[0] = dataIn[15];
		16:		dataOut[0] = dataIn[16];
		17:		dataOut[0] = dataIn[17];
		18:		dataOut[0] = dataIn[18];
		19:		dataOut[0] = dataIn[19];
		20:		dataOut[0] = dataIn[20];
		21:		dataOut[0] = dataIn[21];
		22:		dataOut[0] = dataIn[22];
		23:		dataOut[0] = dataIn[23];
		24:		dataOut[0] = dataIn[24];
		25:		dataOut[0] = dataIn[25];
		26:		dataOut[0] = dataIn[26];
		27:		dataOut[0] = dataIn[27];
		28:		dataOut[0] = dataIn[28];
		29:		dataOut[0] = dataIn[29];
		30:		dataOut[0] = dataIn[30];
		31:		dataOut[0] = dataIn[31];
		default:dataOut[0] = 0;
		endcase
	end
	/////////////////////////1////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[1] = dataIn[1];
		1:		dataOut[1] = dataIn[2];
		2:		dataOut[1] = dataIn[3];
		3:		dataOut[1] = dataIn[4];
		4:		dataOut[1] = dataIn[5];
		5:		dataOut[1] = dataIn[6];
		6:		dataOut[1] = dataIn[7];
		7:		dataOut[1] = dataIn[8];
		8:		dataOut[1] = dataIn[9];
		9:		dataOut[1] = dataIn[10];
		10:		dataOut[1] = dataIn[11];
		11:		dataOut[1] = dataIn[12];
		12:		dataOut[1] = dataIn[13];
		13:		dataOut[1] = dataIn[14];
		14:		dataOut[1] = dataIn[15];
		15:		dataOut[1] = dataIn[16];
		16:		dataOut[1] = dataIn[17];
		17:		dataOut[1] = dataIn[18];
		18:		dataOut[1] = dataIn[19];
		19:		dataOut[1] = dataIn[20];
		20:		dataOut[1] = dataIn[21];
		21:		dataOut[1] = dataIn[22];
		22:		dataOut[1] = dataIn[23];
		23:		dataOut[1] = dataIn[24];
		24:		dataOut[1] = dataIn[25];
		25:		dataOut[1] = dataIn[26];
		26:		dataOut[1] = dataIn[27];
		27:		dataOut[1] = dataIn[28];
		28:		dataOut[1] = dataIn[29];
		29:		dataOut[1] = dataIn[30];
		30:		dataOut[1] = dataIn[31];
		31:		dataOut[1] = 0;
		default:dataOut[1] = 0;		
		endcase
	end
	/////////////////////////2////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[2] = dataIn[2];
		1:		dataOut[2] = dataIn[3];
		2:		dataOut[2] = dataIn[4];
		3:		dataOut[2] = dataIn[5];
		4:		dataOut[2] = dataIn[6];
		5:		dataOut[2] = dataIn[7];
		6:		dataOut[2] = dataIn[8];
		7:		dataOut[2] = dataIn[9];
		8:		dataOut[2] = dataIn[10];
		9:		dataOut[2] = dataIn[11];
		10:		dataOut[2] = dataIn[12];
		11:		dataOut[2] = dataIn[13];
		12:		dataOut[2] = dataIn[14];
		13:		dataOut[2] = dataIn[15];
		14:		dataOut[2] = dataIn[16];
		15:		dataOut[2] = dataIn[17];
		16:		dataOut[2] = dataIn[18];
		17:		dataOut[2] = dataIn[19];
		18:		dataOut[2] = dataIn[20];
		19:		dataOut[2] = dataIn[21];
		20:		dataOut[2] = dataIn[22];
		21:		dataOut[2] = dataIn[23];
		22:		dataOut[2] = dataIn[24];
		23:		dataOut[2] = dataIn[25];
		24:		dataOut[2] = dataIn[26];
		25:		dataOut[2] = dataIn[27];
		26:		dataOut[2] = dataIn[28];
		27:		dataOut[2] = dataIn[29];
		28:		dataOut[2] = dataIn[30];
		29:		dataOut[2] = dataIn[31];
		30:		dataOut[2] = 0;
		31:		dataOut[2] = 0;
		default:dataOut[2] = 0;
		endcase
	end
	/////////////////////////3////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[3] = dataIn[3];
		1:		dataOut[3] = dataIn[4];
		2:		dataOut[3] = dataIn[5];
		3:		dataOut[3] = dataIn[6];
		4:		dataOut[3] = dataIn[7];
		5:		dataOut[3] = dataIn[8];
		6:		dataOut[3] = dataIn[9];
		7:		dataOut[3] = dataIn[10];
		8:		dataOut[3] = dataIn[11];
		9:		dataOut[3] = dataIn[12];
		10:		dataOut[3] = dataIn[13];
		11:		dataOut[3] = dataIn[14];
		12:		dataOut[3] = dataIn[15];
		13:		dataOut[3] = dataIn[16];
		14:		dataOut[3] = dataIn[17];
		15:		dataOut[3] = dataIn[18];
		16:		dataOut[3] = dataIn[19];
		17:		dataOut[3] = dataIn[20];
		18:		dataOut[3] = dataIn[21];
		19:		dataOut[3] = dataIn[22];
		20:		dataOut[3] = dataIn[23];
		21:		dataOut[3] = dataIn[24];
		22:		dataOut[3] = dataIn[25];
		23:		dataOut[3] = dataIn[26];
		24:		dataOut[3] = dataIn[27];
		25:		dataOut[3] = dataIn[28];
		26:		dataOut[3] = dataIn[29];
		27:		dataOut[3] = dataIn[30];
		28:		dataOut[3] = dataIn[31];
		29:		dataOut[3] = 0;
		30:		dataOut[3] = 0;
		31:		dataOut[3] = 0;
		default:dataOut[3] = 0;
		endcase
	end
	////////////////////////4/////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[4] = dataIn[4];
		1:		dataOut[4] = dataIn[5];
		2:		dataOut[4] = dataIn[6];
		3:		dataOut[4] = dataIn[7];
		4:		dataOut[4] = dataIn[8];
		5:		dataOut[4] = dataIn[9];
		6:		dataOut[4] = dataIn[10];
		7:		dataOut[4] = dataIn[11];
		8:		dataOut[4] = dataIn[12];
		9:		dataOut[4] = dataIn[13];
		10:		dataOut[4] = dataIn[14];
		11:		dataOut[4] = dataIn[15];
		12:		dataOut[4] = dataIn[16];
		13:		dataOut[4] = dataIn[17];
		14:		dataOut[4] = dataIn[18];
		15:		dataOut[4] = dataIn[19];
		16:		dataOut[4] = dataIn[20];
		17:		dataOut[4] = dataIn[21];
		18:		dataOut[4] = dataIn[22];
		19:		dataOut[4] = dataIn[23];
		20:		dataOut[4] = dataIn[24];
		21:		dataOut[4] = dataIn[25];
		22:		dataOut[4] = dataIn[26];
		23:		dataOut[4] = dataIn[27];
		24:		dataOut[4] = dataIn[28];
		25:		dataOut[4] = dataIn[29];
		26:		dataOut[4] = dataIn[30];
		27:		dataOut[4] = dataIn[31];
		28:		dataOut[4] = 0;
		29:		dataOut[4] = 0;
		30:		dataOut[4] = 0;
		31:		dataOut[4] = 0;
		default:dataOut[4] = 0;
		endcase
	end
	/////////////////////////5////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[5] = dataIn[5];
		1:		dataOut[5] = dataIn[6];
		2:		dataOut[5] = dataIn[7];
		3:		dataOut[5] = dataIn[8];
		4:		dataOut[5] = dataIn[9];
		5:		dataOut[5] = dataIn[10];
		6:		dataOut[5] = dataIn[11];
		7:		dataOut[5] = dataIn[12];
		8:		dataOut[5] = dataIn[13];
		9:		dataOut[5] = dataIn[14];
		10:		dataOut[5] = dataIn[15];
		11:		dataOut[5] = dataIn[16];
		12:		dataOut[5] = dataIn[17];
		13:		dataOut[5] = dataIn[18];
		14:		dataOut[5] = dataIn[19];
		15:		dataOut[5] = dataIn[20];
		16:		dataOut[5] = dataIn[21];
		17:		dataOut[5] = dataIn[22];
		18:		dataOut[5] = dataIn[23];
		19:		dataOut[5] = dataIn[24];
		20:		dataOut[5] = dataIn[25];
		21:		dataOut[5] = dataIn[26];
		22:		dataOut[5] = dataIn[27];
		23:		dataOut[5] = dataIn[28];
		24:		dataOut[5] = dataIn[29];
		25:		dataOut[5] = dataIn[30];
		26:		dataOut[5] = dataIn[31];
		27:		dataOut[5] = 0;
		28:		dataOut[5] = 0;
		29:		dataOut[5] = 0;
		30:		dataOut[5] = 0;
		31:		dataOut[5] = 0;
		default:dataOut[5] = 0;
		endcase
	end
	/////////////////////////6////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[6] = dataIn[6];
		1:		dataOut[6] = dataIn[7];
		2:		dataOut[6] = dataIn[8];
		3:		dataOut[6] = dataIn[9];
		4:		dataOut[6] = dataIn[10];
		5:		dataOut[6] = dataIn[11];
		6:		dataOut[6] = dataIn[12];
		7:		dataOut[6] = dataIn[13];
		8:		dataOut[6] = dataIn[14];
		9:		dataOut[6] = dataIn[15];
		10:		dataOut[6] = dataIn[16];
		11:		dataOut[6] = dataIn[17];
		12:		dataOut[6] = dataIn[18];
		13:		dataOut[6] = dataIn[19];
		14:		dataOut[6] = dataIn[20];
		15:		dataOut[6] = dataIn[21];
		16:		dataOut[6] = dataIn[22];
		17:		dataOut[6] = dataIn[23];
		18:		dataOut[6] = dataIn[24];
		19:		dataOut[6] = dataIn[25];
		20:		dataOut[6] = dataIn[26];
		21:		dataOut[6] = dataIn[27];
		22:		dataOut[6] = dataIn[28];
		23:		dataOut[6] = dataIn[29];
		24:		dataOut[6] = dataIn[30];
		25:		dataOut[6] = dataIn[31];
		26:		dataOut[6] = 0;
		27:		dataOut[6] = 0;
		28:		dataOut[6] = 0;
		29:		dataOut[6] = 0;
		30:		dataOut[6] = 0;
		31:		dataOut[6] = 0;
		default:dataOut[6] = 0;
		endcase
	end
	/////////////////////////7////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[7] = dataIn[7];
		1:		dataOut[7] = dataIn[8];
		2:		dataOut[7] = dataIn[9];
		3:		dataOut[7] = dataIn[10];
		4:		dataOut[7] = dataIn[11];
		5:		dataOut[7] = dataIn[12];
		6:		dataOut[7] = dataIn[13];
		7:		dataOut[7] = dataIn[14];
		8:		dataOut[7] = dataIn[15];
		9:		dataOut[7] = dataIn[16];
		10:		dataOut[7] = dataIn[17];
		11:		dataOut[7] = dataIn[18];
		12:		dataOut[7] = dataIn[19];
		13:		dataOut[7] = dataIn[20];
		14:		dataOut[7] = dataIn[21];
		15:		dataOut[7] = dataIn[22];
		16:		dataOut[7] = dataIn[23];
		17:		dataOut[7] = dataIn[24];
		18:		dataOut[7] = dataIn[25];
		19:		dataOut[7] = dataIn[26];
		20:		dataOut[7] = dataIn[27];
		21:		dataOut[7] = dataIn[28];
		22:		dataOut[7] = dataIn[29];
		23:		dataOut[7] = dataIn[30];
		24:		dataOut[7] = dataIn[31];
		25:		dataOut[7] = 0;
		26:		dataOut[7] = 0;
		27:		dataOut[7] = 0;
		28:		dataOut[7] = 0;
		29:		dataOut[7] = 0;
		30:		dataOut[7] = 0;
		31:		dataOut[7] = 0;
		default:dataOut[7] = 0;
		endcase
	end
	////////////////////////8/////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[8] = dataIn[8];
		1:		dataOut[8] = dataIn[9];
		2:		dataOut[8] = dataIn[10];
		3:		dataOut[8] = dataIn[11];
		4:		dataOut[8] = dataIn[12];
		5:		dataOut[8] = dataIn[13];
		6:		dataOut[8] = dataIn[14];
		7:		dataOut[8] = dataIn[15];
		8:		dataOut[8] = dataIn[16];
		9:		dataOut[8] = dataIn[17];
		10:		dataOut[8] = dataIn[18];
		11:		dataOut[8] = dataIn[19];
		12:		dataOut[8] = dataIn[20];
		13:		dataOut[8] = dataIn[21];
		14:		dataOut[8] = dataIn[22];
		15:		dataOut[8] = dataIn[23];
		16:		dataOut[8] = dataIn[24];
		17:		dataOut[8] = dataIn[25];
		18:		dataOut[8] = dataIn[26];
		19:		dataOut[8] = dataIn[27];
		20:		dataOut[8] = dataIn[28];
		21:		dataOut[8] = dataIn[29];
		22:		dataOut[8] = dataIn[30];
		23:		dataOut[8] = dataIn[31];
		24:		dataOut[8] = 0;
		25:		dataOut[8] = 0;
		26:		dataOut[8] = 0;
		27:		dataOut[8] = 0;
		28:		dataOut[8] = 0;
		29:		dataOut[8] = 0;
		30:		dataOut[8] = 0;
		31:		dataOut[8] = 0;
		default:dataOut[8] = 0;
		endcase
	end
	/////////////////////////9////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[9] = dataIn[9];
		1:		dataOut[9] = dataIn[10];
		2:		dataOut[9] = dataIn[11];
		3:		dataOut[9] = dataIn[12];
		4:		dataOut[9] = dataIn[13];
		5:		dataOut[9] = dataIn[14];
		6:		dataOut[9] = dataIn[15];
		7:		dataOut[9] = dataIn[16];
		8:		dataOut[9] = dataIn[17];
		9:		dataOut[9] = dataIn[18];
		10:		dataOut[9] = dataIn[19];
		11:		dataOut[9] = dataIn[20];
		12:		dataOut[9] = dataIn[21];
		13:		dataOut[9] = dataIn[22];
		14:		dataOut[9] = dataIn[23];
		15:		dataOut[9] = dataIn[24];
		16:		dataOut[9] = dataIn[25];
		17:		dataOut[9] = dataIn[26];
		18:		dataOut[9] = dataIn[27];
		19:		dataOut[9] = dataIn[28];
		20:		dataOut[9] = dataIn[29];
		21:		dataOut[9] = dataIn[30];
		22:		dataOut[9] = dataIn[31];
		23:		dataOut[9] = 0;
		24:		dataOut[9] = 0;
		25:		dataOut[9] = 0;
		26:		dataOut[9] = 0;
		27:		dataOut[9] = 0;
		28:		dataOut[9] = 0;
		29:		dataOut[9] = 0;
		30:		dataOut[9] = 0;
		31:		dataOut[9] = 0;
		default:dataOut[9] = 0;
		endcase
	end
	/////////////////////////10////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[10] = dataIn[10];
		1:		dataOut[10] = dataIn[11];
		2:		dataOut[10] = dataIn[12];
		3:		dataOut[10] = dataIn[13];
		4:		dataOut[10] = dataIn[14];
		5:		dataOut[10] = dataIn[15];
		6:		dataOut[10] = dataIn[16];
		7:		dataOut[10] = dataIn[17];
		8:		dataOut[10] = dataIn[18];
		9:		dataOut[10] = dataIn[19];
		10:		dataOut[10] = dataIn[20];
		11:		dataOut[10] = dataIn[21];
		12:		dataOut[10] = dataIn[22];
		13:		dataOut[10] = dataIn[23];
		14:		dataOut[10] = dataIn[24];
		15:		dataOut[10] = dataIn[25];
		16:		dataOut[10] = dataIn[26];
		17:		dataOut[10] = dataIn[27];
		18:		dataOut[10] = dataIn[28];
		19:		dataOut[10] = dataIn[29];
		20:		dataOut[10] = dataIn[30];
		21:		dataOut[10] = dataIn[31];
		22:		dataOut[10] = 0;
		23:		dataOut[10] = 0;
		24:		dataOut[10] = 0;
		25:		dataOut[10] = 0;
		26:		dataOut[10] = 0;
		27:		dataOut[10] = 0;
		28:		dataOut[10] = 0;
		29:		dataOut[10] = 0;
		30:		dataOut[10] = 0;
		31:		dataOut[10] = 0;
		default:dataOut[10] = 0;
		endcase
	end
	/////////////////////////11////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[11] = dataIn[11];
		1:		dataOut[11] = dataIn[12];
		2:		dataOut[11] = dataIn[13];
		3:		dataOut[11] = dataIn[14];
		4:		dataOut[11] = dataIn[15];
		5:		dataOut[11] = dataIn[16];
		6:		dataOut[11] = dataIn[17];
		7:		dataOut[11] = dataIn[18];
		8:		dataOut[11] = dataIn[19];
		9:		dataOut[11] = dataIn[20];
		10:		dataOut[11] = dataIn[21];
		11:		dataOut[11] = dataIn[22];
		12:		dataOut[11] = dataIn[23];
		13:		dataOut[11] = dataIn[24];
		14:		dataOut[11] = dataIn[25];
		15:		dataOut[11] = dataIn[26];
		16:		dataOut[11] = dataIn[27];
		17:		dataOut[11] = dataIn[28];
		18:		dataOut[11] = dataIn[29];
		19:		dataOut[11] = dataIn[30];
		20:		dataOut[11] = dataIn[31];
		21:		dataOut[11] = 0;
		22:		dataOut[11] = 0;
		23:		dataOut[11] = 0;
		24:		dataOut[11] = 0;
		25:		dataOut[11] = 0;
		26:		dataOut[11] = 0;
		27:		dataOut[11] = 0;
		28:		dataOut[11] = 0;
		29:		dataOut[11] = 0;
		30:		dataOut[11] = 0;
		31:		dataOut[11] = 0;
		default:dataOut[11] = 0;
		endcase
	end
	////////////////////////12/////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[12] = dataIn[12];
		1:		dataOut[12] = dataIn[13];
		2:		dataOut[12] = dataIn[14];
		3:		dataOut[12] = dataIn[15];
		4:		dataOut[12] = dataIn[16];
		5:		dataOut[12] = dataIn[17];
		6:		dataOut[12] = dataIn[18];
		7:		dataOut[12] = dataIn[19];
		8:		dataOut[12] = dataIn[20];
		9:		dataOut[12] = dataIn[21];
		10:		dataOut[12] = dataIn[22];
		11:		dataOut[12] = dataIn[23];
		12:		dataOut[12] = dataIn[24];
		13:		dataOut[12] = dataIn[25];
		14:		dataOut[12] = dataIn[26];
		15:		dataOut[12] = dataIn[27];
		16:		dataOut[12] = dataIn[28];
		17:		dataOut[12] = dataIn[29];
		18:		dataOut[12] = dataIn[30];
		19:		dataOut[12] = dataIn[31];
		20:		dataOut[12] = 0;
		21:		dataOut[12] = 0;
		22:		dataOut[12] = 0;
		23:		dataOut[12] = 0;
		24:		dataOut[12] = 0;
		25:		dataOut[12] = 0;
		26:		dataOut[12] = 0;
		27:		dataOut[12] = 0;
		28:		dataOut[12] = 0;
		29:		dataOut[12] = 0;
		30:		dataOut[12] = 0;
		31:		dataOut[12] = 0;
		default:dataOut[12] = 0;
		endcase
	end
	////////////////////////13/////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[13] = dataIn[13];
		1:		dataOut[13] = dataIn[14];
		2:		dataOut[13] = dataIn[15];
		3:		dataOut[13] = dataIn[16];
		4:		dataOut[13] = dataIn[17];
		5:		dataOut[13] = dataIn[18];
		6:		dataOut[13] = dataIn[19];
		7:		dataOut[13] = dataIn[20];
		8:		dataOut[13] = dataIn[21];
		9:		dataOut[13] = dataIn[22];
		10:		dataOut[13] = dataIn[23];
		11:		dataOut[13] = dataIn[24];
		12:		dataOut[13] = dataIn[25];
		13:		dataOut[13] = dataIn[26];
		14:		dataOut[13] = dataIn[27];
		15:		dataOut[13] = dataIn[28];
		16:		dataOut[13] = dataIn[29];
		17:		dataOut[13] = dataIn[30];
		18:		dataOut[13] = dataIn[31];
		19:		dataOut[13] = 0;
		20:		dataOut[13] = 0;
		21:		dataOut[13] = 0;
		22:		dataOut[13] = 0;
		23:		dataOut[13] = 0;
		24:		dataOut[13] = 0;
		25:		dataOut[13] = 0;
		26:		dataOut[13] = 0;
		27:		dataOut[13] = 0;
		28:		dataOut[13] = 0;
		29:		dataOut[13] = 0;
		30:		dataOut[13] = 0;
		31:		dataOut[13] = 0;
		default:dataOut[13] = 0;
		endcase
	end
	////////////////////////14/////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[14] = dataIn[14];
		1:		dataOut[14] = dataIn[15];
		2:		dataOut[14] = dataIn[16];
		3:		dataOut[14] = dataIn[17];
		4:		dataOut[14] = dataIn[18];
		5:		dataOut[14] = dataIn[19];
		6:		dataOut[14] = dataIn[20];
		7:		dataOut[14] = dataIn[21];
		8:		dataOut[14] = dataIn[22];
		9:		dataOut[14] = dataIn[23];
		10:		dataOut[14] = dataIn[24];
		11:		dataOut[14] = dataIn[25];
		12:		dataOut[14] = dataIn[26];
		13:		dataOut[14] = dataIn[27];
		14:		dataOut[14] = dataIn[28];
		15:		dataOut[14] = dataIn[29];
		16:		dataOut[14] = dataIn[30];
		17:		dataOut[14] = dataIn[31];
		18:		dataOut[14] = 0;
		19:		dataOut[14] = 0;
		20:		dataOut[14] = 0;
		21:		dataOut[14] = 0;
		22:		dataOut[14] = 0;
		23:		dataOut[14] = 0;
		24:		dataOut[14] = 0;
		25:		dataOut[14] = 0;
		26:		dataOut[14] = 0;
		27:		dataOut[14] = 0;
		28:		dataOut[14] = 0;
		29:		dataOut[14] = 0;
		30:		dataOut[14] = 0;
		31:		dataOut[14] = 0;
		default:dataOut[14] = 0;
		endcase
	end
	////////////////////////15/////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[15] = dataIn[15];
		1:		dataOut[15] = dataIn[16];
		2:		dataOut[15] = dataIn[17];
		3:		dataOut[15] = dataIn[18];
		4:		dataOut[15] = dataIn[19];
		5:		dataOut[15] = dataIn[20];
		6:		dataOut[15] = dataIn[21];
		7:		dataOut[15] = dataIn[22];
		8:		dataOut[15] = dataIn[23];
		9:		dataOut[15] = dataIn[24];
		10:		dataOut[15] = dataIn[25];
		11:		dataOut[15] = dataIn[26];
		12:		dataOut[15] = dataIn[27];
		13:		dataOut[15] = dataIn[28];
		14:		dataOut[15] = dataIn[29];
		15:		dataOut[15] = dataIn[30];
		16:		dataOut[15] = dataIn[31];
		17:		dataOut[15] = 0;
		18:		dataOut[15] = 0;
		19:		dataOut[15] = 0;
		20:		dataOut[15] = 0;
		21:		dataOut[15] = 0;
		22:		dataOut[15] = 0;
		23:		dataOut[15] = 0;
		24:		dataOut[15] = 0;
		25:		dataOut[15] = 0;
		26:		dataOut[15] = 0;
		27:		dataOut[15] = 0;
		28:		dataOut[15] = 0;
		29:		dataOut[15] = 0;
		30:		dataOut[15] = 0;
		31:		dataOut[15] = 0;
		default:dataOut[15] = 0;
		endcase
	end
	////////////////////////16/////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[16] = dataIn[16];
		1:		dataOut[16] = dataIn[17];
		2:		dataOut[16] = dataIn[18];
		3:		dataOut[16] = dataIn[19];
		4:		dataOut[16] = dataIn[20];
		5:		dataOut[16] = dataIn[21];
		6:		dataOut[16] = dataIn[22];
		7:		dataOut[16] = dataIn[23];
		8:		dataOut[16] = dataIn[24];
		9:		dataOut[16] = dataIn[25];
		10:		dataOut[16] = dataIn[26];
		11:		dataOut[16] = dataIn[27];
		12:		dataOut[16] = dataIn[28];
		13:		dataOut[16] = dataIn[29];
		14:		dataOut[16] = dataIn[30];
		15:		dataOut[16] = dataIn[31];
		16:		dataOut[16] = 0;
		17:		dataOut[16] = 0;
		18:		dataOut[16] = 0;
		19:		dataOut[16] = 0;
		20:		dataOut[16] = 0;
		21:		dataOut[16] = 0;
		22:		dataOut[16] = 0;
		23:		dataOut[16] = 0;
		24:		dataOut[16] = 0;
		25:		dataOut[16] = 0;
		26:		dataOut[16] = 0;
		27:		dataOut[16] = 0;
		28:		dataOut[16] = 0;
		29:		dataOut[16] = 0;
		30:		dataOut[16] = 0;
		31:		dataOut[16] = 0;
		default:dataOut[16] = 0;
		endcase
	end
	////////////////////////17/////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[17] = dataIn[17];
		1:		dataOut[17] = dataIn[18];
		2:		dataOut[17] = dataIn[19];
		3:		dataOut[17] = dataIn[20];
		4:		dataOut[17] = dataIn[21];
		5:		dataOut[17] = dataIn[22];
		6:		dataOut[17] = dataIn[23];
		7:		dataOut[17] = dataIn[24];
		8:		dataOut[17] = dataIn[25];
		9:		dataOut[17] = dataIn[26];
		10:		dataOut[17] = dataIn[27];
		11:		dataOut[17] = dataIn[28];
		12:		dataOut[17] = dataIn[29];
		13:		dataOut[17] = dataIn[30];
		14:		dataOut[17] = dataIn[31];
		15:		dataOut[17] = 0;
		16:		dataOut[17] = 0;
		17:		dataOut[17] = 0;
		18:		dataOut[17] = 0;
		19:		dataOut[17] = 0;
		20:		dataOut[17] = 0;
		21:		dataOut[17] = 0;
		22:		dataOut[17] = 0;
		23:		dataOut[17] = 0;
		24:		dataOut[17] = 0;
		25:		dataOut[17] = 0;
		26:		dataOut[17] = 0;
		27:		dataOut[17] = 0;
		28:		dataOut[17] = 0;
		29:		dataOut[17] = 0;
		30:		dataOut[17] = 0;
		31:		dataOut[17] = 0;
		default:dataOut[17] = 0;
		endcase
	end
	////////////////////////18/////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[18] = dataIn[18];
		1:		dataOut[18] = dataIn[19];
		2:		dataOut[18] = dataIn[20];
		3:		dataOut[18] = dataIn[21];
		4:		dataOut[18] = dataIn[22];
		5:		dataOut[18] = dataIn[23];
		6:		dataOut[18] = dataIn[24];
		7:		dataOut[18] = dataIn[25];
		8:		dataOut[18] = dataIn[26];
		9:		dataOut[18] = dataIn[27];
		10:		dataOut[18] = dataIn[28];
		11:		dataOut[18] = dataIn[29];
		12:		dataOut[18] = dataIn[30];
		13:		dataOut[18] = dataIn[31];
		14:		dataOut[18] = 0;
		15:		dataOut[18] = 0;
		16:		dataOut[18] = 0;
		17:		dataOut[18] = 0;
		18:		dataOut[18] = 0;
		19:		dataOut[18] = 0;
		20:		dataOut[18] = 0;
		21:		dataOut[18] = 0;
		22:		dataOut[18] = 0;
		23:		dataOut[18] = 0;
		24:		dataOut[18] = 0;
		25:		dataOut[18] = 0;
		26:		dataOut[18] = 0;
		27:		dataOut[18] = 0;
		28:		dataOut[18] = 0;
		29:		dataOut[18] = 0;
		30:		dataOut[18] = 0;
		31:		dataOut[18] = 0;
		default:dataOut[18] = 0;
		endcase
	end
	////////////////////////19/////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[19] = dataIn[19];
		1:		dataOut[19] = dataIn[20];
		2:		dataOut[19] = dataIn[21];
		3:		dataOut[19] = dataIn[22];
		4:		dataOut[19] = dataIn[23];
		5:		dataOut[19] = dataIn[24];
		6:		dataOut[19] = dataIn[25];
		7:		dataOut[19] = dataIn[26];
		8:		dataOut[19] = dataIn[27];
		9:		dataOut[19] = dataIn[28];
		10:		dataOut[19] = dataIn[29];
		11:		dataOut[19] = dataIn[30];
		12:		dataOut[19] = dataIn[31];
		13:		dataOut[19] = 0;
		14:		dataOut[19] = 0;
		15:		dataOut[19] = 0;
		16:		dataOut[19] = 0;
		17:		dataOut[19] = 0;
		18:		dataOut[19] = 0;
		19:		dataOut[19] = 0;
		20:		dataOut[19] = 0;
		21:		dataOut[19] = 0;
		22:		dataOut[19] = 0;
		23:		dataOut[19] = 0;
		24:		dataOut[19] = 0;
		25:		dataOut[19] = 0;
		26:		dataOut[19] = 0;
		27:		dataOut[19] = 0;
		28:		dataOut[19] = 0;
		29:		dataOut[19] = 0;
		30:		dataOut[19] = 0;
		31:		dataOut[19] = 0;
		default:dataOut[19] = 0;
		endcase
	end
	////////////////////////20/////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[20] = dataIn[20];
		1:		dataOut[20] = dataIn[21];
		2:		dataOut[20] = dataIn[22];
		3:		dataOut[20] = dataIn[23];
		4:		dataOut[20] = dataIn[24];
		5:		dataOut[20] = dataIn[25];
		6:		dataOut[20] = dataIn[26];
		7:		dataOut[20] = dataIn[27];
		8:		dataOut[20] = dataIn[28];
		9:		dataOut[20] = dataIn[29];
		10:		dataOut[20] = dataIn[30];
		11:		dataOut[20] = dataIn[31];
		12:		dataOut[20] = 0;
		13:		dataOut[20] = 0;
		14:		dataOut[20] = 0;
		15:		dataOut[20] = 0;
		16:		dataOut[20] = 0;
		17:		dataOut[20] = 0;
		18:		dataOut[20] = 0;
		19:		dataOut[20] = 0;
		20:		dataOut[20] = 0;
		21:		dataOut[20] = 0;
		22:		dataOut[20] = 0;
		23:		dataOut[20] = 0;
		24:		dataOut[20] = 0;
		25:		dataOut[20] = 0;
		26:		dataOut[20] = 0;
		27:		dataOut[20] = 0;
		28:		dataOut[20] = 0;
		29:		dataOut[20] = 0;
		30:		dataOut[20] = 0;
		31:		dataOut[20] = 0;
		default:dataOut[20] = 0;
		endcase
	end
	////////////////////////21/////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[21] = dataIn[21];
		1:		dataOut[21] = dataIn[22];
		2:		dataOut[21] = dataIn[23];
		3:		dataOut[21] = dataIn[24];
		4:		dataOut[21] = dataIn[25];
		5:		dataOut[21] = dataIn[26];
		6:		dataOut[21] = dataIn[27];
		7:		dataOut[21] = dataIn[28];
		8:		dataOut[21] = dataIn[29];
		9:		dataOut[21] = dataIn[30];
		10:		dataOut[21] = dataIn[31];
		11:		dataOut[21] = 0;
		12:		dataOut[21] = 0;
		13:		dataOut[21] = 0;
		14:		dataOut[21] = 0;
		15:		dataOut[21] = 0;
		16:		dataOut[21] = 0;
		17:		dataOut[21] = 0;
		18:		dataOut[21] = 0;
		19:		dataOut[21] = 0;
		20:		dataOut[21] = 0;
		21:		dataOut[21] = 0;
		22:		dataOut[21] = 0;
		23:		dataOut[21] = 0;
		24:		dataOut[21] = 0;
		25:		dataOut[21] = 0;
		26:		dataOut[21] = 0;
		27:		dataOut[21] = 0;
		28:		dataOut[21] = 0;
		29:		dataOut[21] = 0;
		30:		dataOut[21] = 0;
		31:		dataOut[21] = 0;
		default:dataOut[21] = 0;
		endcase
	end
	////////////////////////22/////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[22] = dataIn[22];
		1:		dataOut[22] = dataIn[23];
		2:		dataOut[22] = dataIn[24];
		3:		dataOut[22] = dataIn[25];
		4:		dataOut[22] = dataIn[26];
		5:		dataOut[22] = dataIn[27];
		6:		dataOut[22] = dataIn[28];
		7:		dataOut[22] = dataIn[29];
		8:		dataOut[22] = dataIn[30];
		9:		dataOut[22] = dataIn[31];
		10:		dataOut[22] = 0;
		11:		dataOut[22] = 0;
		12:		dataOut[22] = 0;
		13:		dataOut[22] = 0;
		14:		dataOut[22] = 0;
		15:		dataOut[22] = 0;
		16:		dataOut[22] = 0;
		17:		dataOut[22] = 0;
		18:		dataOut[22] = 0;
		19:		dataOut[22] = 0;
		20:		dataOut[22] = 0;
		21:		dataOut[22] = 0;
		22:		dataOut[22] = 0;
		23:		dataOut[22] = 0;
		24:		dataOut[22] = 0;
		25:		dataOut[22] = 0;
		26:		dataOut[22] = 0;
		27:		dataOut[22] = 0;
		28:		dataOut[22] = 0;
		29:		dataOut[22] = 0;
		30:		dataOut[22] = 0;
		31:		dataOut[22] = 0;
		default:dataOut[22] = 0;
		endcase
	end
	////////////////////////23/////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[23] = dataIn[23];
		1:		dataOut[23] = dataIn[24];
		2:		dataOut[23] = dataIn[25];
		3:		dataOut[23] = dataIn[26];
		4:		dataOut[23] = dataIn[27];
		5:		dataOut[23] = dataIn[28];
		6:		dataOut[23] = dataIn[29];
		7:		dataOut[23] = dataIn[30];
		8:		dataOut[23] = dataIn[31];
		9:		dataOut[23] = 0;
		10:		dataOut[23] = 0;
		11:		dataOut[23] = 0;
		12:		dataOut[23] = 0;
		13:		dataOut[23] = 0;
		14:		dataOut[23] = 0;
		15:		dataOut[23] = 0;
		16:		dataOut[23] = 0;
		17:		dataOut[23] = 0;
		18:		dataOut[23] = 0;
		19:		dataOut[23] = 0;
		20:		dataOut[23] = 0;
		21:		dataOut[23] = 0;
		22:		dataOut[23] = 0;
		23:		dataOut[23] = 0;
		24:		dataOut[23] = 0;
		25:		dataOut[23] = 0;
		26:		dataOut[23] = 0;
		27:		dataOut[23] = 0;
		28:		dataOut[23] = 0;
		29:		dataOut[23] = 0;
		30:		dataOut[23] = 0;
		31:		dataOut[23] = 0;
		default:dataOut[23] = 0;
		endcase
	end
	////////////////////////24/////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[24] = dataIn[24];
		1:		dataOut[24] = dataIn[25];
		2:		dataOut[24] = dataIn[26];
		3:		dataOut[24] = dataIn[27];
		4:		dataOut[24] = dataIn[28];
		5:		dataOut[24] = dataIn[29];
		6:		dataOut[24] = dataIn[30];
		7:		dataOut[24] = dataIn[31];
		8:		dataOut[24] = 0;
		9:		dataOut[24] = 0;
		10:		dataOut[24] = 0;
		11:		dataOut[24] = 0;
		12:		dataOut[24] = 0;
		13:		dataOut[24] = 0;
		14:		dataOut[24] = 0;
		15:		dataOut[24] = 0;
		16:		dataOut[24] = 0;
		17:		dataOut[24] = 0;
		18:		dataOut[24] = 0;
		19:		dataOut[24] = 0;
		20:		dataOut[24] = 0;
		21:		dataOut[24] = 0;
		22:		dataOut[24] = 0;
		23:		dataOut[24] = 0;
		24:		dataOut[24] = 0;
		25:		dataOut[24] = 0;
		26:		dataOut[24] = 0;
		27:		dataOut[24] = 0;
		28:		dataOut[24] = 0;
		29:		dataOut[24] = 0;
		30:		dataOut[24] = 0;
		31:		dataOut[24] = 0;
		default:dataOut[24] = 0;
		endcase
	end
	////////////////////////25/////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[25] = dataIn[25];
		1:		dataOut[25] = dataIn[26];
		2:		dataOut[25] = dataIn[27];
		3:		dataOut[25] = dataIn[28];
		4:		dataOut[25] = dataIn[29];
		5:		dataOut[25] = dataIn[30];
		6:		dataOut[25] = dataIn[31];
		7:		dataOut[25] = 0;
		8:		dataOut[25] = 0;
		9:		dataOut[25] = 0;
		10:		dataOut[25] = 0;
		11:		dataOut[25] = 0;
		12:		dataOut[25] = 0;
		13:		dataOut[25] = 0;
		14:		dataOut[25] = 0;
		15:		dataOut[25] = 0;
		16:		dataOut[25] = 0;
		17:		dataOut[25] = 0;
		18:		dataOut[25] = 0;
		19:		dataOut[25] = 0;
		20:		dataOut[25] = 0;
		21:		dataOut[25] = 0;
		22:		dataOut[25] = 0;
		23:		dataOut[25] = 0;
		24:		dataOut[25] = 0;
		25:		dataOut[25] = 0;
		26:		dataOut[25] = 0;
		27:		dataOut[25] = 0;
		28:		dataOut[25] = 0;
		29:		dataOut[25] = 0;
		30:		dataOut[25] = 0;
		31:		dataOut[25] = 0;
		default:dataOut[25] = 0;
		endcase
	end
	/////////////////////////26////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[26] = dataIn[26];
		1:		dataOut[26] = dataIn[27];
		2:		dataOut[26] = dataIn[28];
		3:		dataOut[26] = dataIn[29];
		4:		dataOut[26] = dataIn[30];
		5:		dataOut[26] = dataIn[31];
		6:		dataOut[26] = 0;
		7:		dataOut[26] = 0;
		8:		dataOut[26] = 0;
		9:		dataOut[26] = 0;
		10:		dataOut[26] = 0;
		11:		dataOut[26] = 0;
		12:		dataOut[26] = 0;
		13:		dataOut[26] = 0;
		14:		dataOut[26] = 0;
		15:		dataOut[26] = 0;
		16:		dataOut[26] = 0;
		17:		dataOut[26] = 0;
		18:		dataOut[26] = 0;
		19:		dataOut[26] = 0;
		20:		dataOut[26] = 0;
		21:		dataOut[26] = 0;
		22:		dataOut[26] = 0;
		23:		dataOut[26] = 0;
		24:		dataOut[26] = 0;
		25:		dataOut[26] = 0;
		26:		dataOut[26] = 0;
		27:		dataOut[26] = 0;
		28:		dataOut[26] = 0;
		29:		dataOut[26] = 0;
		30:		dataOut[26] = 0;
		31:		dataOut[26] = 0;
		default:dataOut[26] = 0;
		endcase
	end
	////////////////////////27/////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[27] = dataIn[27];
		1:		dataOut[27] = dataIn[28];
		2:		dataOut[27] = dataIn[29];
		3:		dataOut[27] = dataIn[30];
		4:		dataOut[27] = dataIn[31];
		5:		dataOut[27] = 0;
		6:		dataOut[27] = 0;
		7:		dataOut[27] = 0;
		8:		dataOut[27] = 0;
		9:		dataOut[27] = 0;
		10:		dataOut[27] = 0;
		11:		dataOut[27] = 0;
		12:		dataOut[27] = 0;
		13:		dataOut[27] = 0;
		14:		dataOut[27] = 0;
		15:		dataOut[27] = 0;
		16:		dataOut[27] = 0;
		17:		dataOut[27] = 0;
		18:		dataOut[27] = 0;
		19:		dataOut[27] = 0;
		20:		dataOut[27] = 0;
		21:		dataOut[27] = 0;
		22:		dataOut[27] = 0;
		23:		dataOut[27] = 0;
		24:		dataOut[27] = 0;
		25:		dataOut[27] = 0;
		26:		dataOut[27] = 0;
		27:		dataOut[27] = 0;
		28:		dataOut[27] = 0;
		29:		dataOut[27] = 0;
		30:		dataOut[27] = 0;
		31:		dataOut[27] = 0;
		default:dataOut[27] = 0;
		endcase
	end
	////////////////////////28/////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[28] = dataIn[28];
		1:		dataOut[28] = dataIn[29];
		2:		dataOut[28] = dataIn[30];
		3:		dataOut[28] = dataIn[31];
		4:		dataOut[28] = 0;
		5:		dataOut[28] = 0;
		6:		dataOut[28] = 0;
		7:		dataOut[28] = 0;
		8:		dataOut[28] = 0;
		9:		dataOut[28] = 0;
		10:		dataOut[28] = 0;
		11:		dataOut[28] = 0;
		12:		dataOut[28] = 0;
		13:		dataOut[28] = 0;
		14:		dataOut[28] = 0;
		15:		dataOut[28] = 0;
		16:		dataOut[28] = 0;
		17:		dataOut[28] = 0;
		18:		dataOut[28] = 0;
		19:		dataOut[28] = 0;
		20:		dataOut[28] = 0;
		21:		dataOut[28] = 0;
		22:		dataOut[28] = 0;
		23:		dataOut[28] = 0;
		24:		dataOut[28] = 0;
		25:		dataOut[28] = 0;
		26:		dataOut[28] = 0;
		27:		dataOut[28] = 0;
		28:		dataOut[28] = 0;
		29:		dataOut[28] = 0;
		30:		dataOut[28] = 0;
		31:		dataOut[28] = 0;
		default:dataOut[28] = 0;
		endcase
	end
	///////////////////////29//////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[29] = dataIn[29];
		1:		dataOut[29] = dataIn[30];
		2:		dataOut[29] = dataIn[31];
		3:		dataOut[29] = 0;
		4:		dataOut[29] = 0;
		5:		dataOut[29] = 0;
		6:		dataOut[29] = 0;
		7:		dataOut[29] = 0;
		8:		dataOut[29] = 0;
		9:		dataOut[29] = 0;
		10:		dataOut[29] = 0;
		11:		dataOut[29] = 0;
		12:		dataOut[29] = 0;
		13:		dataOut[29] = 0;
		14:		dataOut[29] = 0;
		15:		dataOut[29] = 0;
		16:		dataOut[29] = 0;
		17:		dataOut[29] = 0;
		18:		dataOut[29] = 0;
		19:		dataOut[29] = 0;
		20:		dataOut[29] = 0;
		21:		dataOut[29] = 0;
		22:		dataOut[29] = 0;
		23:		dataOut[29] = 0;
		24:		dataOut[29] = 0;
		25:		dataOut[29] = 0;
		26:		dataOut[29] = 0;
		27:		dataOut[29] = 0;
		28:		dataOut[29] = 0;
		29:		dataOut[29] = 0;
		30:		dataOut[29] = 0;
		31:		dataOut[29] = 0;
		default:dataOut[29] = 0;
		endcase
	end
	////////////////////////30/////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[30] = dataIn[30];
		1:		dataOut[30] = dataIn[31];
		2:		dataOut[30] = 0;
		3:		dataOut[30] = 0;
		4:		dataOut[30] = 0;
		5:		dataOut[30] = 0;
		6:		dataOut[30] = 0;
		7:		dataOut[30] = 0;
		8:		dataOut[30] = 0;
		9:		dataOut[30] = 0;
		10:		dataOut[30] = 0;
		11:		dataOut[30] = 0;
		12:		dataOut[30] = 0;
		13:		dataOut[30] = 0;
		14:		dataOut[30] = 0;
		15:		dataOut[30] = 0;
		16:		dataOut[30] = 0;
		17:		dataOut[30] = 0;
		18:		dataOut[30] = 0;
		19:		dataOut[30] = 0;
		20:		dataOut[30] = 0;
		21:		dataOut[30] = 0;
		22:		dataOut[30] = 0;
		23:		dataOut[30] = 0;
		24:		dataOut[30] = 0;
		25:		dataOut[30] = 0;
		26:		dataOut[30] = 0;
		27:		dataOut[30] = 0;
		28:		dataOut[30] = 0;
		29:		dataOut[30] = 0;
		30:		dataOut[30] = 0;
		31:		dataOut[30] = 0;
		default:dataOut[30] = 0;
		endcase
	end
	///////////////////////31//////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[31] = dataIn[31];
		1:		dataOut[31] = 0;
		2:		dataOut[31] = 0;
		3:		dataOut[31] = 0;
		4:		dataOut[31] = 0;
		5:		dataOut[31] = 0;
		6:		dataOut[31] = 0;
		7:		dataOut[31] = 0;
		8:		dataOut[31] = 0;
		9:		dataOut[31] = 0;
		10:		dataOut[31] = 0;
		11:		dataOut[31] = 0;
		12:		dataOut[31] = 0;
		13:		dataOut[31] = 0;
		14:		dataOut[31] = 0;
		15:		dataOut[31] = 0;
		16:		dataOut[31] = 0;
		17:		dataOut[31] = 0;
		18:		dataOut[31] = 0;
		19:		dataOut[31] = 0;
		20:		dataOut[31] = 0;
		21:		dataOut[31] = 0;
		22:		dataOut[31] = 0;
		23:		dataOut[31] = 0;
		24:		dataOut[31] = 0;
		25:		dataOut[31] = 0;
		26:		dataOut[31] = 0;
		27:		dataOut[31] = 0;
		28:		dataOut[31] = 0;
		29:		dataOut[31] = 0;
		30:		dataOut[31] = 0;
		31:		dataOut[31] = 0;
		default:dataOut[31] = 0;
		endcase
	end

	
endmodule


module ArifmeticShifter #(parameter N = 32)
					(input logic [N-1:0]dataIn,
					input logic [4:0]n,
					output logic [N-1:0]dataOut
					);
	
	/////////////////////////0////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[0] = dataIn[0];
		1:		dataOut[0] = dataIn[1];
		2:		dataOut[0] = dataIn[2];
		3:		dataOut[0] = dataIn[3];
		4:		dataOut[0] = dataIn[4];
		5:		dataOut[0] = dataIn[5];
		6:		dataOut[0] = dataIn[6];
		7:		dataOut[0] = dataIn[7];
		8:		dataOut[0] = dataIn[8];
		9:		dataOut[0] = dataIn[9];
		10:		dataOut[0] = dataIn[10];
		11:		dataOut[0] = dataIn[11];
		12:		dataOut[0] = dataIn[12];
		13:		dataOut[0] = dataIn[13];
		14:		dataOut[0] = dataIn[14];
		15:		dataOut[0] = dataIn[15];
		16:		dataOut[0] = dataIn[16];
		17:		dataOut[0] = dataIn[17];
		18:		dataOut[0] = dataIn[18];
		19:		dataOut[0] = dataIn[19];
		20:		dataOut[0] = dataIn[20];
		21:		dataOut[0] = dataIn[21];
		22:		dataOut[0] = dataIn[22];
		23:		dataOut[0] = dataIn[23];
		24:		dataOut[0] = dataIn[24];
		25:		dataOut[0] = dataIn[25];
		26:		dataOut[0] = dataIn[26];
		27:		dataOut[0] = dataIn[27];
		28:		dataOut[0] = dataIn[28];
		29:		dataOut[0] = dataIn[29];
		30:		dataOut[0] = dataIn[30];
		31:		dataOut[0] = dataIn[31];
		default:dataOut[0] = 0;
		endcase
	end
	/////////////////////////1////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[1] = dataIn[1];
		1:		dataOut[1] = dataIn[2];
		2:		dataOut[1] = dataIn[3];
		3:		dataOut[1] = dataIn[4];
		4:		dataOut[1] = dataIn[5];
		5:		dataOut[1] = dataIn[6];
		6:		dataOut[1] = dataIn[7];
		7:		dataOut[1] = dataIn[8];
		8:		dataOut[1] = dataIn[9];
		9:		dataOut[1] = dataIn[10];
		10:		dataOut[1] = dataIn[11];
		11:		dataOut[1] = dataIn[12];
		12:		dataOut[1] = dataIn[13];
		13:		dataOut[1] = dataIn[14];
		14:		dataOut[1] = dataIn[15];
		15:		dataOut[1] = dataIn[16];
		16:		dataOut[1] = dataIn[17];
		17:		dataOut[1] = dataIn[18];
		18:		dataOut[1] = dataIn[19];
		19:		dataOut[1] = dataIn[20];
		20:		dataOut[1] = dataIn[21];
		21:		dataOut[1] = dataIn[22];
		22:		dataOut[1] = dataIn[23];
		23:		dataOut[1] = dataIn[24];
		24:		dataOut[1] = dataIn[25];
		25:		dataOut[1] = dataIn[26];
		26:		dataOut[1] = dataIn[27];
		27:		dataOut[1] = dataIn[28];
		28:		dataOut[1] = dataIn[29];
		29:		dataOut[1] = dataIn[30];
		30:		dataOut[1] = dataIn[31];
		31:		dataOut[1] = dataIn[0];
		default:dataOut[1] = 0;		
		endcase
	end
	/////////////////////////2////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[2] = dataIn[2];
		1:		dataOut[2] = dataIn[3];
		2:		dataOut[2] = dataIn[4];
		3:		dataOut[2] = dataIn[5];
		4:		dataOut[2] = dataIn[6];
		5:		dataOut[2] = dataIn[7];
		6:		dataOut[2] = dataIn[8];
		7:		dataOut[2] = dataIn[9];
		8:		dataOut[2] = dataIn[10];
		9:		dataOut[2] = dataIn[11];
		10:		dataOut[2] = dataIn[12];
		11:		dataOut[2] = dataIn[13];
		12:		dataOut[2] = dataIn[14];
		13:		dataOut[2] = dataIn[15];
		14:		dataOut[2] = dataIn[16];
		15:		dataOut[2] = dataIn[17];
		16:		dataOut[2] = dataIn[18];
		17:		dataOut[2] = dataIn[19];
		18:		dataOut[2] = dataIn[20];
		19:		dataOut[2] = dataIn[21];
		20:		dataOut[2] = dataIn[22];
		21:		dataOut[2] = dataIn[23];
		22:		dataOut[2] = dataIn[24];
		23:		dataOut[2] = dataIn[25];
		24:		dataOut[2] = dataIn[26];
		25:		dataOut[2] = dataIn[27];
		26:		dataOut[2] = dataIn[28];
		27:		dataOut[2] = dataIn[29];
		28:		dataOut[2] = dataIn[30];
		29:		dataOut[2] = dataIn[31];
		30:		dataOut[2] = dataIn[0];
		31:		dataOut[2] = dataIn[1];
		default:dataOut[2] = 0;
		endcase
	end
	/////////////////////////3////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[3] = dataIn[3];
		1:		dataOut[3] = dataIn[4];
		2:		dataOut[3] = dataIn[5];
		3:		dataOut[3] = dataIn[6];
		4:		dataOut[3] = dataIn[7];
		5:		dataOut[3] = dataIn[8];
		6:		dataOut[3] = dataIn[9];
		7:		dataOut[3] = dataIn[10];
		8:		dataOut[3] = dataIn[11];
		9:		dataOut[3] = dataIn[12];
		10:		dataOut[3] = dataIn[13];
		11:		dataOut[3] = dataIn[14];
		12:		dataOut[3] = dataIn[15];
		13:		dataOut[3] = dataIn[16];
		14:		dataOut[3] = dataIn[17];
		15:		dataOut[3] = dataIn[18];
		16:		dataOut[3] = dataIn[19];
		17:		dataOut[3] = dataIn[20];
		18:		dataOut[3] = dataIn[21];
		19:		dataOut[3] = dataIn[22];
		20:		dataOut[3] = dataIn[23];
		21:		dataOut[3] = dataIn[24];
		22:		dataOut[3] = dataIn[25];
		23:		dataOut[3] = dataIn[26];
		24:		dataOut[3] = dataIn[27];
		25:		dataOut[3] = dataIn[28];
		26:		dataOut[3] = dataIn[29];
		27:		dataOut[3] = dataIn[30];
		28:		dataOut[3] = dataIn[31];
		29:		dataOut[3] = dataIn[0];
		30:		dataOut[3] = dataIn[1];
		31:		dataOut[3] = dataIn[2];
		default:dataOut[3] = 0;
		endcase
	end
	////////////////////////4/////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[4] = dataIn[4];
		1:		dataOut[4] = dataIn[5];
		2:		dataOut[4] = dataIn[6];
		3:		dataOut[4] = dataIn[7];
		4:		dataOut[4] = dataIn[8];
		5:		dataOut[4] = dataIn[9];
		6:		dataOut[4] = dataIn[10];
		7:		dataOut[4] = dataIn[11];
		8:		dataOut[4] = dataIn[12];
		9:		dataOut[4] = dataIn[13];
		10:		dataOut[4] = dataIn[14];
		11:		dataOut[4] = dataIn[15];
		12:		dataOut[4] = dataIn[16];
		13:		dataOut[4] = dataIn[17];
		14:		dataOut[4] = dataIn[18];
		15:		dataOut[4] = dataIn[19];
		16:		dataOut[4] = dataIn[20];
		17:		dataOut[4] = dataIn[21];
		18:		dataOut[4] = dataIn[22];
		19:		dataOut[4] = dataIn[23];
		20:		dataOut[4] = dataIn[24];
		21:		dataOut[4] = dataIn[25];
		22:		dataOut[4] = dataIn[26];
		23:		dataOut[4] = dataIn[27];
		24:		dataOut[4] = dataIn[28];
		25:		dataOut[4] = dataIn[29];
		26:		dataOut[4] = dataIn[30];
		27:		dataOut[4] = dataIn[31];
		28:		dataOut[4] = dataIn[0];
		29:		dataOut[4] = dataIn[1];
		30:		dataOut[4] = dataIn[2];
		31:		dataOut[4] = dataIn[3];
		default:dataOut[4] = 0;
		endcase
	end
	/////////////////////////5////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[5] = dataIn[5];
		1:		dataOut[5] = dataIn[6];
		2:		dataOut[5] = dataIn[7];
		3:		dataOut[5] = dataIn[8];
		4:		dataOut[5] = dataIn[9];
		5:		dataOut[5] = dataIn[10];
		6:		dataOut[5] = dataIn[11];
		7:		dataOut[5] = dataIn[12];
		8:		dataOut[5] = dataIn[13];
		9:		dataOut[5] = dataIn[14];
		10:		dataOut[5] = dataIn[15];
		11:		dataOut[5] = dataIn[16];
		12:		dataOut[5] = dataIn[17];
		13:		dataOut[5] = dataIn[18];
		14:		dataOut[5] = dataIn[19];
		15:		dataOut[5] = dataIn[20];
		16:		dataOut[5] = dataIn[21];
		17:		dataOut[5] = dataIn[22];
		18:		dataOut[5] = dataIn[23];
		19:		dataOut[5] = dataIn[24];
		20:		dataOut[5] = dataIn[25];
		21:		dataOut[5] = dataIn[26];
		22:		dataOut[5] = dataIn[27];
		23:		dataOut[5] = dataIn[28];
		24:		dataOut[5] = dataIn[29];
		25:		dataOut[5] = dataIn[30];
		26:		dataOut[5] = dataIn[31];
		27:		dataOut[5] = dataIn[0];
		28:		dataOut[5] = dataIn[1];
		29:		dataOut[5] = dataIn[2];
		30:		dataOut[5] = dataIn[3];
		31:		dataOut[5] = dataIn[4];
		default:dataOut[5] = 0;
		endcase
	end
	/////////////////////////6////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[6] = dataIn[6];
		1:		dataOut[6] = dataIn[7];
		2:		dataOut[6] = dataIn[8];
		3:		dataOut[6] = dataIn[9];
		4:		dataOut[6] = dataIn[10];
		5:		dataOut[6] = dataIn[11];
		6:		dataOut[6] = dataIn[12];
		7:		dataOut[6] = dataIn[13];
		8:		dataOut[6] = dataIn[14];
		9:		dataOut[6] = dataIn[15];
		10:		dataOut[6] = dataIn[16];
		11:		dataOut[6] = dataIn[17];
		12:		dataOut[6] = dataIn[18];
		13:		dataOut[6] = dataIn[19];
		14:		dataOut[6] = dataIn[20];
		15:		dataOut[6] = dataIn[21];
		16:		dataOut[6] = dataIn[22];
		17:		dataOut[6] = dataIn[23];
		18:		dataOut[6] = dataIn[24];
		19:		dataOut[6] = dataIn[25];
		20:		dataOut[6] = dataIn[26];
		21:		dataOut[6] = dataIn[27];
		22:		dataOut[6] = dataIn[28];
		23:		dataOut[6] = dataIn[29];
		24:		dataOut[6] = dataIn[30];
		25:		dataOut[6] = dataIn[31];
		26:		dataOut[6] = dataIn[0];
		27:		dataOut[6] = dataIn[1];
		28:		dataOut[6] = dataIn[2];
		29:		dataOut[6] = dataIn[3];
		30:		dataOut[6] = dataIn[4];
		31:		dataOut[6] = dataIn[5];
		default:dataOut[6] = 0;
		endcase
	end
	/////////////////////////7////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[7] = dataIn[7];
		1:		dataOut[7] = dataIn[8];
		2:		dataOut[7] = dataIn[9];
		3:		dataOut[7] = dataIn[10];
		4:		dataOut[7] = dataIn[11];
		5:		dataOut[7] = dataIn[12];
		6:		dataOut[7] = dataIn[13];
		7:		dataOut[7] = dataIn[14];
		8:		dataOut[7] = dataIn[15];
		9:		dataOut[7] = dataIn[16];
		10:		dataOut[7] = dataIn[17];
		11:		dataOut[7] = dataIn[18];
		12:		dataOut[7] = dataIn[19];
		13:		dataOut[7] = dataIn[20];
		14:		dataOut[7] = dataIn[21];
		15:		dataOut[7] = dataIn[22];
		16:		dataOut[7] = dataIn[23];
		17:		dataOut[7] = dataIn[24];
		18:		dataOut[7] = dataIn[25];
		19:		dataOut[7] = dataIn[26];
		20:		dataOut[7] = dataIn[27];
		21:		dataOut[7] = dataIn[28];
		22:		dataOut[7] = dataIn[29];
		23:		dataOut[7] = dataIn[30];
		24:		dataOut[7] = dataIn[31];
		25:		dataOut[7] = dataIn[0];
		26:		dataOut[7] = dataIn[1];
		27:		dataOut[7] = dataIn[2];
		28:		dataOut[7] = dataIn[3];
		29:		dataOut[7] = dataIn[4];
		30:		dataOut[7] = dataIn[5];
		31:		dataOut[7] = dataIn[6];
		default:dataOut[7] = 0;
		endcase
	end
	////////////////////////8/////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[8] = dataIn[8];
		1:		dataOut[8] = dataIn[9];
		2:		dataOut[8] = dataIn[10];
		3:		dataOut[8] = dataIn[11];
		4:		dataOut[8] = dataIn[12];
		5:		dataOut[8] = dataIn[13];
		6:		dataOut[8] = dataIn[14];
		7:		dataOut[8] = dataIn[15];
		8:		dataOut[8] = dataIn[16];
		9:		dataOut[8] = dataIn[17];
		10:		dataOut[8] = dataIn[18];
		11:		dataOut[8] = dataIn[19];
		12:		dataOut[8] = dataIn[20];
		13:		dataOut[8] = dataIn[21];
		14:		dataOut[8] = dataIn[22];
		15:		dataOut[8] = dataIn[23];
		16:		dataOut[8] = dataIn[24];
		17:		dataOut[8] = dataIn[25];
		18:		dataOut[8] = dataIn[26];
		19:		dataOut[8] = dataIn[27];
		20:		dataOut[8] = dataIn[28];
		21:		dataOut[8] = dataIn[29];
		22:		dataOut[8] = dataIn[30];
		23:		dataOut[8] = dataIn[31];
		24:		dataOut[8] = dataIn[0];
		25:		dataOut[8] = dataIn[1];
		26:		dataOut[8] = dataIn[2];
		27:		dataOut[8] = dataIn[3];
		28:		dataOut[8] = dataIn[4];
		29:		dataOut[8] = dataIn[5];
		30:		dataOut[8] = dataIn[6];
		31:		dataOut[8] = dataIn[7];
		default:dataOut[8] = 0;
		endcase
	end
	/////////////////////////9////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[9] = dataIn[9];
		1:		dataOut[9] = dataIn[10];
		2:		dataOut[9] = dataIn[11];
		3:		dataOut[9] = dataIn[12];
		4:		dataOut[9] = dataIn[13];
		5:		dataOut[9] = dataIn[14];
		6:		dataOut[9] = dataIn[15];
		7:		dataOut[9] = dataIn[16];
		8:		dataOut[9] = dataIn[17];
		9:		dataOut[9] = dataIn[18];
		10:		dataOut[9] = dataIn[19];
		11:		dataOut[9] = dataIn[20];
		12:		dataOut[9] = dataIn[21];
		13:		dataOut[9] = dataIn[22];
		14:		dataOut[9] = dataIn[23];
		15:		dataOut[9] = dataIn[24];
		16:		dataOut[9] = dataIn[25];
		17:		dataOut[9] = dataIn[26];
		18:		dataOut[9] = dataIn[27];
		19:		dataOut[9] = dataIn[28];
		20:		dataOut[9] = dataIn[29];
		21:		dataOut[9] = dataIn[30];
		22:		dataOut[9] = dataIn[31];
		23:		dataOut[9] = dataIn[0];
		24:		dataOut[9] = dataIn[1];
		25:		dataOut[9] = dataIn[2];
		26:		dataOut[9] = dataIn[3];
		27:		dataOut[9] = dataIn[4];
		28:		dataOut[9] = dataIn[5];
		29:		dataOut[9] = dataIn[6];
		30:		dataOut[9] = dataIn[7];
		31:		dataOut[9] = dataIn[8];
		default:dataOut[9] = 0;
		endcase
	end
	/////////////////////////10////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[10] = dataIn[10];
		1:		dataOut[10] = dataIn[11];
		2:		dataOut[10] = dataIn[12];
		3:		dataOut[10] = dataIn[13];
		4:		dataOut[10] = dataIn[14];
		5:		dataOut[10] = dataIn[15];
		6:		dataOut[10] = dataIn[16];
		7:		dataOut[10] = dataIn[17];
		8:		dataOut[10] = dataIn[18];
		9:		dataOut[10] = dataIn[19];
		10:		dataOut[10] = dataIn[20];
		11:		dataOut[10] = dataIn[21];
		12:		dataOut[10] = dataIn[22];
		13:		dataOut[10] = dataIn[23];
		14:		dataOut[10] = dataIn[24];
		15:		dataOut[10] = dataIn[25];
		16:		dataOut[10] = dataIn[26];
		17:		dataOut[10] = dataIn[27];
		18:		dataOut[10] = dataIn[28];
		19:		dataOut[10] = dataIn[29];
		20:		dataOut[10] = dataIn[30];
		21:		dataOut[10] = dataIn[31];
		22:		dataOut[10] = dataIn[0];
		23:		dataOut[10] = dataIn[1];
		24:		dataOut[10] = dataIn[2];
		25:		dataOut[10] = dataIn[3];
		26:		dataOut[10] = dataIn[4];
		27:		dataOut[10] = dataIn[5];
		28:		dataOut[10] = dataIn[6];
		29:		dataOut[10] = dataIn[7];
		30:		dataOut[10] = dataIn[8];
		31:		dataOut[10] = dataIn[9];
		default:dataOut[10] = 0;
		endcase
	end
	/////////////////////////11////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[11] = dataIn[11];
		1:		dataOut[11] = dataIn[12];
		2:		dataOut[11] = dataIn[13];
		3:		dataOut[11] = dataIn[14];
		4:		dataOut[11] = dataIn[15];
		5:		dataOut[11] = dataIn[16];
		6:		dataOut[11] = dataIn[17];
		7:		dataOut[11] = dataIn[18];
		8:		dataOut[11] = dataIn[19];
		9:		dataOut[11] = dataIn[20];
		10:		dataOut[11] = dataIn[21];
		11:		dataOut[11] = dataIn[22];
		12:		dataOut[11] = dataIn[23];
		13:		dataOut[11] = dataIn[24];
		14:		dataOut[11] = dataIn[25];
		15:		dataOut[11] = dataIn[26];
		16:		dataOut[11] = dataIn[27];
		17:		dataOut[11] = dataIn[28];
		18:		dataOut[11] = dataIn[29];
		19:		dataOut[11] = dataIn[30];
		20:		dataOut[11] = dataIn[31];
		21:		dataOut[11] = dataIn[0];
		22:		dataOut[11] = dataIn[1];
		23:		dataOut[11] = dataIn[2];
		24:		dataOut[11] = dataIn[3];
		25:		dataOut[11] = dataIn[4];
		26:		dataOut[11] = dataIn[5];
		27:		dataOut[11] = dataIn[6];
		28:		dataOut[11] = dataIn[7];
		29:		dataOut[11] = dataIn[8];
		30:		dataOut[11] = dataIn[9];
		31:		dataOut[11] = dataIn[10];
		default:dataOut[11] = 0;
		endcase
	end
	////////////////////////12/////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[12] = dataIn[12];
		1:		dataOut[12] = dataIn[13];
		2:		dataOut[12] = dataIn[14];
		3:		dataOut[12] = dataIn[15];
		4:		dataOut[12] = dataIn[16];
		5:		dataOut[12] = dataIn[17];
		6:		dataOut[12] = dataIn[18];
		7:		dataOut[12] = dataIn[19];
		8:		dataOut[12] = dataIn[20];
		9:		dataOut[12] = dataIn[21];
		10:		dataOut[12] = dataIn[22];
		11:		dataOut[12] = dataIn[23];
		12:		dataOut[12] = dataIn[24];
		13:		dataOut[12] = dataIn[25];
		14:		dataOut[12] = dataIn[26];
		15:		dataOut[12] = dataIn[27];
		16:		dataOut[12] = dataIn[28];
		17:		dataOut[12] = dataIn[29];
		18:		dataOut[12] = dataIn[30];
		19:		dataOut[12] = dataIn[31];
		20:		dataOut[12] = dataIn[0];
		21:		dataOut[12] = dataIn[1];
		22:		dataOut[12] = dataIn[2];
		23:		dataOut[12] = dataIn[3];
		24:		dataOut[12] = dataIn[4];
		25:		dataOut[12] = dataIn[5];
		26:		dataOut[12] = dataIn[6];
		27:		dataOut[12] = dataIn[7];
		28:		dataOut[12] = dataIn[8];
		29:		dataOut[12] = dataIn[9];
		30:		dataOut[12] = dataIn[10];
		31:		dataOut[12] = dataIn[11];
		default:dataOut[12] = 0;
		endcase
	end
	////////////////////////13/////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[13] = dataIn[13];
		1:		dataOut[13] = dataIn[14];
		2:		dataOut[13] = dataIn[15];
		3:		dataOut[13] = dataIn[16];
		4:		dataOut[13] = dataIn[17];
		5:		dataOut[13] = dataIn[18];
		6:		dataOut[13] = dataIn[19];
		7:		dataOut[13] = dataIn[20];
		8:		dataOut[13] = dataIn[21];
		9:		dataOut[13] = dataIn[22];
		10:		dataOut[13] = dataIn[23];
		11:		dataOut[13] = dataIn[24];
		12:		dataOut[13] = dataIn[25];
		13:		dataOut[13] = dataIn[26];
		14:		dataOut[13] = dataIn[27];
		15:		dataOut[13] = dataIn[28];
		16:		dataOut[13] = dataIn[29];
		17:		dataOut[13] = dataIn[30];
		18:		dataOut[13] = dataIn[31];
		19:		dataOut[13] = dataIn[0];
		20:		dataOut[13] = dataIn[1];
		21:		dataOut[13] = dataIn[2];
		22:		dataOut[13] = dataIn[3];
		23:		dataOut[13] = dataIn[4];
		24:		dataOut[13] = dataIn[5];
		25:		dataOut[13] = dataIn[6];
		26:		dataOut[13] = dataIn[7];
		27:		dataOut[13] = dataIn[8];
		28:		dataOut[13] = dataIn[9];
		29:		dataOut[13] = dataIn[10];
		30:		dataOut[13] = dataIn[11];
		31:		dataOut[13] = dataIn[12];
		default:dataOut[13] = 0;
		endcase
	end
	////////////////////////14/////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[14] = dataIn[14];
		1:		dataOut[14] = dataIn[15];
		2:		dataOut[14] = dataIn[16];
		3:		dataOut[14] = dataIn[17];
		4:		dataOut[14] = dataIn[18];
		5:		dataOut[14] = dataIn[19];
		6:		dataOut[14] = dataIn[20];
		7:		dataOut[14] = dataIn[21];
		8:		dataOut[14] = dataIn[22];
		9:		dataOut[14] = dataIn[23];
		10:		dataOut[14] = dataIn[24];
		11:		dataOut[14] = dataIn[25];
		12:		dataOut[14] = dataIn[26];
		13:		dataOut[14] = dataIn[27];
		14:		dataOut[14] = dataIn[28];
		15:		dataOut[14] = dataIn[29];
		16:		dataOut[14] = dataIn[30];
		17:		dataOut[14] = dataIn[31];
		18:		dataOut[14] = dataIn[0];
		19:		dataOut[14] = dataIn[1];
		20:		dataOut[14] = dataIn[2];
		21:		dataOut[14] = dataIn[3];
		22:		dataOut[14] = dataIn[4];
		23:		dataOut[14] = dataIn[5];
		24:		dataOut[14] = dataIn[6];
		25:		dataOut[14] = dataIn[7];
		26:		dataOut[14] = dataIn[8];
		27:		dataOut[14] = dataIn[9];
		28:		dataOut[14] = dataIn[10];
		29:		dataOut[14] = dataIn[11];
		30:		dataOut[14] = dataIn[12];
		31:		dataOut[14] = dataIn[13];
		default:dataOut[14] = 0;
		endcase
	end
	////////////////////////15/////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[15] = dataIn[15];
		1:		dataOut[15] = dataIn[16];
		2:		dataOut[15] = dataIn[17];
		3:		dataOut[15] = dataIn[18];
		4:		dataOut[15] = dataIn[19];
		5:		dataOut[15] = dataIn[20];
		6:		dataOut[15] = dataIn[21];
		7:		dataOut[15] = dataIn[22];
		8:		dataOut[15] = dataIn[23];
		9:		dataOut[15] = dataIn[24];
		10:		dataOut[15] = dataIn[25];
		11:		dataOut[15] = dataIn[26];
		12:		dataOut[15] = dataIn[27];
		13:		dataOut[15] = dataIn[28];
		14:		dataOut[15] = dataIn[29];
		15:		dataOut[15] = dataIn[30];
		16:		dataOut[15] = dataIn[31];
		17:		dataOut[15] = dataIn[0];
		18:		dataOut[15] = dataIn[1];
		19:		dataOut[15] = dataIn[2];
		20:		dataOut[15] = dataIn[3];
		21:		dataOut[15] = dataIn[4];
		22:		dataOut[15] = dataIn[5];
		23:		dataOut[15] = dataIn[6];
		24:		dataOut[15] = dataIn[7];
		25:		dataOut[15] = dataIn[8];
		26:		dataOut[15] = dataIn[9];
		27:		dataOut[15] = dataIn[10];
		28:		dataOut[15] = dataIn[11];
		29:		dataOut[15] = dataIn[12];
		30:		dataOut[15] = dataIn[13];
		31:		dataOut[15] = dataIn[14];
		default:dataOut[15] = 0;
		endcase
	end
	////////////////////////16/////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[16] = dataIn[16];
		1:		dataOut[16] = dataIn[17];
		2:		dataOut[16] = dataIn[18];
		3:		dataOut[16] = dataIn[19];
		4:		dataOut[16] = dataIn[20];
		5:		dataOut[16] = dataIn[21];
		6:		dataOut[16] = dataIn[22];
		7:		dataOut[16] = dataIn[23];
		8:		dataOut[16] = dataIn[24];
		9:		dataOut[16] = dataIn[25];
		10:		dataOut[16] = dataIn[26];
		11:		dataOut[16] = dataIn[27];
		12:		dataOut[16] = dataIn[28];
		13:		dataOut[16] = dataIn[29];
		14:		dataOut[16] = dataIn[30];
		15:		dataOut[16] = dataIn[31];
		16:		dataOut[16] = dataIn[0];
		17:		dataOut[16] = dataIn[1];
		18:		dataOut[16] = dataIn[2];
		19:		dataOut[16] = dataIn[3];
		20:		dataOut[16] = dataIn[4];
		21:		dataOut[16] = dataIn[5];
		22:		dataOut[16] = dataIn[6];
		23:		dataOut[16] = dataIn[7];
		24:		dataOut[16] = dataIn[8];
		25:		dataOut[16] = dataIn[9];
		26:		dataOut[16] = dataIn[10];
		27:		dataOut[16] = dataIn[11];
		28:		dataOut[16] = dataIn[12];
		29:		dataOut[16] = dataIn[13];
		30:		dataOut[16] = dataIn[14];
		31:		dataOut[16] = dataIn[15];
		default:dataOut[16] = 0;
		endcase
	end
	////////////////////////17/////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[17] = dataIn[17];
		1:		dataOut[17] = dataIn[18];
		2:		dataOut[17] = dataIn[19];
		3:		dataOut[17] = dataIn[20];
		4:		dataOut[17] = dataIn[21];
		5:		dataOut[17] = dataIn[22];
		6:		dataOut[17] = dataIn[23];
		7:		dataOut[17] = dataIn[24];
		8:		dataOut[17] = dataIn[25];
		9:		dataOut[17] = dataIn[26];
		10:		dataOut[17] = dataIn[27];
		11:		dataOut[17] = dataIn[28];
		12:		dataOut[17] = dataIn[29];
		13:		dataOut[17] = dataIn[30];
		14:		dataOut[17] = dataIn[31];
		15:		dataOut[17] = dataIn[0];
		16:		dataOut[17] = dataIn[1];
		17:		dataOut[17] = dataIn[2];
		18:		dataOut[17] = dataIn[3];
		19:		dataOut[17] = dataIn[4];
		20:		dataOut[17] = dataIn[5];
		21:		dataOut[17] = dataIn[6];
		22:		dataOut[17] = dataIn[7];
		23:		dataOut[17] = dataIn[8];
		24:		dataOut[17] = dataIn[9];
		25:		dataOut[17] = dataIn[10];
		26:		dataOut[17] = dataIn[11];
		27:		dataOut[17] = dataIn[12];
		28:		dataOut[17] = dataIn[13];
		29:		dataOut[17] = dataIn[14];
		30:		dataOut[17] = dataIn[15];
		31:		dataOut[17] = dataIn[16];
		default:dataOut[17] = 0;
		endcase
	end
	////////////////////////18/////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[18] = dataIn[18];
		1:		dataOut[18] = dataIn[19];
		2:		dataOut[18] = dataIn[20];
		3:		dataOut[18] = dataIn[21];
		4:		dataOut[18] = dataIn[22];
		5:		dataOut[18] = dataIn[23];
		6:		dataOut[18] = dataIn[24];
		7:		dataOut[18] = dataIn[25];
		8:		dataOut[18] = dataIn[26];
		9:		dataOut[18] = dataIn[27];
		10:		dataOut[18] = dataIn[28];
		11:		dataOut[18] = dataIn[29];
		12:		dataOut[18] = dataIn[30];
		13:		dataOut[18] = dataIn[31];
		14:		dataOut[18] = dataIn[0];
		15:		dataOut[18] = dataIn[1];
		16:		dataOut[18] = dataIn[2];
		17:		dataOut[18] = dataIn[3];
		18:		dataOut[18] = dataIn[4];
		19:		dataOut[18] = dataIn[5];
		20:		dataOut[18] = dataIn[6];
		21:		dataOut[18] = dataIn[7];
		22:		dataOut[18] = dataIn[8];
		23:		dataOut[18] = dataIn[9];
		24:		dataOut[18] = dataIn[10];
		25:		dataOut[18] = dataIn[11];
		26:		dataOut[18] = dataIn[12];
		27:		dataOut[18] = dataIn[13];
		28:		dataOut[18] = dataIn[14];
		29:		dataOut[18] = dataIn[15];
		30:		dataOut[18] = dataIn[16];
		31:		dataOut[18] = dataIn[17];
		default:dataOut[18] = 0;
		endcase
	end
	////////////////////////19/////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[19] = dataIn[19];
		1:		dataOut[19] = dataIn[20];
		2:		dataOut[19] = dataIn[21];
		3:		dataOut[19] = dataIn[22];
		4:		dataOut[19] = dataIn[23];
		5:		dataOut[19] = dataIn[24];
		6:		dataOut[19] = dataIn[25];
		7:		dataOut[19] = dataIn[26];
		8:		dataOut[19] = dataIn[27];
		9:		dataOut[19] = dataIn[28];
		10:		dataOut[19] = dataIn[29];
		11:		dataOut[19] = dataIn[30];
		12:		dataOut[19] = dataIn[31];
		13:		dataOut[19] = dataIn[0];
		14:		dataOut[19] = dataIn[1];
		15:		dataOut[19] = dataIn[2];
		16:		dataOut[19] = dataIn[3];
		17:		dataOut[19] = dataIn[4];
		18:		dataOut[19] = dataIn[5];
		19:		dataOut[19] = dataIn[6];
		20:		dataOut[19] = dataIn[7];
		21:		dataOut[19] = dataIn[8];
		22:		dataOut[19] = dataIn[9];
		23:		dataOut[19] = dataIn[10];
		24:		dataOut[19] = dataIn[11];
		25:		dataOut[19] = dataIn[12];
		26:		dataOut[19] = dataIn[13];
		27:		dataOut[19] = dataIn[14];
		28:		dataOut[19] = dataIn[15];
		29:		dataOut[19] = dataIn[16];
		30:		dataOut[19] = dataIn[17];
		31:		dataOut[19] = dataIn[18];
		default:dataOut[19] = 0;
		endcase
	end
	////////////////////////20/////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[20] = dataIn[20];
		1:		dataOut[20] = dataIn[21];
		2:		dataOut[20] = dataIn[22];
		3:		dataOut[20] = dataIn[23];
		4:		dataOut[20] = dataIn[24];
		5:		dataOut[20] = dataIn[25];
		6:		dataOut[20] = dataIn[26];
		7:		dataOut[20] = dataIn[27];
		8:		dataOut[20] = dataIn[28];
		9:		dataOut[20] = dataIn[29];
		10:		dataOut[20] = dataIn[30];
		11:		dataOut[20] = dataIn[31];
		12:		dataOut[20] = dataIn[0];
		13:		dataOut[20] = dataIn[1];
		14:		dataOut[20] = dataIn[2];
		15:		dataOut[20] = dataIn[3];
		16:		dataOut[20] = dataIn[4];
		17:		dataOut[20] = dataIn[5];
		18:		dataOut[20] = dataIn[6];
		19:		dataOut[20] = dataIn[7];
		20:		dataOut[20] = dataIn[8];
		21:		dataOut[20] = dataIn[9];
		22:		dataOut[20] = dataIn[10];
		23:		dataOut[20] = dataIn[11];
		24:		dataOut[20] = dataIn[12];
		25:		dataOut[20] = dataIn[13];
		26:		dataOut[20] = dataIn[14];
		27:		dataOut[20] = dataIn[15];
		28:		dataOut[20] = dataIn[16];
		29:		dataOut[20] = dataIn[17];
		30:		dataOut[20] = dataIn[18];
		31:		dataOut[20] = dataIn[19];
		default:dataOut[20] = 0;
		endcase
	end
	////////////////////////21/////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[21] = dataIn[21];
		1:		dataOut[21] = dataIn[22];
		2:		dataOut[21] = dataIn[23];
		3:		dataOut[21] = dataIn[24];
		4:		dataOut[21] = dataIn[25];
		5:		dataOut[21] = dataIn[26];
		6:		dataOut[21] = dataIn[27];
		7:		dataOut[21] = dataIn[28];
		8:		dataOut[21] = dataIn[29];
		9:		dataOut[21] = dataIn[30];
		10:		dataOut[21] = dataIn[31];
		11:		dataOut[21] = dataIn[0];
		12:		dataOut[21] = dataIn[1];
		13:		dataOut[21] = dataIn[2];
		14:		dataOut[21] = dataIn[3];
		15:		dataOut[21] = dataIn[4];
		16:		dataOut[21] = dataIn[5];
		17:		dataOut[21] = dataIn[6];
		18:		dataOut[21] = dataIn[7];
		19:		dataOut[21] = dataIn[8];
		20:		dataOut[21] = dataIn[9];
		21:		dataOut[21] = dataIn[10];
		22:		dataOut[21] = dataIn[11];
		23:		dataOut[21] = dataIn[12];
		24:		dataOut[21] = dataIn[13];
		25:		dataOut[21] = dataIn[14];
		26:		dataOut[21] = dataIn[15];
		27:		dataOut[21] = dataIn[16];
		28:		dataOut[21] = dataIn[17];
		29:		dataOut[21] = dataIn[18];
		30:		dataOut[21] = dataIn[19];
		31:		dataOut[21] = dataIn[20];
		default:dataOut[21] = 0;
		endcase
	end
	////////////////////////22/////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[22] = dataIn[22];
		1:		dataOut[22] = dataIn[23];
		2:		dataOut[22] = dataIn[24];
		3:		dataOut[22] = dataIn[25];
		4:		dataOut[22] = dataIn[26];
		5:		dataOut[22] = dataIn[27];
		6:		dataOut[22] = dataIn[28];
		7:		dataOut[22] = dataIn[29];
		8:		dataOut[22] = dataIn[30];
		9:		dataOut[22] = dataIn[31];
		10:		dataOut[22] = dataIn[0];
		11:		dataOut[22] = dataIn[1];
		12:		dataOut[22] = dataIn[2];
		13:		dataOut[22] = dataIn[3];
		14:		dataOut[22] = dataIn[4];
		15:		dataOut[22] = dataIn[5];
		16:		dataOut[22] = dataIn[6];
		17:		dataOut[22] = dataIn[7];
		18:		dataOut[22] = dataIn[8];
		19:		dataOut[22] = dataIn[9];
		20:		dataOut[22] = dataIn[10];
		21:		dataOut[22] = dataIn[11];
		22:		dataOut[22] = dataIn[12];
		23:		dataOut[22] = dataIn[13];
		24:		dataOut[22] = dataIn[14];
		25:		dataOut[22] = dataIn[15];
		26:		dataOut[22] = dataIn[16];
		27:		dataOut[22] = dataIn[17];
		28:		dataOut[22] = dataIn[18];
		29:		dataOut[22] = dataIn[19];
		30:		dataOut[22] = dataIn[20];
		31:		dataOut[22] = dataIn[21];
		default:dataOut[22] = 0;
		endcase
	end
	////////////////////////23/////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[23] = dataIn[23];
		1:		dataOut[23] = dataIn[24];
		2:		dataOut[23] = dataIn[25];
		3:		dataOut[23] = dataIn[26];
		4:		dataOut[23] = dataIn[27];
		5:		dataOut[23] = dataIn[28];
		6:		dataOut[23] = dataIn[29];
		7:		dataOut[23] = dataIn[30];
		8:		dataOut[23] = dataIn[31];
		9:		dataOut[23] = dataIn[0];
		10:		dataOut[23] = dataIn[1];
		11:		dataOut[23] = dataIn[2];
		12:		dataOut[23] = dataIn[3];
		13:		dataOut[23] = dataIn[4];
		14:		dataOut[23] = dataIn[5];
		15:		dataOut[23] = dataIn[6];
		16:		dataOut[23] = dataIn[7];
		17:		dataOut[23] = dataIn[8];
		18:		dataOut[23] = dataIn[9];
		19:		dataOut[23] = dataIn[10];
		20:		dataOut[23] = dataIn[11];
		21:		dataOut[23] = dataIn[12];
		22:		dataOut[23] = dataIn[13];
		23:		dataOut[23] = dataIn[14];
		24:		dataOut[23] = dataIn[15];
		25:		dataOut[23] = dataIn[16];
		26:		dataOut[23] = dataIn[17];
		27:		dataOut[23] = dataIn[18];
		28:		dataOut[23] = dataIn[19];
		29:		dataOut[23] = dataIn[20];
		30:		dataOut[23] = dataIn[21];
		31:		dataOut[23] = dataIn[22];
		default:dataOut[23] = dataIn[0];
		endcase
	end
	////////////////////////24/////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[24] = dataIn[24];
		1:		dataOut[24] = dataIn[25];
		2:		dataOut[24] = dataIn[26];
		3:		dataOut[24] = dataIn[27];
		4:		dataOut[24] = dataIn[28];
		5:		dataOut[24] = dataIn[29];
		6:		dataOut[24] = dataIn[30];
		7:		dataOut[24] = dataIn[31];
		8:		dataOut[24] = dataIn[0];
		9:		dataOut[24] = dataIn[1];
		10:		dataOut[24] = dataIn[2];
		11:		dataOut[24] = dataIn[3];
		12:		dataOut[24] = dataIn[4];
		13:		dataOut[24] = dataIn[5];
		14:		dataOut[24] = dataIn[6];
		15:		dataOut[24] = dataIn[7];
		16:		dataOut[24] = dataIn[8];
		17:		dataOut[24] = dataIn[9];
		18:		dataOut[24] = dataIn[10];
		19:		dataOut[24] = dataIn[11];
		20:		dataOut[24] = dataIn[12];
		21:		dataOut[24] = dataIn[13];
		22:		dataOut[24] = dataIn[14];
		23:		dataOut[24] = dataIn[15];
		24:		dataOut[24] = dataIn[16];
		25:		dataOut[24] = dataIn[17];
		26:		dataOut[24] = dataIn[18];
		27:		dataOut[24] = dataIn[19];
		28:		dataOut[24] = dataIn[20];
		29:		dataOut[24] = dataIn[21];
		30:		dataOut[24] = dataIn[22];
		31:		dataOut[24] = dataIn[23];
		default:dataOut[24] = 0;
		endcase
	end
	////////////////////////25/////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[25] = dataIn[25];
		1:		dataOut[25] = dataIn[26];
		2:		dataOut[25] = dataIn[27];
		3:		dataOut[25] = dataIn[28];
		4:		dataOut[25] = dataIn[29];
		5:		dataOut[25] = dataIn[30];
		6:		dataOut[25] = dataIn[31];
		7:		dataOut[25] = dataIn[0];
		8:		dataOut[25] = dataIn[1];
		9:		dataOut[25] = dataIn[2];
		10:		dataOut[25] = dataIn[3];
		11:		dataOut[25] = dataIn[4];
		12:		dataOut[25] = dataIn[5];
		13:		dataOut[25] = dataIn[6];
		14:		dataOut[25] = dataIn[7];
		15:		dataOut[25] = dataIn[8];
		16:		dataOut[25] = dataIn[9];
		17:		dataOut[25] = dataIn[10];
		18:		dataOut[25] = dataIn[11];
		19:		dataOut[25] = dataIn[12];
		20:		dataOut[25] = dataIn[13];
		21:		dataOut[25] = dataIn[14];
		22:		dataOut[25] = dataIn[15];
		23:		dataOut[25] = dataIn[16];
		24:		dataOut[25] = dataIn[17];
		25:		dataOut[25] = dataIn[18];
		26:		dataOut[25] = dataIn[19];
		27:		dataOut[25] = dataIn[20];
		28:		dataOut[25] = dataIn[21];
		29:		dataOut[25] = dataIn[22];
		30:		dataOut[25] = dataIn[23];
		31:		dataOut[25] = dataIn[24];
		default:dataOut[25] = 0;
		endcase
	end
	/////////////////////////26////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[26] = dataIn[26];
		1:		dataOut[26] = dataIn[27];
		2:		dataOut[26] = dataIn[28];
		3:		dataOut[26] = dataIn[29];
		4:		dataOut[26] = dataIn[30];
		5:		dataOut[26] = dataIn[31];
		6:		dataOut[26] = dataIn[0];
		7:		dataOut[26] = dataIn[1];
		8:		dataOut[26] = dataIn[2];
		9:		dataOut[26] = dataIn[3];
		10:		dataOut[26] = dataIn[4];
		11:		dataOut[26] = dataIn[5];
		12:		dataOut[26] = dataIn[6];
		13:		dataOut[26] = dataIn[7];
		14:		dataOut[26] = dataIn[8];
		15:		dataOut[26] = dataIn[9];
		16:		dataOut[26] = dataIn[10];
		17:		dataOut[26] = dataIn[11];
		18:		dataOut[26] = dataIn[12];
		19:		dataOut[26] = dataIn[13];
		20:		dataOut[26] = dataIn[14];
		21:		dataOut[26] = dataIn[15];
		22:		dataOut[26] = dataIn[16];
		23:		dataOut[26] = dataIn[17];
		24:		dataOut[26] = dataIn[18];
		25:		dataOut[26] = dataIn[19];
		26:		dataOut[26] = dataIn[20];
		27:		dataOut[26] = dataIn[21];
		28:		dataOut[26] = dataIn[22];
		29:		dataOut[26] = dataIn[23];
		30:		dataOut[26] = dataIn[24];
		31:		dataOut[26] = dataIn[25];
		default:dataOut[26] = 0;
		endcase
	end
	////////////////////////27/////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[27] = dataIn[27];
		1:		dataOut[27] = dataIn[28];
		2:		dataOut[27] = dataIn[29];
		3:		dataOut[27] = dataIn[30];
		4:		dataOut[27] = dataIn[31];
		5:		dataOut[27] = dataIn[0];
		6:		dataOut[27] = dataIn[1];
		7:		dataOut[27] = dataIn[2];
		8:		dataOut[27] = dataIn[3];
		9:		dataOut[27] = dataIn[4];
		10:		dataOut[27] = dataIn[5];
		11:		dataOut[27] = dataIn[6];
		12:		dataOut[27] = dataIn[7];
		13:		dataOut[27] = dataIn[8];
		14:		dataOut[27] = dataIn[9];
		15:		dataOut[27] = dataIn[10];
		16:		dataOut[27] = dataIn[11];
		17:		dataOut[27] = dataIn[12];
		18:		dataOut[27] = dataIn[13];
		19:		dataOut[27] = dataIn[14];
		20:		dataOut[27] = dataIn[15];
		21:		dataOut[27] = dataIn[16];
		22:		dataOut[27] = dataIn[17];
		23:		dataOut[27] = dataIn[18];
		24:		dataOut[27] = dataIn[19];
		25:		dataOut[27] = dataIn[20];
		26:		dataOut[27] = dataIn[21];
		27:		dataOut[27] = dataIn[22];
		28:		dataOut[27] = dataIn[23];
		29:		dataOut[27] = dataIn[24];
		30:		dataOut[27] = dataIn[25];
		31:		dataOut[27] = dataIn[26];
		default:dataOut[27] = 0;
		endcase
	end
	////////////////////////28/////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[28] = dataIn[28];
		1:		dataOut[28] = dataIn[29];
		2:		dataOut[28] = dataIn[30];
		3:		dataOut[28] = dataIn[31];
		4:		dataOut[28] = dataIn[0];
		5:		dataOut[28] = dataIn[1];
		6:		dataOut[28] = dataIn[2];
		7:		dataOut[28] = dataIn[3];
		8:		dataOut[28] = dataIn[4];
		9:		dataOut[28] = dataIn[5];
		10:		dataOut[28] = dataIn[6];
		11:		dataOut[28] = dataIn[7];
		12:		dataOut[28] = dataIn[8];
		13:		dataOut[28] = dataIn[9];
		14:		dataOut[28] = dataIn[10];
		15:		dataOut[28] = dataIn[11];
		16:		dataOut[28] = dataIn[12];
		17:		dataOut[28] = dataIn[13];
		18:		dataOut[28] = dataIn[14];
		19:		dataOut[28] = dataIn[15];
		20:		dataOut[28] = dataIn[16];
		21:		dataOut[28] = dataIn[17];
		22:		dataOut[28] = dataIn[18];
		23:		dataOut[28] = dataIn[19];
		24:		dataOut[28] = dataIn[20];
		25:		dataOut[28] = dataIn[21];
		26:		dataOut[28] = dataIn[22];
		27:		dataOut[28] = dataIn[23];
		28:		dataOut[28] = dataIn[24];
		29:		dataOut[28] = dataIn[25];
		30:		dataOut[28] = dataIn[26];
		31:		dataOut[28] = dataIn[27];
		default:dataOut[28] = 0;
		endcase
	end
	///////////////////////29//////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[29] = dataIn[29];
		1:		dataOut[29] = dataIn[30];
		2:		dataOut[29] = dataIn[31];
		3:		dataOut[29] = dataIn[0];
		4:		dataOut[29] = dataIn[1];
		5:		dataOut[29] = dataIn[2];
		6:		dataOut[29] = dataIn[3];
		7:		dataOut[29] = dataIn[4];
		8:		dataOut[29] = dataIn[5];
		9:		dataOut[29] = dataIn[6];
		10:		dataOut[29] = dataIn[7];
		11:		dataOut[29] = dataIn[8];
		12:		dataOut[29] = dataIn[9];
		13:		dataOut[29] = dataIn[10];
		14:		dataOut[29] = dataIn[11];
		15:		dataOut[29] = dataIn[12];
		16:		dataOut[29] = dataIn[13];
		17:		dataOut[29] = dataIn[14];
		18:		dataOut[29] = dataIn[15];
		19:		dataOut[29] = dataIn[16];
		20:		dataOut[29] = dataIn[17];
		21:		dataOut[29] = dataIn[18];
		22:		dataOut[29] = dataIn[19];
		23:		dataOut[29] = dataIn[20];
		24:		dataOut[29] = dataIn[21];
		25:		dataOut[29] = dataIn[22];
		26:		dataOut[29] = dataIn[23];
		27:		dataOut[29] = dataIn[24];
		28:		dataOut[29] = dataIn[25];
		29:		dataOut[29] = dataIn[26];
		30:		dataOut[29] = dataIn[27];
		31:		dataOut[29] = dataIn[28];
		default:dataOut[29] = 0;
		endcase
	end
	////////////////////////30/////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[30] = dataIn[30];
		1:		dataOut[30] = dataIn[31];
		2:		dataOut[30] = dataIn[0];
		3:		dataOut[30] = dataIn[1];
		4:		dataOut[30] = dataIn[2];
		5:		dataOut[30] = dataIn[3];
		6:		dataOut[30] = dataIn[4];
		7:		dataOut[30] = dataIn[5];
		8:		dataOut[30] = dataIn[6];
		9:		dataOut[30] = dataIn[7];
		10:		dataOut[30] = dataIn[8];
		11:		dataOut[30] = dataIn[9];
		12:		dataOut[30] = dataIn[10];
		13:		dataOut[30] = dataIn[11];
		14:		dataOut[30] = dataIn[12];
		15:		dataOut[30] = dataIn[13];
		16:		dataOut[30] = dataIn[14];
		17:		dataOut[30] = dataIn[15];
		18:		dataOut[30] = dataIn[16];
		19:		dataOut[30] = dataIn[17];
		20:		dataOut[30] = dataIn[18];
		21:		dataOut[30] = dataIn[19];
		22:		dataOut[30] = dataIn[20];
		23:		dataOut[30] = dataIn[21];
		24:		dataOut[30] = dataIn[22];
		25:		dataOut[30] = dataIn[23];
		26:		dataOut[30] = dataIn[24];
		27:		dataOut[30] = dataIn[25];
		28:		dataOut[30] = dataIn[26];
		29:		dataOut[30] = dataIn[27];
		30:		dataOut[30] = dataIn[28];
		31:		dataOut[30] = dataIn[29];
		default:dataOut[30] = 0;
		endcase
	end
	///////////////////////31//////////////////////////////////
	always_comb begin
		case(n)
		0:		dataOut[31] = dataIn[31];
		1:		dataOut[31] = dataIn[0];
		2:		dataOut[31] = dataIn[1];
		3:		dataOut[31] = dataIn[2];
		4:		dataOut[31] = dataIn[3];
		5:		dataOut[31] = dataIn[4];
		6:		dataOut[31] = dataIn[5];
		7:		dataOut[31] = dataIn[6];
		8:		dataOut[31] = dataIn[7];
		9:		dataOut[31] = dataIn[8];
		10:		dataOut[31] = dataIn[9];
		11:		dataOut[31] = dataIn[10];
		12:		dataOut[31] = dataIn[11];
		13:		dataOut[31] = dataIn[12];
		14:		dataOut[31] = dataIn[13];
		15:		dataOut[31] = dataIn[14];
		16:		dataOut[31] = dataIn[15];
		17:		dataOut[31] = dataIn[16];
		18:		dataOut[31] = dataIn[17];
		19:		dataOut[31] = dataIn[18];
		20:		dataOut[31] = dataIn[19];
		21:		dataOut[31] = dataIn[20];
		22:		dataOut[31] = dataIn[21];
		23:		dataOut[31] = dataIn[22];
		24:		dataOut[31] = dataIn[23];
		25:		dataOut[31] = dataIn[24];
		26:		dataOut[31] = dataIn[25];
		27:		dataOut[31] = dataIn[26];
		28:		dataOut[31] = dataIn[27];
		29:		dataOut[31] = dataIn[28];
		30:		dataOut[31] = dataIn[29];
		31:		dataOut[31] = dataIn[30];
		default:dataOut[31] = 0;
		endcase
	end

	
endmodule





















