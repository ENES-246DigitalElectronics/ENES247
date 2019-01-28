`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: binaryto7segment
/////////////////////////////////////////////////////////////////

module binaryto7segment(
    output [7:0] an,
    output [6:0] seg
    );
      
	wire [3:0] x = 4'b1001;
   
	bcdto7segment_dataflow U1 (
        .x(x), 
        .an(an[3:0]), 
        .seg(seg)
    );
    assign an[7:4] = 4'b1111;
endmodule