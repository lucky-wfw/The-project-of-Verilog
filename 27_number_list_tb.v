//testbench
//author:WangFW
//date:2020-6-9

`timescale 10ns/1ns

module number_list_tb();
	reg clk;
	reg rst_n;
	wire dout;

	initial
		begin
			clk=0;
			rst_n=1;
			#10 rst_n=0;
			#10 rst_n=1;
		end
	always #2 clk<=~clk;

	number_list dut(.clk(clk),.rst_n(rst_n),.dout(dout));
endmodule
