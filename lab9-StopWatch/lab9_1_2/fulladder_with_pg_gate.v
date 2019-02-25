`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: fulladder_with_pg_gate
/////////////////////////////////////////////////////////////////

module fulladder_with_pg_gate(
    input a,
    input b,
    input cin,
    output p,
    output g,
    output s
    );
        
parameter AND_DELAY=2, OR_DELAY=2, XOR_DELAY=2;
wire s_1;

	xor #XOR_DELAY U1(s_1, a, b);
     xor #XOR_DELAY U2(s, s_1, cin);
	or #OR_DELAY U3(p, a, b);
	and #AND_DELAY U4 (g, a, b);

endmodule