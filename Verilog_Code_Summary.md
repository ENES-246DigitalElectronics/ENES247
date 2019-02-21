# Verilog Code Summary

assign begin A=B; end

assign A=B;

always_comb begin
	A=B;
	C=B;
end

always_ff @ (posedge clk) begin
	A<=B;
	C<=B;
end

always_comb if (select) LED[0] = A; else LED[0]=B;

always_comb LED[3:2] = select ? a : b;

always_comb LED=c[select];

always_ff @ (posedge clk) if (select) LED[0] <= A; else LED[0] <= B;

always_ff @ (posedge clk)  = select ? a : b;

always_ff @ (posedge clk)  LED <= c[select];

always_comb  begin
		case (select)
			2’b00 : LED[0] = c[0];
			2’b01 : LED[0] = c[1];
			2’b10 : LED[0] = c[2];
			2’b11 : LED[0] = c[3];
			default : LED[0] = c[0];
		endcase
end

always_ff @ (posedge clk)  begin
		case (select)
			2’b00 : LED[0] <= c[0];
			2’b01 : LED[0] <= c[1];
			2’b10 : LED[0] <= c[2];
			2’b11 : LED[0] <= c[3];
		endcase
end

assign LED[1] = 
        select==2'b00 ? c[0] :
        select==2'b01 ? c[1] :
        select==2'b10 ? c[2] :
        select==2'b11 ? c[3] :
        c[0];  

assign hex_to_display = c_input[4*segment +: 4];

integer ac=16'h2812, bc=16'hd860;

