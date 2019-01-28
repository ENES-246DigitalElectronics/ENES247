`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: add_two_values_task
//////////////////////////////////////////////////////////////////////////////////

module add_two_values_task(
    input [3:0] ain,
    input [3:0] bin,
    output reg cout,
    output reg [3:0] sum
     );

  task add_two_values;			// task definition starts here
    input [3 : 0] a_in;
    input [3 : 0] b_in;
    output [3:0] sum;
    output cout;

    begin
        {cout, sum} = a_in + b_in;
    end
  endtask				// task definition ends here

  always @ (ain or bin)
	add_two_values(ain, bin, sum, cout); // task being called

endmodule
