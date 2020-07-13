`timescale 10ns/1ns
module test_mod3_tb();
	reg clk;
	reg rst_n;
	wire din;
	wire dout;

	reg [23:0] data;

	assign din=data[23];
  	initial 
		begin
  			clk=0;
 		 	rst_n=1;
  			#10 rst_n=0;
  			#10 rst_n=1;
  			data=24'b1010_0101_1001_0101_0100_1001;
 		 end
  	always #2 clk=~clk;
  	always @(posedge clk)
 		 begin
  			data={data[22:0],data[23]};
  		end

	test_mod3 dut(.clk(clk),.rst_n(rst_n),.din(din),.dout(dout));
endmodule
