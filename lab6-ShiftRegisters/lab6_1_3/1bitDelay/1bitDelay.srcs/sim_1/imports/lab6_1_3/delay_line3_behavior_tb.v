`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: delay_line3_behavior_tb
//////////////////////////////////////////////////////////////////////////////////

module delay_line3_behavior_tb(
    );
    
    reg Clk;
    reg ShiftIn;
    wire ShiftOut;
    
    delay_line3_behavior DUT (.Clk(Clk), .ShiftIn(ShiftIn), .ShiftOut(ShiftOut));
    
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
      ShiftIn = 0; 
      #20 ShiftIn = 1;
      #40 ShiftIn = 0;
      #20 ShiftIn = 1;
      #40 ShiftIn = 0;
    end

endmodule
