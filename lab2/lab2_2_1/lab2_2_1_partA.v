`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: lab2_2_1_partA
/////////////////////////////////////////////////////////////////

module lab2_2_1_partA(
    input [3:0] v,
    output z,
    output [3:0] m_out
    );
        
	wire [2:0] v_out;
	wire [2:0] m;

	comparator_dataflow U1 (.v(v), .z(z));
	lab2_circuitA_dataflow U2 (.v_in(v[2:0]), .v_out(v_out));
	mux_2_to_1_behavior U3 (.x(v[3]), .y(1'b0), .s(z), .m(m_out[3]));
	mux_2_to_1_behavior U4 (.x(v[2]), .y(v_out[2]), .s(z), .m(m_out[2]));
	mux_2_to_1_behavior U5 (.x(v[1]), .y(v_out[1]), .s(z), .m(m_out[1]));
	mux_2_to_1_behavior U6 (.x(v[0]), .y(v_out[0]), .s(z), .m(m_out[0]));

endmodule