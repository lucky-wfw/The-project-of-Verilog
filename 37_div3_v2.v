
module test_div3_v2(clkin,rst_n,clkout);
	input clkin;
	input rst_n;
	output clkout;

	reg pos,neg;
	reg [1:0] cnt1,cnt2;

	always @(posedge clkin or negedge rst_n)
		begin
			if(!rst_n)
				cnt1<=2'd0;
			else
				begin
					if(cnt1<2'd2)
						cnt1<=cnt1+1'b1;
					else	
						cnt1<=2'd0;
				end
		end

	always @(posedge clkin or negedge rst_n)
		begin
			if(!rst_n)
				begin
					pos<=1'b0;
				end
			else
				begin
					case(cnt1)
						2'd0:pos<=1'b1;
						2'd1:pos<=1'd0;
						2'd2:pos<=1'd0;
						default:pos<=1'b0;
					endcase
				end
		end

	always @(negedge clkin or negedge rst_n)
		begin
			if(!rst_n)
				cnt2<=2'd0;
			else
				begin
					if(cnt2<2'd2)
						cnt2<=cnt2+1'b1;
					else	
						cnt2<=2'd0;
				end
		end

	always @(negedge clkin or negedge rst_n)
		begin
			if(!rst_n)
				begin
					neg<=1'b0;
				end
			else
				begin
					case(cnt2)
						2'd0:neg<=1'b1;
						2'd1:neg<=1'd0;
						2'd2:neg<=1'd0;
						default:neg<=1'b0;
					endcase
				end
		end

	assign clkout=pos||neg;
endmodule
