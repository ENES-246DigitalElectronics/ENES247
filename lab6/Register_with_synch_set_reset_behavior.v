`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: Register_with_synch_set_reset_behavior
//////////////////////////////////////////////////////////////////////////////////

module Register_with_synch_set_reset_behavior(
    input [3:0] D,
    input set,
    input reset,
    input Clk,
    output reg [3:0] Q
    );
    
       always @(posedge Clk)
       if (reset) 
       begin
          Q <= 4'b0;
       end else if (set)
       begin
         Q <= 4'b1111;
       end else
       begin
          Q <= D;
       end

endmodule
