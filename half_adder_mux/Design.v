`timescale 1ns / 1ps

module top(
    input a, b,
    output s, c
);
    mux m1 (
        .a(b), 
        .b(~b), 
        .s(a), 
        .y(s)
    );
    
    mux m2 (
        .a(0), 
        .b(b), 
        .s(a), 
        .y(c)
    );
endmodule

module mux(
    input a, b, s,
    output reg y
);
    always @(a, b, s) begin
        y = (~s & a) | (s & b);
    end
endmodule
