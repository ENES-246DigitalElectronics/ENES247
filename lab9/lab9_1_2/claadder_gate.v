`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: claadder_gate
/////////////////////////////////////////////////////////////////

module claadder_gate(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] s,
    output cout
    );
        
	wire [3:0] p, g, cout_i;

	assign cout = cout_i[3];

	fulladder_with_pg_gate F0 (.a(a[0]), .b(b[0]), .cin(cin), .p(p[0]), .g(g[0]), .s(s[0]));
	fulladder_with_pg_gate F1 (.a(a[1]), .b(b[1]), .cin(cout_i[0]), .p(p[1]), .g(g[1]), .s(s[1]));
	fulladder_with_pg_gate F2 (.a(a[2]), .b(b[2]), .cin(cout_i[1]), .p(p[2]), .g(g[2]), .s(s[2]));
	fulladder_with_pg_gate F3 (.a(a[3]), .b(b[3]), .cin(cout_i[2]), .p(p[3]), .g(g[3]), .s(s[3]));

	cla_gate C1 (.p(p), .g(g), .cin(cin), .cout(cout_i));

endmodule