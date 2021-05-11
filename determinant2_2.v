`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2021 12:12:58 AM
// Design Name: 
// Module Name: determinant2_2
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


module determinant2_2(
    output [31:0] determinant,
    input [31:0] a,
    input [31:0] b,
    input [31:0] c,
    input [31:0] d,
    input clk,
    input rst
    );
    
    wire [31:0] ad, bc;
    wire [2:0] stb;
    mul mul0(ad, stb[0], a, d, clk, rst);
    mul mul1(bc, stb[1], b, c, clk, rst);
    adder adder0(determinant, stb[2], ad, bc, 1'b1, clk, rst);
endmodule
