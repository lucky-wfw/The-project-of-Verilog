//The testbench of seqdet
//author:WangFW
//date:2020-6-4

`timescale 10ns/1ns

module seqdet_tb();
  reg clk,rst_n;
  reg [23:0]data;
  wire flag,x;
  assign x=data[23];
  initial 
	begin
  		 clk=0;
 		 rst_n=1;
  		#10 rst_n=0;
  		#10 rst_n=1;
  		data=24'b1011_0101_1011_0101_0100_0101;
 	 end
  always #2 clk=~clk;
  always @(posedge clk)
 	 begin
  		data={data[22:0],data[23]};
  	end
  seqdet m(.clk(clk),.rst_n(rst_n),.x(x),.flag(flag));
endmodule
