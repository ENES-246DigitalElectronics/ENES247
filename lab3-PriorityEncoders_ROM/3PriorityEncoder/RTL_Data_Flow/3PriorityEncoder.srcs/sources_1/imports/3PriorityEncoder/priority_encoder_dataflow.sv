`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: priority_encoder_dataflow
/////////////////////////////////////////////////////////////////

module priority_encoder_dataflow(
	input [7:0] D,
	output reg VdataFlow,
	output reg [2:0] YdataFlow
    );
		
	//RTL Data Flow
		assign YdataFlow = 
			(!D[7]) ? 3'b000 :
			(!D[6]) ? 3'b001 :
			(!D[5]) ? 3'b010 :
			(!D[4]) ? 3'b011 :
			(!D[3]) ? 3'b100 :
			(!D[2]) ? 3'b101 :
			(!D[1]) ? 3'b110 :
			(!D[0]) ? 3'b111 : 3'b111;
		assign VdataFlow = !YdataFlow;
		
endmodule