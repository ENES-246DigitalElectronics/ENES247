`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: mux_4_1_if_else_if
//////////////////////////////////////////////////////////////////////////////////

module mux_4_1_if_else_if(
	input [3:0] channel,
	input [1:0] sel,
	output reg Q
    );
    
       reg STREAM;

       always @ (channel or sel)
       begin
        if(sel==2'b00)
            Q = channel[0];
		else if (sel == 2'b01)
            Q = channel[1];
		else if (sel == 2'b10)
            Q = channel[2];
		else 
            Q = channel[3];
       end 

endmodule
