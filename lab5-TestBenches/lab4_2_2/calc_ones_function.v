`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: calc_ones_function
//////////////////////////////////////////////////////////////////////////////////

module calc_ones_function(
    input [7:0] ain,
    output reg [2:0] number_of_ones
     );

  function [2:0] calc_ones;	// function definition starts here
    input [7 : 0] a_in;
    integer count, k;

    begin
        count = 0;
        for (k=0; k < 8; k=k+1)
            if (a_in[k])
                count = count + 1;
         calc_ones = count;
    end
  endfunction				// function definition ends here

  always @(ain)
     number_of_ones=calc_ones(ain); // function being called

endmodule
