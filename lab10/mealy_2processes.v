`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: mealy_2processes
/////////////////////////////////////////////////////////////////

module mealy_2processes(input clk, input reset, input x, output reg parity);
    reg state, nextstate;
    parameter S0=0, S1=1;
always @(posedge clk or posedge reset)	// always block to update state
if (reset) 
     state <= S0;
else 
    state <= nextstate;

always @(state or x) // always block to compute both output & nextstate
begin
    parity = 1'b0;
    case(state)
       S0: if(x)
           begin
               parity = 1; nextstate = S1;
           end
           else
                nextstate = S0;
       S1: if(x)
                nextstate = S0;
           else
           begin
                parity = 1; nextstate = S1;
           end
       default: 
           nextstate = S0;
    endcase 
end
endmodule
