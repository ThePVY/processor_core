module ROM(input logic [10:0]adr,
            output logic[31:0]dout);

always_comb begin
    case(adr)
        11'd0:    dout <= 32'd66019;
        11'd1:    dout <= 32'd655875;
        11'd2:    dout <= 32'd16869;
        11'd3:    dout <= 32'd131555;
        11'd4:    dout <= 32'd655875;
        11'd5:    dout <= 32'd16869;
        default:    dout <= 0;
    endcase
end 
endmodule 
