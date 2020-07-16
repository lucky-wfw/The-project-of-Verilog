//level to pluse
//author:WangFW
//date:2020-7-16

module test_level_pluse(clk,rst_n,din,dout);
	input clk;
	input rst_n;
	input din;
	output dout;

	reg d1,d2;

	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					d1<=1'b0;
					d2<=1'b0;
				end
			else
				begin	
					d1<=din;
					d2<=d1;
				end
		end

	assign dout=d1&&(~d2);
endmodule
