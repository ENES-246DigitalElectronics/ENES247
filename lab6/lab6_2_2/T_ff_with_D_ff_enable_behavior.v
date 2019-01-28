`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: T_ff_enable_behavior
//////////////////////////////////////////////////////////////////////////////////

module T_ff_D_ff_enable_behavior(input Clk, input reset_n, input T, output Q);

	wire reset, D;
	assign reset=~reset_n;
	assign D = T ^ Q;

    D_ff_sync_reset_behavior D1 (.D(D), .Clk(Clk), .reset(reset), .Q(Q));

endmodule
