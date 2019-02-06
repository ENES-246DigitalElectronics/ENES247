`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: rom_2bit_multipler_behavior
/////////////////////////////////////////////////////////////////

module rom_2bit_multipler_behavior(
	input [1:0] a,
	input [1:0] b,
	output [3:0] product
    );
        
  	reg [3:0] ROM [15:0];  // defining 16x4 ROM
	wire [3:0] ROM_addr;

	assign ROM_addr = {a, b};

	assign product = ROM[ROM_addr];	// reading ROM content at the address ROM_addr

  	initial $readmemb ("ROM_2bit_multipler.txt", ROM, 0, 15);   // load ROM content from ROM_2bit_multipler.txt file

endmodule