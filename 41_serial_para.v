// one bit serial number change to four bits para
//author:WangFW
//date:2020-7-28

module test_seri_para(clk,rst_n,din,valid_in,dout,valid_out);
	input clk;
	input rst_n;
	input din;
	input valid_in;
	output reg [3:0] dout;
	output reg valid_out;

	reg [1:0] cnt;
	reg [3:0] temp;

	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					cnt<=2'd0;
					temp<=4'd0;
				end
			else
				begin
					if(valid_in)
						begin
							temp[cnt]<=din;
							cnt<=cnt+1'b1;
						end
					else
						begin
							temp<=temp;	
							cnt<=cnt;
						end
				end
		end

	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					dout<=4'd0;
					valid_out<=1'b0;
				end
			else
				begin
					if(cnt==2'd0)
						begin
							dout<=temp;
							valid_out<=1'b1;
						end
					else
						begin
							dout<=4'd0;
							valid_out<=1'b0;
						end
				end
		end
endmodule
