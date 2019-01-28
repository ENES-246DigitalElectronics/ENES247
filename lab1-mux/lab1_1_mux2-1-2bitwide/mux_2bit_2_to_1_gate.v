`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: mux_2bit_2_to_1_gate
/////////////////////////////////////////////////////////////////

module mux_2bit_2_to_1_gate(
    input [1:0] x,
    input [1:0] y,
    input s,
    output [1:0] m
    );
      
    wire sbar;
    wire [1:0] x_i, y_i;
    
    not (sbar,s);
    and (x_i[1], x[1], sbar);
    and (y_i[1], y[1], s);
    or (m[1], x_i[1], y_i[1]);
    and (x_i[0], x[0], sbar);
    and (y_i[0], y[0], s);
    or (m[0], x_i[0], y_i[0]);

endmodule
