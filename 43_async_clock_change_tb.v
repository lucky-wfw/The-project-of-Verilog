// The testbench of clk_change
// Author: WangFW
// Date: 2020-8-5

`timescale 10ns/1ns

module async_clock_change_tb();
	reg clk1;
	reg clk0;
	reg sel;
	reg rst_n;
	wire clkout;

	initial
		begin
			clk1=0;
			clk0=0;
			sel=0;
			rst_n=1;
			#10 rst_n=0;
			#10 rst_n=1;
			#50 sel=1;
			#50 sel=0;
		end

	always #2 clk1<=~clk1;
	always #5 clk0<=~clk0;

	async_clock_change dut(.clk1(clk1),.clk0(clk0),.rst_n(rst_n),.sel(sel),.clkout(clkout));
endmodule
