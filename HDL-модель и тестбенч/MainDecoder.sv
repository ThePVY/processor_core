module MainDecoder	(input logic [4:0]cmd,
					output logic [12:0]out);
							
		
	always_comb begin
		case ( cmd )
			5'd0:		out = 13'd6;
			5'd1:		out = 13'd1;
			5'd2:		out = 13'd130;
			5'd3:		out = 13'd2;
			5'd4: 		out = 13'd14;
			5'd5:		out = 13'd298;
			5'd6:		out = 13'd554;
			5'd7:		out = 13'd810;
			5'd8:		out = 13'd1066;
			5'd9:		out = 13'd1322;
			5'd10:		out = 13'd1610;
			5'd11:		out = 13'd1866;
			5'd12:		out = 13'd2058;
			5'd13: 		out = 13'd4096;
			5'd14:		out = 13'd2320;
			default: 	out = 13'd0;
		endcase
	end


endmodule



 








