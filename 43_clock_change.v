// A module used to change from one clock to anothor clock, glitch-free
// Author:WangFW
//Date:2020-8-5

module clock_change(clk1,clk0,rst_n,sel,clkout);
	input clk1;
	input clk0;
	input rst_n;
	input sel;
	output clkout;


	reg q1_p;
	reg q1_n;
	reg q0_p;
	reg q0_n;


	always @(negedge clk1 or negedge rst_n)
		begin
			if(!rst_n)
				begin
					q1_p<=1'b0;
					q1_n<=1'b1;
				end
			else
				begin
					q1_p<=sel&&q0_n;
					q1_n<=~(sel&&q0_n);
				end
		end

	always @(negedge clk0 or negedge rst_n)
		begin
			if(!rst_n)
				begin
					q0_p<=1'b0;
					q0_n<=1'b1;
				end
			else
				begin
					q0_p<=q1_n&&(~sel);
					q0_n<=~(q1_n&&(~sel));
				end
		end

	assign clkout=(clk1&&q1_p)||(clk0&&q0_p);
endmodule
