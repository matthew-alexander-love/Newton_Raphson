`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2021 02:14:45 AM
// Design Name: 
// Module Name: determinant2_2_tb
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


module determinant2_2_tb();
    wire [31:0] determinant;
    
    reg [31:0] a, b, c, d;
    reg clk, rst;
    
    determinant2_2 UUT(
        .determinant(determinant),
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .clk(clk),
        .rst(rst)
    );
    
    initial begin
        clk = 0;
        rst = 0;
        
        forever
            #10 clk =~clk;
    end

    initial begin
        #5;
        a = 32'h40400000;//3
        b = 32'h40000000;//2
        c = 32'h40e00000; //7
        d = 32'h41000000; //8
    end
endmodule
