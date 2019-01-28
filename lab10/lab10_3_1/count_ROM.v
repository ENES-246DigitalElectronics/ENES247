`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: count_ROM
/////////////////////////////////////////////////////////////////

module count_ROM(input [2:0] addr, output [5:0] data);

reg [5:0] ROM [0:7];

assign data=ROM[addr];

initial 
  begin
	ROM[0] = 6'b001_000; // nextstate, output
	ROM[1] = 6'b011_001;
	ROM[2] = 6'b000_010;
	ROM[3] = 6'b101_011;
	ROM[4] = 6'bxxx_xxx;
	ROM[5] = 6'b111_101;
	ROM[6] = 6'bxxx_xxx;
	ROM[7] = 6'b010_111;
  end
endmodule
