//The testbench of shake_hand_recv
//author:WangFW
//date:2020-5-2

`timescale 10ns/1ns

module shake_hand_recv_tb();
	reg clk,rst_n;
	reg ready;
	reg [7:0] din;

	wire [7:0]dout;
	wire ack;

	initial
		begin
			clk=0;
			rst_n=1;
			ready=0;
			din=8'd0;
			#10 rst_n=0;
			#10 rst_n=1;
			#10 din=7'b1010_1010;
			ready=1;
			#10 din=8'd0;
			#10 ready=0;
		end
	
	always #2 clk<=~clk;

	shake_hand_recv dut(.clk(clk),.rst_n(rst_n),.din(din),.ready(ready),.dout(dout),.ack(ack));
endmodule
