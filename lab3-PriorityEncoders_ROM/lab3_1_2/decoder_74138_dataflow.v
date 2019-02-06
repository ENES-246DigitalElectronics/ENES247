`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: decoder_74138_dataflow
/////////////////////////////////////////////////////////////////

module decoder_74138_dataflow(
    input g1,
    input g2a_n,
    input g2b_n,
    input [2:0] x,
    output [7:0] y
    );
        
	wire [7:0] y_i;
	wire [2:0] reverse_x;  // nneded as decoder_3to8_dataflow needs it as 0:2

	assign reverse_x[2] = x[0];
	assign reverse_x[1] = x[1];
	assign reverse_x[0] = x[2];
	assign enable = g1 & ~g2a_n & ~g2b_n;
	assign y = enable ? ~y_i : 8'hff;
	decoder_3to8_dataflow U1 (.x(reverse_x), .y(y_i));

endmodule