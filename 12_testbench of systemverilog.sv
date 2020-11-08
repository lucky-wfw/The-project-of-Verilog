`timescale 10ns/1ns

module test23_tb();

	reg [7:0] a;
	reg [7:0] b;
	reg cin;
	wire [7:0] sum;
	wire cout;


	class src;
		rand bit [7:0] a;
		rand bit [7:0] b;
		rand bit c;
	
		function void display();
			$display("a=%d,b=%d,c=%b",a,b,c);
		endfunction
	endclass

	initial
		begin
			repeat(10)
				begin
					src t;
					t=new();
					#10 t.randomize();
					t.display();
					a=t.a;
					b=t.b;
					cin=t.c;
				end
		end

	test23 dut(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));
endmodule

		
