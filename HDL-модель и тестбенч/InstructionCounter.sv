module InstructionCounter #(parameter N = 32)
									(input logic clk,
									input logic reset,
									input logic [15:0]shift,
									input logic MD_mux0_ctrl,
									input logic MD_mux1_ctrl,
									input logic ALU_mux1_ctrl,
									output logic [10:0]out);
	
	logic [N-1:0]flop_in;
	logic [N-1:0]flop_out;
	flop flop_instance(.clk(clk), .enable(1'd1), .reset(reset), .d(flop_in), .q(flop_out));
	
	assign out = flop_out[10:0];
	
	logic [N-1:0]ADDER_out;
	Adder adder_instance(flop_out, 32'd1, ADDER_out);
	
	logic mux0_out;
	always_comb begin
		case(MD_mux0_ctrl)
			1'b1:		mux0_out = ALU_mux1_ctrl;		
			1'b0:		mux0_out = MD_mux1_ctrl;
		endcase 
	end
	
	logic [N-1:0]mux1_out;
	logic [N-1:0]mux1_in1;
	assign mux1_in1[N-1:16] = 0;
	assign mux1_in1[15:0] = shift;
	always_comb begin
		case(mux0_out)
			1'b1:		mux1_out = mux1_in1;		
			1'b0:		mux1_out = ADDER_out;
		endcase 
	end
	
	assign flop_in = mux1_out;
								
									
endmodule 



module Flop #(parameter N = 32)
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


module Adder (input logic [31:0]a,
					input logic [31:0]b,
					output logic [31:0]y);
	assign y = a + b;
					
endmodule



