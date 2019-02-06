`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: D_ff_with_ce_and_synch_reset_behavior_tb
//////////////////////////////////////////////////////////////////////////////////

module D_ff_with_ce_and_synch_reset_behavior_tb(
    );
    
   reg D, Clk, ce, reset;
   wire Q;
   
   D_ff_with_ce_and_synch_reset_behavior DUT(.D(D), .Clk(Clk), .reset(reset), .ce(ce), .Q(Q));
   initial
   begin
       Clk = 0;
       forever
       begin
         #10 Clk = 1;
         #10 Clk = 0;
       end
   end
   
   initial
   begin
     D = 0; reset = 0; ce = 0;
     #20 D = 1;
     #40 ce = 1;
     #20 ce = 0;
     #20 D = 0;
     #20 reset = 1;
     #20 reset = 0;
     #40 ce = 1;
     #20 ce = 0;
     #20 D = 1;
     #40 ce = 1;
     #20 ce = 0;
   end   
endmodule
