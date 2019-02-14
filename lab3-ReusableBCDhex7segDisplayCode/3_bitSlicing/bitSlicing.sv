

module bitSlice(
    input [2:0] select,
    output [3:0] hexOut
    );

    /* https://stackoverflow.com/questions/13399663/splitting-a-bit-array-in-verilog*/
        reg [127:0] in;
        reg [3:0] idx;
        wire [7:0] out = in[8*idx +: 8];
    
    integer c_input = 451263715; // instead of reg [127:0] in; creating a 32 bit value
    // using 3 bit wide select instead of 4 bit wide reg [3:0] idx;
    // using 4 bit wide hexOut instead of eight bit wire [7:0] out = in[8*idx +: 8];
    assign hexOut = c_input[4*select +: 4];
    // this means there are 8 possible groups of 4 bits in 32 bits, 
    /* https://stackoverflow.com/questions/18067571/indexing-vectors-and-arrays-with
    If sel is 0 then dword[8*(0) +: 8] == dword[7:0]
    If sel is 7 then dword[8*(7) +: 8] == dword[63:56]
    If select=0 then 4*select+4=4 and hexOut=c_input[3,0]
    If select=7 then 4*select+4=31 and hexOut=c_input[31,28]
    */
endmodule
