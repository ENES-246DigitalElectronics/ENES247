`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: clk_divider_about_500hz_refresh_rate_2display
// Generate anode enabling circuit for 4 7-segment displays
// with 50% duty cycle
// Input clock expected is 5 MHz
//////////////////////////////////////////////////////////////////////////////////

module clk_divider_about_500hz_refresh_rate_4display(
    input Clk,
    input reset,
    output reg [3:0] an
    );
    
    reg [14:0] count;

    always @(posedge Clk or posedge reset)
    if (reset) 
    begin
       an <= 4'b1111;
       count <= 0;
    end 
    else 
    begin
       count <= count + 1;
       case (count[14:12])
         3'b000 : an <= 4'b1110;
         3'b001 : an <= 4'b1101;
         3'b010 : an <= 4'b1011;
         3'b011 : an <= 4'b0111;
         3'b100 : begin
                    an <= 4'b1111;
                    count <= 0;
                  end
       endcase 
     end

endmodule
