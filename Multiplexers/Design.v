module mux_2_to_1(a,s,y);
  input [0:1]a;
  input s;
  output reg y;
  always@(a,s)
    y=((~s)&a[0]) | (s& a[1]);
endmodule
  
