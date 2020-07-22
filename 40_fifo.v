//The async FIFO
//author:WangFW
//date:2020-7-22

module test_fifo(rst_n,w_clk,w_en,din,r_clk,r_en,empty,full,dout);
	input rst_n;
	input w_clk;
	input w_en;
	input [7:0] din;
	input r_clk;
	input r_en;
	output empty;
	output full;
	output reg [7:0] dout;

	reg [7:0] mem [7:0];
	
	reg [3:0] w_ptr,r_ptr;
	wire [2:0] w_addr,r_addr;

	wire [3:0] w_ptr_gray,r_ptr_gray;
	reg [3:0] w_r_d1,w_r_d2,r_w_d1,r_w_d2;

	//the write process
	always @(posedge w_clk or rst_n)
		begin
			if(!rst_n)
				begin
					w_ptr<=4'd0;
				end
			else
				begin
					if((!full)&&w_en)
						w_ptr<=w_ptr+1'b1;
					else
						w_ptr<=w_ptr;
				end
		end

	assign w_addr=w_ptr[2:0];

	always @(posedge w_clk)
		begin
			if((!full)&&w_en)
				mem[w_addr]<=din;
		end

	//the read process
	always @(posedge r_clk or rst_n)
		begin
			if(!rst_n)
				r_ptr<=4'd0;
			else
				begin
					if((!empty)&&r_en)
						r_ptr<=r_ptr+1'b1;
					else
						r_ptr<=r_ptr;
				end
		end

	assign r_addr=r_ptr[2:0];
	
	always @(posedge r_clk)
		begin
			if((!empty)&&r_en)
				dout<=mem[r_addr];
		end

	//the generation of empty or full flag

	assign w_ptr_gray=w_ptr^(w_ptr>>1);
	
	always @(posedge r_clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					w_r_d1<=4'd0;
					w_r_d2<=4'd0;
				end
			else
				begin
					w_r_d1<=w_ptr_gray;
					w_r_d2<=w_r_d1;
				end
		end

	assign empty=(w_r_d2==r_ptr_gray);


	assign r_ptr_gray=r_ptr^(r_ptr>>1);

	always @(posedge w_clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					r_w_d1<=4'd0;
					r_w_d2<=4'd0;
				end
			else
				begin
					r_w_d1<=r_ptr_gray;
					r_w_d2<=r_w_d1;
				end
		end
	
	assign full=(r_w_d2[3]!=w_ptr_gray[3])&&(r_w_d2[2]!=w_ptr_gray[2])&&(r_w_d2[1:0]==w_ptr_gray[1:0]);

endmodule
