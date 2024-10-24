module datapath2(input clk, rst, 
	 	clr1, en1, 
		ld1, shL1,
		ld2, ld3,
		clr2, en2,
		clr3, en3,
		wen,
		output x15,
		output [3:0] num1C , num3,
		output [4:0] num2C);
	
	wire [2:0] shiftout;
	wire [3:0] num1;
	wire [4:0] num2;
	wire [7:0] reg2out, reg3out;
	wire [15:0] RAMout, shLout, multout;
	wire [31:0] c3out;

	assign num1C = num1;
	assign num2C = num2;
	assign x15 = shLout[15];

	counter #(4) cnt1(clk, rst, clr1, en1, num1);
	inRAM inram(num1, RAMout);
	ShiftLReg2 shiftreg1(clk, rst, ld1, shL1, RAMout, shLout);
	register reg2 (clk, rst, ld2, shLout[15:8], reg2out);
	register reg3 (clk, rst, ld3, shLout[15:8], reg3out);
	mult multiplier(reg2out, reg3out, multout);
	counter #(5) cnt2 (clk, rst, clr2, en2, num2);
	counter #(4) cnt3 (clk, rst, clr3, en3, num3);
	shifter shift(num1, shiftout);
	concat2 c2(num2, multout, c3out);
	outRAM outram(clk, rst, wen, shiftout, c3out);

endmodule
