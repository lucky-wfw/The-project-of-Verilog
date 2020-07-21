//clk div even
//author:WangFW
//date:2020-7-21

module test_div_even(clkin,rst_n,clkout);
	input clkin;
	input rst_n;
	output reg clkout;

	parameter num=6;
	parameter fen=num/2;

	reg [2:0] cnt;

	always @(posedge clkin or negedge rst_n)
		begin
			if(!rst_n)
				begin
					cnt<=3'd0;
					clkout<=1'b0;
				end
			else
				begin
					if(cnt<fen)
						begin
							clkout<=1'b1;
							cnt<=cnt+1'b1;
						end
					else if(cnt<num-1'b1)
						begin
							clkout<=1'b0;
							cnt<=cnt+1'b1;
						end
					else
						begin
							clkout<=1'b0;
							cnt<=3'd0;
						end
				end
		end
endmodule
