//The module of auto drink machine based on FSM
//author:WangFW
//date:2020-6-9

module Auto_drink_machine(clk,rst_n,select,coin,drink,back);
	input clk;
	input rst_n;
	input [1:0] select;
	input [1:0] coin;
	output reg [1:0] drink;
	output reg [1:0] back;

	parameter coin_5=2'b01,coin_10=2'b10;

	parameter drink_a=2'b01,drink_b=2'b10;

	reg [3:0] state;
	reg [3:0] next_state;

	parameter idle=4'b0000,choice=4'b0001,a1=4'b0010,a2=4'b0011,a3=4'b0100,a4=4'b0101,a5=4'b0110,b1=4'b0111,b2=4'b1000,b3=4'b1001;

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


	always @(select or coin)
		begin
			case(state)
				idle:
					begin
						next_state<=choice;
					end
				choice:
					begin
						if(select==drink_a)
							next_state<=a1;
						else if(select==drink_b)
							next_state<=b1;
						else
							next_state<=choice;
					end
				a1:
					begin
						if(coin==coin_5)
							next_state<=a2;
						else if(coin==coin_10)
							next_state<=a5;
						else
							next_state<=a1;
					end
				a2:
					begin
						if(coin==coin_5)
							next_state<=a3;
						else if(coin==coin_10)
							next_state<=a4;
						else
							next_state<=a2;
					end
				a3:
					begin
						next_state<=idle;
					end
				a4:
					begin
						next_state<=idle;
					end
				a5:
					begin
						next_state<=idle;
					end
				b1:
					begin
						if(coin==coin_5)
							next_state<=b2;
						else if(coin==coin_10)
							next_state<=b3;
						else
							next_state<=b1;
					end
				b2:
					begin
						next_state<=idle;
					end
				b3:
					begin
						next_state<=idle;
					end
				default:next_state<=idle;
			endcase
		end

	always @(posedge clk)
		begin	
			case(state)
				a3:
					begin
						drink<=drink_a;
						back<=2'b00;
					end
				a4:
					begin
						drink<=drink_a;
						back<=coin_5;
					end
				a5:
					begin
						drink<=drink_a;
						back<=2'b00;
					end
				b2:
					begin
						drink<=drink_b;
						back<=2'b00;
					end
				b3:
					begin
						drink<=drink_b;
						back<=coin_5;
					end
				default:
					begin
						drink<=2'b00;
						back<=2'b00;
					end
			endcase
		end
endmodule



