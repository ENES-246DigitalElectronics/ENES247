`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: cla_dataflow
/////////////////////////////////////////////////////////////////

module cla_dataflow(
    input [3:0] p,
    input [3:0] g,
    input cin,
    output [3:0] cout
    );
        
	assign cout[0] = g[0] | (p[0] & cin);
	assign cout[1] = g[1] | (p[1] & cout[0]);
	assign cout[2] = g[2] | (p[2] & cout[1]);
	assign cout[3] = g[3] | (p[3] & cout[2]);

endmodule