`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: mult_4x4_cu (control unit)
/////////////////////////////////////////////////////////////////
module mult_4x4_cu(input clk,input start, input lsb, input count_done, 
    output reg add, output reg shift, output reg cnt_up, output reg m_sel, output reg done);

    reg [1:0] state, nextstate;
    parameter [1:0] S0=0, S1=1, S2=2, S3=3;
    reg done_sig;

    always @(posedge clk)	// always block to update state
        state <= nextstate;

    always @(state or lsb or start or count_done) // always block to compute both Mealy output & nextstate
    begin
        add = 1'b0;
        m_sel = 1'b0;
        done_sig = 1'b0;
        case(state)
           S0: if(start)
		    begin
                   m_sel = 1'b1;
                   nextstate = S1;
		    end
               else
                   nextstate = S0;
           S1: begin
                   if(lsb)
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
