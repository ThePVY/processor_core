`timescale 1ps/1ps
module decoderLDI #(parameter N = 16)
												(input logic [N-1:0] data,
												input logic  switch,
												output logic [N*2-1:0] dataOut);
		logic [N*2-1:0]high;
		logic [N*2-1:0]low;		
		
		assign high[31:16] = data;
		assign high[15:0] = 0;
		
		assign low[31:16] = 0;
		assign low[15:0] = data;
		
		always_comb begin
			case(switch)
				1'b1:	dataOut = high;
				1'b0:	dataOut = low;
			endcase
		
		end


		

endmodule


