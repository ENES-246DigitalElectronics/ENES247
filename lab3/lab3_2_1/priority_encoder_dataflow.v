`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: priority_encoder_dataflow
/////////////////////////////////////////////////////////////////

module priority_encoder_dataflow(
    input en_in_n,
	input [7:0] x,
	output en_out,
	output gs,
    output [2:0] y
    );
        
	wire [2:0] y_i;

	assign y = (en_out) ? y_i : 3'b111;
	assign en_out = (~en_in_n & &x) ? 1'b0 : 1'b1;
	assign gs = (en_in_n | &x) ? 1'b1 : 1'b0;
	
	assign y_i = (!x[7]) ? 3'b000 :
				(!x[6]) ? 3'b001 :
				(!x[5]) ? 3'b010 :
				(!x[4]) ? 3'b011 :
				(!x[3]) ? 3'b100 :
				(!x[2]) ? 3'b101 :
				(!x[1]) ? 3'b110 :
				(!x[0]) ? 3'b111 : 3'b111;
endmodule