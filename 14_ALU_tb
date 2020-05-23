//The testbench of ALU
//design by system verilog
//author:WangFW
//date:2020-5-23

`timescale 10ns/1ns

module ALU_tb();
	reg clk;
	reg rst_n;
	reg [2:0] opcode;
	reg [7:0] dina;
	reg [7:0] dinb;
	wire [7:0] dout;
	wire cout;

	class src;
		rand bit [7:0] src_a;
		rand bit [7:0] src_b;
	
		function display;
			$display("a=%d,b=%d",src_a,src_b);
		endfunction
	endclass

	covergroup cov;
		coverpoint opcode;
		coverpoint dina;
		coverpoint dinb;
		coverpoint dout;
	endgroup


	src t;

	initial
		begin
			cov ck;
			t=new();
			ck=new();
			clk=0;
			opcode=3'b000;
			rst_n=1;
			#10 rst_n=0;
			#10 rst_n=1;
			repeat(5000)
				begin
					@(posedge clk);
					opcode=opcode+1'b1;
					t.randomize();
					dina=t.src_a;
					dinb=t.src_b;
					t.display();
					$display("dout=%d,cout=%d",dout,cout);
					ck.sample();
				end
		end

	always #2 clk<=~clk;

	ALU dut(.clk(clk),.rst_n(rst_n),.opcode(opcode),.dina(dina),.dinb(dinb),.cout(cout),.dout(dout));
endmodule
					
				
