// A simple module used to convert binary code to gray code
//author:WangFW
//date:2020-5-25

module bin_to_gray(bin_code,gray_code);
	//input clk;
	//input rst_n;
	input [7:0] bin_code;
	output [7:0] gray_code;

	/*always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				gray_code<=8'd0;
			else
				gray_code<=(bin_code>>1)^bin_code;
		end*/

	assign gray_code=(bin_code>>1)^bin_code;
endmodule
