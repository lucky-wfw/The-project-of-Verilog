//The handshake process of AXI BUS
//date:2020-7-11
//author:WangFW

module axi_hs(clk,rst_n,din_a,din_b,din_valid,din_ready,dout,dout_valid,dout_ready);
	input clk;
	input rst_n;
	//din part
	input [7:0] din_a,din_b;
	input din_valid;
	output din_ready;
	//dout part
	output reg [7:0] dout;
	output reg dout_valid;
	input dout_ready;

	assign din_ready=dout_ready||!dout_valid;
	
	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					dout<=8'd0;
					dout_valid<=1'b0;
				end
			else
				begin
					if(din_valid&&din_ready)
						begin
							dout<=din_a+din_b;
							dout_valid<=1'b1;
						end
					else
						begin
							dout<=8'd0;
							dout_valid<=1'b0;
						end
				end
		end
endmodule
