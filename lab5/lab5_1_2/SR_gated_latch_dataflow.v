`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: SR_gated_latch_dataflow
/////////////////////////////////////////////////////////////////

module SR_gated_latch_dataflow(
    input R,
    input S,
    input Enable,
    output Q,
    output Qbar
    );
    
    assign #2 R_i = R & Enable;
    assign #2 S_i = S & Enable;
    assign #2 Q_i = Q;
    assign #2 Qbar_i = Qbar; 
    assign #2 Q = ~ (R_i | Qbar_i);
    assign #2 Qbar = ~ (S_i | Q_i);

endmodule
