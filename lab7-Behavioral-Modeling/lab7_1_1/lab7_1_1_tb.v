`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: lab7_1_1_tb
//////////////////////////////////////////////////////////////////////////////////

module lab7_1_1_tb(
    );
    
       parameter DELAY = 5;
       reg [7:0] PORT_A;

       initial
       begin
          PORT_A=8'h20;
          #DELAY PORT_A = 8'hF2;
          #DELAY PORT_A = 8'h41;
          #DELAY PORT_A = 8'h0A;
       end 

endmodule
