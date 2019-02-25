`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: mux_3x3_tb
//////////////////////////////////////////////////////////////////////////////////

module mux_3x3_tb
#(
parameter MUL_SIZE=3
)
    (
    );

    reg clk;
    reg start;
    reg [MUL_SIZE-1:0] multiplicand;
    reg [MUL_SIZE-1:0] multiplier;

    wire done;
    wire [2*MUL_SIZE-1:0] product;
    
    mult_3x3 DUT (.clk(clk), .start(start), .multiplicand(multiplicand), .multiplier(multiplier), .done(done), .product(product));

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
		multiplicand = 3'b111;
		multiplier = 3'b101;
		start = 1'b0;
		#30 start = 1'b1;
		#10 start = 1'b0;
		#100;
		multiplicand = 3'b100;
		multiplier = 3'b001;
		start = 1'b1;
		#10 start = 1'b0;
		#100;
		multiplicand = 3'b111;
		multiplier = 3'b100;
		start = 1'b1;
		#10 start = 1'b0;
		#70;
       end 

endmodule
