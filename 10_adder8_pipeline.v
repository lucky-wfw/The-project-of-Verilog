// 8 bits adder based on pipeline
//author:WangFW
//date:2020-5-14

module adder8_pipeline(clk,rst_n,ain,bin,cin,sum,cout);
	input clk;
	input rst_n;
	input cin;
	input [7:0] ain;
	input [7:0] bin;
	output reg cout;
	output reg [7:0] sum;

	//The registers needed by pipeline

	reg [3:0] sum1;
	reg cout1;

	reg [3:0] reg_ain;
	reg [3:0] reg_bin;

	//The  first class pipeline
	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					cout1<=1'b0;
					sum1<=4'd0;
				end
			else
				{cout1,sum1}<=ain[3:0]+bin[3:0]+cin;
		end

	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					reg_ain<=4'd0;
					reg_bin<=4'd0;
				end
			else
				begin
					reg_ain<=ain[7:4];
					reg_bin<=bin[7:4];
				end
		end

	//The second class pipeline
	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					sum<=8'd0;
					cout<=1'b0;
				end
			else
				begin
					{cout,sum}<={{1'b0,reg_ain}+{1'b0,reg_bin}+cout1,sum1};
				end
		end
endmodule
