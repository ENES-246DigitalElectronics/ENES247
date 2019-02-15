module BCD(   
	input [1:0] test_number,
	input output_Bank,
	output [15:0] LED
	);
	
	reg [27:0] binary;
	integer i;
	
	// loading up the 28 bits of binary depending upon test_number
	always_comb begin
	   if (test_number==0) binary=
	always @ (binary) begin
		//set 100's 10's and 1's to 0
		Hundreds = 0;
		Tens = 0;
		Ones = 0;
		
		for (i=27; i>=0; i=i-1) begin
			//add 3 to columns >=5
			if (Hundreds >= 5) Hundreds = Hundreds + 3;
			if (Tens >= 5) Tens = Tens + 3;
			if (Ones >= 5) Ones = Ones + 3;
			
			//shift left one
			Hundreds = Hundreds << 1;
			Hundreds[0] = Tens[3];
			Tens = Tens << 1;
			Tens[0] = Ones[3];
			Ones = Ones << 1;
			Ones[0] = binary[i];
		end
	end
endmodule