`timescale 10ns/1ns
module handshake_tb();

	reg clk;
	reg rst_n;
 	reg [3:0] din;
	reg din_valid;
	reg dout_ready;
	wire [3:0] dout;
	wire dout_valid;
	wire din_ready;

	class SRC;
		rand bit din_valid,dout_ready;
		rand bit [3:0] din;
	endclass

	SRC s;

	initial
		begin
			s=new();
			clk=0;
			rst_n=1;
			#10 rst_n=0;
			#10 rst_n=1;
			repeat(100)
				begin
					s.randomize();
					din=s.din;
					din_valid=s.din_valid;
					@(posedge clk)
					dout_ready=s.dout_ready;
				end
		end


	always #2 clk<=~clk;

	handshake dut(.clk(clk),.rst_n(rst_n),.din(din),.din_valid(din_valid),.dout_ready(dout_ready),
			.dout(dout),.dout_valid(dout_valid),.din_ready(din_ready));
		
endmodule
