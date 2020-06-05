//The review of sync fifo
//author:WangFW
//date:2020-6-5

module sync_fifo_review(clk,rst_n,din,wr,rd,full,empty,dout);
	input clk;
	input rst_n;
	input wr;
	input rd;
	input [7:0] din;
	output reg full;
	output reg empty;
	output reg [7:0] dout;

	reg [7:0] mem [15:0];
	reg [3:0] wp;
	reg [3:0] rp;

	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				wp<=4'd0;
			else
				if(wr&&(~full))
					wp<=wp+1'b1;
		end

	always @(posedge clk)
		begin
			if(wr&&(~full))
				mem[wp]<=din;
		end

	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				rp<=4'd0;
			else
				if(rd&&(~empty))
					rp<=rp+1'b1;
		end

	always @(posedge clk)
		begin
			if(rd&&(~empty))
				dout<=mem[rp];
		end

	
	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				full<=1'b0;
			else
				begin
					if(((~rd&&wr)&&(wp==rp-1'b1))||((wp==4'hf)&&(rp==4'h0)))
						full<=1'b1;
					else if(full&&rd)
						full<=1'b0;
					else
						full<=1'b0;
				end
		end

	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				empty<=1'b0;
			else
				begin
					if(((~wr&&rd)&&(rp==wr-1'b1))||((rp==4'hf)&&(wp==4'h0)))
						empty<=1'b1;
					else if(empty&&wr)
						empty<=1'b0;
					else
						empty<=1'b0;
				end
		end
endmodule


				
