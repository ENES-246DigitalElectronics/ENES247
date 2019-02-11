`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: priority_encoder_dataflow
/////////////////////////////////////////////////////////////////

module priority_encoder_dataflow(
	input [7:0] D,
	output reg VoneHot,
	output reg [2:0] YoneHot
    );
        
	//RTL One Hot
		integer i;
		always_comb for (i=0; i<8; i=i+1) if(D[i]) YoneHot++;	
		assign VoneHot = !YoneHot;

endmodule