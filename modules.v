module ShiftLReg(input clk, rst, serin, ld, shL, 
		input [15:0] datain,
		output reg serout,
		output reg[15:0] dataout);

	always@(posedge clk , posedge rst)begin	
		if(rst)
			dataout <= 16'b0;
		else if(ld)
			dataout <= datain;
		else if(shL)
			{serout, dataout} <= {dataout , serin};
	end
endmodule

module ShiftLReg2(input clk, rst, ld, shL, 
		input [15:0] datain,
		output reg[15:0] dataout);

	always@(posedge clk , posedge rst)begin	
		if(rst)
			dataout <= 16'b0;
		else if(ld)
			dataout <= datain;
		else if(shL)
			dataout <= {dataout[14:0] , 1'b0};
	end
endmodule


module counter #(parameter n)(input clk, rst, clear, enable,
				output reg [n - 1:0] num);

	always@(posedge clk, posedge rst)begin
		if(rst)
			num <= {n * 1'b0};
		else if(clear)
			num <= {n * 1'b0};
		else if(enable)
			num <= num + 1;
	end
endmodule

module MUX(input sel,
	input [7:0]A, B,
	output [7:0] muxout);

	assign muxout = (sel==1)? B : A;
endmodule


module register (input clk, rst, ld,
			input [7:0] datain,
			output reg [7:0] dataout);

	always@(posedge clk, posedge rst) begin
		if(rst)
			dataout <= {8'b0};
		else if(ld)
			dataout <= datain;
	end
endmodule


module mult(input [7:0] A, B,
		output [15:0] multout);

	assign multout = A * B;
	
endmodule


module concat2 (input [4:0] num2,
		input [15:0] multresult,
		output [31:0] dataout);
	
	assign dataout = multresult << (16 - num2);
endmodule


module shifter(input [3:0] datain,
		output [2:0] dataout);

	assign dataout = datain [3:1];
endmodule
	

module inRAM(input [3:0] address,
		output [15:0] dataout);

	reg [15:0] RAM [0:15];	
	initial $readmemb ("data_input.txt" , RAM);
	assign dataout = RAM[address];

endmodule


module outRAM(input clk, rst, wen,
		input [2:0] address,
		input [31:0] datain);

	reg [31:0] RAM [0:7];	
	initial $readmemb ("data_output.txt" , RAM);

	always@(posedge clk) begin
		if(wen)
			RAM[address] <= datain;
	end
endmodule
	
