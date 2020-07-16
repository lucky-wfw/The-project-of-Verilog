`timescale 10ns/1ns

module test_level_pluse_tb();
	reg clk;
	reg rst_n;
	reg din;
	wire dout;

	initial
		begin
			clk=0;
			rst_n=1;
			din=0;
			#10 rst_n=0;
			#10 rst_n=1;
			#20 din=0;
			#20 din=1;
			#20 din=0;
			#20 din=1;
			#20 $stop;
		end

	always #2 clk<=~clk;

	test_level_pluse dut(.clk(clk),.rst_n(rst_n),.din(din),.dout(dout));
endmodule

