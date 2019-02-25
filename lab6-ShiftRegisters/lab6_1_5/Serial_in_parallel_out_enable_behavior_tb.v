`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: Serial_in_parallel_out_enable_behavior_tb
//////////////////////////////////////////////////////////////////////////////////

module Serial_in_parallel_out_enable_behavior_tb(
    );
    
    reg Clk, ShiftEn, ShiftIn;
    wire [3:0] ParallelOut;
    wire ShiftOut;
    
    Serial_in_parallel_out_enable_behavior DUT (.Clk(Clk), .ShiftEn(ShiftEn), .ShiftIn(ShiftIn), .ShiftOut(ShiftOut), .ParallelOut(ParallelOut));
    
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
      ShiftEn= 0; ShiftIn = 1; 
      #40 ShiftEn= 1;
      #40 ShiftEn= 0;
      #40 ShiftEn= 1;
      #40 ShiftEn= 0;
      #40 ShiftIn = 0;
      #40 ShiftEn= 1;
      #40 ShiftEn= 0;
      #40 ShiftEn= 1;
      #40 ShiftEn= 0;      
    end

endmodule
