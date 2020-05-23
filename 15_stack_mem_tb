//The testbench of stack_mem used by system verilog
//author:WangFW
//date:2020-5-23

`timescale 10ns/1ns

module stack_mem_tb();
	reg clk;
	reg rst_n;
	reg wr;
	reg rd;
	reg en;
	reg [7:0] din;
	wire full;
	wire empty;
	wire [7:0] dout;

	reg [5:0] count;

	class src;
		rand bit [7:0] data;
		function display;
			$display("data=%d",data);
		endfunction
	endclass

	src t;

	initial
		begin
			t=new();
			clk=0;
			en=1;
			wr=0;
			rd=0;
			din=8'd0;
			rst_n=1;
			#10 rst_n=0;
			#10 rst_n=1;

			wr=1;
			count=0;
			repeat(35)
				begin
					@(posedge clk);
					count=count+1'b1;
					t.randomize();
					din=t.data;
					$display("cycle-%d: din = %d, full = %b",count,din,full);
				end
			
			wr=0;
			rd=1;
			count=0;
			repeat(35)
				begin
					@(posedge clk);
					count=count+1'b1;
					$display("cycle-%d: dout = %d, empty = %b",count,dout,empty);
				end
			
			rd=0;
		end

	always #2 clk<=~clk;

	stack_mem dut(.clk(clk),.rst_n(rst_n),.en(en),.wr(wr),.rd(rd),.din(din),.full(full),.empty(empty),.dout(dout));
endmodule

		
