`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: Register_with_synch_set_reset_load_behavior
//////////////////////////////////////////////////////////////////////////////////

module Register_with_synch_set_reset_load_behavior(
    input Clk,
    input [3:0] D,
    input set,
    input reset,
    input load,
    output reg [3:0] Q
    );
    
   always @(posedge Clk)
   if (reset) 
      Q <= 4'b0;
   else if (set)
     Q <= 4'b1111;
   else if (load)
     Q <= D;
endmodule
