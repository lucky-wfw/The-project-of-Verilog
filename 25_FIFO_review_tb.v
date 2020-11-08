//The testbench of FIFO
//author:WangFW
//date:2020-6-5


`timescale 10ns/1ns
`define data_width 8
`define data_depth 8
`define addr_width 3

module FIFO_review_tb();
	reg rst_n,wr_clk,wr_en,rd_clk,rd_en;
	reg [`data_width-1:0] din;
	wire full,empty;
	wire [`data_width-1:0] dout;

	reg [`data_width-1:0] temp=0;

	initial
		begin
			rst_n=1;
			wr_clk=0;
			wr_en=0;
			rd_clk=0;
			rd_en=0;
			#10 rst_n=0;
			#10 rst_n=1;
		end

	always #5 wr_clk<=~wr_clk;
	always #16 rd_clk<=~rd_clk;


	FIFO_review dut(.rst_n(rst_n),.wr_clk(wr_clk),.wr_en(wr_en),.rd_clk(rd_clk),.rd_en(rd_en),.din(din),.full(full),.empty(empty),
				.dout(dout));

	


	initial 
		begin
			#30 push(1);
			push(2);
			push(3);
			push(4);
			push(5);
			push(6);
			push(7);	
			push(8);
			push(9);
			push(10);	
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



	task push (input [`data_width-1:0] data);
		if(full)
			$display("---Cannot push %d: Buffer Full---",data);
		else begin
			$display("Push",,data);
			din = data;
			wr_en = 1;
			@(posedge wr_clk);
			#1 wr_en = 0;
		end
	endtask
	
	task pop(output[`data_width-1:0] data);
		if(empty)
			$display("---Cannot Pop: Buffer Empty---");
		else begin
			rd_en = 1;
			@(posedge rd_clk);
			#1 rd_en = 0;
			data = dout;
			$display("------Poped:",,data);
		end		
	endtask
endmodule
