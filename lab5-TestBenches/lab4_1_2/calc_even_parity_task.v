`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: calc_even_parity_task 
//////////////////////////////////////////////////////////////////////////////////

module calc_even_parity_task (
    input [7:0] ain,
    output reg parity
     );

  task calc_even_parity;			// task definition starts here
    input [7 : 0] a_in;
    output parity;
    integer k;

    begin
        parity=0;
        for (k=0; k < 8; k=k+1)
		parity = parity ^ ain[k];
    end
  endtask				// task definition ends here

  always @ (ain)
	calc_even_parity(ain, parity); // task being called

endmodule
