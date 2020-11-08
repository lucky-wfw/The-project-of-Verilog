//The testbench of IIC_Drive
//author:WangFW
//date:2020-5-9

`timescale 10ns/1ns

module i2c_drive_tb();
	reg clk;
	reg rst_n;
	reg i2c_enable;
	reg bit_ctrl;
	reg i2c_rh_wl;
	reg [15:0] i2c_addr;
	reg [7:0] i2c_data_w;

	wire [7:0] i2c_data_r;
	wire i2c_done;
	wire scl;
	wire sda;

	initial
		begin
			clk=0;
			rst_n=1;
			i2c_enable=1;
			bit_ctrl=1;
			i2c_rh_wl=0;
			i2c_addr=16'b0000_0000_0000_0001;
			i2c_data_w=8'b1010_1010;
			#10 rst_n=0;
			#10 rst_n=1;
		end

	always #2 clk<=~clk;


	i2c_drive dut(.clk(clk),.rst_n(rst_n),.i2c_enable(i2c_enable),.bit_ctrl(bit_ctrl),.i2c_rh_wl(i2c_rh_wl),.i2c_addr(i2c_addr),
			.i2c_data_w(i2c_data_w),.i2c_data_r(i2c_data_r),.i2c_done(i2c_done),.scl(scl),.sda(sda));


endmodule
