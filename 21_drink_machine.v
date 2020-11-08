//The auto machine for drink
//author:WangFW
//date:2020-6-3

module drink_machine(clk,rst_n,coin,drink,back);
	input clk;
	input rst_n;
	input [1:0] coin;
	output reg drink;
	output reg [1:0] back;

	parameter init=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100;

	parameter coin_5=2'b01,coin_10=2'b10;

	reg [2:0] state;
	reg [2:0] next_state;

	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					state<=init;
					next_state<=init;
				end
			else
				begin
					state<=next_state;
				end
		end

	always @(coin)
				begin
					case(state)
						init:
							begin
								if(coin==coin_10)
									next_state<=s1;
								else if(coin==coin_5)
									next_state<=s2;
								else
									next_state<=init;
							end
						s1:
							begin
								next_state<=init;
							end
						s2:
							begin
								if(coin==coin_5)
									next_state<=s3;
								else if(coin==coin_10)
									next_state<=s4;
								else
									next_state<=s2;
							end
						s3:
							begin
								next_state<=init;
							end
						s4:
							begin
								next_state<=init;
							end
						default:next_state<=init;
					endcase
				end

	always @(state)
		begin
			case(state)
				init:
					begin
						drink<=1'b0;
						back<=2'b00;
					end
				s1:
					begin
						drink<=1'b1;
						back<=2'b00;
					end
				s2:
					begin
						drink<=1'b0;
						back<=2'b00;
					end
				s3:
					begin
						drink<=1'b1;
						back<=2'b00;
					end
				s4:
					begin
						drink<=1'b1;
						back<=coin_5;
					end
				default:
					begin
						drink<=1'b0;
						back<=2'b00;
					end
			endcase
		end
endmodule
