`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: mealy_sequence_detector_3processes
/////////////////////////////////////////////////////////////////

module mealy_sequence_detector_3processes(
    input clk,
    input reset,
    input ain,
    output reg [3:0] count,
    output reg yout
    );

    reg [2:0] state, nextstate;
    parameter [2:0] S0=0, S1=1, S2=2, S3=3, S4=4, S5=5;
    
    always @(posedge clk or posedge reset)
   	if (reset) 
   	begin
        count <= 0;
        state <= S0;
    end
 	else 
 	begin
 	    if(ain) count <= count + 1;
 	    state <= nextstate;
    end
 	
    always @(state or ain)
    begin
        begin
            yout = 1'b0;
            case(state)
                S0: if(!ain) yout = 1; 
                S3: if(ain)  yout = 1;
              endcase 
        end
    end

    always @(state or ain)
    begin
        begin
            case(state)
                S0: if(ain)		//1st 1 counted
                     nextstate = S1;
			    else
                     nextstate = S0;
                S1: if(ain)		//2nd 1 counted
                     nextstate = S2;
			    else
                     nextstate = S1;
                S2: if(ain) 	//3rd 1 counted
                     nextstate = S3;
			    else
                     nextstate = S2;
                S3: if(ain)		//4th 1 counted
                     nextstate = S4;
			    else
                     nextstate = S3;
                S4: if(ain)		//5th 1 counted
                     nextstate = S5;
			    else
                     nextstate = S4;
                S5: if(ain)		//6th 1 counted
                     nextstate = S3;
			    else
                     nextstate = S5;
                default: nextstate = S0;
            endcase 
        end
    end

endmodule
