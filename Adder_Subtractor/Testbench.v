`timescale 1ns / 1ps
module top_tb;

    reg [3:0] a, b;
    reg m;
    wire [3:0] s;
    wire cout, overflow;

    top uut (
        .a(a), 
        .b(b), 
        .m(m), 
        .s(s), 
        .cout(cout),
        .overflow(overflow)
    );

    initial begin
      $monitor("Time=%0d a=%b a=%d b=%d b=%b m=%b s=%b s=%d cout=%b", 
                 $time, a,a,b, b, m, s, s,cout, overflow);

       
        a = 4'b1010; b = 4'b0101; m = 0; 
        #10;
        a = 4'b1010; b = 4'b0011; m = 1; 
        #10;
        a = 4'b0011; b = 4'b1010; m = 1;
        #10;
        a = 4'b0111; b = 4'b0001; m = 0; 
        #10;
        a = 4'b1000; b = 4'b0001; m = 1;
        #10;
        a = 4'b1111; b = 4'b0001; m = 1;
        #10;
        $finish;
    end
endmodule
