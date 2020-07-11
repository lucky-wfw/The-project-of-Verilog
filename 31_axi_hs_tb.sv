//The testbench of axi_hs
//date:2020-7-11
//author:WangFW

module axi_hs_tb();
	reg clk,rst_n;
	reg [7:0] din_a,din_b;
	reg din_valid;
	wire din_ready;

	reg dout_ready;
	wire [7:0]dout;
	wire dout_valid;

	class Data;
		rand bit [7:0] din_a,din_b;
		rand bit din_valid,dout_ready;
		function void dsiplay();
			$display("A=%0d, b=%0d",din_a,din_b);
		endfunction
	endclass


	Data din;

	initial
		begin
			clk=0;
			rst_n=1;
			#10 rst_n=0;
			#10 rst_n=1;
			din=new();
			repeat(1000)
				begin
					@(posedge clk)
					din.randomize();
					din_a=din.din_a;
					din_b=din.din_b;
					din_valid=din.din_valid;
					dout_ready=din.dout_ready;
				end
		end

	always #2 clk<=~clk;

	axi_hs dut(.clk(clk),.rst_n(rst_n),.din_a(din_a),.din_b(din_b),.din_valid(din_valid),.din_ready(din_ready),
			.dout(dout),.dout_valid(dout_valid),.dout_ready(dout_ready));

endmodule

			
