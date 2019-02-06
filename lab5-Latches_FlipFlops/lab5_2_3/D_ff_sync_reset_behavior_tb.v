`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: D_ff_sync_reset_behavior_tb
//////////////////////////////////////////////////////////////////////////////////

module D_ff_sync_reset_behavior_tb(
    );
    
    reg Clk, D, reset;
    wire Q;
    
    D_ff_sync_reset_behavior DUT (.Clk(Clk), .D(D), .reset(reset), .Q(Q));
    
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
      D = 0; reset = 0;
      #20 D = 1;
      #15 reset = 1;
      #5 reset = 0;
      #5 reset = 1;
      #10 reset = 0;
      #30 D = 0;
      #2 reset = 1;
      #5 reset = 0;
      #40 D = 1;
      #20 D = 0;
    end

endmodule
