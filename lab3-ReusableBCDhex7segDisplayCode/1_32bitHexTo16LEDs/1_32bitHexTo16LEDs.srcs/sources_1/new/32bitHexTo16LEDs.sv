module thirtyTwobitHexTo16LEDs(
    input SW,
    input CLK100MHZ,
    input reset,
    output reg [15:0] LED
    );
    integer i=0; //this creates a variable called i with 32 bits and initialized to 0 
    always_ff @ (posedge CLK100MHZ, negedge reset) if (reset) i=0; else i <= i+1; //always use <= with flip flops
    always_comb if (SW) LED = i[31:16]; else LED = i[15:0]; //separate combinational logic from flip flop (ff) logic
    
endmodule

