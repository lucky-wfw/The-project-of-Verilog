// 8 bits adder based on 4 stages pipeline
//author:WangFW
//date:2020-5-14

module adder8_4pipeline(clk,rst_n,ain,bin,cin,sum,cout);
	input clk;
	input rst_n;
	input cin;
	input [7:0] ain;
	input [7:0] bin;
	output reg cout;
	output reg [7:0] sum;

	//The registers needed by pipeline

	reg [1:0] sum1;
	reg [3:0] sum2;
	reg [5:0] sum3;
	reg cout1;
	reg cout2;
	reg cout3;

	reg [1:0] ain1;
	reg [1:0] bin1;

	reg [1:0] ain2;
	reg [1:0] bin2;
	reg [1:0] ain2_2;
	reg [1:0] bin2_2;

	reg [1:0] ain3;
	reg [1:0] bin3;
	reg [1:0] ain3_2;
	reg [1:0] bin3_2;
	reg [1:0] ain3_3;
	reg [1:0] bin3_3;


	//The 1 statge  pipeline
	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					cout1<=1'b0;
					sum1<=2'd0;
				end
			else
				{cout1,sum1}<={1'b0,ain[1:0]}+{1'b0,bin[1:0]}+cin;
		end


	//The 2 statge  pipeline

	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					ain1<=2'd0;
					bin1<=2'd0;
				end
			else
				begin
					ain1<=ain[3:2];
					bin1<=bin[3:2];
				end
		end



	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					cout2<=1'b0;
					sum2<=4'd0;
				end
			else
				{cout2,sum2}<={{1'b0,ain1}+{1'b0,bin1}+cout1,sum1};
		end

	//The 3 statge  pipeline

	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					ain2<=2'd0;
					bin2<=2'd0;
				end
			else
				begin
					ain2<=ain[5:4];
					bin2<=bin[5:4];
				end
		end

	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					ain2_2<=2'd0;
					bin2_2<=2'd0;
				end
			else
				begin
					ain2_2<=ain2;
					bin2_2<=bin2;
				end
		end



	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					cout3<=1'b0;
					sum3<=6'd0;
				end
			else
				{cout3,sum3}<={{1'b0,ain2_2}+{1'b0,bin2_2}+cout2,sum2};
		end

	//The 4 statge  pipeline

	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					ain3<=2'd0;
					bin3<=2'd0;
				end
			else
				begin
					ain3<=ain[7:6];
					bin3<=bin[7:6];
				end
		end

	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					ain3_2<=2'd0;
					bin3_2<=2'd0;
				end
			else
				begin
					ain3_2<=ain3;
					bin3_2<=bin3;
				end
		end

	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					ain3_3<=2'd0;
					bin3_3<=2'd0;
				end
			else
				begin
					ain3_3<=ain3_2;
					bin3_3<=bin3_2;
				end
		end



	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					cout<=1'b0;
					sum<=8'd0;
				end
			else
				{cout,sum}<={{1'b0,ain3_3}+{1'b0,bin3_3}+cout3,sum3};
		end



	
endmodule
