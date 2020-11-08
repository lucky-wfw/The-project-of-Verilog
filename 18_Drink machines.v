//FSM of drink machine
//author:WangFW
//date:2020-5-27

module Drink_machines(clk,rst_n,choice,coin,back,drink);
	input clk;
	input rst_n;
	input [1:0] choice;
	input [1:0] coin;
	output reg [1:0] back;
	output reg [1:0] drink;

	parameter init=3'b000,select=3'b001,sa1=3'b010,sa2=3'b011,sa3=3'b100,sb1=3'b101,sb2=3'b110;

	reg [2:0] state,next_state;

	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					state<=init;
					next_state<=init;
				end
			else
				state<=next_state;
		end


	always @(*)
		case(state)
			init:
				next_state<=select;
			select:
				begin
					if(choice==2'b10)
						begin
							if(coin==2'b01)
								next_state<=sa1;
							if(coin==2'b10)
								next_state<=sa2;
						end
					if(choice==2'b01)
						begin
							if(coin==2'b01)
								next_state<=sb1;
							if(coin==2'b10)
								next_state<=sb2;
						end
				end
			sa1:
				begin
					if(coin==2'b01)
						next_state<=sa2;
					if(coin==2'b10)
						next_state<=sa3;
				end
			sa2:
				begin
					next_state<=init;
				end
			sa3:
				begin
					next_state<=init;
				end
			sb1:
				begin
					next_state<=init;
				end
			sb2:
				begin
					next_state<=init;
				end
			default:next_state<=init;
		endcase
	

	always @(state)
		begin
			case(state)
				init:
					begin
						back<=2'b00;
						drink<=2'b00;
					end
				select:
					begin
						back<=2'b00;
						drink<=2'b00;
					end
				sa1:
					begin
						back<=2'b00;
						drink<=2'b00;
					end
				sa2:
					begin
						back<=2'b00;
						drink<=2'b10;
					end
				sa3:
					begin
						back<=2'b01;
						drink<=2'b10;
					end
				sb1:
					begin
						back<=2'b00;
						drink<=2'b01;
					end
				sb2:
					begin
						back<=2'b01;
						drink<=2'b01;
					end
			endcase
		end
endmodule

				
				
