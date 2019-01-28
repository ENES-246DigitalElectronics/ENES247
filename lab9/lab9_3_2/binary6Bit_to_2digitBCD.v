`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: binary6Bit_to_2digitBCD 
/////////////////////////////////////////////////////////////////


module binary6Bit_to_2digitBCD (
    input [5:0] addr,
    output [7:0] data
    );

    reg [7:0] binary6Bit_to_2digitBCD_ROM [0:59];
    initial
    begin
       binary6Bit_to_2digitBCD_ROM[0] = 8'b0000_0000; 
       binary6Bit_to_2digitBCD_ROM[1] = 8'b0000_0001; 
       binary6Bit_to_2digitBCD_ROM[2] = 8'b0000_0010; 
       binary6Bit_to_2digitBCD_ROM[3] = 8'b0000_0011; 
       binary6Bit_to_2digitBCD_ROM[4] = 8'b0000_0100; 
       binary6Bit_to_2digitBCD_ROM[5] = 8'b0000_0101; 
       binary6Bit_to_2digitBCD_ROM[6] = 8'b0000_0110; 
       binary6Bit_to_2digitBCD_ROM[7] = 8'b0000_0111; 
       binary6Bit_to_2digitBCD_ROM[8] = 8'b0000_1000; 
       binary6Bit_to_2digitBCD_ROM[9] = 8'b0000_1001; 
       binary6Bit_to_2digitBCD_ROM[10] = 8'b0001_0000; 
       binary6Bit_to_2digitBCD_ROM[11] = 8'b0001_0001; 
       binary6Bit_to_2digitBCD_ROM[12] = 8'b0001_0010; 
       binary6Bit_to_2digitBCD_ROM[13] = 8'b0001_0011; 
       binary6Bit_to_2digitBCD_ROM[14] = 8'b0001_0100; 
       binary6Bit_to_2digitBCD_ROM[15] = 8'b0001_0101; 
       binary6Bit_to_2digitBCD_ROM[16] = 8'b0001_0110; 
       binary6Bit_to_2digitBCD_ROM[17] = 8'b0001_0111; 
       binary6Bit_to_2digitBCD_ROM[18] = 8'b0001_1000; 
       binary6Bit_to_2digitBCD_ROM[19] = 8'b0001_1001; 
       binary6Bit_to_2digitBCD_ROM[20] = 8'b0010_0000; 
       binary6Bit_to_2digitBCD_ROM[21] = 8'b0010_0001; 
       binary6Bit_to_2digitBCD_ROM[22] = 8'b0010_0010; 
       binary6Bit_to_2digitBCD_ROM[23] = 8'b0010_0011; 
       binary6Bit_to_2digitBCD_ROM[24] = 8'b0010_0100; 
       binary6Bit_to_2digitBCD_ROM[25] = 8'b0010_0101; 
       binary6Bit_to_2digitBCD_ROM[26] = 8'b0010_0110; 
       binary6Bit_to_2digitBCD_ROM[27] = 8'b0010_0111; 
       binary6Bit_to_2digitBCD_ROM[28] = 8'b0010_1000; 
       binary6Bit_to_2digitBCD_ROM[29] = 8'b0010_1001; 
       binary6Bit_to_2digitBCD_ROM[30] = 8'b0011_0000; 
       binary6Bit_to_2digitBCD_ROM[31] = 8'b0011_0001; 
       binary6Bit_to_2digitBCD_ROM[32] = 8'b0011_0010; 
       binary6Bit_to_2digitBCD_ROM[33] = 8'b0011_0011; 
       binary6Bit_to_2digitBCD_ROM[34] = 8'b0011_0100; 
       binary6Bit_to_2digitBCD_ROM[35] = 8'b0011_0101; 
       binary6Bit_to_2digitBCD_ROM[36] = 8'b0011_0110; 
       binary6Bit_to_2digitBCD_ROM[37] = 8'b0011_0111; 
       binary6Bit_to_2digitBCD_ROM[38] = 8'b0011_1000; 
       binary6Bit_to_2digitBCD_ROM[39] = 8'b0011_1001; 
       binary6Bit_to_2digitBCD_ROM[40] = 8'b0100_0000; 
       binary6Bit_to_2digitBCD_ROM[41] = 8'b0100_0001; 
       binary6Bit_to_2digitBCD_ROM[42] = 8'b0100_0010; 
       binary6Bit_to_2digitBCD_ROM[43] = 8'b0100_0011; 
       binary6Bit_to_2digitBCD_ROM[44] = 8'b0100_0100; 
       binary6Bit_to_2digitBCD_ROM[45] = 8'b0100_0101; 
       binary6Bit_to_2digitBCD_ROM[46] = 8'b0100_0110; 
       binary6Bit_to_2digitBCD_ROM[47] = 8'b0100_0111; 
       binary6Bit_to_2digitBCD_ROM[48] = 8'b0100_1000; 
       binary6Bit_to_2digitBCD_ROM[49] = 8'b0100_1001; 
       binary6Bit_to_2digitBCD_ROM[50] = 8'b0101_0000; 
       binary6Bit_to_2digitBCD_ROM[51] = 8'b0101_0001; 
       binary6Bit_to_2digitBCD_ROM[52] = 8'b0101_0010; 
       binary6Bit_to_2digitBCD_ROM[53] = 8'b0101_0011; 
       binary6Bit_to_2digitBCD_ROM[54] = 8'b0101_0100; 
       binary6Bit_to_2digitBCD_ROM[55] = 8'b0101_0101; 
       binary6Bit_to_2digitBCD_ROM[56] = 8'b0101_0110; 
       binary6Bit_to_2digitBCD_ROM[57] = 8'b0101_0111; 
       binary6Bit_to_2digitBCD_ROM[58] = 8'b0101_1000; 
       binary6Bit_to_2digitBCD_ROM[59] = 8'b0101_1001; 
    end    
    assign data=binary6Bit_to_2digitBCD_ROM[addr];

endmodule
