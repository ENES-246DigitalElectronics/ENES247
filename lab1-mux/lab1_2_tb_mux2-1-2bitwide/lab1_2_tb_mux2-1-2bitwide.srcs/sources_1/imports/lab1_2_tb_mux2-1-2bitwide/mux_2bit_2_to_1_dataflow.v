`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: mux_2bit_2_to_1_dataflow
/////////////////////////////////////////////////////////////////

module mux_2bit_2_to_1_dataflow(
    input [1:0] x,
    input [1:0] y,
    input s,
    output [1:0] m
    );
      
   
	assign #3 m[1] = (~s & x[1]) | (s & y[1]);  // 3 units delay
	assign #3 m[0] = (~s & x[0]) | (s & y[0]);  // 3 units delay

endmodule
