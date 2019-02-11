`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: priority_encoder_dataflow
/////////////////////////////////////////////////////////////////

module priority_encoder_dataflow(
	input [7:0] D,
	output reg Vgate,
    output reg [2:0] Ygate
    );
        
	//gate
	  always @* begin
		  Ygate[1] <= D[2] | D[3];
		  Ygate[0] <= D[3] | D[1] & ~D[2];
		  Vgate = D[0] | D[1] | D[2] | D[3];
		end
	
endmodule