`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: pb_debouncer
//////////////////////////////////////////////////////////////////////////////////

module pb_debouncer(
    input CLK_5MHz,
    input pb,
    output reg pb_debounced
    );
    
    reg [16:0] counter;  // enough for 5 MHz clock to generate 100 KHz clock (10 msec)
    reg start_delay_timer;
    reg [2:0] state;
    parameter [2:0] S0=0, S1=1, S2=2, S3=3, S4=4;
    
    always@(posedge CLK_5MHz)
    begin
        if(start_delay_timer)
            counter <= 0;
        else
            counter <= counter + 1;
    end
    
    always@(posedge CLK_5MHz)
    begin
        pb_debounced <= 1'b0;
        start_delay_timer <= 1'b0;
        case(state)
        S0 : if(pb)
             begin
                start_delay_timer<=1'b1;
                state <= S1;
             end
        S1 : if(counter[16])
                state <= S2;
             else
                state <= S1;
        S2 : if(pb)
                state <= S3;
             else
                state <= S0;
        S3 : if(!pb)
                state <= S4;
             else
                state <= S3;
        S4 : begin
                pb_debounced <= 1'b1;
                state <= S0;
             end
        default : state <= S0;
        endcase
    end

endmodule
