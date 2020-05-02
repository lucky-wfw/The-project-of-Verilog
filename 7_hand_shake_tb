//The testbench of shake_hand
//author:WangFW
//date:2020-5-2

`timescale 10ns/1ns

module shake_hand_tb();
	reg clk_send,clk_recv,rst_n_send,rst_n_recv;
	reg [7:0] din;
	wire [7:0] dout;

	initial
		begin
			clk_send=0;
			clk_recv=0;
			rst_n_send=1;
			rst_n_recv=1;
			din=8'd0;
			#10 rst_n_send=0;
			rst_n_recv=0;
			#10 rst_n_send=1;
			rst_n_recv=1;
			#10 din=8'b1010_1010;
			#10 din=8'b0101_0101;
		end

	always #2 clk_send<=~clk_send;
	
	always #4 clk_recv<=~clk_recv;

	shake_hand dut(.clk_send(clk_send),.clk_recv(clk_recv),.rst_n_send(rst_n_send),.rst_n_recv(rst_n_recv),.din(din),.dout(dout));
endmodule
