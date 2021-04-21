`timescale 1ps/1ps
module TopLevel_tb();
	logic clk;
	//logic [31:0]dataIn0;
	//logic [31:0]dataIn1;
	//logic [3:0]ctrlALU;
	//logic cmp;
	logic [31:0]out;
							
		
	TopLevel TL(.clk(clk), .z_ALU_out(out));
	
	initial begin
		clk = 0;
	end
	
	always begin
		#50;
		clk = ~clk;
	end

endmodule 