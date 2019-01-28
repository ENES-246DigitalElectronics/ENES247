`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: Serial_in_parallel_out_enable_behavior
//////////////////////////////////////////////////////////////////////////////////

module Serial_in_parallel_out_enable_behavior(
    input Clk,
    input ShiftIn,
    input ShiftEn,
    output ShiftOut,
    output [3:0] ParallelOut
    );

    reg [3:0] shift_reg; 
    always @(posedge Clk)
       if (ShiftEn)
          shift_reg <= {shift_reg[2:0], ShiftIn};
    assign ShiftOut = shift_reg[3];
    assign ParallelOut= shift_reg;
    
endmodule
