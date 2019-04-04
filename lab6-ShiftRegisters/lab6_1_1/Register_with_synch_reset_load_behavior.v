`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: Register_with_synch_reset_load_behavior
//////////////////////////////////////////////////////////////////////////////////

module Register_with_synch_reset_load_behavior(
    input Clk,
    input [3:0] D,
    input reset,
    input load,
    output reg [3:0] Q
    );
    
   always @(posedge Clk) if (load)  Q <= 4'b0; else if (reset) Q <= D;

endmodule
