// testbench of edge det
// WangFW
// 2020-8-8

`timescale 10ns/1ns
module edge_det_tb();
	reg clk,rstn,dat_i;
	wire edge_rising,edge_falling,edge_both;

	reg clk_i;

	initial
		begin
			clk=0;
			rstn=1;
			dat_i=0;
			clk_i=0;
			#10 rstn=0;
			#10 rstn=1;
		end

	always #4 clk<=~clk;

	always #2 clk_i<=~clk_i;

	always @(posedge clk_i)
		dat_i<={$random}%2;


	edge_det dut(.clk(clk),.rstn(rstn),.dat_i(dat_i),
		.edge_rising(edge_rising),.edge_falling(edge_falling),.edge_both(edge_both));
endmodule
