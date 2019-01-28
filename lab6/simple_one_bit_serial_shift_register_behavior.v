`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: simple_one_bit_serial_shift_register_behavior
//////////////////////////////////////////////////////////////////////////////////

module simple_one_bit_serial_shift_register_behavior(
    input Clk,
    input ShiftIn,
    output ShiftOut
    );

    reg [31:0] shift_reg;
 
    always @(posedge Clk)
          shift_reg <= {shift_reg[30:0], ShiftIn};
 
    assign ShiftOut = shift_reg[31];
    
endmodule
