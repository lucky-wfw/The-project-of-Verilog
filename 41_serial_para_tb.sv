//The testbench of serial to para
//author:WangFw
//date:2020-7-28

`timescale 10ns/1ns

module test_seri_para_tb();
	reg clk;
	reg rst_n;
	reg din;
	reg valid_in;
	wire [3:0] dout;
	wire valid_out;

	class Src;
		rand bit data;
		rand bit valid;
	endclass

	Src s;

	initial
		begin
			s=new();
			clk=0;
			rst_n=1;
			valid_in=0;
			#10 rst_n=0;
			#10 rst_n=1;
			repeat(1000)
				begin
					s.randomize();
					@(posedge clk)
					#1 din=s.data;
					valid_in=1;
				end
		end

	always #2 clk<=~clk;

	test_seri_para dut(.clk(clk),.rst_n(rst_n),.din(din),.valid_in(valid_in),
				.dout(dout),.valid_out(valid_out));
endmodule
