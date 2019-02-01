`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: lab2_3_2_dataflow_tb
/////////////////////////////////////////////////////////////////

module lab2_3_2_dataflow_tb(
	);

    reg [3:0] a,b;
    reg cin;
    wire [6:0] seg0;
    wire [3:0] an;
    wire [1:0] m_s_digit;
        
	lab2_3_2_dataflow DUP (.a(a), .b(b), .cin(cin), .seg0(seg0), .an(an), .m_s_digit(m_s_digit);

	initial
	begin

	end

endmodule