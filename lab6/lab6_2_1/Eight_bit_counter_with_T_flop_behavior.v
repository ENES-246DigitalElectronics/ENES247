`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: Eight_bit_counter_with_T_flop_behave
//////////////////////////////////////////////////////////////////////////////////

module Eight_bit_counter_with_T_flop_behave(
    input Clock,
    input Enable,
    input Clear_n,
    output [7:0] Q
    );
    
    wire [7:0] Qout_i, T_i;
 
    T_ff_enable_behavior T7 (.Clk(Clock), .reset_n(Clear_n), .T(T_i[7]), .Q(Q[7]));
    and (T_i[7], Q[6], T_i[6]);
    T_ff_enable_behavior T6 (.Clk(Clock), .reset_n(Clear_n), .T(T_i[6]), .Q(Q[6]));
    and (T_i[6], Q[5], T_i[5]);
    T_ff_enable_behavior T5 (.Clk(Clock), .reset_n(Clear_n), .T(T_i[5]), .Q(Q[5]));
    and (T_i[5], Q[4], T_i[4]);
    T_ff_enable_behavior T4 (.Clk(Clock), .reset_n(Clear_n), .T(T_i[4]), .Q(Q[4]));
    and (T_i[4], Q[3], T_i[3]);
    T_ff_enable_behavior T3 (.Clk(Clock), .reset_n(Clear_n), .T(T_i[3]), .Q(Q[3]));
    and (T_i[3], Q[2], T_i[2]);
    T_ff_enable_behavior T2 (.Clk(Clock), .reset_n(Clear_n), .T(T_i[2]), .Q(Q[2]));
    and (T_i[2], Q[1], T_i[1]);
    T_ff_enable_behavior T1 (.Clk(Clock), .reset_n(Clear_n), .T(T_i[1]), .Q(Q[1]));
    and (T_i[1], Q[0], T_i[0]);
    T_ff_enable_behavior T0 (.Clk(Clock), .reset_n(Clear_n), .T(T_i[0]), .Q(Q[0]));
    and (T_i[0], 1'b1, Enable);

endmodule
