`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: fsm_tb
//////////////////////////////////////////////////////////////////////////////////

module fsm_tb(
    );

    reg clk;
    reg reset;
    reg x;
    wire parity;
    
    mealy_2processes DUT (.clk(clk), .reset(reset), .x(x), .parity(parity));

    initial
    begin
        clk = 0;
        forever
        begin
          #5 clk = 1;
          #5 clk = 0;
        end
    end
    
    initial
       begin
        reset = 1'b1;
		x = 1'b0;
		#20; // wait for 2 clock cycles
        reset = 1'b0;
		#10 x = 1'b0;
		#30 x = 1'b1;
		#30 x = 1'b0;
		#30 x = 1'b1;
		#10 reset = 1'b1;
		#10 reset = 1'b0;
		#10 x = 1'b0;
		#30 x = 1'b1;
		#30;
       end 

endmodule
