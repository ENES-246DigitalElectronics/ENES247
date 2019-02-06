`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: SR_latch_gate
/////////////////////////////////////////////////////////////////

module SR_latch_gate(
    input S,
    input R,
    output Q,
    output Qbar
    );
      
    nor (Q_i, R, Qbar);
    nor (Qbar_i, S, Q);

endmodule
