`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: Register_with_synch_reset_load_behavior_tb
//////////////////////////////////////////////////////////////////////////////////

module Register_with_synch_reset_load_behavior_tb(
    );
    
    reg Clk, load, reset;
    reg [3:0] D;
    wire [3:0] Q;
    
    Register_with_synch_reset_load_behavior DUT (.Clk(Clk), .D(D), .reset(reset), .load(load), .Q(Q));
    
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
      D = 0; reset = 0; load = 0;
      #20 D = 4'b0101;
      #40 load = 1;
      #20 load = 0;
      D = 4'b1001;
      #40 load = 1;
      #20 load = 0;  
      #15 reset = 1;
      #40 load = 1;
      #20 load = 0;
      #25 reset = 0;
      #40 load = 1;
      #20 load = 0;
    end

endmodule
