`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: two_digits_counter_on_2_7segment_display
/////////////////////////////////////////////////////////////////

module two_digits_counter_on_2_7segment_display(
    input clkin,
    input reset,
    input enable,
    output locked,
	output [3:0] an,
    output [6:0] seg
    );
        
	wire [3:0] m_lsn, m_msn; // least significant nibble and most significant nibbles in bcd
	wire clk_1hz;
	wire Clk, thresh0;
	
	wire [3:0] an;

	clk_5MHz U1 (.clk_in1(clkin), .clk_out1(Clk), .locked(locked));     
	clk_divider_1hz_behavior U2 (.Clk(Clk), .reset(0), .enable(enable), .Q(clk_1hz));
	// set the restrict count to 9 and sync threshold output to 9 in the IP generator
	four_bit_counter_fabric U3 (.CLK(clk_1hz), .CE(enable), .SCLR(reset), .THRESH0(thresh0), .Q(m_lsn));
	four_bit_counter_fabric U4 (.CLK(clk_1hz), .CE(thresh0), .SCLR(reset), .Q(m_msn));
	clk_divider_about_500hz_refresh_rate_2display U7(.Clk(Clk), .reset(reset), .an(an));
	two_bcd_2_7segment_display U8(.lsn(m_lsn), .msn(m_msn), .an(an), .seg(seg));

endmodule