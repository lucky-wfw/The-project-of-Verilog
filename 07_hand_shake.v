//Communication by the way of shakehand
//author:WangFW
//date:2020-5-2

module shake_hand(clk_send,clk_recv,rst_n_send,rst_n_recv,din,dout);
	input clk_send,clk_recv,rst_n_send,rst_n_recv;
	input [7:0] din;
	output[7:0] dout;

	wire [7:0] w_data;
	wire ready,ack;

	shake_hand_send u1(.din(din),.clk(clk_send),.rst_n(rst_n_send),.ack(ack),.dout(w_data),.ready(ready));

	shake_hand_recv u2(.din(w_data),.clk(clk_recv),.rst_n(rst_n_recv),.ready(ready),.dout(dout),.ack(ack));
endmodule
