`timescale 1ns / 1ps

module clkDivider(
    input clk,
    input rst,
    output [7:0] count_small,
    output [2:0] anode_small
    );
     
integer divider_counter = 100000;
integer divider_anode = 5;

integer count = 0;
reg [2:0] anode_clk = 0;
 
always_ff @ (posedge(clk), posedge(rst))
begin
    if (rst == 1) begin
         count <= 0;
         anode_clk <=0 ;
    end
    else if (count == divider_counter-1) begin
        count <= 0;      
        anode_clk <=0 ;
    end         
    else begin
        count <= count + 1;
        anode_clk<=anode_clk + 1;
    end
end

assign count_small = count[7:0];
assign anode_small = anode_clk[2:0];

endmodule