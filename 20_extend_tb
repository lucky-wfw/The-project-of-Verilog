//testbench of module "extend"
//author:WangFW
//date:2020-5-29

module extend_tb();
	reg clk;
	reg rst_n;
	reg din;
	wire dout;

	initial
		begin
			clk=0;
			rst_n=1;
			din=0;
			#10 rst_n=0;
			#10 rst_n=1;
			#10 din=1;
			#2 din=0;
		end


	always #2 clk<=~clk;


	extend dut(.clk(clk),.rst_n(rst_n),.din(din),.dout(dout));
endmodule
