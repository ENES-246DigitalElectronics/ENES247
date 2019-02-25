`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: real_time_clock_core
/////////////////////////////////////////////////////////////////

parameter COUNT_SIZE=6;

module real_time_clock_core(
    input clk,
    input reset,
    output [7:0] an,
    output reg [7:0] seg
    );

   wire clk_5MHz;
   wire [5:0] second_count, minute_count;
   wire [6:0] seg3, seg2, seg1, seg0;
   reg [22:0] count_1sec;
   wire cnt_done_i;
   reg cnt_done;
   wire [3:0] m_cnt_m, m_cnt_l;
   wire [3:0] s_cnt_m, s_cnt_l;   
    wire thresh0, thresh1;
   
   clk_5MHz U1
   (
     .clk_in1(clk),      
     .clk_out1(CLK_5MHz));     
 
     assign cnt_done_i = (count_1sec == 23'h4C4B40) ? 1'b1 : 1'b0; 
     assign seconds_done_i = (second_count == 6'h3a) ? 1'b1 : 1'b0; 
     
     always @(posedge CLK_5MHz or posedge reset)
     if (reset) 
        cnt_done <= 0;
     else
        cnt_done <= cnt_done_i;
             
    always @(posedge CLK_5MHz or posedge reset)
    if (reset) 
       count_1sec <= 0;
    else if(cnt_done)
        count_1sec <= 0;
    else
        count_1sec <= count_1sec + 1;

 
    always @(an or seg0 or seg1 or seg2 or seg3)
    case(an)
        8'b11111110 : seg = {1'b1,seg0};
        8'b11111101 : seg = {1'b1,seg1};
        8'b11111011 : seg = {1'b0,seg2};
        8'b11110111 : seg = {1'b1,seg3};
        default : seg = {8'hff}; // turn OFF
    endcase
    
    clk_divider_about_500hz_refresh_rate_4display R1 (.Clk(CLK_5MHz), .reset(reset), .an(an[3:0]));
    assign an[7:4] = 4'b1111; 
      
// instantiate up count core
// the core generated should have clock eneable, synchronous clear, and threshold options selected
// the threshold value is set to 3c (in hex).  The width of counter is 6 bits.    
    counter_6Bit_dsp48 U2 (
      .CLK(CLK_5MHz), 
      .CE(cnt_done),
      .SCLR(reset | thresh0), 
      .THRESH0(thresh0), // output thresh0 when count=60
      .Q(second_count) // output [5 : 0] q
    );

    counter_6Bit_dsp48 U3 (
      .CLK(CLK_5MHz), 
      .CE(thresh0),
      .SCLR(reset | thresh1), 
      .THRESH0(thresh1), // output thres10 when count=60
      .Q(minute_count) // output [5 : 0] q
    );

    binary6Bit_to_2digitBCD R_minute(.addr(minute_count), .data({m_cnt_m,m_cnt_l}));
    binary6Bit_to_2digitBCD R_second(.addr(second_count), .data({s_cnt_m,s_cnt_l}));
    
    bcdto7segment_dataflow SecL(.x(s_cnt_l), .seg(seg0));
    bcdto7segment_dataflow SecM(.x(s_cnt_m), .seg(seg1));
    bcdto7segment_dataflow MinL(.x(m_cnt_l), .seg(seg2));
    bcdto7segment_dataflow MinM(.x(m_cnt_m), .seg(seg3));

endmodule
