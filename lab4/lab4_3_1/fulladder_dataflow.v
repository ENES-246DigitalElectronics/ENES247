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
        
	assign #2 s = a ^ b ^ cin;
	assign #2 cout = (a & b) | (a & cin) | (b & cin);

endmodule