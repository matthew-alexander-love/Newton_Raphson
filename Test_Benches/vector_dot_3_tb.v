`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2021 12:14:39 PM
// Design Name: 
// Module Name: vector_dot_3_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module vector_dot_3_tb();
    reg [31:0] a0, a1, a2, b0, b1, b2;
    reg clk, rst;
    
    wire [31:0] out;
    
    vector_dot_3 UUT(
        .out(out),
        .a0(a0),
        .a1(a1),
        .a2(a2),
        .b0(b0),
        .b1(b1),
        .b2(b2),
        .clk(clk),
        .rst(rst)
    );

    initial begin
        //a0 = 32'b0;
        //a1 = 32'b0;
        //a2 = 32'b0;
        //b0 = 32'b0;
        //b1 = 32'b0;
        //b2 = 32'b0;
        clk = 0;
        rst = 0;
       
        forever
            #10 clk = ~clk;
    end
    
    initial begin
        $monitor("Input Vector: a0:%8h a1:%8h a2:%8h, b0:%8h b1:%8h b2:%8h \n", a0, a1, a2, b0, b1, b2);
        $monitor("Output Vector: out:%8h", out);
    end
    
    initial begin
        #5{a0, a1, a2, b0, b1, b2} = {32'h40800000, 32'hc0a00000, 32'h40e00000, 32'h40a00000, 32'h40000000, 32'hc1100000}; //4, -5, 7  5,2,-9
        #2000 $finish;
    end
endmodule
