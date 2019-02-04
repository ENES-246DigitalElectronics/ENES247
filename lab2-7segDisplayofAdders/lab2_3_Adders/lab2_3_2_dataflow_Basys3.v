`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: lab2_3_2_dataflow
/////////////////////////////////////////////////////////////////

module lab2_3_2_dataflow(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [6:0] seg0,
    output [3:0] an,
    output m_s_digit
    );
        
	wire [3:0] rca_s, rca_s6, bcd_out;
	wire rca_cout, gt_9;

	assign gt_9 = (rca_s > 9) ? 1'b1 : 1'b0;
	assign m_s_digit = rca_cout | gt_9;

	rca_dataflow R1 (.a(a), .b(b), .cin(cin), .s(rca_s), .cout(rca_cout));
	rca_dataflow R2 (.a(rca_s), .b(4'b0110), .cin(1'b0), .s(rca_s6));
	mux_2_to_1_behavior U1 (.x(rca_s[3]), .y(rca_s6[3]), .s(m_s_digit), .m(bcd_out[3]));
    mux_2_to_1_behavior U2 (.x(rca_s[2]), .y(rca_s6[2]), .s(m_s_digit), .m(bcd_out[2]));
    mux_2_to_1_behavior U3 (.x(rca_s[1]), .y(rca_s6[1]), .s(m_s_digit), .m(bcd_out[1]));
    mux_2_to_1_behavior U4 (.x(rca_s[0]), .y(rca_s6[0]), .s(m_s_digit), .m(bcd_out[0]));
	bcdto7segment_dataflow B1 (.x(bcd_out), .an(an), .seg(seg0));
	
endmodule