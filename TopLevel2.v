module TopLevel (input clk, rst, start, output done);
	wire [3:0] num1 ,num3;
	wire [4:0] num2;
	wire clr1, en1, ld1, shL1, ld2, ld3, clr2, en2, clr3, en3, wen, x;

	datapath2 DP(clk, rst, 
	 	clr1, en1, 
		ld1, shL1,
		ld2, ld3,
		clr2, en2,
		clr3, en3,
		wen,
		x,
		num1 , num3,
		num2);

	controller2 CT(clk, rst, start, x, 
		num1 ,num3,
		num2,
		clr1, en1, ld1, shL1, ld2, ld3, clr2, en2, clr3, en3, wen, done);
endmodule
