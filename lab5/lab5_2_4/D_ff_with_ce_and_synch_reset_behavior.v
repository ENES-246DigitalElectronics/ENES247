`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: D_ff_with_ce_and_synch_reset_behavior
//////////////////////////////////////////////////////////////////////////////////

module D_ff_with_ce_and_synch_reset_behavior(
    input Clk,
    input D,
    input ce,
    input reset,
    output reg Q
    );

   always @(posedge Clk)
   if (reset) 
   begin
      Q <= 1'b0;
   end else if (ce)
   begin
      Q <= D;
   end 
endmodule
