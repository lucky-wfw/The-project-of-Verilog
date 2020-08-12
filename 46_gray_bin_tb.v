// Gray to bin testbench
// Author:WangFW
// data:2020-8-12

`timescale 10ns/1ns

module gray_bin_tb();
	reg [3:0] gray;
	wire [3:0] bin;

	initial
		begin
			repeat(10)
				begin
					#10 gray={$random}%15;
				end
		end

	gray_bin dut(.gray(gray),.bin(bin));
endmodule
