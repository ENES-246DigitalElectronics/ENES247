`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: mult_4x4
/////////////////////////////////////////////////////////////////
module mult_4x4
#(
parameter SIZE = 4
)
(
    input clk, 
    input start, 
    input [3:0] multiplicand_addr, 
    input [3:0] multiplier_addr, 
    output [7:0] an,
    output reg [6:0] seg, 
    output reg done);

    wire add, shift, cnt_up, done_sig;
    reg [3:0] count;
    reg [4:0] addr; 
    wire [SIZE-1:0] operand;
    wire [2*SIZE-1:0] product;
    wire CLK_5MHz;
    wire [3:0] bcd_t, bcd_o;
    wire [1:0] bcd_h;
    wire start_s;
    wire [6:0] seg0, seg1, seg2;

// Generate 5 MHz clock
    clk_5MHz U1
    (
      .clk_in1(clk),      
      .clk_out1(CLK_5MHz));     

// processing unit components 
    reg [2*SIZE:0] acc;

// 2*SIZE+1 Bit register functioning as accumulator and miltiplier register
    always @(posedge CLK_5MHz)	
    if(start_s)
    begin
        acc[2*SIZE:SIZE] <= 0;
        acc[SIZE-1:0] <= operand; // multiplier
    end
    else if(add)
        acc[2*SIZE:SIZE] <= operand + acc[2*SIZE-1:SIZE]; // operand is multiplicand
    else if(shift)
        acc <= {1'b0,acc[2*SIZE:1]};

    assign product = acc[2*SIZE-1:0];

// counter
    always @(posedge CLK_5MHz)
    if(start_s)
        count <=0;
    else if(cnt_up)
        count <= count+1;
    
    assign count_done = (count==SIZE-1) ? 1'b1 : 1'b0;

    mult_4x4_cu U2 (.clk(CLK_5MHz), .start(start_s), .lsb(acc[0]), .count_done(count_done), .done(done_sig), .add(add), .shift(shift), .cnt_up(cnt_up), .m_sel(m_sel));

// multiplexer
    always @(m_sel or multiplicand_addr or multiplier_addr)
    if(m_sel)
        addr = {1'b1,multiplier_addr}; // locations 17 to 31
    else
        addr = {1'b0, multiplicand_addr}; // locations 0 to 15
    
    mult_4x4_operands_ROM U3(.addr(addr), .data(operand));
        
    always @(posedge CLK_5MHz)
    if(start_s)
        done <= 1'b0;
    else if(done_sig)
        done <= 1'b1;

    binary8Bit_to_3digitBCD U4(.binarydata(product),.bcd({bcd_h,bcd_t,bcd_o}));
//    binary8Bit_to_3digitBCD U4(.binarydata(8'hc0),.bcd({bcd_h,bcd_t,bcd_o}));

    always @(an or seg0 or seg1 or seg2)
    case(an)
        8'b11111110 : seg = seg0;
        8'b11111101 : seg = seg1;
        8'b11111011 : seg = seg2;
        8'b11110111 : seg = 7'h7f;
        default : seg = 7'h7f; // turn OFF
    endcase
    
    clk_divider_about_500hz_refresh_rate_4display U5 (.Clk(CLK_5MHz), .reset(1'b0), .an(an[3:0]));
    
    bcdto7segment_dataflow U6(.x(bcd_o), .seg(seg0));
    bcdto7segment_dataflow U7(.x(bcd_t), .seg(seg1));
    bcdto7segment_dataflow U8(.x({2'b00,bcd_h}), .seg(seg2));

    pb_debouncer U9 (.CLK_5MHz(CLK_5MHz), .pb(start), .pb_debounced(start_s));
    
    assign an[7:4] = 4'b1111; 
    
endmodule
