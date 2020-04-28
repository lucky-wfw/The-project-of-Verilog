// The function of mod3
//aythor:WangFW
//date:2020-4-28

module mod3(clk,rst_n,din,dout);
	input clk,rst_n,din;
	output reg dout;

	parameter idle=2'b00,s1=2'b01,s2=2'b10,s3=2'b11;

	reg [1:0] state,next_state;

	always @(posedge clk or negedge rst_n)
		if(~rst_n)
			begin
				state<=idle;
			end
		else
			state<=next_state;

	always @(posedge clk or negedge rst_n)
		if(~rst_n)
			dout<=1'b0;
		else
			begin
				if(state==s3)
					dout<=1'b1;
				else
					dout<=1'b0;
			end

	always @(din or state)
		begin
			case(state)
				idle:begin
					if(din)
						next_state<=s1;
					else
						next_state<=idle;
					end
				s1:begin
					if(din)
						next_state<=s2;
					else
						next_state<=s1;
					end
				s2:begin
					if(din)
						next_state<=s3;
					else
						next_state<=s2;
					end
				s3:begin
					if(din)
						next_state<=s1;
					else
						next_state<=idle;
					end
				default:state<=idle;
			endcase
		end
endmodule
			
