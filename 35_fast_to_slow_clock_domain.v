// a signal from fast clock domain to slow domain
//author:WangFW
//date:2020-7-16

module test_fast_slow(clka,clkb,rst_n,din,dout);
	input clka,clkb,rst_n;
	input din;
	output dout;

	reg d1,d2,d3;
	wire da;
	always @(posedge clka or negedge rst_n)
		begin
			if(~rst_n)
				begin
					d1<=1'b0;
					d2<=1'b0;
					d3<=1'b0;
				end
			else
				begin
					d1<=din;
					d2<=d1;
					d3<=d2;
				end
		end
	assign da=din|d1|d2|d3;

	reg db1,db2;
	always @(posedge clkb or negedge rst_n)
		begin
			if(!rst_n)
				begin
					db1<=1'b0;
					db2<=1'b0;
				end
			else
				begin
					db1<=da;
					db2<=db1;
				end
		end

	assign dout=db1&&(~db2);
endmodule

	
