`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2021 11:44:40 AM
// Design Name: 
// Module Name: vector_dot_3
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


module vector_dot_3(
    output [31:0] out,
    input [31:0] a0,
    input [31:0] a1,
    input [31:0] a2,
    input [31:0] b0,
    input [31:0] b1,
    input [31:0] b2,
    
    input clk,
    input rst
    );
    
    wire [31:0] result [0:3];
    wire [4:0] stb;

    
    
    mul mul0(result[0], stb[0], a0, b0, clk, rst);
    mul mul1(result[1], stb[1], a1, b1, clk, rst);
    mul mul2(result[2], stb[2], a2, b2, clk, rst);  
    adder adder0(result[3], stb[3], result[0], result[1], 1'b0, clk, rst);
    adder adder1(out, stb[4], result[3], result[2], 1'b0, clk, rst);
    
    
endmodule
