//Testbench of reset
//author:WangFW
//date:2020-6-6

`timescale 10ns/1ns

module a_s_reset_tb();
	reg clk;
	reg rst_n;
	reg [7:0] din;
	wire [7:0] dout;

	initial
		begin
			clk=0;
			rst_n=1;
			din=8'b1010_1010;
			#10 rst_n=0;
			#10 rst_n=1;
		end

	always #2 clk<=~clk;

	a_s_reset dut(.clk(clk),.rst_n(rst_n),.din(din),.dout(dout));
endmodule
