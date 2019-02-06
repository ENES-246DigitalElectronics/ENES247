`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: D_ff_behavior_tb
//////////////////////////////////////////////////////////////////////////////////

module D_ff_behavior_tb(
    );
    
    reg Clk, D;
    wire Q;
    
    D_ff_behavior DUT (.Clk(Clk), .D(D), .Q(Q));
    
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
      D = 0;
      #30 D = 1;
      #30 D = 0;
      #40 D = 1;
      #20 D = 0;
    end
    
endmodule
