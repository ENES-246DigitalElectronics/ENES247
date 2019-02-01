`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: Parallel_in_serial_out_load_enable_behavior_tb
//////////////////////////////////////////////////////////////////////////////////

module Parallel_in_serial_out_load_enable_behavior_tb(
    );
    
    reg Clk, load, ShiftEn, ShiftIn;
    reg [3:0] ParallelIn;
    wire [3:0] RegContent;
    wire ShiftOut;
    
    Parallel_in_serial_out_load_enable_behavior DUT (.Clk(Clk), .ParallelIn(ParallelIn), .ShiftEn(ShiftEn), .ShiftIn(ShiftIn), .load(load), .ShiftOut(ShiftOut), .RegContent(RegContent));
    
    initial
    begin
        Clk = 0;
        forever
        begin
          #10 Clk = 1;
          #10 Clk = 0;
        end
    end
    
    initial
    begin
      ParallelIn = 0; ShiftEn= 0; ShiftIn = 1; load = 0;
      #20 ParallelIn = 4'b0101;
      #40 load = 1;
      #20 load = 0;
      #20 ShiftEn= 1;
      #80 ParallelIn = 4'b1001;
      #20 load = 1;
      #20 load = 0;  
      #15 ShiftEn= 1;
      #40 load = 1;
      #20 load = 0;
      #25 ShiftEn= 0;
      #40 load = 1;
      #20 load = 0;
    end

endmodule
