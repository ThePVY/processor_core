module Reset(input logic clk,
				 output logic reset);
	
	logic [3:0]out;
	logic d;
	ShiftRegister shiftRegister(clk, d, out);
	
	logic mux1_out;
	always_comb begin
		case(out)
			4'b0001: 	mux1_out = 0;
			4'b0011:		mux1_out = 0;
			4'b0111:		mux1_out = 0;
			4'b1111:		mux1_out = 0;
			default: 	mux1_out = 1;
		endcase
	end
	
	always_comb begin
		case(mux1_out)
			1:  	d = 0;
			0: 	d = 1;
		endcase
	end
	
	assign reset = ~out[3];

endmodule 

module ShiftRegister(input logic clk,
							input logic d,
							output logic [3:0]out);
			
	always_ff@(posedge clk) begin
		out <= d ? {out[2:0],1'b1} : 4'b0001; 
	end
							
							
							
endmodule 