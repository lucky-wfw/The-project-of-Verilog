//seqdet used to check a special list of numbers
//author:WangFW
//date:2020-6-4

module seqdet(clk,rst_n,x,flag);
	input clk;
	input rst_n;
	input x;
	output reg flag;

	parameter idle=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100,s5=3'b101,s6=3'b110;

	reg [2:0] state;
	reg [2:0] next_state;

	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					state<=idle;
					next_state<=idle;
				end
			else
				state<=next_state;
		end

	always @(*)
		begin
			case(state)
				idle:
					begin
						if(x==1'b0)
							next_state<=idle;
						else
							next_state<=s1;
					end
				s1:
					begin
						if(x==1'b0)
							next_state<=s2;
						else
							next_state<=s1;
					end
				s2:
					begin
						if(x==1'b0)
							next_state<=idle;
						else
							next_state<=s3;
					end
				s3:
					begin
						if(x==1'b0)
							next_state<=s2;
						else
							next_state<=s4;
					end
				s4:
					begin
						if(x==1'b0)
							next_state<=s5;
						else
							next_state<=s1;
					end
				s5:
					begin
						if(x==1'b0)
							next_state<=idle;
						else
							next_state<=s6;
					end
				s6:
					begin
						if(x==1'b0)
							next_state<=idle;
						else
							next_state<=s1;
					end
				default:next_state<=idle;
			endcase
		end

	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				flag<=1'b0;
			else
				begin
					if(state==s6)
						flag<=1'b1;
					else
						flag<=1'b0;
				end
		end
endmodule
