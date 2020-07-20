// clk div 3
//author:WangFW
//date:2020-7-20

module test_div3(clkin,rst_n,clkout);
	input clkin;
	input rst_n;
	output clkout;

	reg [1:0] count1,count2;

	reg pos,neg;

	always @(posedge clkin or negedge rst_n)
		begin
			if(!rst_n)
				begin
					count1<=2'd0;
					pos<=1'b0;
				end
			else
				begin
					case(count1)
						2'd0:
							begin
								pos<=1'b1;
								count1<=count1+1'b1;
							end
						2'd1:
							begin
								pos<=1'b0;
								count1<=count1+1'b1;
							end
						2'd2:
							begin
								pos<=1'b0;
								count1<=2'd0;
							end
						default:
							begin
								pos<=1'b0;
								count1<=2'd0;
							end
					endcase
				end
		end

	always @(negedge clkin or negedge rst_n)
		begin
			if(!rst_n)
				begin
					count2<=2'd0;
					neg<=1'b0;
				end
			else
				begin
					case(count2)
						2'd0:
							begin
								neg<=1'b1;
								count2<=count2+1'b1;
							end
						2'd1:
							begin
								neg<=1'b0;
								count2<=count2+1'b1;
							end
						2'd2:
							begin
								neg<=1'b0;
								count2<=2'd0;
							end
						default:
							begin
								neg<=1'b0;
								count2<=2'd0;
							end
					endcase
				end
		end


	assign clkout=pos|neg;
endmodule

					
