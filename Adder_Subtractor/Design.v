`timescale 1ns / 1ps

module FA(
    input a, b, cin,
    output s, cout
);
    assign s = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule

module top(
    input [3:0] a, b,
    input m,
    output [3:0] s,
    output cout,  
    output overflow 
);
    wire [3:0] b_xor;  
    wire [4:0] c; 

    assign b_xor = b ^ {4{m}};
    assign c[0] = m;  

    
    FA f1 (.a(a[0]), .b(b_xor[0]), .cin(c[0]), .s(s[0]), .cout(c[1]));
    FA f2 (.a(a[1]), .b(b_xor[1]), .cin(c[1]), .s(s[1]), .cout(c[2]));
    FA f3 (.a(a[2]), .b(b_xor[2]), .cin(c[2]), .s(s[2]), .cout(c[3]));
    FA f4 (.a(a[3]), .b(b_xor[3]), .cin(c[3]), .s(s[3]), .cout(c[4]));

    assign cout = c[4];  
    assign overflow = c[3] ^ c[4];

endmodule
