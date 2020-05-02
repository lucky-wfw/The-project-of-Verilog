//The testbench of shank_hand_send
//author:WangFW
//date:2020-5-2

`timescale 10ns/1ns
module shake_hand_send_tb();
	reg clk,rst_n;
	reg ack;
	reg [7:0]din;
	wire ready;
	wire [7:0] dout;

	initial
		begin
			clk=0;
			rst_n=1;
			ack=0;
			din=8'd0;
			#10 rst_n=0;
			#10 rst_n=1;
			#10 din=8'b1010_1010;
			#10 ack=1'b1;
			#10 ack=1'b0;
		end

	always #2 clk<=~clk;

	shake_hand_send dut(.clk(clk),.rst_n(rst_n),.din(din),.ack(ack),.dout(dout),.ready(ready));
endmodule
