`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: fulladder_with_pg_dataflow
/////////////////////////////////////////////////////////////////

module fulladder_with_pg_dataflow(
    input a,
    input b,
    input cin,
    output p,
    output g,
    output s
    );
        
	assign s = a ^ b ^ cin;
	assign p = a | b;
	assign g = a & b;

endmodule