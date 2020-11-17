//date:2020-4-28
//author:WangFW

`timescale 10ns/1ns
module sync_fifo_ver2_tb();
	reg clk,rst_n,wr,rd;
	reg [7:0] din;
	wire [7:0] dout;
	wire full,empty;
	reg [7:0] temp=0;
	initial
		begin
			clk=0;
			rst_n=1;
			wr=0;
			rd=0;
			#10 rst_n=0;
			#10 rst_n=1;


			push(1);
			push(2);
			push(3);
			push(4);
			push(5);
			push(6);
			push(7);
			push(8);
			push(9);
			push(10);
			push(11);
			push(12);
			push(13);
			push(14);
			push(15);
			push(16);
			push(17);
			pop(temp);
			pop(temp);
			pop(temp);
			pop(temp);
			pop(temp);
			pop(temp);
			pop(temp);
			pop(temp);
			pop(temp);
			pop(temp);
			pop(temp);
			pop(temp);
			pop(temp);
			pop(temp);
			pop(temp);
			pop(temp);
			pop(temp);
			pop(temp);
			
		end

	always #2 clk<=~clk;

	sync_fifo_ver2 dut(.clk(clk),.rst_n(rst_n),.wr(wr),.rd(rd),.din(din),.full(full),.empty(empty),.dout(dout));

	task push(input [7:0] data);
		if(full)
			$display("The FIFO has been full! Data:%d cannot been push!",data);
		else
			begin
				$display("Push:%d",data);
				din<=data;
				wr<=1;
				@(posedge clk);
				#3 wr = 0;
			end
	endtask

	task pop(output [7:0] data);
		if(empty)
			$display("The FIFO has been empty! Data cannot been poped!");
		else
			begin
				rd = 1;
				@(posedge clk);
				#3 rd = 0;
				data = dout;
				$display("------Poped:",,data);
			end
	endtask


endmodule
