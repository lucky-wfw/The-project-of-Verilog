//A module used to extend the width of the pulse
//author:WangFW
//date:2020-5-29

module extend(clk,rst_n,din,dout);
	input clk;
	input rst_n;
	input din;
	output reg dout;

	reg d1;
	reg d2;
	reg d3;
	reg d4;

	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					d1<=1'b0;
					d2<=1'b0;
					d3<=1'b0;
					d4<=1'b0;
					dout<=1'b0;
				end
			else
				begin
					d1<=din;
					d2<=d1;
					d3<=d2;
					d4<=d3;
					dout<=d1 || d2 || d3 || d4;
				end
		end
endmodule

