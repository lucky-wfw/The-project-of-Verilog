//The testbench of DMUX
//author:WangFW
//date:2020-5-28

`timescale 10ns/1ns

module DMUX_tb();
	reg clk;
	reg rst_n;
	reg [3:0] din;
	wire dout;

	initial
		begin
			clk=0;
			rst_n=1;
			din=4'b1010;
			#10 rst_n=0;
			#10 rst_n=1;
		end

	always #2 clk<=~clk;

	initial
		$monitor("din=%b,dout=%b",din,dout);

	DMUX dut(.clk(clk),.rst_n(rst_n),.din(din),.dout(dout));
endmodule


	
