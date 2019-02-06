`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: lab5_2_2_circuit_tb
//////////////////////////////////////////////////////////////////////////////////

module lab5_2_2_circuit_tb(
    );
    
    reg Clock, D;
    wire Qa, Qb, Qc;
    
    lab5_2_2_circuit DUT (.Clock(Clock), .D(D), .Qa(Qa), .Qb(Qb), .Qc(Qc));
    
    initial
    begin
        Clock = 0;
        forever
        begin
          #30 Clock = 1;
          #30 Clock = 0;
        end
    end
    
    initial
    begin
      D = 0;
      #20 D = 1;
      #20 D = 0;
      #5 D = 1;
      #10 D = 0;
      #10 D = 1;
      #5 D = 0;
      #5 D = 1;
      #5 D = 0;
      #15 D = 1;
      #10 D = 0;
      #5 D = 1;
      #5 D = 1;
      #10 D = 0;
    end
endmodule
