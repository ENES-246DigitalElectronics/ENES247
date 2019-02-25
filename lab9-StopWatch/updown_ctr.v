`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2013 01:38:39 PM
// Design Name: 
// Module Name: updown_ctr
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

parameter COUNT_SIZE=8;

module updown_ctr(
    input clk,
    input up_dn,
    input reset,
    input enable,
    output reg [COUNT_SIZE-1:0] count
    );

 //   reg [COUNT_SIZE-1:0] count;
 
   wire clk_5MHz;
   reg clk_1Hz;
   
   clk_5MHz instance_name
   (
     .CLK_IN1(clk),      
     .CLK_OUT1(CLK_5MHz),     
     .RESET(RESET),     
     .LOCKED(LOCKED));      
 
     reg [13:0] count_1sec;

     always @(posedge CLK_5MHz)
     if (reset) 
     begin
        count_1sec <= 0;
        clk_1Hz <= 0;
     end else if(count_1sec[13])
     begin
        count_1sec <= 0;
        clk_1Hz <= ~clk_1Hz;
     end
     else
     begin
        count_1sec <= count_1sec + 1;
     end
   
    always @(posedge clk_1Hz)
        if (reset)
           count <= 0;
        else if (enable)
           if (up_dn)
              count <= count + 1;
           else
              count <= count - 1;
    
endmodule
