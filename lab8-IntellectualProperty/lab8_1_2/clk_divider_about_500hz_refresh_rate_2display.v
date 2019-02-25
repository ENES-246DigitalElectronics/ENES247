`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: clk_divider_about_500hz_refresh_rate_2display
// Generate anode enabling circuit for 2 7-segment displays
// with 50% duty cycle
// Input clock expected is 5 MHz
//////////////////////////////////////////////////////////////////////////////////

module clk_divider_about_500hz_refresh_rate_2display(
    input Clk,
    input reset,
    output reg [3:0] an
    );
    
    reg [13:0] count;

    always @(posedge Clk or posedge reset)
    if (reset) 
    begin
       an <= 8'b1111;
       count <= 0;
    end 
    else 
    begin
       count <= count + 1;
       case (count[13:12])
         2'b00 : an <= 8'b1110;
         2'b01 : an <= 8'b1101;
         2'b10 : begin
                    an <= 8'b1111;
                    count <= 0;
                  end
       endcase 
     end

endmodule
