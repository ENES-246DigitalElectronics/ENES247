`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: lab7_1_2_tb
//////////////////////////////////////////////////////////////////////////////////

module lab7_1_2_tb(
    );
    
       reg STREAM;

       initial
       begin
          STREAM = #10 1'b0;
          STREAM = #2 1'b1;
          STREAM = #5 1'b0;
          STREAM = #3 1'b1;
          STREAM = #4 1'b0;
          STREAM = #2 1'b1;
          STREAM = #5 1'b0;
       end 

endmodule
