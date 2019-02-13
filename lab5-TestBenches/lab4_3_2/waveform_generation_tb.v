`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: waveform_generation_tb
//////////////////////////////////////////////////////////////////////////////////

module waveform_generation_tb(
    );
    
	reg a, g1, g2;
    
    initial
    begin
        a = 1'b0; g1 = 1'b0; g2 = 1'b1;
        #40;
        a = 1'b1; 
	   #20 g1 = 1'b1; 
	   #20 g2 = 1'b0;
         #20; a = 1'b0; 
	   #20 g1 = 1'b0; 
	   #20 g2 = 1'b1;
	   #20;
    end
        
endmodule
