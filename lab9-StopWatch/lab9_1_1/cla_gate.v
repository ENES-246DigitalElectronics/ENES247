`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: cla_gate
/////////////////////////////////////////////////////////////////

module cla_gate(
    input [3:0] p,
    input [3:0] g,
    input cin,
    output [3:0] cout
    );

parameter AND_DELAY=2, OR_DELAY=2, XOR_DELAY=2;
wire cout_0_i, cout_1_i, cout_2_i, cout_3_i;
        
and #AND_DELAY (cout_0_i, p[0], cin);
or #OR_DELAY (cout[0], cout_0_i, g[0]);

and #AND_DELAY (cout_1_i, p[1], cout[0]);
or #OR_DELAY (cout[1], cout_1_i, g[1]);

and #AND_DELAY (cout_2_i, p[2], cout[1]);
or #OR_DELAY (cout[2], cout_2_i, g[2]);

and #AND_DELAY (cout_3_i, p[3], cout[2]);
or #OR_DELAY (cout[3], cout_3_i, g[3]);

endmodule