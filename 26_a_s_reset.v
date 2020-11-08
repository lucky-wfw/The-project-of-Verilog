//Asynchronous Reset Synchronous Release
//author:WangFW
//date:2020-6-6

module a_s_reset(clk,rst_n,din,dout);
	input clk;
	input rst_n;
	input [7:0] din;
	output reg [7:0] dout;


	reg reg1,reg2;
	wire reset;

	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					reg1<=1'b0;
					reg2<=1'b0;
				end
			else
				begin
					reg1<=rst_n;
					reg2<=reg1;
				end
		end


	assign reset=reg2;

	always @(posedge clk or negedge reset)
		begin		
			if(!reset)
				dout<=8'd0;
			else
				dout<=din;
		end
endmodule
