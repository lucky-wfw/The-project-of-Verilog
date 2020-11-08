//Frequency div 5
//author:WangFW
//date:2020-6-3

module div_odd(clk,rst_n,clkout);
	input clk;
	input rst_n;
	output clkout;

	reg pos_clk;
	reg neg_clk;

	reg [2:0] count1;
	reg [2:0] count2;

	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					count1<=3'd0;
					pos_clk<=1'b0;
				end
			else
				begin
					if(count1<3'd2)
						begin
							pos_clk<=1'b1;
							count1<=count1+1'b1;
						end
					else if(count1<3'd4)
						begin	
							pos_clk<=1'b0;
							count1<=count1+1'b1;
						end
					else
						count1<=3'd0;
				end
		end


	always @(negedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					count2<=3'd0;
					neg_clk<=1'b0;
				end
			else
				begin
					if(count2<3'd2)
						begin
							neg_clk<=1'b1;
							count2<=count2+1'b1;
						end
					else if(count2<3'd4)
						begin	
							neg_clk<=1'b0;
							count2<=count2+1'b1;
						end
					else
						count2<=3'd0;
				end
		end

	assign clkout=pos_clk|neg_clk;
endmodule
					
