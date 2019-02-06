`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: D_ff_sync_reset_behavior
//////////////////////////////////////////////////////////////////////////////////

module D_ff_sync_reset_behavior(
    input Clk,
    input D,
    input reset,
    output reg Q
    );
    
       always @(posedge Clk)
       if (reset) 
       begin
          Q <= 1'b0;
       end else 
       begin
          Q <= D;
       end

endmodule
