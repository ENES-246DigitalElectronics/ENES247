`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: mux_4_1_if_else_if_tb
//////////////////////////////////////////////////////////////////////////////////

module mux_4_1_if_else_if_tb(
    );
	reg [3:0] channel;
	reg [1:0] sel;
	wire Q;
    
       mux_4_1_if_else_if DUT (.channel(channel), .sel(sel), .Q(Q));

       initial
       begin
          channel = 4'h5; sel = 2'b00;
		#5 sel = 2'b01;
		#5 sel = 2'b10;
		#5 sel = 2'b11;
		#5 sel = 2'b00;
		#5 channel = 4'ha;
		#5 sel = 2'b01;
		#5 sel = 2'b10;
		#5 sel = 2'b11;
		#5 sel = 2'b00;
       end 

endmodule
