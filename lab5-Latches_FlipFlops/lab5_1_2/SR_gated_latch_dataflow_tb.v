`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: SR_gated_latch_dataflow_tb
/////////////////////////////////////////////////////////////////

module SR_gated_latch_dataflow_tb(

    );
    
    reg R, S, Enable;
    wire Q, Qbar;
    
    SR_gated_latch_dataflow DUT (.R(R), .S(S), .Enable(Enable), .Q(Q), .Qbar(Qbar));
    
    initial
    begin
        S=0; R=0; Enable=0;
        #10 S=1;
        #10 Enable=1;
        #10 S=0; 
        #10 R=1;
        #10 Enable=0;
        #10 S=1; R=0;
        #10 S=0; R=1;
        #10 S=1; R=0;
        #10 Enable=1;
        #10 S=0; R=1;
        #10 S=1; R=1;
    end
endmodule
