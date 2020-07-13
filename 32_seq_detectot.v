//seq detect 10010

module test_seq(clk,rst_n,din,dout);
	input clk;
	input rst_n;
	input din;
	output reg dout;

	reg [2:0] state,next_state;
	parameter idle=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100,s5=3'b101;

	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				state<=idle;
			else
				state<=next_state;
		end


	always @(state,din)
		begin
			case(state)
				idle:
					begin
						if(din==1'b0)
							next_state<=idle;
						else
							next_state<=s1;
					end
				s1:
					begin
						if(din==1'b0)
							next_state<=s2;
						else
							next_state<=s1;
					end
				s2:
					begin
						if(din==1'b0)
							next_state<=s3;
						else
							next_state<=s1;
					end
				s3:
					begin
						if(din==1'b0)
							next_state<=idle;
						else
							next_state<=s4;
					end
				s4:
					begin
						if(din==1'b0)
							next_state<=s5;
						else
							next_state<=s1;
					end
				s5:
					begin
						if(din==1'b0)
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
				dout<=1'b0;
			else
				//case(next_state)
				case(state)
					s5:dout<=1'b1;
					default:dout<=1'b0;
				endcase
		end
endmodule

