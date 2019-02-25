`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: mult_4x4_operands_ROM
/////////////////////////////////////////////////////////////////

module mult_4x4_operands_ROM( 
    input [4:0] addr, 
    output [3:0] data);

reg [3:0] ROM [0:31];

assign data=ROM[addr];

initial 
  begin
	ROM[0] = 4'h0;  // multiplcands
	ROM[1] = 4'h1;
	ROM[2] = 4'h2;
	ROM[3] = 4'h3;
	ROM[4] = 4'h4;
	ROM[5] = 4'h5;
	ROM[6] = 4'h6;
	ROM[7] = 4'h7;
	ROM[8] = 4'h8;
	ROM[9] = 4'h9;
	ROM[10] = 4'ha;
	ROM[11] = 4'hb;
	ROM[12] = 4'hc;
	ROM[13] = 4'hd;
	ROM[14] = 4'he;
	ROM[15] = 4'hf;

	ROM[16] = 4'h0;  // multipliers
	ROM[17] = 4'h1;
	ROM[18] = 4'h2;
	ROM[19] = 4'h3;
	ROM[20] = 4'h4;
	ROM[21] = 4'h5;
	ROM[22] = 4'h6;
	ROM[23] = 4'h7;
	ROM[24] = 4'h8;
	ROM[25] = 4'h9;
	ROM[26] = 4'ha;
	ROM[27] = 4'hb;
	ROM[28] = 4'hc;
	ROM[29] = 4'hd;
	ROM[30] = 4'he;
	ROM[31] = 4'hf;
  end
    
endmodule
