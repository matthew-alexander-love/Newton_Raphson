`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2021 10:29:32 PM
// Design Name: 
// Module Name: next_invJ
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
// Broydens Formula for invJ[n+1] ~ invJ[n]
//////////////////////////////////////////////////////////////////////////////////


module next_invJ(
    output [31:0] next_invJ0,
    output [31:0] next_invJ1,
    output [31:0] next_invJ2,
    output [31:0] next_invJ3,
    output [31:0] next_invJ4,
    output [31:0] next_invJ5,
    output [31:0] next_invJ6,
    output [31:0] next_invJ7,
    output [31:0] next_invJ8,
    output [31:0] next_invJ9,
    output [31:0] next_invJ10,
    output [31:0] next_invJ11,
    
    input [31:0] invJ0,
    input [31:0] invJ1,
    input [31:0] invJ2,
    input [31:0] invJ3,
    input [31:0] invJ4,
    input [31:0] invJ5,
    input [31:0] invJ6,
    input [31:0] invJ7,
    input [31:0] invJ8,
    input [31:0] invJ9,
    input [31:0] invJ10,
    input [31:0] invJ11,
    
    input [31:0] f0,
    input [31:0] f1,
    input [31:0] f2,
    input [31:0] f3,
    
    input [31:0] next_f0,
    input [31:0] next_f1,
    input [31:0] next_f2,
    input [31:0] next_f3,
    
    input [31:0] x0,
    input [31:0] x1,
    input [31:0] x2,

    input [31:0] next_x0,
    input [31:0] next_x1,
    input [31:0] next_x2,

    input clk,
    input rst
    );
    wire [35:0] stb;
    wire [31:0] delx [0:2];
    wire [31:0] delF [0:3];
    
    // getting delx
    adder adder0(delx[0], stb[0], next_x0, x0, 1'b1, clk, rst);
    adder adder1(delx[1], stb[1], next_x1, x1, 1'b1, clk, rst);
    adder adder2(delx[2], stb[2], next_x2, x1, 1'b1, clk, rst);
    
    // geeting delF
    adder adder3(delF[0], stb[3], next_f0, f0, 1'b1, clk, rst);
    adder adder4(delF[1], stb[4], next_f1, f1, 1'b1, clk, rst);
    adder adder5(delF[2], stb[5], next_f2, f2, 1'b1, clk, rst);
    adder adder6(delF[3], stb[6], next_f3, f3, 1'b1, clk, rst);
    
    wire [31:0] denom0 [0:3];
    wire [31:0] denom1;
    //getting denominator of fraction
    vector_dot_3 vd0(denom0[0], delx[0], delx[1], delx[2], invJ0, invJ4, invJ8, clk, rst);
    vector_dot_3 vd1(denom0[1], delx[0], delx[1], delx[2], invJ1, invJ5, invJ9, clk, rst);
    vector_dot_3 vd3(denom0[2], delx[0], delx[1], delx[2], invJ2, invJ6, invJ10, clk, rst);
    vector_dot_3 vd4(denom0[3], delx[0], delx[1], delx[2], invJ3, invJ7, invJ11, clk, rst);
    vector_dot_4 vd5(denom1, denom0[0], denom0[1], denom0[2], denom0[3], delF[0], delF[1], delF[2], delF[3], clk, rst);
    
    wire [31:0] numer0 [0:2];
    wire [31:0] numer1 [0:2];
    // getting numerator
    vector_dot_4 vd6(numer0[0], invJ0, invJ1, invJ2, invJ3, delF[0], delF[1], delF[2], delF[3], clk, rst);
    vector_dot_4 vd7(numer0[1], invJ4, invJ5, invJ6, invJ7, delF[0], delF[1], delF[2], delF[3], clk, rst);
    vector_dot_4 vd8(numer0[2], invJ8, invJ9, invJ10, invJ11, delF[0], delF[1], delF[2], delF[3], clk, rst);
    adder adder7(numer1[0], stb[7], delx[0], numer0[0], 1'b1, clk, rst);
    adder adder8(numer1[1], stb[8], delx[1], numer0[1], 1'b1, clk, rst);
    adder adder9(numer1[2], stb[9], delx[2], numer0[2], 1'b1, clk, rst);
    
    wire [31:0] fraction [0:2];
    //dividing frac numerator by const denom
    div div0(fraction[0], stb[10], numer1[0], denom1, clk, rst);
    div div1(fraction[1], stb[11], numer1[1], denom1, clk, rst);
    div div2(fraction[2], stb[12], numer1[2], denom1, clk, rst);
    
    wire [31:0] adjust_const;
    wire [31:0] adjust_matrix [0:11];
    //calculating final adjustmet factor
    vector_dot_3 vd9(adjust_const, fraction[0], fraction[1], fraction[2], delx[0], delx[1], delx[2], clk, rst);
    mul mul0(adjust_matrix[0], stb[12], adjust_const, invJ0, clk, rst);
    mul mul1(adjust_matrix[1], stb[13], adjust_const, invJ1, clk, rst);
    mul mul2(adjust_matrix[2], stb[14], adjust_const, invJ2, clk, rst);
    mul mul3(adjust_matrix[3], stb[15], adjust_const, invJ3, clk, rst);
    mul mul4(adjust_matrix[4], stb[16], adjust_const, invJ4, clk, rst);
    mul mul5(adjust_matrix[5], stb[17], adjust_const, invJ5, clk, rst);
    mul mul6(adjust_matrix[6], stb[18], adjust_const, invJ6, clk, rst);
    mul mul7(adjust_matrix[7], stb[19], adjust_const, invJ7, clk, rst);
    mul mul8(adjust_matrix[8], stb[20], adjust_const, invJ8, clk, rst);
    mul mul9(adjust_matrix[9], stb[21], adjust_const, invJ9, clk, rst);
    mul mul10(adjust_matrix[10], stb[22], adjust_const, invJ10, clk, rst);
    mul mul11(adjust_matrix[11], stb[23], adjust_const, invJ11, clk, rst);
    
    //subtracting adjustment from old invJ
    adder adder10(next_invJ0, stb[24], invJ0, adjust_matrix[0], 1'b1, clk, rst);
    adder adder11(next_invJ1, stb[25], invJ1, adjust_matrix[1], 1'b1, clk, rst);
    adder adder12(next_invJ2, stb[26], invJ2, adjust_matrix[2], 1'b1, clk, rst);
    adder adder13(next_invJ3, stb[27], invJ3, adjust_matrix[3], 1'b1, clk, rst);
    adder adder14(next_invJ4, stb[28], invJ4, adjust_matrix[4], 1'b1, clk, rst);
    adder adder15(next_invJ5, stb[29], invJ5, adjust_matrix[5], 1'b1, clk, rst);
    adder adder16(next_invJ6, stb[30], invJ6, adjust_matrix[6], 1'b1, clk, rst);
    adder adder17(next_invJ7, stb[31], invJ7, adjust_matrix[7], 1'b1, clk, rst);
    adder adder18(next_invJ8, stb[32], invJ8, adjust_matrix[8], 1'b1, clk, rst);
    adder adder19(next_invJ9, stb[33], invJ9, adjust_matrix[9], 1'b1, clk, rst);
    adder adder20(next_invJ10, stb[34], invJ10, adjust_matrix[10], 1'b1, clk, rst);
    adder adder21(next_invJ11, stb[35], invJ11, adjust_matrix[11], 1'b1, clk, rst);

endmodule
