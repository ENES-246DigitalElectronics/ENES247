`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: one_second_clock_behavior
//////////////////////////////////////////////////////////////////////////////////

module one_second_clock_behavior(
    input Clk,
    input reset,
    input enable,
    output locked,
    output Q
    );
    
       wire Q;

       // clock generator instantiation
        clk_wiz_1 instance_name
        (
        // Clock in ports
         .clk_in1(Clk),      // input clk_in1
         // Clock out ports
         .clk_out1(Clk_5MHz),     // output clk_out1
         // Status and control signals
//         .reset(reset), // input reset
         .locked(locked)); 

       // clock divider instantiation
       clk_divider_behavior U1 (.Clk(Clk_5MHz), .reset(0), .enable(enable), .Q(Q));

endmodule
