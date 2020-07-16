

`timescale 1ns/1ns

module test_fast_slow_test();
	reg clka,clkb;
	reg rst_n;
	reg din;
	wire dout;

	initial
		begin
			clka=0;
			clkb=0;
			rst_n=1;
			din=0;
			#10 rst_n=0;
			#10 rst_n=1;
			#10 din=0;
			@(posedge clka) din=1;
			@(posedge clka) din=0;
		end

	always #2 clka<=~clka;
	always #3 clkb<=~clkb;


	test_fast_slow test(.clka(clka),.clkb(clkb),.rst_n(rst_n),.din(din),.dout(dout));
endmodule
