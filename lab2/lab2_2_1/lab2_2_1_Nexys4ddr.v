`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: lab2_2_1
/////////////////////////////////////////////////////////////////

module lab2_2_1(
    input [3:0] v,
    output z,
	output [7:0] an,
    output [6:0] seg0
    );
        
	wire [3:0] m;

	lab2_2_1_partA U1 (.v(v), .z(z), .m_out(m));
	bcdto7segment_dataflow U2 (.x(m), .an(an[3:0]), .seg(seg0)
	);
	assign an[7:4] = 4'b1111;
	
endmodule