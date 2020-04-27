`define buf_width 4	//地址宽度
`define buf_size 8	//数据个数，FIFO深度
module sync_fifo_ver1(clk,rst_n,buf_in,buf_out,wr_en,rd_en,buf_empty,buf_full,fifo_cnt);
	input clk,rst_n;
	input wr_en,rd_en;
	input [7:0] buf_in;
	output reg [7:0] buf_out;
	output wire buf_empty,buf_full;
	output reg [`buf_width-1:0] fifo_cnt;

	reg [`buf_size-2:0] rd_ptr,wr_ptr;
	reg [7:0] buf_mem [0:`buf_size-1];

	//判断空满
	assign buf_empty=(fifo_cnt==0);
	assign buf_full=(fifo_cnt==`buf_size);

	always @(posedge clk or negedge rst_n)
		if(!rst_n)
			fifo_cnt<=0;
		else if((!buf_full&&wr_en)&&(!buf_empty&&rd_en))
			fifo_cnt<=fifo_cnt;
		else if(!buf_full&&wr_en)
			fifo_cnt<=fifo_cnt+1'b1;
		else if(!buf_empty&&rd_en)
			fifo_cnt<=fifo_cnt-1'b1;
		else
			fifo_cnt<=fifo_cnt;
	
	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				buf_out<=0;
			if(rd_en&&!buf_empty)
				buf_out<=buf_mem[rd_ptr];
		end

	always @(posedge clk or negedge rst_n)
		if(wr_en&&!buf_full)
			buf_mem[wr_ptr]<=buf_in;

	always @(posedge clk or negedge rst_n)
		if(!rst_n)
			begin
				wr_ptr<=0;
				rd_ptr<=0;
			end
		else
			begin
				if(!buf_full&&wr_en)
					wr_ptr<=wr_ptr+1'b1;
				if(!buf_empty&&rd_en)
					rd_ptr<=rd_ptr+1'b1;
			end
endmodule
