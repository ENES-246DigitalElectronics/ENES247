`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: mult_3x3
/////////////////////////////////////////////////////////////////
module mult_3x3
#(
parameter SIZE=3
)
(   input clk, 
    input start, 
    input [SIZE-1:0] multiplicand, 
    input [SIZE-1:0] multiplier, 
    output [2*SIZE-1:0] product, 
    output reg done);

    reg [1:0] state, nextstate;
    parameter [1:0] S0=0, S1=1, S2=2, S3=3;
    reg add, shift, cnt_up, done_sig;
    reg [SIZE-1:0] count;

// processing unit components 
    reg [2*SIZE:0] acc;

    always @(posedge clk)	// accumulator
    if(start)
    begin
        acc[2*SIZE:SIZE] <= 0;
        acc[SIZE-1:0] <= multiplier;
    end
    else if(add)
        acc[2*SIZE:SIZE] <= multiplicand + acc[2*SIZE-1:SIZE];
    else if(shift)
        acc <= {1'b0,acc[2*SIZE:1]};

    assign product = acc[2*SIZE-1:0];

    always @(posedge clk)
    if(start)
        count <=0;
    else if(cnt_up)
        count <= count+1;
    
// control unit components
    assign count_done = (count==SIZE-1) ? 1'b1 : 1'b0;

    always @(posedge clk)	// always block to update state
        state <= nextstate;

    always @(state or acc[0] or start or count_done) // always block to compute both Mealy output & nextstate
    begin
        add = 1'b0;
        done_sig = 1'b0;
        case(state)
           S0: if(start)
                   nextstate = S1;
               else
                   nextstate = S0;
           S1: begin
                   if(acc[0])
                        add = 1'b1;
                   nextstate = S2;
               end
           S2: if (count_done)
                    nextstate = S3;
               else   
                    nextstate = S1;
           S3: begin
                    done_sig = 1'b1;
                    nextstate = S0;
               end
           default: nextstate = S0;
        endcase 
    end

    always @(state) // always block to compute Moore output 
    begin
        shift = 1'b0;
        cnt_up = 1'b0;
        if(state == S2)
        begin
           shift = 1'b1;
           cnt_up = 1'b1;
        end
    end

    always @(posedge clk)
    if(start)
        done <= 1'b0;
    else if(done_sig)
        done <= 1'b1;
    
endmodule
