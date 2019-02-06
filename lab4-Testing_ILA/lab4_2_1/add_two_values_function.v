`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: add_two_values_function
//////////////////////////////////////////////////////////////////////////////////

module add_two_values_function(
    input [3:0] ain,
    input [3:0] bin,
    output reg [4:0] sum
     );

  function [4:0] add_two_values;	// function definition starts here
    input [3 : 0] a_in;
    input [3 : 0] b_in;

    begin
        add_two_values = a_in + b_in;
    end
  endfunction				// function definition ends here

  always @(ain or bin)
     sum=add_two_values(ain, bin); // function being called

endmodule
