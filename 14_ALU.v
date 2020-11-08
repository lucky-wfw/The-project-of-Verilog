//ALU module
//author:WangFW
//date:2020-5-23

module ALU(clk,rst_n,opcode,dina,dinb,cout,dout);
	input clk;
	input rst_n;
	input [2:0] opcode;
	input [7:0] dina;
	input [7:0] dinb;
	output reg cout;
	output reg [7:0] dout;

	parameter op_add=3'b000;
	parameter op_sub=3'b001;
	parameter op_and=3'b010;
	parameter op_or=3'b011;
	parameter op_xor=3'b100;
	parameter op_sl=3'b101;
	parameter op_sr=3'b110;

	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					cout<=1'b0;
					dout<=8'd0;
				end
			else
				begin
					case(opcode)
						op_add:{cout,dout}<=dina+dinb;
						op_sub:dout<=(dina>dinb)?(dina-dinb):(dinb-dina);
						op_and:dout<=dina&dinb;
						op_or:dout<=dina | dinb;
						op_xor:dout<=dina^dinb;
						op_sl:dout<=dina<<dinb;
						op_sr:dout<=dina>>dinb;
						default:dout<=8'd0;
					endcase
				end
		end
endmodule

						
