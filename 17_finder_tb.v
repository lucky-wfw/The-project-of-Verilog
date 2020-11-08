//Testbench of finder
//author:WangFW
//date:2020-5-26

`timescale 10ns/1ns

module finder_tb();
	reg clk;
	reg rst_n;
	reg wr;
	reg [7:0] din;
	reg find;
	reg [7:0] dfind;
	wire full;
	wire is;
	wire [5:0] location;

	initial
		begin
			clk=0;
			rst_n=1;
			wr=0;
			din=8'd0;
			find=0;
			dfind=8'd0;
			#10 rst_n=0;
			#10 rst_n=1;
			wr=1;
			repeat(63)
				begin
					@(posedge clk);
					din<=din+1'b1;
				end
			wr=0;

			dfind=8'd32;
			find=1;
		end

	always #2 clk<=~clk;

	initial
		$monitor("full = %b, is = %b, location = %d",full,is,location);

	finder dut(.clk(clk),.rst_n(rst_n),.wr(wr),.din(din),.find(find),.dfind(dfind),.full(full),.is(is),.location(location));
endmodule
