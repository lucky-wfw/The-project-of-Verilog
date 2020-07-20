//The testbench of div3
//author:WangFW
//date:2020-7-20

module test_div3_v2_tb();
	reg clkin;
	reg rst_n;
	wire clkout;

	initial
		begin
			clkin=0;
			rst_n=1;
			#10 rst_n=0;
			#10 rst_n=1;
		end

	always #2 clkin<=~clkin;

	test_div3_v2 dut(.clkin(clkin),.rst_n(rst_n),.clkout(clkout));
endmodule
		
