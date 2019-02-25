`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: asm_chart_tb
//////////////////////////////////////////////////////////////////////////////////

module asm_chart_tb(
    );

    reg clk;
    reg x;
    wire ya, yb, yc, y1, y2;
    
    asm_chart DUT (.clk(clk), .x(x), .ya(ya), .yb(yb), .yc(yc), .y1(y1), .y2(y2));

    initial
    begin
        clk = 0;
        forever
        begin
          #5 clk = 1;
          #5 clk = 0;
        end
    end
    
    initial
       begin
		x = 1'b0;
		#30 x = 1'b1;
		#30 x = 1'b0;
		#30 x = 1'b1;
		#10 x = 1'b0;
		#30 x = 1'b1;
		#20 x = 1'b0;
		#30;
       end 

endmodule
