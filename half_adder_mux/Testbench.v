`timescale 1ns / 1ps

module testbench();
    reg a, b;  
    wire s, c; 

    
    top utt(
        .a(a),
        .b(b),
        .s(s),
        .c(c)
    );

    initial begin
       
        $monitor($time, " a=%b, b=%b, s=%b, c=%b", a, b, s, c);

        
        #5 a = 1'b0; b = 1'b0;
        #5 a = 1'b0; b = 1'b1;
        #5 a = 1'b1; b = 1'b0;
        #5 a = 1'b1; b = 1'b1;


        #5 $finish;
    end    
endmodule
