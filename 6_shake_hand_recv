//Communication by the way of shake hand
//Receive part
//author:WangFW
//date:2020-5-2

module shake_hand_recv(clk,rst_n,ready,din,dout,ack);
	input clk,rst_n;
	input ready;
	input [7:0] din;
	output reg [7:0] dout;
	output reg ack;

	reg ready_d1,ready_d2;

	parameter idle=2'b00,recv=2'b01,active=2'b10,reset=2'b11;

	reg [1:0] state,next_state;

	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					ready_d1<=1'b0;
					ready_d2<=1'b0;
				end
			else
				begin
					ready_d1<=ready;
					ready_d2<=ready_d1;
				end
		end




	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					dout<=8'd0;
					ack<=1'b0;
					state<=idle;
				end
			else
				begin
					case(state)
						idle:begin
							ack<=1'b0;
							state<=recv;
							end
						recv:begin
							ack<=1'b1;
							state<=active;
							end
						active:begin
							if(ready_d2==1'b1)
								begin
									ack<=1'b0;
									dout<=din;
									state<=reset;
								end
							else
								state<=active;
							end
						reset:begin
							if(ready_d2==1'b0)
								begin
									state<=recv;
								end
							else
								state<=reset;
							end
						default:state<=idle;
					endcase
				end
		end
endmodule
