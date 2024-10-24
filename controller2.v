module controller2(input clk, rst, start, x15, 
		input [3:0] num1 ,num3,
		input [4:0] num2,
		output reg clr1, en1, ld1, shL1, ld2, ld3, clr2, en2, clr3, en3, wen, done);

	reg[3:0] ps, ns;
	parameter [3:0] A=0, B=1, C=2, D=3, E=4, F=5, G=6, H=7, I=8;

	always @(posedge clk, posedge rst)begin
		if(rst)
			ps <= A;
		else
			ps <=ns;
	end

	always @(start, num1, x15, num3, ps)begin
		ns = A;
		case(ps)
			A: ns = start? B : A;
			B: ns = start? B : C;
			C: ns = D;
			D: ns = (x15 & ~num1[0])? E : (x15 & num1[0])? G : ~x15? F: A;
			E: ns = C;
			F: ns = ((num3 == 4'b1000) & (~num1[0])) ? E : ((num3 == 4'b1000) & (num1[0])) ? G : (num3 != 4'b1000) ? D: A;
			G: ns = H;
			H: ns = (num1 == 4'b1111) ? I : C;
			I: ns = A;
		endcase
	end

	always @(ps)begin
		{clr1, en1, ld1, shL1, ld2, ld3, clr2, en2, clr3, en3, wen, done} = 12'b0;
		case(ps)
			A: ;
			B:begin clr1 =1'b1; clr2=1'b1; clr3=1'b1; end
			C:begin ld1 =1'b1; end
			D:begin en3 = 1'b1; end
			E:begin ld2 = 1'b1; en1 =1'b1; clr3 =1'b1; end
			F:begin en2 = 1'b1; shL1 = 1'b1; end
			G:begin ld3 = 1'b1; clr3= 1'b1; end
			H:begin wen = 1'b1; en1 = 1'b1; clr2 = 1'b1; end
			I:begin done = 1'b1; end
		endcase	
	end		

endmodule
