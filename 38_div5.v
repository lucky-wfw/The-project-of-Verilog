//clk div 5 with 50%
//author:WangFW
//date:2020-7-21

module test_div5(clkin,rst_n,clkout);
	input clkin;
	input rst_n;
	output clkout;

	reg pos,neg;
	reg [2:0] cnt1,cnt2;

	always @(posedge clkin or negedge rst_n)
		begin
			if(!rst_n)
				cnt1<=3'd0;
			else
				begin
					if(cnt1<3'd4)
						cnt1<=cnt1+1'b1;
					else
						cnt1<=3'd0;
				end
		end

	always @(posedge clkin or negedge rst_n)
		begin
			if(!rst_n)
				pos<=1'b0;
			else
				begin
					case(cnt1)
						3'd0:pos<=1'b1;
						3'd1:pos<=1'b1;
						default:pos<=1'b0;
					endcase
				end
		end


	always @(negedge clkin or negedge rst_n)
		begin
			if(!rst_n)
				cnt2<=3'd0;
			else
				begin
					if(cnt2<3'd4)
						cnt2<=cnt2+1'b1;
					else
						cnt2<=3'd0;
				end
		end

	always @(negedge clkin or negedge rst_n)
		begin
			if(!rst_n)
				neg<=1'b0;
			else
				begin
					case(cnt2)
						3'd0:neg<=1'b1;
						3'd1:neg<=1'b1;
						default:neg<=1'b0;
					endcase
				end
		end
	assign clkout=pos|neg;
endmodule


