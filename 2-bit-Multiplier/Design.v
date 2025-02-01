`timescale 1ns / 1ps

module HA(
    input a, b,
    output s, c
);
    assign s = a ^ b;
    assign c = a & b;
endmodule


module multi(
    input [1:0] a, b,
    output [3:0] p
);

    wire t1, t2, t3, carry; 

    
    assign p[0] = a[0] & b[0];  

    
    HA ha1 (.a(a[1] & b[0]), .b(a[0] & b[1]), .s(p[1]), .c(t1));

    
    HA ha2 (.a(a[1] & b[1]), .b(t1), .s(p[2]), .c(t2));

 
    assign p[3] = t2;

endmodule
