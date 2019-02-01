`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: fulladder_dataflow
/////////////////////////////////////////////////////////////////

module fulladder_dataflow(
    input a,
    input b,
    input cin,
    output s,
    output cout
    );
        
	wire axorb;

	assign s = a ^ b ^ cin;
	assign cout = (a & b) | (a & cin) | (b & cin);

endmodule