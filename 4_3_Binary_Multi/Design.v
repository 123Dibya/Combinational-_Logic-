`timescale 1ns / 1ps

module multi(
    input [3:0] b, 
    input [2:0] a, 
    output [6:0] c 
);
    wire [11:0] t; 
    wire [3:0] stage1_sum;
    wire [3:0] stage1_carry;
    wire [2:0] stage2_sum, stage2_carry;
    wire c5_final_sum, c6_final_carry;

    // Generate Partial Products
    assign t[0] = a[0] & b[0];
    assign t[1] = a[0] & b[1];
    assign t[2] = a[0] & b[2];
    assign t[3] = a[0] & b[3];
    assign t[4] = a[1] & b[0];
    assign t[5] = a[1] & b[1];
    assign t[6] = a[1] & b[2];
    assign t[7] = a[1] & b[3];
    assign t[8] = a[2] & b[0];
    assign t[9] = a[2] & b[1];
    assign t[10] = a[2] & b[2];
    assign t[11] = a[2] & b[3];

    // Stage 1
    FA fa1 (.a(t[1]), .b(t[4]), .cin(0), .s(stage1_sum[0]), .cout(stage1_carry[0]));
    FA fa2 (.a(t[2]), .b(t[5]), .cin(stage1_carry[0]), .s(stage1_sum[1]), .cout(stage1_carry[1]));
    FA fa3 (.a(t[3]), .b(t[6]), .cin(stage1_carry[1]), .s(stage1_sum[2]), .cout(stage1_carry[2]));
    FA fa_extra (.a(stage1_carry[2]), .b(t[7]), .cin(0), .s(stage1_sum[3]), .cout(stage1_carry[3]));

    // Stage 2
    FA fa4 (.a(stage1_sum[1]), .b(t[8]), .cin(0), .s(stage2_sum[0]), .cout(stage2_carry[0]));
    FA fa5 (.a(stage1_sum[2]), .b(t[9]), .cin(stage2_carry[0]), .s(stage2_sum[1]), .cout(stage2_carry[1]));
    FA fa6 (.a(stage1_sum[3]), .b(t[10]), .cin(stage2_carry[1]), .s(stage2_sum[2]), .cout(stage2_carry[2]));

    
    FA fa_final (.a(stage2_carry[2]), .b(t[11]), .cin(0), .s(c5_final_sum), .cout(c6_final_carry));

    assign c[0] = t[0];                 
    assign c[1] = stage1_sum[0];
    assign c[2] = stage2_sum[0];
    assign c[3] = stage2_sum[1];
    assign c[4] = stage2_sum[2];
    assign c[5] = c5_final_sum;      
    assign c[6] = c6_final_carry;       

endmodule


module FA(
    input a, b, cin,
    output s, cout
);
    assign s = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule
