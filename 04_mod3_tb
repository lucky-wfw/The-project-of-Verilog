//The testbench of mod3
//author:WangFW
//date:2020-4-28

`timescale 10ns/1ns
module mod3_tb();
	reg clk,rst_n,din;
	wire dout;

	initial
		begin
			clk=0;
			rst_n=1;
			din=0;
			#10 rst_n=0;
			#10 rst_n=1;
		end

	always #2 clk<=~clk;

	always @(posedge clk)
		din<={$random%2};

	mod3 dut(.clk(clk),.rst_n(rst_n),.din(din),.dout(dout));
endmodule
