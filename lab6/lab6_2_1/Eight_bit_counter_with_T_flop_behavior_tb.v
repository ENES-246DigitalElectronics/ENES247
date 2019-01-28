`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: Eight_bit_counter_with_T_flop_behave_tb
//////////////////////////////////////////////////////////////////////////////////

module Eight_bit_counter_with_T_flop_behave_tb(
    );
    
    reg Clock, Enable, Clear_n;
    wire [7:0] Q;
    
    Eight_bit_counter_with_T_flop_behave DUT(.Clock(Clock), .Enable(Enable), .Clear_n(Clear_n), .Q(Q));

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
      Enable = 0; Clear_n = 0;
      #20 Enable = 1;
      #20 Clear_n = 1;
      #80 Enable = 0;
      #80 Enable = 1;
      #2000 Clear_n = 0;
      #20 Clear_n = 1;  
      #40;
    end


endmodule
