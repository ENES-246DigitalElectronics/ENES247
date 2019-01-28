`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: D_latch_dataflow_tb
/////////////////////////////////////////////////////////////////

module D_latch_dataflow_tb(

    );
    
    reg D, Enable;
    wire Q, Qbar;
    
    D_latch_dataflow DUT (.D(D), .Enable(Enable), .Q(Q), .Qbar(Qbar));
    
    initial
    begin
        D=0; Enable=0;
        #10 D=1;
        #10 Enable=1;
        #10 D=0; 
        #10 D=1; 
        #10 Enable=0;
        #10 D=0; 
        #10 D=1; 
        #10 D=0; 
        #10 Enable=1;
        #10 D=1; 
        #10 D=0; 
    end
endmodule
