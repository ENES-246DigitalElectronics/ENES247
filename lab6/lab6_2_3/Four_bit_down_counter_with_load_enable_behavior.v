`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: Four_bit_down_counter_with_load_enable_behavior
//////////////////////////////////////////////////////////////////////////////////

module Four_bit_down_counter_with_load_enable_behavior(
    input Clock,
    input Clear,
    input Load,
    input Enable,
    output [3:0] Q
    );

    reg [3:0] count;
    wire cnt_done;
    
    assign cnt_done = ~| count;
    assign Q = count;
       
    always @(posedge Clock)
      if (Clear)
         count <= 0;
      else if (Enable)
         if (Load | cnt_done)
            count <= 4'b1010;   // decimal 10
         else
            count <= count - 1;
    
endmodule
