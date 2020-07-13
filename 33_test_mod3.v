module test_mod3(clk,rst_n,din,dout);
	input clk;
	input rst_n;
	input din;
	output reg dout;

	reg [1:0] state,next_state;
	parameter idle=2'b00,s1=2'b01,s2=2'b10,s3=2'b11;

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
							next_state<=s1;
						else
							next_state<=s2;
					end
				s2:
					begin
						if(din==1'b0)
							next_state<=s2;
						else
							next_state<=s3;
					end
				s3:
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
				case(next_state)
					s3:dout<=1'b1;
					default:dout<=1'b0;
				endcase
		end
endmodule


				
