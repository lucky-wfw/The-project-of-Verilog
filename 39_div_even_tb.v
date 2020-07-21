//The testbench of div even
//author:WangFW
//date:2020-7-21

`timescale 10ns/1ns

module test_div_even_tb();
	reg clkin;
	reg rst_n;
	wire clkout;

	initial
		begin
			clkin=0;
			rst_n=1;
			#10 rst_n=0;
			#10 rst_n=1;
		end

	always #2 clkin<=~clkin;

	test_div_even dut(.clkin(clkin),.rst_n(rst_n),.clkout(clkout));
endmodule
