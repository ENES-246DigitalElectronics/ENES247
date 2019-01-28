`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: mealy_ROM_tb
//////////////////////////////////////////////////////////////////////////////////

module mealy_ROM_tb(
    );

    reg clk;
    reg reset;
    wire [2:0] count;
    
    mealy_ROM DUT (.clk(clk), .reset(reset), .count(count));

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
		#20; // wait for 2 clock cycles
        reset = 1'b0;
		#100;
        reset = 1'b1;
		#20; // wait for 2 clock cycles
        reset = 1'b0;
		#100;
       end 

endmodule
