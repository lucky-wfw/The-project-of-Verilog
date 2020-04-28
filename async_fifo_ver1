//The design of async fifo
//date:2020-4-28
//author:WangFW

//Some parameters of fifo

`define data_width 8
`define data_depth 8
`define addr_width 3


module async_fifo_ver1(rst_n,wr_clk,wr_en,din,rd_clk,rd_en,dout,empty,full);
	input rst_n;
	input wr_clk,wr_en;
	input rd_clk,rd_en;
	input [`data_width-1:0] din;
	output full,empty;
	wire full,empty;
	output [`data_width-1:0] dout;
	reg [`data_width-1:0] dout;

	//The RAM for store data
	reg [`data_width-1:0] mem [`data_depth-1:0];

	//The address poniter and adress of ram
	reg [`addr_width:0] wr_ptr,rd_ptr;
	wire [`addr_width-1:0] wr_ram,rd_ram;

	//the reg used for compare
	wire [`addr_width:0] wr_ptr_gray;
	reg [`addr_width:0] wr_ptr_gray_reg1;
	reg [`addr_width:0] wr_ptr_gray_reg2;

	wire [`addr_width:0] rd_ptr_gray;
	reg [`addr_width:0] rd_ptr_gray_reg1;
	reg [`addr_width:0] rd_ptr_gray_reg2;

	//--------------------The process of writing data---------------------------------

	always @(posedge wr_clk)
		if(wr_en&&(~full))
			mem[wr_ram]<=din;

	always @(posedge wr_clk or negedge rst_n)
		if(!rst_n)
			wr_ptr<=0;
		else 
			begin
				if(wr_en&&(~full))
					wr_ptr<=wr_ptr+1'b1;
				else
					wr_ptr<=wr_ptr;
			end

	assign wr_ram=wr_ptr[`addr_width-1:0];


	//--------------------The process of reading data--------------------------------
	always @(posedge rd_clk)
		if((~empty)&&rd_en)
			dout<=mem[rd_ram];

	always @(posedge rd_clk or negedge rst_n)
		if(!rst_n)
			rd_ptr<=0;
		else
			begin
				if((~empty)&&rd_en)
					rd_ptr<=rd_ptr+1'b1;
				else
					rd_ptr<=rd_ptr;
			end

	assign rd_ram=rd_ptr[`addr_width-1:0];


	//--------------------The gray code of read to write domian------------------------
	always @(posedge wr_clk)
		begin
			rd_ptr_gray_reg1<=rd_ptr_gray;
			rd_ptr_gray_reg2<=rd_ptr_gray_reg1;
		end

	assign rd_ptr_gray=(rd_ptr>>1)^rd_ptr;

	//-------------------The gray code of write to read domian--------------------------
	always @(posedge rd_clk)
		begin
			wr_ptr_gray_reg1<=wr_ptr_gray;
			wr_ptr_gray_reg2<=wr_ptr_gray_reg1;
		end

	assign wr_ptr_gray=(wr_ptr>>1)^wr_ptr;

	//--------------------The generate of flag of full and empty------------------------
	assign empty=(rd_ptr_gray==wr_ptr_gray_reg2);
	assign full=(wr_ptr_gray=={~(rd_ptr_gray_reg2[`addr_width-:2]),rd_ptr_gray_reg2[`addr_width-2:0]});
endmodule

