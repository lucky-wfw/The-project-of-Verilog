//The testbench of drink_machine
//author:WangFW
//date:2020-6-3


`timescale 10ns/1ns
module drink_machine_tb();
	reg clk;
	reg rst_n;
	//reg load;
	reg [1:0] coin;
	wire drink;
	wire [1:0] back;


	initial
		begin
			clk=0;
			rst_n=1;
			coin=2'b00;
			#10 rst_n=0;
			#10 rst_n=1;
			//init---s2---s3
			#5 coin=2'b01;
			#5 coin=2'b00;
			#5 coin=2'b01;
			#5 coin=2'b00;
			//init---s2--s4
			#5 coin=2'b01;
			#5 coin=2'b00;
			#5 coin=2'b10;
			#5 coin=2'b00;
			//init---s1
			#5 coin=2'b10;
			#5 coin=2'b00;
		end

	always #2 clk<=~clk;

	drink_machine dut(.clk(clk),.rst_n(rst_n),.coin(coin),.drink(drink),.back(back));
endmodule
