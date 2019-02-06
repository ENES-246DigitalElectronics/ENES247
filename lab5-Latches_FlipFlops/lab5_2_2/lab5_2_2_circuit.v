`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: lab5_2_2_circuit
//////////////////////////////////////////////////////////////////////////////////

module lab5_2_2_circuit(
    input D,
    input Clock,
    output reg Qa,
    output reg Qb,
    output reg Qc
    );
    
    always @(D or Clock)
       if(Clock)
         Qa <= D;
    
    always @(posedge Clock)
       if(Clock)
         Qb <= D;
         
     always @(negedge Clock)
        if(!Clock)
          Qc <= D;
     
endmodule
