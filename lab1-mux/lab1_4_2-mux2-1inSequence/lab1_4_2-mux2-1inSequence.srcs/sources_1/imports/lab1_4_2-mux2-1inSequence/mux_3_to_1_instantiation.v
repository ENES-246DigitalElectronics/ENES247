`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: mux_3_to_1_instantiation
/////////////////////////////////////////////////////////////////

module mux_3_to_1_instantiation(
    input u,
    input v,
    input w,
    input s0,
    input s1,
    output m
    );
      
    wire u1_o;
    
    mux_2_to_1_gate U1 (.x(u), .y(v), .s(s0), .m(u1_o));
    mux_2_to_1_gate U2 (.x(u1_o), .y(w), .s(s1), .m(m));

endmodule
