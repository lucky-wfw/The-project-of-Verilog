//random number generator used to covergroup
//author:WangFW
//date:2020-5-20

module test25(clk,rst_n,load,initial_num,dout);
	input clk,rst_n;
	input load;
	input [3:0] initial_num;
	output reg [3:0] dout;

	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				dout<=4'd0;
			else if(load)
				dout<=initial_num;
			else
				begin
					dout[0]<=dout[2]^dout[3];
					dout[1]<=dout[0];
					dout[2]<=dout[1];
					dout[3]<=dout[2];
				end
		end

endmodule
