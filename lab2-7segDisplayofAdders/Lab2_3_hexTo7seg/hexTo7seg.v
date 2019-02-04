module hex2bcd(
    input [3:0] hex, // four bits hex input
    output reg [3:0] bcd, // four bits BCD output
	output reg carry // carry over to more significant bits 
    );
    always @* begin
        if (hex>4'b1001) begin  //greater than 9
            carry=1; 
            bcd[3:0]=hex-10;
            end 
        else
            bcd=hex;
			carry=0;
    end
endmodule

module bcdto7segment(
    input [3:0] x,
    output [6:0] seg
    );
      
	assign seg[6] = (~x[3] & ~x[2] & ~x[1]) | (x[2] & x[1] & x[0]);  // seg g or 6
	assign seg[5] = (~x[3] & ~x[2] & x[0]) | (x[1] & x[0]) | (~x[3] & ~x[2] & x[1]);  // seg f or 5
	assign seg[4] = x[0] | (x[2] & ~x[1]);  // seg e or 4
	assign seg[3] = (x[2] & ~x[1] & ~x[0]) | (x[2] & x[1] & x[0]) | (~x[3] & ~x[2] & ~x[1] & x[0]);  // seg d or 3
	assign seg[2] = ~x[2] & x[1] & ~x[0];  // seg c or 2
	assign seg[1] = (x[2] & ~x[1] & x[0]) | (x[2] & x[1] & ~x[0]);  // seg b or 1
	assign seg[0] = (x[2] & ~x[1] & ~x[0]) | (~x[3] & ~x[2] & ~x[1] & x[0]);  // seg a or 0

endmodule
