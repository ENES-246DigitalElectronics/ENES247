`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: Four_bit_down_counter_with_load_enable_behavior_tb
//////////////////////////////////////////////////////////////////////////////////

module Four_bit_down_counter_with_load_enable_behavior_tb(
    );

    reg Clock, Enable, Clear, Load;
    wire [3:0] Q;

	Four_bit_down_counter_with_load_enable_behavior DUT (.Clock(Clock), .Clear(Clear), .Load(Load), .Enable(Enable), .Q(Q));

    initial
    begin
        Clock = 0;
        forever
        begin
          #5 Clock = 1;
          #5 Clock = 0;
        end
    end

    initial
    begin
      Enable = 0; Clear = 0; Load = 0;
      #20 Enable = 1;
      #20 Clear = 1;
      #20 Clear = 0;
      #20 Load = 1;
	  #10 Load = 0;
      #80 Enable = 0;
      #40 Enable = 1;
      #400 Clear = 1;
      #20 Clear = 0;  
      #40;
    end

endmodule
