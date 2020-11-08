//A memory according to stack
//author:WangFW
//date:2020-5-23

module stack_mem(clk,rst_n,en,wr,rd,din,dout,full,empty);
	input clk;
	input rst_n;
	input en;
	input wr;
	input rd;
	input [7:0] din;
	output reg full;
	output reg empty;
	output reg [7:0] dout;

	reg [7:0] mem [31:0];

	reg [4:0] point;

	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					full<=1'b0;
					empty<=1'b0;
					dout<=8'd0;
					point=5'd0;
				end
			else 
				if(en)
					begin
						if(wr)
							begin
								if(point<5'd31)
									begin
										mem[point]<=din;
										point<=point+1'b1;
										full<=1'b0;
										empty<=1'b0;
									end
								else
									begin
										full<=1'b1;
										empty<=1'b0;
									end
							end
						if(rd)
							begin
								if(point>5'd0)
									begin
										dout<=mem[point];
										point=point-1'b1;
										empty<=1'b0;
										full<=1'b0;
									end
								else
									begin
										empty<=1'b1;
										full<=1'b0;
									end
							end
					end
		end
endmodule

										
						
