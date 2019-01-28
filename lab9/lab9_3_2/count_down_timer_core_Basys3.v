`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: count_down_timer_core
/////////////////////////////////////////////////////////////////

module count_down_timer_core(
    input clk,
    input load,
    input enable,
    input [1:0] minute,
    output [3:0] an,
    output reg [7:0] seg
    );

   wire clk_5MHz;
   wire [5:0] second_count;
   wire [1:0] minute_count;
   wire second_count_done, second_count_59;
   wire [6:0] seg3, seg2, seg1, seg0;
   reg [22:0] count_1sec;
   wire cnt_done_i, cntdn_done, load_s;
   reg cnt_done;
   wire [3:0] m_cnt_m, m_cnt_l;
   wire [3:0] s_cnt_m, s_cnt_l;   
   reg load_minute, load_second, enable_minute, enable_second;
   reg [2:0] state;
   parameter [2:0] S0=0, S1=1, S2=2, S3=3, S4=4, S5=5, S6=6;
   
   
   clk_5MHz U1
   (
     .clk_in1(clk),      
     .clk_out1(CLK_5MHz));     

// generate 1Hz signal
     assign cnt_done_i = (count_1sec == 23'h4C4B40) ? 1'b1 : 1'b0; 
     
     always @(posedge CLK_5MHz)
        cnt_done <= cnt_done_i;
        
     always @(posedge CLK_5MHz)
     if(cnt_done | load_s)
         count_1sec <= 0;
     else
         count_1sec <= count_1sec + 1;

// display on 7-segments
    always @(an or seg0 or seg1 or seg2 or seg3)
    case(an)
        4'b1110 : seg = {1'b1,seg0};
        4'b1101 : seg = {1'b1,seg1};
        4'b1011 : seg = {1'b0,seg2};
        4'b0111 : seg = {1'b1,seg3};
        default : seg = {8'hff}; // turn OFF
    endcase
    
    clk_divider_about_500hz_refresh_rate_4display R1 (.Clk(CLK_5MHz), .reset(load_s), .an(an));

    bcdto7segment_dataflow MinM(.x(m_cnt_m), .seg(seg3));
    bcdto7segment_dataflow MinL(.x(m_cnt_l), .seg(seg2));
    bcdto7segment_dataflow SecM(.x(s_cnt_m), .seg(seg1));    
    bcdto7segment_dataflow SecL(.x(s_cnt_l), .seg(seg0));

    binary6Bit_to_2digitBCD R_minute(.addr({4'b0,minute_count}), .data({m_cnt_m,m_cnt_l}));
    binary6Bit_to_2digitBCD R_second(.addr(second_count), .data({s_cnt_m,s_cnt_l}));

    down_counter_asynLoad_syncCE #(6) DC1(.clk(CLK_5MHz), .load(load_second), .ce(enable_second & cnt_done & enable), 
    .count_input(6'd60), .count(second_count)); 

    down_counter_asynLoad_syncCE #(2) DC2(.clk(CLK_5MHz), .load(load_minute), .ce(enable_minute & enable), 
    .count_input(minute), .count(minute_count)); 

    assign second_count_done = (second_count==6'b0) ? 1'b1 : 1'b0;
    assign second_count_59 = (second_count==6'd59) ? 1'b1 : 1'b0;

    assign minute_count_done = (minute_count==2'b0) ? 1'b1 : 1'b0;
    
    assign cntdn_done = second_count_done & minute_count_done;

    pb_debouncer U4 (.CLK_5MHz(CLK_5MHz), .pb(load), .pb_debounced(load_s));
    
    always@(posedge CLK_5MHz)
    begin
        load_minute <= 1'b0;
        load_second <= 1'b0;
        enable_second <= 1'b0;
        enable_minute <= 1'b0;
        case(state)
        S0 : if((load_s) && (minute!=2'b00))
                state <= S1;
             else
                state <= S0;
        S1 : begin
                load_minute <= 1'b1;
                load_second <= 1'b1;
                state <= S2;
             end
         S2 : begin
                 enable_second <= 1'b1;
                 if (minute_count_done)
                    state <= S4;
                 else
                    state <= S3; 
              end
         S3 : begin
                 enable_second <= 1'b1;
                 if(second_count_59)
                 begin
                    enable_minute <= 1'b1;
                    state <= S4;
                 end
                 else
                    state <= S3;
              end
         S4 : begin
                 enable_second <= 1'b1;
                 if(cntdn_done)
                    state <= S0;
                 else if(second_count_done)
                 begin
                    enable_minute <= 1'b1;
                    load_second <= 1'b1;
                    state <= S4; 
                 end
                 else
                    state <= S4;
               end
        default : state <= S0;
        endcase
    end

endmodule
