`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: moore_sequence_detector_3processes
/////////////////////////////////////////////////////////////////

module moore_sequence_detector_3processes(
    input clk,
    input reset,
    input [1:0] ain,
    output reg yout,
    output reg [1:0] state
    );

    reg [1:0] nextstate;
    parameter [1:0] S0=0, S1=1, S2=2, S3=3;
    
    always @(posedge clk or posedge reset)
   	if (reset) 
        state <= S0;
 	else 
 	    state <= nextstate;
 	
    always @(state or ain)
    begin
            case(state)
                S0: case(ain)
                     2'b00: nextstate = S0;
                     2'b01: nextstate = S0;
                     2'b10: nextstate = S1;
                     2'b11: nextstate = S1;
                    endcase
                S1: case(ain)
                     2'b00: nextstate = S2;
                     2'b01: nextstate = S0;
                     2'b10: nextstate = S1;
                     2'b11: nextstate = S1;
                    endcase
                S2: case(ain)
                     2'b00: nextstate = S2;
                     2'b01: nextstate = S3;
                     2'b10: nextstate = S3;
                     2'b11: nextstate = S2;
                    endcase
                S3: case(ain)
                     2'b00: nextstate = S0;
                     2'b01: nextstate = S3;
                     2'b10: nextstate = S3;
                     2'b11: nextstate = S2;
                    endcase
                default: 
                     nextstate = S0;
            endcase 
    end

    always @(state)
    begin
            case(state)
                S0, S1 : yout = 0;
                S2, S3 : yout = 1;
                default: yout = 0;
            endcase 
    end

endmodule
