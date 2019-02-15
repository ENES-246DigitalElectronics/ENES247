module clkDivider(
    input clk,
    input rst,
    output [7:0] count_small,
    output [2:0] anode_small
    );
     
integer divider_counter = 50000000; //50,000,000 with 100,000,000Hz clock means 2 times per second 
integer divider_anode = 5000000; //5000000 means 50 times a second

integer count_up = 0; //this is the counter to be displayed by the 7 seg display
integer anode_clk = 0; //this is the clock that is to cause a 3 bit counter to to change 50 times a second
 
always_ff @ (posedge(clk), posedge(rst))
begin
    if (rst == 1) count_up <= 0;
    else if (count_up == divider_counter-1) count_up <= 0;         
    else count_up <= count_up + 1;
end

always_ff @ (posedge(clk), posedge(rst))
begin
    if (rst == 1) anode_clk <=0 ;
    else if (anode_clk == divider_anode-1) anode_clk <=0 ;         
    else anode_clk<=anode_clk + 1;
end

assign count_small = count_up[7:0];
assign anode_small = anode_clk[2:0];

endmodule