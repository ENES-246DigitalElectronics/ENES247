module thirtyTwobitHexTo16LEDs(
//    input bankSwitch, //bank or row of 16 LED's 
    input clk,
    input reset,
    input stop_start,
    input [2:0] dp_selector,
    //input [2:0] segment,
    output reg [15:0] LED,
    output dp,
    output [7:0] anodes,
    output a,b,c,d,e,f,g
    );
    
    //input creator ... 32 bit counter
    integer c_input=451263789; //this creates a variable called c_input with 32 bits and initialized to 0 
              //in hex is 1AE5 BD2D
              //in decimal is 451,263,789
              //in binary is 0001 1010 1110 0101 1011 1101 0010 1101
              
    always_ff @ (posedge clk, negedge reset) begin
        if (reset | stop_start) begin //reset will skip both resetting and incrementing the clock
            if (reset) c_input=0; 
        end 
        else c_input <= c_input+1; //always use <= with flip flops
    end
    
    assign segment = c_input[19:7];
    assign LED = c_input[25:10];
    
    //assign LED[2:0] = segment;
    //assign LED[5:3] = dp_selector;  
    //assign LED[6] = dp;
    //assign LED[7] = stop_start;
     
    //anode expansion
    assign anodes = ~(1 << segment); // is a decoder .. anode_select 3 bits could be 0,1,2,3,4,5,6,7 .. 
    //assign LED[15:8] = anodes;
    
    //decimal place (dp) selector
    assign dp = ~(segment & dp_selector); //only when they match will the decimal place be displayed
    
    //hex selector
    wire [3:0] hex_to_display;
    assign hex_to_display = c_input[4*segment +: 4]; // 3 bits of anode_select, grab 4 bits of c_input and put them in hex_to_display
   
    //7-Seg Convertor .. intial values come from a spreadsheet analysis
    integer ac=16'h2812, bc=16'hd860, cc=16'hd004, dc=16'h8692, ec=16'h02ba, fc=16'h208e,gc=16'h1083;
    assign a = ac[hex_to_display]; // all these are muxes, hex_to_display selects one of the constants 16 bits
    assign b = bc[hex_to_display];
    assign c = cc[hex_to_display];
    assign d = dc[hex_to_display];
    assign e = ec[hex_to_display];
    assign f = fc[hex_to_display];
    assign g = gc[hex_to_display];   
        
endmodule

