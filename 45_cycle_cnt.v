// Cycle count 0-1-2-3-3-2-1-0
// WangFW
// 2020-8-8
module hs1(clk,rst_n,dout);
	input clk;
	input rst_n;
	output reg [2:0] dout;

	reg [2:0] temp;

	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					dout<=3'd0;
					temp<=3'd0;
				end
			else
				begin
					temp<=temp+1'b1;
					if(temp<=3'd3)
						dout<=temp;
					else
						dout<=~temp;
				end
		end
endmodule
