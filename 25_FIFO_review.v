//The Async FIFO
//author:WangFW
//date:2020-6-5

module FIFO_review(wr_clk,wr_en,rd_clk,rd_en,rst_n,din,empty,full,dout);
	input wr_clk;
	input wr_en;
	input rd_clk;
	input rd_en;
	input rst_n;
	input [7:0] din;
	output empty;
	output full;
	output reg [7:0] dout;

	reg [7:0] mem [7:0];
	reg [3:0] wr_ptr;
	reg [3:0] rd_ptr;
	wire [2:0] wr_ram;
	wire [2:0] rd_ram;

	wire [3:0] gray_wr;
	reg [3:0] gray_wr_d1;
	reg [3:0] gray_wr_d2;

	wire [3:0] gray_rd;
	reg [3:0] gray_rd_d1;
	reg [3:0] gray_rd_d2;


	//------the process of write---------//
	always @(posedge wr_clk or negedge rst_n)
		begin
			if(!rst_n)
				wr_ptr<=4'd0;
			else
				begin
					if(wr_en&&(!full))
						wr_ptr<=wr_ptr+1'b1;
				end
		end

	always @(posedge wr_clk)
		begin
			mem[wr_ram]<=din;
		end

	assign wr_ram=wr_ptr[2:0];

	//-------the process of read-----------//

	always @(posedge rd_clk or negedge rst_n)
		begin
			if(!rst_n)
				rd_ptr<=4'd0;
			else
				if(rd_en&&(!empty))
					rd_ptr<=rd_ptr+1'b1;
		end

	always @(posedge rd_clk)
		begin
			dout<=mem[rd_ram];
		end

	assign rd_ram=rd_ptr[2:0];

	//----transition from write to read-----//
	always @(posedge rd_clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					gray_wr_d1<=4'd0;
					gray_wr_d2<=4'd0;
				end
			else
				begin
					gray_wr_d1<=gray_wr;
					gray_wr_d2<=gray_wr_d1;
				end
		end

	assign gray_wr=(wr_ptr>>1)^wr_ptr;


	//----transition from read to write-----//
	always @(posedge wr_clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					gray_rd_d1<=4'd0;
					gray_rd_d2<=4'd0;
				end
			else
				begin
					gray_rd_d1<=gray_rd;
					gray_rd_d2<=gray_rd_d1;
				end
		end

	assign gray_rd=(rd_ptr>>1)^rd_ptr;

	//generate the flag of full and empty

	assign empty=(gray_wr_d2==gray_rd);

	assign full=((gray_rd_d2[3]!=gray_wr[3])&&(gray_rd_d2[2]!=gray_wr[2])&&(gray_rd_d2[1:0]==gray_wr[1:0]));
endmodule

	
	
