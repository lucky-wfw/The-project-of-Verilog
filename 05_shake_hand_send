//The communication by the way of shakehand
//module:send part
//author:WangFW
//date:2020-5-2

module shake_hand_send(clk,rst_n,ack,din,dout,ready);
	input clk,rst_n;
	input ack;
	input [7:0] din;
	output reg [7:0] dout;
	output reg ready;

	reg ack_d1,ack_d2;
	reg [1:0] state,next_state;
	parameter idle=2'b00,send=2'b01,ack_active=2'b10,ack_check=2'b11;

	reg [7:0] data_buf;

	always @(posedge clk or negedge rst_n)
		begin
			if(~rst_n)
				begin
					ack_d1<=1'b0;
					ack_d2<=1'b0;
				end
			else
				begin
					ack_d1<=ack;
					ack_d2<=ack_d1;
				end
		end

	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					dout<=8'd0;
					ready<=1'b0;
					state<=idle;
				end
			else
				begin
					case(state)
						idle:begin
							ready<=1'b0;
							state<=send;
							end
						send:begin
							ready<=1'b1;
							state<=ack_active;
							end
						ack_active:begin
							if(ack_d2==1'b1)
								begin
									dout<=din;
									ready<=1'b0;
									state<=ack_check;
								end
							else
								state<=ack_active;
							end
						ack_check:begin
							if(ack_d2==1'b0)
								state<=send;
							else
								state<=ack_check;
							end
						default:state<=idle;
					endcase
				end
		end

endmodule
