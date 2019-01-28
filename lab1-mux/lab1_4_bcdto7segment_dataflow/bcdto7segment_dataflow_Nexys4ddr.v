`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: bcdto7segment_dataflow
/////////////////////////////////////////////////////////////////

module bcdto7segment_dataflow(
    input [3:0] x,
    output [7:0] an,
    output [6:0] seg
    );
      
   
    assign an[7] = 1'b1;
    assign an[6] = 1'b1;
    assign an[5] = 1'b1;
    assign an[4] = 1'b1;
    assign an[3] = 1'b1;
	assign an[2] = 1'b1;
	assign an[1] = 1'b1;
	assign an[0] = 1'b0;

	assign seg[6] = (~x[3] & ~x[2] & ~x[1]) | (x[2] & x[1] & x[0]);  // seg g or 6
	assign seg[5] = (~x[3] & ~x[2] & x[0]) | (x[1] & x[0]) | (~x[3] & ~x[2] & x[1]);  // seg f or 5
	assign seg[4] = x[0] | (x[2] & ~x[1]);  // seg e or 4
	assign seg[3] = (x[2] & ~x[1] & ~x[0]) | (x[2] & x[1] & x[0]) | (~x[3] & ~x[2] & ~x[1] & x[0]);  // seg d or 3
	assign seg[2] = ~x[2] & x[1] & ~x[0];  // seg c or 2
	assign seg[1] = (x[2] & ~x[1] & x[0]) | (x[2] & x[1] & ~x[0]);  // seg b or 1
	assign seg[0] = (x[2] & ~x[1] & ~x[0]) | (~x[3] & ~x[2] & ~x[1] & x[0]);  // seg a or 0

endmodule
