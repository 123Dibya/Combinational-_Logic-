`timescale 1ns / 1ps
module test_bench();

    reg [1:0] a, b;
    wire [3:0] p;
    
    multi uut(.a(a),.b(b),.p(p));
    
    initial
        begin
            $monitor("Time=%0d  a=%d b=%d p=%d",$time, a,b,p);
           #10; a=2;b=2;
           #10; a=3; b=2; 
           
           #20;
             $finish;
        end
endmodule
