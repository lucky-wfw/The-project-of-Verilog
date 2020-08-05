// Async clock change
// Author: WangFW
// Date: 2020-8-5

module async_clock_change(clk1,clk0,rst_n,sel,clkout);
	input clk1;
	input clk0;
	input rst_n;
	input sel;
	output clkout;

	reg q1;
	reg q2_p,q2_n;
	reg q3;
	reg q4_p,q4_n;

	always @(posedge clk1 or negedge rst_n)
		begin
			if(!rst_n)
				begin
					q1<=1'b0;
				end
			else
				begin
					q1<=sel&&(q4_n);
				end
		end

	always @(negedge clk1 or negedge rst_n)
		begin
			if(!rst_n)
				begin
					q2_p<=1'b0;
					q2_n<=1'b1;
				end
			else
				begin
					q2_p<=q1;
					q2_n<=~q1;
				end
		end


	always @(posedge clk0 or negedge rst_n)
		begin
			if(!rst_n)
				begin
					q3<=1'b0;
				end
			else
				begin
					q3<=(~sel)&&(q2_n);
				end
		end

	always @(negedge clk0 or negedge rst_n)
		begin
			if(!rst_n)
				begin
					q4_p<=1'b0;
					q4_n<=1'b1;
				end
			else
				begin
					q4_p<=q3;
					q4_n<=~q3;
				end
		end

	assign clkout=(q2_p&&clk1)||(q4_p&&clk0);
endmodule


	
