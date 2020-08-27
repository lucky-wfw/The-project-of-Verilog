module pwm(clk,rst_n,pwm_en,period_ini,period_min,period_max,duty_ini,duty_min,duty_max,inc,dec,pwm);
	input clk,rst_n,pwm_en;
	input [7:0] period_ini,period_min,period_max;
	input [6:0] duty_ini,duty_min,duty_max;
	input inc,dec;
	output reg pwm;

	reg [7:0] clk_cnt;
	reg [7:0] period;
	reg [6:0] duty;
	
	reg qout;

	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					duty<=duty_ini;
					period<=period_ini;
				end
			else
				begin
					case({inc,dec})
						2'b00:begin
							duty<=duty;
							period<=period;
							end
						2'b01:begin
							if(duty>duty_min)
								duty<=duty-1'b1;
							else
								duty<=duty;
							if(period>period_min)
								period<=period-1'b1;
							else
								period<=period;
							end
						2'b10:begin
							if(duty<duty_max)
								duty<=duty+1'b1;
							else
								duty<=duty;
							if(period<period_max)
								period<=period+1'b1;
							else
								period<=period;
							end
						2'b11:begin
							duty<=duty;
							period<=period;
							end
					endcase
				end
		end

	always @(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					clk_cnt<=8'd0;
					qout<=1'b0;
				end
			else
				begin
					if(clk_cnt<duty)
						begin
							clk_cnt<=clk_cnt+1'b1;
							qout<=1'b1;
						end
					else if(clk_cnt<period)
						begin
							clk_cnt<=clk_cnt+1'b1;
							qout<=1'b0;
						end
					else
						begin
							clk_cnt<=8'd0;
							qout<=1'b1;
						end
				end
		end

	always @(posedge clk or negedge rst_n)
		begin
			if(~rst_n)
				begin
					pwm<=1'b0;
				end
			else
				begin
					if(pwm_en)
						pwm<=qout;
					else
						pwm<=pwm;
				end
		end
endmodule
