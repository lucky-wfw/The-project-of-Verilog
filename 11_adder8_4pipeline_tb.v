//The testbench of adder8_4pipeline
//author:WangFW
//date:2020-5-14

`timescale 10ns/1ns

module adder8_4pipeline_tb();
	reg clk;
	reg rst_n;
	reg [7:0] ain;
	reg [7:0] bin;
	reg cin;
	wire cout;
	wire [7:0] sum;

	initial
		begin
			clk=0;
			rst_n=1;
			#10 rst_n=0;
			#10 rst_n=1;
		end

	always #2 clk<=~clk;

	always @(posedge clk)
		begin
			ain<={$random}%256;
			bin<={$random}%256;
			cin<={$random}%2;
		end

	adder8_4pipeline dut(.clk(clk),.rst_n(rst_n),.ain(ain),.bin(bin),.cin(cin),.cout(cout),.sum(sum));
endmodule
