`timescale 1ps/1ps
module RAM #(parameter N = 8, M = 32)
				(
					input logic clk,
					input logic we,
					input logic [N-1:0]addr,
					input logic [M-1:0]dataIn,
					output logic [M-1:0]dataOut
				);
				
				
	logic [M-1:0]mem[2**N-1:0];
				
	always_ff @(posedge clk) begin
		if(we) mem[addr] <= dataIn;
	end
	
	assign dataOut = mem[addr];
				
endmodule 