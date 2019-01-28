`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: asm_chart
/////////////////////////////////////////////////////////////////

module asm_chart(input clk, input x, output reg ya, output reg yb, output reg yc, output reg y1, output reg y2);

    reg [1:0] state, nextstate;
    parameter [1:0] S0=0, S1=1, S2=2;

always @(posedge clk)	// always block to update state
    state <= nextstate;

always @(state or x) // always block to compute both Mealy output & nextstate
begin
    y1 = 1'b0;
    y2 = 1'b0;
    case(state)
       S0: if(x)
           begin
               nextstate = S1;
           end
           else
                nextstate = S0;
       S1: if(x)
                nextstate = S2;
           else
           begin
                nextstate = S0;
           end
       S2: if(x)
           begin
                y2 = 1'b1;
                nextstate = S1;
           end
           else
           begin
                y1 = 1'b1;
                nextstate = S0;
           end
       default: 
           nextstate = S0;
    endcase 
end

always @(state) // always block to compute Moore output 
begin
    ya = 1'b0;
    yb = 1'b0;
    yc = 1'b0;
    case(state)
       S0: ya = 1'b1;
       S1: yb = 1'b1;
       S2: yc = 1'b1;
       default: begin
           ya = 1'b0;
           yb = 1'b0;
           yc = 1'b0;
		end
    endcase 
end

endmodule
