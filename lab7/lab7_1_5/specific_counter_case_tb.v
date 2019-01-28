`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: specific_counter_case_tb
//////////////////////////////////////////////////////////////////////////////////

module specific_counter_case_tb(
    );
	reg clk, reset, enable;
	wire [2:0] count;
	integer k;
    
       specific_counter_case DUT (.clk(clk), .reset(reset), .enable(enable), .count(count));

    initial
    begin
        clk = 0;
        forever
        begin
          #5 clk = 1;
          #5 clk = 0;
        end
    end

    initial
    begin
      reset = 0; enable = 0;
      @(posedge clk)
		#5;
		$display("enable=%b, reset=%b, count=%b at time=%t",enable, reset, count, $time);
	enable = 1;
	for (k=0; k < 7; k=k+1)
	begin
      	@(posedge clk)
		$display("enable=%b, reset=%b, count=%b at time=%t",enable, reset, count, $time);
	end
	reset = 1;
	for (k=0; k < 3; k=k+1)
	begin
      	@(posedge clk)
		$display("enable=%b, reset=%b, count=%b at time=%t",enable, reset, count, $time);
	end
	enable = 0; reset = 0;
	for (k=0; k < 3; k=k+1)
	begin
      	@(posedge clk)
		$display("enable=%b, reset=%b, count=%b at time=%t",enable, reset, count, $time);
	end
	enable = 1;
	for (k=0; k < 7; k=k+1)
	begin
      	@(posedge clk)
		$display("enable=%b, reset=%b, count=%b at time=%t",enable, reset, count, $time);
	end

	$display("Simulation Done");
    end

endmodule
