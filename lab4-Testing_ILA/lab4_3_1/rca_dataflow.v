`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: rca_dataflow
/////////////////////////////////////////////////////////////////

module rca_dataflow(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] s,
    output cout
    );
        
	wire [3:0] cout_i;

	assign #2 cout = cout_i[3];

	fulladder_dataflow F0 (.a(a[0]), .b(b[0]), .cin(cin), .s(s[0]), .cout(cout_i[0]));
	fulladder_dataflow F1 (.a(a[1]), .b(b[1]), .cin(cout_i[0]), .s(s[1]), .cout(cout_i[1]));
	fulladder_dataflow F2 (.a(a[2]), .b(b[2]), .cin(cout_i[1]), .s(s[2]), .cout(cout_i[2]));
	fulladder_dataflow F3 (.a(a[3]), .b(b[3]), .cin(cout_i[2]), .s(s[3]), .cout(cout_i[3]));

endmodule