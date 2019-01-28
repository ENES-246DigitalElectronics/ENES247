`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: mux_2_to_1_gate
/////////////////////////////////////////////////////////////////

module mux_2_to_1_gate(
    input x,
    input y,
    input s,
    output m
    );
      
    wire sbar, x_i, y_i;
    
    not (sbar,s);
    and (x_i, x, sbar);
    and (y_i, y, s);
    or (m, x_i, y_i);

endmodule
