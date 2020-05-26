//An instering module used to find a special number
//author:WangFW
//date:2020-5-26

module finder(clk,rst_n,wr,din,find,dfind,full,is,location);
	input clk;
	input rst_n;
	input wr;
	input [7:0] din;
	input find;
	input [7:0] dfind;
	output reg full;
	output reg is;
	output reg [5:0] location;

	reg [7:0] mem [63:0];

	reg [5:0] pointer;

	reg [5:0] check;

	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					pointer<=6'd0;
					full<=1'b0;
				end
			else
				begin
					if(wr)
						if(pointer<6'd63)
							begin
								mem[pointer]<=din;
								pointer<=pointer+1'b1;
								full<=1'b0;
							end
						else
							begin
								pointer<=6'd0;
								full<=1'b1;
							end
				end
		end


	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					is<=1'b0;
					location<=6'd0;
					check<=6'd0;
				end
			else
				begin
					if(find)
						begin
							if(check<6'd63)
								begin
									if(mem[check]==dfind)
										begin
											location<=check;
											is<=1'b1;
										end
									else
										begin
											check<=check+1'b1;
											is<=1'b0;
										end
								end
							else
								begin
									check<=6'd0;
									is<=1'b0;
								end
						end
				end
		end
endmodule

							
