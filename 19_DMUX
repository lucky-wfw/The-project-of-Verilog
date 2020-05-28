//DMUX used to data bits synchronization
//author:WangFW
//date:2020-5-28

module DMUX(clk,rst_n,din,dout);
	input clk;
	input rst_n;
	input [3:0] din;
	output reg dout;

	reg [1:0] count;
	reg [3:0] temp1;
	reg [3:0] temp2;

	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					temp1<=4'd0;
					temp2<=4'd0;
				end
			else
				begin
					temp1<=din;
					temp2<=temp1;
				end
		end
							
			
	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					count<=2'd0;
					dout<=1'b0;
				end
			else
				begin
					case(count)
						2'd0:begin
							dout<=temp2[0];
							count<=count+1'b1;
							end		
						2'd1:begin
							dout<=temp2[1];
							count<=count+1'b1;
							end	
						2'd2:begin
							dout<=temp2[2];
							count<=count+1'b1;
							end	
						2'd3:begin
							dout<=temp2[3];
							count<=count+1'b1;
							end	
					endcase
				end
		end



endmodule

