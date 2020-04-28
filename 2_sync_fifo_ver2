date:2020-4-28
author:WangFW

module sync_fifo_ver2(clk,rst_n,wr,rd,din,dout,full,empty);
	input clk,rst_n;
	input wr,rd;
	input [7:0] din;
	output [7:0] dout;
	reg [7:0] dout;
	output full,empty;
	reg full,empty;

	reg [7:0] mem [15:0];
	reg [3:0] wp,rp;

	always @(posedge clk or negedge rst_n)
		if(!rst_n)
			wp<=0;
		else
			begin
				if(!full&&wr)
					wp<=wp+1'b1;
			end

	always @(posedge clk)
		if(!full&&wr)
			mem[wp]<=din;

	always @(posedge clk or negedge rst_n)
		if(!rst_n)
			rp<=0;
		else
			begin
				if(!empty&&rd)
					rp<=rp+1'b1;
			end

	always @(posedge clk)
		if(!empty&&rd)
			dout<=mem[rp];

	always @(posedge clk or negedge rst_n)
		if(!rst_n)
			full<=1'b0;
		else
			begin
				if((!rd&&wr)&&((wp==rp-1'b1)||((rp==4'h0)&&(wp==4'hf))))
					full<=1'b1;
				else if(full&&rd)
					full<=1'b0;
				else
					full<=1'b0;
			end

	always @(posedge clk or negedge rst_n)
		if(!rst_n)
			empty<=1'b0;
		else
			begin
				if((!wr&&rd)&&((rp==wp-1'b1)||((rp==4'hf)&&(wp==4'h0))))
					empty<=1'b1;
				else if(empty&&wr)
					empty<=1'b0;
				else
					empty<=1'b0;
			end
endmodule
