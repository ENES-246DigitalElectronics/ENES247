`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: down_counter_asynLoad_syncCE
//////////////////////////////////////////////////////////////////////////////////
module down_counter_asynLoad_syncCE #(parameter COUNTER_SIZE = 8)    
    (input clk,
    input load,
    input ce,
    input  [COUNTER_SIZE-1:0] count_input,
    output reg [COUNTER_SIZE-1:0] count
    );
       
    always @(posedge clk or posedge load)
       if (load)
          count <= count_input;
       else if (ce)
              count <= count - 1;

endmodule
