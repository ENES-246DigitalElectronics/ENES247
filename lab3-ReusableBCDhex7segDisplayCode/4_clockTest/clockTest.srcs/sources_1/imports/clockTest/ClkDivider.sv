module clkDivider(
    input clk,
    input rst,
    input [1:0] outputBankSelect, //there are 32 bits of cout_up, displayed 8 at a time in the LEDs
    output [7:0] count_small,
    output [2:0] anode_small,
    output [7:0] AN,
    output a,
    output b,
    output c,
    output d,
    output e,
    output f,
    output g
    );
     
integer divider_counter = 1000000; //20,000,000 with 100,000,000Hz clock means 100 times per second 
integer divider_anode = 50000000; //5000000 means 2Hz clock

integer count_clk = 0; //this is the counter to be displayed by the 7 seg display
integer anode_clk = 0; //this is the clock that is to cause a 3 bit counter to to change 50 times a second

integer count_up = 1000000; //this is a 32 but counter that add's 1 evry half second
 
always_ff @ (posedge(clk), posedge(rst))
begin
    if (rst == 1) count_clk <= 0;
    else if (count_clk == divider_counter-1) begin
     count_clk <= 0;
     count_up <= count_up + 1;
     end         
    else count_clk <= count_clk + 1;
end

always_ff @ (posedge(clk), posedge(rst))
begin
    if (rst == 1) anode_clk <=0 ;
    else if (anode_clk == divider_anode-1) anode_clk <=0 ;         
    else anode_clk<=anode_clk + 1;
end

assign count_small = count_up[8*outputBankSelect +: 8];
assign anode_small = anode_clk[2:0];

assign AN = 1 << anode_clk;
assign a=0;
assign b=1;
assign c=1;
assign d=0;
assign e=1;
assign f=1;
assign g=0;


endmodule