`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2021 02:22:14 PM
// Design Name: 
// Module Name: vector_dot_5
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


module vector_dot_4(
    output [31:0] out,
    input [31:0] a0,
    input [31:0] a1,
    input [31:0] a2,
    input [31:0] a3,
    input [31:0] b0,
    input [31:0] b1,
    input [31:0] b2,
    input [31:0] b3,

    
    input clk,
    input rst
    );
    
    wire [31:0] result [0:5];
    wire [6:0] stb;


    
    mul mul0(result[0], stb[0], a0, b0, clk, rst);
    mul mul1(result[1], stb[1], a1, b1, clk, rst);
    mul mul2(result[2], stb[2], a2, b2, clk, rst);
    mul mul3(result[3], stb[3], a3, b3, clk, rst);
    adder adder0(result[4], stb[4], result[0], result[1], 1'b0, clk, rst);
    adder adder1(result[5], stb[5], result[2], result[3], 1'b0, clk, rst);
    adder adder2(out, stb[6], result[4], result[5], 1'b0, clk, rst);
endmodule