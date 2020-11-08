//Generation of number list
//author:WangFW
//date:2020-6-9

module number_list(clk,rst_n,dout);
	input clk;
	input rst_n;
	output dout;

	reg [9:0] init;

	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				init<=10'b0010_1101_11;
			else
				init<={init[8:0],init[9]};
		end

	assign dout=init[9];
endmodule
