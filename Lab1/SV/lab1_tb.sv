`timescale 1ns / 1ps
module tb ();

   logic  [3:0 ]A, B, sum;
   logic 	Cin;
   logic 	Cout;
   logic  clk;   
   
  // instantiate device under test
   RCA dut (A, B, Cin, sum, Cout);
 ////////////////////////////////////////////////////////////////////
   // 20 ns clock
   initial 
     begin	
	clk = 1'b1;
	forever #10 clk = ~clk;
     end


integer handle3;
integer desc3;
integer i;
assign Sum_correct = A + B + Cin;
initial
begin
  handle3 = $fopen("rca.out");
  desc3 = handle3;
  #1250 $finish;
  end
  initial
    begin
      for (i=0; i < 128; i=i+1)
        begin
        // Put vectors before beginning of clk
        @(posedge clk)
        begin
          A = $random;
          B = $random;
          Cin = $random;
        end
        @(negedge clk)
        begin

          $fdisplay(desc3, "%h %h %h|| %h | %h | %b", A, B, Cin,  sum, Sum_correct, (sum ==
          Sum_correct));

    end
  end // @(negedge clk)
end

endmodule
