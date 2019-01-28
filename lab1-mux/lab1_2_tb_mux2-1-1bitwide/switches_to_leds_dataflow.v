`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: switches_to_leds_dataflow
/////////////////////////////////////////////////////////////////

module switches_to_leds_dataflow(
    input [7:0] x_in,
    output [7:0] y_out
    );
      
    assign y_out = x_in;

endmodule
