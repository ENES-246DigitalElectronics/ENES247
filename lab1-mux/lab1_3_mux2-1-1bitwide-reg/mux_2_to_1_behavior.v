`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: mux_2_to_1_behavior
/////////////////////////////////////////////////////////////////

module mux_2_to_1_behavior(
    input x,
    input y,
    input s,
    output m
    );
      
	reg m;
	always @ (x or y or s)
	begin
          if(s==0)
             m=y;
          else
             m=x;
	end

endmodule
