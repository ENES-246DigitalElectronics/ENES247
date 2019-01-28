`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: two_bcd_2_7segment_display
/////////////////////////////////////////////////////////////////

module two_bcd_2_7segment_display(
    input [3:0] lsn,
    input [3:0] msn,
	input [3:0] an,
    output reg [6:0] seg
    );
        
    wire [6:0] seg0, seg1;

	bcdto7segment_dataflow U2 (.x(lsn), .seg(seg0));  // right most 7-segment display
    bcdto7segment_dataflow U3 (.x(msn), .seg(seg1));  // 2nd from right 7-segment display

    always @(an or seg0 or seg1)
    case(an)
        8'b1110 : seg = {1'b1,seg0};
        8'b1101 : seg = {1'b1,seg1};
        default : seg = {8'hff}; // turn OFF
    endcase

endmodule