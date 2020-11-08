module handshake(clk,rst_n,din,din_valid,din_ready,dout,dout_valid,dout_ready);
	input clk;
	input rst_n;
	//---------------------
	input [3:0] din;
	input din_valid;
	output din_ready;
	//---------------------
	output reg [3:0] dout;
	output reg dout_valid;
	input dout_ready;

	assign din_ready=dout_ready||!dout_valid;

	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					dout_valid<=1'b0;
					dout<=4'd0;
				end
			else
				begin
					dout_valid<=(din_ready)?din_valid:dout_valid;
					dout<=(din_ready&&din_valid)?din:dout;
				end
		end
endmodule
