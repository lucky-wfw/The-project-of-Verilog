//The testbench of div5
//author:WangFW
//date:2020-6-3

`timescale 10ns/1ns

module div_odd_tb();
	reg clk;
	reg rst_n;
	wire clkout;

	initial
		begin
			clk=0;
			rst_n=1;
			#10 rst_n=0;
			#10 rst_n=1;
		end

	always #2 clk<=~clk;

	div_odd test(.clk(clk),.rst_n(rst_n),.clkout(clkout));
endmodule
