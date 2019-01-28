`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: stop_watch_core
/////////////////////////////////////////////////////////////////

parameter COUNT_SIZE=6;

module stop_watch_core(
    input clk,
    input reset,
    input enable,
    output [3:0] an,
    output reg [7:0] seg
    );

   wire clk_5MHz;
   reg clk_1tenthHz;
   wire [5:0] tenth_count, second_count, minute_count;
   wire tenth_count_done, tenth_count_clear;
   wire second_count_done, second_count_clear;
   wire [6:0] seg3, seg2, seg1, seg0;
   wire [3:0] s_cnt_m, s_cnt_l;
   
   
   clk_5MHz U1
   (
     .clk_in1(clk),      
     .clk_out1(CLK_5MHz));     
 
     reg [18:0] count_1tenthsec;
     wire cnt_done_i;
     reg cnt_done;

     assign cnt_done_i = (count_1tenthsec == 19'h7A120) ? 1'b1 : 1'b0; 
     
     always @(posedge CLK_5MHz or posedge reset)
     if (reset) 
        cnt_done <= 0;
     else
        cnt_done <= cnt_done_i;
        
     always @(posedge CLK_5MHz or posedge reset)
     if (reset) 
        count_1tenthsec <= 0;
     else if(cnt_done)
         count_1tenthsec <= 0;
     else
         count_1tenthsec <= count_1tenthsec + 1;
 
    always @(an or seg0 or seg1 or seg2 or seg3)
    case(an)
        4'b1110 : seg = {1'b1,seg0};
        4'b1101 : seg = {1'b0,seg1};
        4'b1011 : seg = {1'b1,seg2};
        4'b0111 : seg = {1'b0,seg3};
        default : seg = {8'hff}; // turn OFF
    endcase
    
    clk_divider_about_500hz_refresh_rate_4display R1 (.Clk(CLK_5MHz), .reset(reset), .an(an));
      
// instantiate up count core
    counter_6Bit_dsp48 U2 (
      .CLK(CLK_5MHz), 
      .CE(cnt_done & enable), 
      .SCLR(tenth_count_clear), 
      .Q(tenth_count) 
    );
    
    assign tenth_count_done = (tenth_count==6'b001010) ? 1'b1 : 1'b0;
    assign tenth_count_clear = reset | tenth_count_done;

    bcdto7segment_dataflow Tenth(.x(tenth_count[3:0]), .seg(seg0));
    bcdto7segment_dataflow SecL(.x(s_cnt_l), .seg(seg1));
    bcdto7segment_dataflow SecM(.x(s_cnt_m), .seg(seg2));
    bcdto7segment_dataflow Minute(.x(minute_count[3:0]), .seg(seg3));
   
    binary6Bit_to_2digitBCD Sec(.addr(second_count),.data({s_cnt_m,s_cnt_l}));
    
    counter_6Bit_dsp48 U3 (
      .CLK(CLK_5MHz),  
      .CE(tenth_count_done & enable), 
      .SCLR(second_count_clear), 
      .Q(second_count) 
    );

    assign second_count_done = (second_count==6'd60) ? 1'b1 : 1'b0;
    assign second_count_clear = reset | second_count_done;

    counter_6Bit_dsp48 U4 (
      .CLK(CLK_5MHz), 
      .CE(second_count_done & enable), 
      .SCLR(minute_count_clear), 
      .Q(minute_count) 
    );

    assign minute_count_done = (minute_count==6'd5) ? 1'b1 : 1'b0;
    assign minute_count_clear = reset | minute_count_done;    

endmodule
