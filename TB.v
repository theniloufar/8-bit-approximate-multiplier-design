`timescale 1ns/1ns
module TB();

    reg clk = 1'b0, rst = 1'b0, start = 1'b0;
    wire done;

    TopLevel TL (clk, rst, start, done);

    always #5 clk = ~clk;
    initial begin
        #15 rst = 1'b1;
        #15 rst = 1'b0;
        #15 start = 1'b1;
        #15 start = 1'b0;
        #5000 $stope;
    end

endmodule