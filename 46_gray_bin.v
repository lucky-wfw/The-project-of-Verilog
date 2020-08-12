// Gray code to bin code
// Author:WangFW
// Date:2020-8-12

module gray_bin(gray,bin);
	parameter length = 4; 
	input [length-1:0] gray; 
	output [length-1:0] bin; 

	reg [length-1:0] bin; 
	integer i;
	always @ (gray)
		begin    
    			bin[length-1]=gray[length-1];    
    			for(i=length-2;i>=0;i=i-1)        
        			bin[i]=bin[i+1]^gray[i];
		end
endmodule

			
			
