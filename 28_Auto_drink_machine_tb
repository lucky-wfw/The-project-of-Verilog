//Testbench of auto drink machine
//author:WangFW
//date:2020-6-9

`timescale 10ns/1ns

module Auto_drink_machine_tb();
	reg clk;
	reg rst_n;
	reg [1:0] select;
	reg [1:0] coin;
	wire [1:0] drink;
	wire [1:0] back;

	initial
		begin
			clk=0;
			rst_n=1;
			select=2'b00;
			coin=2'b00;
			#10 rst_n=0;
			#10 rst_n=1;

			//a1--a2--a3
			@(posedge clk)
			select=2'b01;
			@(posedge clk)
			select=2'b00;
			@(posedge clk)
			coin=2'b01;
			@(posedge clk)
			coin=2'b00;
			@(posedge clk)
			coin=2'b01;
			@(posedge clk)
			coin=2'b00;
			
			//a1--a2--a4
			@(posedge clk)
			select=2'b00;
			@(posedge clk)
			select=2'b01;
			@(posedge clk)
			select=2'b00;
			@(posedge clk)
			coin=2'b01;
			@(posedge clk)
			coin=2'b00;
			@(posedge clk)
			coin=2'b10;
			@(posedge clk)
			coin=2'b00;
			

			//a1--a5
			@(posedge clk)
			select=2'b00;
			@(posedge clk)
			select=2'b01;
			@(posedge clk)
			select=2'b00;
			@(posedge clk)
			coin=2'b10;
			@(posedge clk)
			coin=2'b00;

			
			//b1---b2
			@(posedge clk)
			select=2'b00;
			@(posedge clk)
			select=2'b10;
			@(posedge clk)
			select=2'b00;
			@(posedge clk)
			coin=2'b01;
			@(posedge clk)
			coin=2'b00;
			

			//b1---b3
			@(posedge clk)
			select=2'b00;
			@(posedge clk)
			select=2'b10;
			@(posedge clk)
			select=2'b00;
			@(posedge clk)
			coin=2'b10;
			@(posedge clk)
			coin=2'b00;
		end

	always #1 clk<=~clk;

	Auto_drink_machine dut(.clk(clk),.rst_n(rst_n),.coin(coin),.select(select),.drink(drink),.back(back));

endmodule


	
