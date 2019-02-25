`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: specific_counter_case
//////////////////////////////////////////////////////////////////////////////////

module specific_counter_case(
	input clk,
	input enable,
	input reset,
	output reg [2:0] count
    );
    
       always @ (posedge clk)
       begin
        if(reset)
		  count = 3'b000;
	    else
		begin
		  if(enable)
              case(count)
                3'b000 : count = 3'b001;
                3'b001 : count = 3'b011;
                3'b011 : count = 3'b101;
                3'b101 : count = 3'b111;
                3'b111 : count = 3'b010;
                default :  begin
                            count = 3'b000;
                           end
              endcase
           else
              count = count;
		end
       end 

endmodule
