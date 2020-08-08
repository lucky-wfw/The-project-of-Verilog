// The testbench of cycle cnt
// WangFW
// 2020-8-8
`timescale 10ns/1ns
module hs1_tb();
	reg clk;
	reg rst_n;
	wire [2:0] dout;

	initial
		begin
			clk=0;
			rst_n=1;
			#10 rst_n=0;
			#10 rst_n=1;
		end

	always #2 clk<=~clk;

	hs1 dut(.clk(clk),.rst_n(rst_n),.dout(dout));
endmodule
