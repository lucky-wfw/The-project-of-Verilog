`timescale 1ns/1ns

module pwm_tb();
	reg clk,rst_n,pwm_en;
	reg [7:0] period_ini,period_min,period_max;
	reg [6:0] duty_ini,duty_min,duty_max;
	reg inc,dec;
	wire pwm;

	initial
		begin
			clk=0;
			rst_n=1;
			pwm_en=0;
			period_ini=200;
			period_min=50;
			period_max=250;
			duty_ini=60;
			duty_min=25;
			duty_max=120;

			inc=0;
			dec=0;
			#10 rst_n=0;
			#10 rst_n=1;
			
			pwm_en=1;
		end

	always #2 clk<=~clk;

	initial
		begin
			#3000 inc=0;
			dec=0;
			#10 inc=1;
			//#10 inc=0;
			//#10 dec=1;
			//#10 dec=0;
		end
			

	pwm dut(clk,rst_n,pwm_en,period_ini,period_min,period_max,duty_ini,duty_min,duty_max,inc,dec,pwm);
endmodule
