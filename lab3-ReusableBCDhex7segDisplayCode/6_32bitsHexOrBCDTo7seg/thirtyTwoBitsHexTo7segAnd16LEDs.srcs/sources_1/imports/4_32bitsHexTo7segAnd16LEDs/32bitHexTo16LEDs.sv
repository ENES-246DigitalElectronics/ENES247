

module thirtyTwobitHexTo16LEDs(
    input clk, //100Mhz clock
    input reset, // SW[14] // resets counter to 0
    input stop_start, // SW[15] // pauses the counting
    input [2:0] dp_selector, // decimal place selector
    input HEX_BCD, // SW[13] switches between Hex and BCD
    output reg dp, // decimal place SW[2:0]
    output [7:0] anodes, // one for each of the 8 displays
    output a,b,c,d,e,f,g, // seven segments of a dipslay
    output reg [15:0] LED //so can see counting in hex and BCD
    );
    
    // clock stuff ... really two clocks .. one so can see counting on the display
    // another faster clock that displays 8 7seg displays fast enough that they blur, but slow enough to fully turn on and be bright
    integer divider_counter = 5000; //with 100,000,000Hz clock means 100000 times per second 
    integer divider_anode = 200000; //with 100,000,000Hz clock means 400Hz clock
    
    integer count_clk = 0; //this is the counter to be displayed by the 7 seg display
    integer anode_clk = 0; //this is the clock that is to cause a 3 bit counter to to change 50 times a second
    
    //hex selector
    reg [31:0] BCD; // BCD value computed by hexToBCD that is only loaded when o_DV is one
    reg [3:0] hex_to_display; //The value displayed in one of the segments
    wire [27:0] i_Binary; // driven by hexToBCD, includes the parital calulation that takes 50+ manual clock ticks
    reg i_start; // this triggers the control_path hexToBCD into action, otherwise it is idling .. doing nothing
    reg [2:0] segment = 0; //this is what chooses which segment is active at the moment  
    integer c_input=99900000; //this creates a variable called c_input with 32 bits that has 1 added to it by a clock
              //in hex is 1AE5 BD2D
              //in decimal is 451,263,789
              //in binary is 0001 1010 1110 0101 1011 1101 0010 1101

    //first clock controlling how fast numbers seem to count on the 8 segments
    always_ff @ (posedge(clk), posedge(reset))
    begin
        if (reset == 1) begin //reset counter to zero
            count_clk <= 0;
            c_input <=0;
        end
        else if(stop_start==0) begin //if not pausing
            if (count_clk == divider_counter-1) begin // have counted enough clock ticks to increment counter
                count_clk <= 0;
                c_input <= c_input + 1;
                i_start = 1; // this triggers binary to BCD conversion
                end         
            else begin // continue couting clk pulses, turn off start of hexToBCD
                count_clk <= count_clk + 1;
                i_start = 0; // this has to go to zero before the binary to BCD conversion finishes
                if (o_DV) BCD = o_BCD; // grab new converted BCD value to display   
            end
        end
        else count_clk <= count_clk; //100Mhz clock moves to fast, this counts individual clk ticks
    end
    //second clock controlling how fast the 8 displays are turned on one at a time, too fast grow dim, too slow they flicker      
    always_ff @ (posedge(clk), posedge(reset))
    begin
        if (reset == 1) anode_clk <=0 ;
        else if (anode_clk == divider_anode-1) begin
            anode_clk <=0 ;
            if ((segment+1)==dp_selector) dp<=0; else dp<=1; // had to fiddle with this code, no idea why it works this way
            segment <= segment+1;
        end         
        else anode_clk<=anode_clk + 1;
    end
    
    //connecting to HexToBCD.sv
    wire [31:0] o_BCD; // driven by hexToBCD
    wire o_DV;// driven by hexToiBCD
    
    Binary_to_BCD   i1 (clk, i_Binary, i_start, o_BCD, o_DV); 
    // clk is driven from the constraints file
    assign i_Binary = c_input[27:0]; 
    
    // i_start is set everytime c_input is incremented above. 
    // i_start is set to 0 after a clock tick 
    always_comb begin // this switches between Hex and BCD depending upon switch position
        if (HEX_BCD) begin // display BCD
            hex_to_display = BCD[4*segment +: 4];  
            LED = o_BCD[31:16];
        end
        else begin // display hex
            hex_to_display = c_input[4*segment +: 4];  
            LED = c_input[31:16];
        end
    end
    
    //anode expansion
    wire nanodes; //not anodes
    assign anodes = ~(1 << segment); // is a decoder .. anode_select 3 bits could be 0,1,2,3,4,5,6,7 ..     
    
    /* use then turning off hexToDisplay converter
    assign hex_to_display = c_input[4*segment +: 4]; // 3 bits of anode_select, grab 4 bits of c_input and put them in hex_to_display
    */ 
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