`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: clk_divider_behavior
//////////////////////////////////////////////////////////////////////////////////

module clk_divider_behavior(
    input Clk,
    input reset,
    input enable,
    output reg Q
    );
    
       reg [22:0] count;

       always @(posedge Clk or posedge reset)
       if (reset) 
       begin
          Q <= 1'b0;
          count <= 0;
       end else if (count[22])
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
