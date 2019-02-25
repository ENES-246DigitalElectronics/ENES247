`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: clk_divider_1hz_behavior
// Expected input clock of 5 MHz
// To generate rising edge every 1 second, toggle at 0.5 sec = 23'h2625A0
//////////////////////////////////////////////////////////////////////////////////

module clk_divider_1hz_behavior(
    input Clk,
    input reset,
    input enable,
    output reg Q
    );
    
       parameter TERMINAL_COUNT = 23'h2625A0;
       reg [22:0] count;
       wire count_done;;

       assign count_done = (count == TERMINAL_COUNT);

       always @(posedge Clk)
       if (reset) 
       begin
          Q <= 1'b0;
          count <= 0;
       end else if (count_done)
       begin
          Q <= ~Q;
          count <= 0;
       end else if(enable)
       begin
          count <= count + 1;
       end
       else
          count <= count;

endmodule
