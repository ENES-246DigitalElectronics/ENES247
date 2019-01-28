`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: mux_2bit_2_to_1_behavior
/////////////////////////////////////////////////////////////////

module mux_2bit_2_to_1_behavior(
    input [1:0] x,
    input [1:0] y,
    input s,
    output reg [1:0] m
    );
      
   
	always @ (x or y or s)
	begin
          if(s==0)
             m=y;
          else
             m=x;
	end

endmodule
