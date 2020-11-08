
//The tesetbench of LSFR
//author:WangFW
//date:2020-5-20

`timescale 10ns/1ns

module test25_tb();
	reg clk,rst_n;
	reg load;
	reg [3:0] initial_num;
	wire [3:0] dout;

	covergroup cov;
		coverpoint rst_n;
		coverpoint load;
		coverpoint initial_num;
	endgroup

	cov ck;


	initial
		begin
			ck=new();
			clk=0;
			load=0;
			initial_num=4'b1010;
			rst_n=1;
			#10 rst_n=0;
			#10 rst_n=1;
			#10 load=1;
			#10 load=0;
			forever
				begin
					@(posedge clk);
					ck.sample();
				end
			
		end
	always #2 clk<=~clk;

	test25 dut(.clk(clk),.rst_n(rst_n),.load(load),.initial_num(initial_num),.dout(dout));
endmodule
