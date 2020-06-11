//a 4*4 key scan
//author:WangFW
//date:2020-6-11

module key_scan(clk,rst_n,col,row,key_out);
	input clk;	//10KHz
	input rst_n;
	input [3:0] col;
	output reg [3:0] row;
	output reg [15:0] key_out;

	parameter s1=2'b00,s2=2'b01,s3=2'b10,s4=2'b11;
	reg [1:0] state;

	reg clk_200hz;
	reg [4:0] cnt;
	
	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					cnt<=5'd0;
					clk_200hz=1'b0;
				end
			else
				begin
					if(cnt==25)
						begin
							cnt<=5'd0;
							clk_200hz<=~clk_200hz;
						end
					else
						begin
							cnt<=cnt+1'b1;
							clk_200hz<=clk_200hz;
						end
				end
		end


	always @(posedge clk_200hz or negedge rst_n)
		begin
			if(!rst_n)
				begin
					state<=s1;
					row<=4'b1111;
				end
			else
				begin
					case(state)
						s1:
							begin
								state<=s2;
								row<=4'b1101;
							end
						s2:
							begin
								state<=s3;
								row<=4'b1011;
							end
						s3:
							begin
								state<=s4;
								row<=4'b0111;
							end
						s4:
							begin
								state<=s1;
								row<=4'b1110;
							end
						default:state<=s2;
					endcase
				end
		end

	always @(posedge clk_200hz or negedge rst_n)
		begin
			if(!rst_n)
				begin
					key_out<=16'hffff;
				end
			else
				begin
					case(state)
						s1:key_out[3:0]<=col^key_out[3:0];		//filter
						s2:key_out[7:4]<=col^key_out[7:4];
						s3:key_out[11:8]<=col^key_out[11:8];
						s4:key_out[15:12]<=col^key_out[15:12];
					endcase
				end
		end
endmodule

