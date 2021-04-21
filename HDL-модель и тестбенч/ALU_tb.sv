`timescale 1ps/1ps
module decoderLDI_tb();
	logic [31:0]dataIn0;
	logic [31:0]dataIn1;
	logic [3:0]ctrlALU;
	logic cmp;
	logic [31:0]dataOut;
							
		
	ALU alu(dataIn0,dataIn1,ctrlALU,cmp,dataOut);
	
	initial begin
		dataIn0 = 8;
		dataIn1 = 5;
		ctrlALU = 0;
	end
	
	always begin
		#50;
		ctrlALU = ctrlALU + 1;
		if(ctrlALU==10) begin
			ctrlALU = 9;
			dataIn0 = 10;
			dataIn1 = 5;
			#50;
			dataIn0 = 5;
			dataIn1 = 5;
			#50;
			ctrlALU = 0;
			dataIn0 = 8;
			dataIn1 = 5;
		end
	end

endmodule