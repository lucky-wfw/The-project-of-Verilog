//The tesetbench of LSFR
//author:WangFW
//date:2020-5-4

`timescale 10ns/1ns

module LSFR_tb();
	reg clk,rst_n;
	reg load;
	reg [3:0] initial_num;
	wire [3:0] dout;

	initial
		begin
			clk=0;
			load=0;
			initial_num=4'b1010;
			rst_n=1;
			#10 rst_n=0;
			#10 rst_n=1;
			#10 load=1;
			#10 load=0;
		end
	always #2 clk<=~clk;

	LSFR dut(.clk(clk),.rst_n(rst_n),.load(load),.initial_num(initial_num),.dout(dout));
endmodule
