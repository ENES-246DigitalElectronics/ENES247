`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: gray_code_case
//////////////////////////////////////////////////////////////////////////////////

module gray_code_case(
	input [3:0] bcd,
	input enable,
	output reg invalid,
	output reg [3:0] gray_code
    );
    
       always @ (bcd or enable)
       begin
        if(enable)
		begin
            invalid = 1'b0;
		  case(bcd)
			4'b0000 : gray_code = 4'b0000;
			4'b0001 : gray_code = 4'b0001;
			4'b0010 : gray_code = 4'b0011;
			4'b0011 : gray_code = 4'b0010;
			4'b0100 : gray_code = 4'b0110;
			4'b0101 : gray_code = 4'b1110;
			4'b0110 : gray_code = 4'b1010;
			4'b0111 : gray_code = 4'b1011;
			4'b1000 : gray_code = 4'b1001;
			4'b1001 : gray_code = 4'b1000;
			default :  begin
                        gray_code = 4'b1111;
                        invalid = 1'b1;
                       end
		  endcase
		end
		else
		begin
            invalid = 1'b1;
            gray_code = 4'b1111;
		end		
       end 

endmodule
