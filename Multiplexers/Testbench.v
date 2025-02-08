module testbench;
  reg [0:1]a;reg s;wire y;
  mux_2_to_1 utt(a,s,y);
  initial
    begin
      $monitor($time,"a[0]=%b,a[1]=%b,s=%b,y=%b",a[0],a[1],s,y);
      #5 a=2'b01;s=0;
      #5 a=2'b01;s=1;
      #5 a=2'b10;s=0;
      #5 a=2'b10;s=1;
      #5 $finish;
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
	  #300
      $finish;
    end
endmodule
