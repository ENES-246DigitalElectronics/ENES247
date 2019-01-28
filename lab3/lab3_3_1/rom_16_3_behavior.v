`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: rom_16_3_behavior
/////////////////////////////////////////////////////////////////

module rom_16_3_behavior(
	input [1:0] a,
	input [1:0] b,
	output gt,
	output lt,
    output eq
    );
        
  	reg [2:0] ROM [15:0];  // defining 16x3 ROM
	wire [3:0] ROM_addr;
	wire [2:0] ROM_data;
	assign ROM_addr = {a, b};

  	assign lt = ROM_data[2];
  	assign gt = ROM_data[1];
  	assign eq = ROM_data[0];

	assign ROM_data = ROM[ROM_addr];	// reading ROM content at the address ROM_addr

  	initial $readmemb ("ROM_16_3_behavior.txt", ROM, 0, 15);   // load ROM content from ROM_16_3_behavior.txt file

endmodule