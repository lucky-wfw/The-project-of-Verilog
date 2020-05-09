//The drive module of IIC communication
//author:WangFW
//date:2020-5-6

module i2c_drive(clk,rst_n,bit_ctrl,i2c_enable,i2c_rh_wl,i2c_addr,i2c_data_w,i2c_data_r,i2c_done,scl,sda);

	//The definition of port
	input clk;
	input rst_n;
	input bit_ctrl;
	input i2c_enable;
	input i2c_rh_wl;
	input [15:0] i2c_addr;
	input [7:0] i2c_data_w;
	
	output reg [7:0] i2c_data_r;
	output reg i2c_done;
	output reg scl;
	inout sda;

	//The definition of state of FSM
	parameter idle=8'b0000_0001,send_addr=8'b0000_0010,addr_16=8'b0000_0100,addr_8=8'b0000_1000,
		data_wr=8'b0001_0000,addr_rd=8'b0010_0000,data_rd=8'b0100_0000,stop=8'b1000_0000;

	//The address of slave device
	parameter slave_addr=7'b1010000;

	//The definition of register
	reg sda_dir;		//The direction of sda
	reg sda_out;		//The output of sda
	reg st_done;		//The end of state
	reg wr_flag;		//The flag of write
	reg [6:0] cnt;		//The counter of num
	reg [7:0] state;	//The current state of FSM
	reg [7:0] next_state;	//The next state of FSM
	reg [15:0] addr_t;	//the address
	reg [7:0] data_r;	//the data of read
	reg [7:0] data_wr_t;	//The temp data of write
	
	//The definition of wires
	wire sda_in;		//The input of sda

	//The direction of sda
	assign sda=sda_dir?sda_out:'bz;		//The output of sda
	assign sda_in=sda;			//The input of sda

	
	//The description of IIC by FSM

	//The change to next_state with clock
	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				state<=idle;
			else
				state<=next_state;
		end

	//The change within different states according to the conditions

	always @(*)
		begin
			case(state)
				idle:begin
					if(i2c_enable)
						next_state<=send_addr;
					else
						next_state<=idle;
					end
				send_addr:begin
					if(st_done)
						begin
							if(bit_ctrl==1'b1)
								next_state<=addr_16;
							else
								next_state<=addr_8;
						end
					else
						next_state<=send_addr;
					end
				addr_16:begin
					if(st_done)
						next_state<=addr_8;
					else
						next_state<=addr_16;
					end
				addr_8:begin
					if(st_done)
						begin
							if(wr_flag==1'b0)
								next_state<=data_wr;
							else
								next_state<=addr_rd;
						end
					else
						next_state<=addr_8;
					end
				data_wr:begin
					if(st_done)
						next_state<=stop;
					else
						next_state<=data_wr;
					end
				stop:begin
					if(st_done)
						next_state<=idle;
					else
						next_state<=stop;
					end
				addr_rd:begin
					if(st_done)
						next_state<=data_rd;
					else
						next_state<=addr_rd;
					end
				data_rd:begin
					if(st_done)
						next_state<=stop;
					else
						next_state<=data_rd;
					end
				default:next_state<=idle;
			endcase
		end
	

	//The outputs according to different states

	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					scl<=1'b1;
					sda_out<=1'b1;
					sda_dir<=1'b1;
					i2c_done<=1'b0;
					cnt<=7'd0;
					st_done<=1'b0;
					data_r<=8'd0;
					i2c_data_r<=8'd0;
					wr_flag<=1'b0;
					addr_t<=16'd0;
					data_wr_t<=8'd0;
				end
			else
				begin
					st_done<=1'b0;
					cnt<=cnt+1'b1;
					case(state)
						idle:begin
							scl<=1'b1;
							sda_out<=1'b1;
							sda_dir<=1'b1;
							i2c_done<=1'b0;
							cnt<=7'd0;
							if(i2c_enable)
								begin
									wr_flag<=i2c_rh_wl;
									addr_t<=i2c_addr;
									data_wr_t<=i2c_data_w;
								end
							end
						send_addr:begin
							case(cnt)
								7'd1:sda_out<=1'b0;
								7'd3:scl<=1'b0;
								7'd4:sda_out<=slave_addr[6];
								7'd5:scl<=1'b1;
								7'd7:scl<=1'b0;
								7'd8:sda_out<=slave_addr[5];
								7'd9:scl<=1'b1;
								7'd11:scl<=1'b0;
								7'd12:sda_out<=slave_addr[4];
								7'd13:scl<=1'b1;
								7'd15:scl<=1'b0;
								7'd16:sda_out<=slave_addr[3];
								7'd17:scl<=1'b1;
								7'd19:scl<=1'b0;
								7'd20:sda_out<=slave_addr[2];
								7'd21:scl<=1'b1;
								7'd23:scl<=1'b0;
								7'd24:sda_out<=slave_addr[1];
								7'd25:scl<=1'b1;
								7'd27:scl<=1'b0;
								7'd28:sda_out<=slave_addr[0];
								7'd29:scl<=1'b1;
								7'd31:scl<=1'b0;
								7'd32:sda_out<=1'b0;	//write signal!!!!!!!!!!!!!!!!!!
								7'd23:scl<=1'b1;
								7'd35:scl<=1'b0;
								7'd36:begin
									sda_dir<=1'b0;	//the ack of slave
									sda_out<=1'b1;
									end
								7'd37:scl<=1'b1;
								7'd38:st_done<=1'b1;
								7'd39:begin
									scl<=1'b0;
									cnt<=7'd0;
									end
								default:;
							endcase
							end
						addr_16:begin
							case(cnt)
								7'd0:begin
									sda_dir<=1'b1;
									sda_out<=addr_t[15];
									end
								7'd1:scl<=1'b1;
								7'd3:scl<=1'b0;
								7'd4:sda_out<=addr_t[14];
								7'd5:scl<=1'b1;
								7'd7:scl<=1'b0;
								7'd8:sda_out<=addr_t[13];
								7'd9:scl<=1'b1;
								7'd11:scl<=1'b0;
								7'd12:sda_out<=addr_t[12];
								7'd13:scl<=1'b1;
								7'd15:scl<=1'b0;
								7'd16:sda_out<=addr_t[11];
								7'd17:scl<=1'b1;
								7'd19:scl<=1'b0;
								7'd20:sda_out<=addr_t[10];
								7'd21:scl<=1'b1;
								7'd23:scl<=1'b0;
								7'd24:sda_out<=addr_t[9];
								7'd25:scl<=1'b1;
								7'd27:scl<=1'b0;
								7'd28:sda_out<=addr_t[8];
								7'd29:scl<=1'b1;
								7'd31:scl<=1'b0;
								7'd32:begin
									sda_dir<=1'b0;	//the ack of slave
									sda_out<=1'b1;
									end
								7'd33:scl<=1'b1;
								7'd34:st_done<=1'b1;
								7'd35:begin
									scl<=1'b0;
									cnt<=7'd0;
									end
								default:;
							endcase
							end
						addr_8:begin
							case(cnt)
								7'd0:begin
									sda_dir<=1'b1;
									sda_out<=addr_t[7];
									end
								7'd1:scl<=1'b1;
								7'd3:scl<=1'b0;
								7'd4:sda_out<=addr_t[6];
								7'd5:scl<=1'b1;
								7'd7:scl<=1'b0;
								7'd8:sda_out<=addr_t[5];
								7'd9:scl<=1'b1;
								7'd11:scl<=1'b0;
								7'd12:sda_out<=addr_t[4];
								7'd13:scl<=1'b1;
								7'd15:scl<=1'b0;
								7'd16:sda_out<=addr_t[3];
								7'd17:scl<=1'b1;
								7'd19:scl<=1'b0;
								7'd20:sda_out<=addr_t[2];
								7'd21:scl<=1'b1;
								7'd23:scl<=1'b0;
								7'd24:sda_out<=addr_t[1];
								7'd25:scl<=1'b1;
								7'd27:scl<=1'b0;
								7'd28:sda_out<=addr_t[0];
								7'd29:scl<=1'b1;
								7'd31:scl<=1'b0;
								7'd32:begin
									sda_dir<=1'b0;	//the ack of slave
									sda_out<=1'b1;
									end
								7'd33:scl<=1'b1;
								7'd34:st_done<=1'b1;
								7'd35:begin
									scl<=1'b0;
									cnt<=7'd0;
									end
								default:;
							endcase
							end
						data_wr:begin
							case(cnt)
								7'd0:begin
									sda_out<=data_wr_t[7];
									sda_dir<=1'b1;
									end
								7'd1:scl<=1'b1;
								7'd3:scl<=1'b0;
								7'd4:sda_out<=data_wr_t[6];
								7'd5:scl<=1'b1;
								7'd7:scl<=1'b0;
								7'd8:sda_out<=data_wr_t[5];
								7'd9:scl<=1'b1;
								7'd11:scl<=1'b0;
								7'd12:sda_out<=data_wr_t[4];
								7'd13:scl<=1'b1;
								7'd15:scl<=1'b0;
								7'd16:sda_out<=data_wr_t[3];
								7'd17:scl<=1'b1;
								7'd19:scl<=1'b0;
								7'd20:sda_out<=data_wr_t[2];
								7'd21:scl<=1'b1;
								7'd23:scl<=1'b0;
								7'd24:sda_out<=data_wr_t[1];
								7'd25:scl<=1'b1;
								7'd27:scl<=1'b0;
								7'd28:sda_out<=data_wr_t[0];
								7'd29:scl<=1'b1;
								7'd31:scl<=1'b0;
								7'd32:begin
									sda_dir<=1'b0;	//the ack of slave
									sda_out<=1'b1;
									end
								7'd33:scl<=1'b1;
								7'd34:st_done<=1'b1;
								7'd35:begin
									scl<=1'b0;
									cnt<=7'd0;
									end
								default:;
							endcase
							end
						addr_rd:begin
							case(cnt)
								7'd0:begin
									sda_dir<=1'b1;
									sda_out<=1'b1;
									end
								7'd1:scl<=1'b1;
								7'd3:scl<=1'b0;
								7'd4:sda_out<=slave_addr[6];
								7'd5:scl<=1'b1;
								7'd7:scl<=1'b0;
								7'd8:sda_out<=slave_addr[5];
								7'd9:scl<=1'b1;
								7'd11:scl<=1'b0;
								7'd12:sda_out<=slave_addr[4];
								7'd13:scl<=1'b1;
								7'd15:scl<=1'b0;
								7'd16:sda_out<=slave_addr[3];
								7'd17:scl<=1'b1;
								7'd19:scl<=1'b0;
								7'd20:sda_out<=slave_addr[2];
								7'd21:scl<=1'b1;
								7'd23:scl<=1'b0;
								7'd24:sda_out<=slave_addr[1];
								7'd25:scl<=1'b1;
								7'd27:scl<=1'b0;
								7'd28:sda_out<=slave_addr[0];
								7'd29:scl<=1'b1;
								7'd31:scl<=1'b0;
								7'd32:sda_out<=1'b1;	//read!!!!!!!!!!!!!!!!!!!
								7'd33:scl<=1'b1;
								7'd35:scl<=1'b0;
								7'd36:begin
									sda_dir<=1'b0;	//the ack of slave
									sda_out<=1'b1;
									end
								7'd37:scl<=1'b1;
								7'd38:st_done<=1'b1;
								7'd39:begin
									scl<=1'b0;
									cnt<=7'd0;
									end
								default:;
							endcase
							end
						data_rd:begin
							case(cnt)
								7'd0:sda_dir<=1'b0;
								7'd1:begin
									data_r[7]<=sda_in;
									scl<=1'b1;
									end
								7'd3:scl<=1'b0;
								7'd5:begin
									data_r[6]<=sda_in;
									scl<=1'b1;
									end
								7'd7:scl<=1'b0;
								7'd9:begin
									data_r[5]<=sda_in;
									scl<=1'b1;
									end
								7'd11:scl<=1'b0;
								7'd13:begin
									data_r[4]<=sda_in;
									scl<=1'b1;
									end
								7'd15:scl<=1'b0;
								7'd17:begin
									data_r[3]<=sda_in;
									scl<=1'b1;
									end
								7'd19:scl<=1'b0;
								7'd21:begin
									data_r[2]<=sda_in;
									scl<=1'b1;
									end
								7'd23:scl<=1'b0;
								7'd25:begin
									data_r[1]<=sda_in;
									scl<=1'b1;
									end
								7'd27:scl<=1'b0;
								7'd29:begin
									data_r[0]<=sda_in;
									scl<=1'b1;
									end
								7'd31:scl<=1'b0;
								7'd32:begin
									sda_dir<=1'b1;		//non ack
									sda_out<=1'b1;
									end
								7'd33:scl<=1'b1;
								7'd34:st_done<=1'b1;
								7'd35:begin
									scl<=1'b0;
									cnt<=7'd0;
									i2c_data_r<=data_r;
									end
								default:;
							endcase
							end
						stop:begin
							case(cnt)
								7'd0:begin
									sda_dir<=1'b1;
									sda_out<=1'b0;
									end
								7'd1:scl<=1'b1;
								7'd3:sda_out<=1'b1;
								7'd15:st_done<=1'b1;
								7'd16:begin
									cnt<=7'd0;
									i2c_done<=1'b1;
									end
								default:;
							endcase
							end
					endcase
				end
		end
endmodule
