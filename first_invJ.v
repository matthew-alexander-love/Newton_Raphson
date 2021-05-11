`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2021 12:05:50 AM
// Design Name: 
// Module Name: first_invJ
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


module first_invJ(
    output [31:0] invJ0,
    output [31:0] invJ1,
    output [31:0] invJ2,
    output [31:0] invJ3,
    output [31:0] invJ4,
    output [31:0] invJ5,
    output [31:0] invJ6,
    output [31:0] invJ7,
    output [31:0] invJ8,
    output [31:0] invJ9,
    output [31:0] invJ10,
    output [31:0] invJ11,
    /*
    output [31:0] s_m0,
    output [31:0] s_m1,
    output [31:0] s_m2,
    output [31:0] s_m3,
    output [31:0] s_m4,
    output [31:0] s_m5,
    output [31:0] s_m6,
    output [31:0] s_m7,
    output [31:0] s_m8,
    

    
    output [31:0] determinant0,
    output [31:0] determinant1,
    output [31:0] determinant2,
    output [31:0] determinant3,
    output [31:0] determinant4,
    output [31:0] determinant5,
    output [31:0] determinant6,
    output [31:0] determinant7,
    output [31:0] determinant8,
    output [31:0] determinant9,
    output [31:0] determinant10,
    output [31:0] determinant11,
    */
    input [31:0] J0,
    input [31:0] J1,
    input [31:0] J2,
    input [31:0] J3,
    input [31:0] J4,
    input [31:0] J5,
    input [31:0] J6,
    input [31:0] J7,
    input [31:0] J8,
    input [31:0] J9,
    input [31:0] J10,
    input [31:0] J11,
    
    input clk,
    input rst
    );
    

    
    //using suedo inverse as over determined system
    wire [5:0] stb;
    wire [31:0] s_m [0:8];
    
    
    /*
    assign s_m0 = s_m[0];
    assign s_m1 = s_m[1];
    assign s_m2 = s_m[2];
    assign s_m3 = s_m[3];
    assign s_m4 = s_m[4];
    assign s_m5 = s_m[5];
    assign s_m6 = s_m[6];
    assign s_m7 = s_m[7];
    assign s_m8 = s_m[8];
    */
    // row 1
    vector_dot_4 vd0(s_m[0], J0, J3, J6, J9, J0, J3, J6, J9, clk, rst);
    vector_dot_4 vd1(s_m[1], J0, J3, J6, J9, J1, J4, J7, J10, clk, rst);
    vector_dot_4 vd2(s_m[2], J0, J3, J6, J9, J2, J5, J8, J11, clk, rst);
    //row 2
    vector_dot_4 vd3(s_m[3], J1, J4, J7, J10, J0, J3, J6, J9, clk, rst);
    vector_dot_4 vd4(s_m[4], J1, J4, J7, J10, J1, J4, J7, J10, clk, rst);
    vector_dot_4 vd5(s_m[5], J1, J4, J7, J10, J2, J5, J8, J11, clk, rst);
    //row 3
    vector_dot_4 vd6(s_m[6], J2, J5, J8, J11, J0, J3, J6, J9, clk, rst);
    vector_dot_4 vd7(s_m[7], J2, J5, J8, J11, J1, J4, J7, J10, clk, rst);
    vector_dot_4 vd8(s_m[8], J2, J5, J8, J11, J2, J5, J8, J11, clk, rst);
    
    wire [31:0] matrix_of_minors [0:9];
    /*
    assign determinant0 = matrix_of_minors[0];
    assign determinant1 = matrix_of_minors[1];
    assign determinant2 = matrix_of_minors[2];
    assign determinant3 = matrix_of_minors[3];
    assign determinant4 = matrix_of_minors[4];
    assign determinant5 = matrix_of_minors[5];
    assign determinant6 = matrix_of_minors[6];
    assign determinant7 = matrix_of_minors[7];
    assign determinant8 = matrix_of_minors[8];
    assign determinant9 = matrix_of_minors[9];
    assign determinant10 = matrix_of_minors[10];
    assign determinant11 = matrix_of_minors[11];
    */
    //finding inverse of square matrix made
    
    //Matrix of minors
    determinant2_2 d0(matrix_of_minors[0], s_m[4], s_m[5], s_m[7], s_m[8], clk, rst);
    determinant2_2 d1(matrix_of_minors[1], s_m[3], s_m[5], s_m[6], s_m[8], clk, rst);
    determinant2_2 d2(matrix_of_minors[2], s_m[3], s_m[4], s_m[6], s_m[7], clk, rst);
    determinant2_2 d3(matrix_of_minors[3], s_m[1], s_m[2], s_m[7], s_m[8], clk, rst);
    determinant2_2 d4(matrix_of_minors[4], s_m[0], s_m[2], s_m[6], s_m[8], clk, rst);
    determinant2_2 d5(matrix_of_minors[5], s_m[0], s_m[1], s_m[6], s_m[7], clk, rst);
    determinant2_2 d6(matrix_of_minors[6], s_m[1], s_m[2], s_m[4], s_m[5], clk, rst);
    determinant2_2 d7(matrix_of_minors[7], s_m[0], s_m[2], s_m[3], s_m[5], clk, rst);
    determinant2_2 d8(matrix_of_minors[8], s_m[0], s_m[1], s_m[3], s_m[4], clk, rst);

    //Matric of Cofactors
    
    wire [31:0] adjoint [0:8];
    assign adjoint[0] =  matrix_of_minors[0];
    mul mul0(adjoint[1], stb[0], 32'hbf800000, matrix_of_minors[3], clk, rst);
    assign adjoint[2] = matrix_of_minors[6];
    mul mul1(adjoint[3], stb[1], 32'hbf800000, matrix_of_minors[1], clk, rst);
    assign adjoint[4] = matrix_of_minors[4];
    mul mul2(adjoint[5], stb[2], 32'hbf800000, matrix_of_minors[7], clk, rst);
    assign adjoint[6] = matrix_of_minors[2];
    mul mul3(adjoint[7], stb[3], 32'hbf800000, matrix_of_minors[5], clk, rst);
    assign adjoint[8] = matrix_of_minors[8];
    
    
    //calculating deteriminant
    wire [31:0] c0, c1, c2, c4, deter, invdeter;
    
    mul mul4(c0, stb[4], s_m[0], matrix_of_minors[0], clk, rst);
    mul mul5(c1, stb[5], s_m[1], matrix_of_minors[1], clk, rst);
    mul mul6(c2, stb[6], s_m[2], matrix_of_minors[2], clk, rst);
    adder adder0(c4, stb[7], c0, c1, 1'b1, clk, rst);
    adder adder1(deter, stb[8], c4, c2, 1'b0, clk, rst);
    div div0(invdeter, stb[9], 32'h3f800000, deter, clk, rst);
    
    
    
    // 1/determinant * adjoint
    wire [31:0] inverse [0:8];
    
    mul mul7(inverse[0], stb[10], adjoint[0], invdeter, clk, rst);
    mul mul8(inverse[1], stb[11], adjoint[1], invdeter, clk, rst);
    mul mul9(inverse[2], stb[12], adjoint[2], invdeter, clk, rst);
    mul mul10(inverse[3], stb[13], adjoint[3], invdeter, clk, rst);
    mul mul11(inverse[4], stb[14], adjoint[4], invdeter, clk, rst);
    mul mul12(inverse[5], stb[15], adjoint[5], invdeter, clk, rst);
    mul mul13(inverse[6], stb[16], adjoint[6], invdeter, clk, rst);
    mul mul14(inverse[7], stb[17], adjoint[7], invdeter, clk, rst);
    mul mul15(inverse[8], stb[18], adjoint[8], invdeter, clk, rst);

    ////////////////////////////////////
    //inverse of square matrix dot original J transposed
    vector_dot_3 vd9(invJ0, inverse[0], inverse[1], inverse[2], J0, J1, J2, clk, rst);
    vector_dot_3 vd10(invJ1, inverse[0], inverse[1], inverse[2], J3, J4, J5, clk, rst);
    vector_dot_3 vd11(invJ2, inverse[0], inverse[1], inverse[2], J6, J7, J8, clk, rst);
    vector_dot_3 vd12(invJ3, inverse[0], inverse[1], inverse[2], J9, J10, J11, clk, rst);
    
    vector_dot_3 vd13(invJ4, inverse[3], inverse[4], inverse[5], J0, J1, J2, clk, rst);
    vector_dot_3 vd14(invJ5, inverse[3], inverse[4], inverse[5], J3, J4, J5, clk, rst);
    vector_dot_3 vd15(invJ6, inverse[3], inverse[4], inverse[5], J6, J7, J8, clk, rst);
    vector_dot_3 vd16(invJ7, inverse[3], inverse[4], inverse[5], J9, J10, J11, clk, rst);
    
    vector_dot_3 vd17(invJ8, inverse[6], inverse[7], inverse[8], J0, J1, J2, clk, rst);
    vector_dot_3 vd18(invJ9, inverse[6], inverse[7], inverse[8], J3, J4, J5, clk, rst);
    vector_dot_3 vd19(invJ10, inverse[6], inverse[7], inverse[8], J6, J7, J8, clk, rst);
    vector_dot_3 vd20(invJ11, inverse[6], inverse[7], inverse[8], J9, J10, J11, clk, rst);
   /*
    wire [31:0] adjoint [0:9];
    //
    mul mul0(adjoint[0], stb[0], 32'hbf800000, determinants[1], clk, rst);
    mul mul1(adjoint[1], stb[1], 32'hbf800000, determinants[3], clk, rst);
    mul mul2(adjoint[2], stb[2], 32'hbf800000, determinants[5], clk, rst);
    mul mul3(adjoint[3], stb[3], 32'hbf800000, determinants[7], clk, rst);
    
    
    // determinant of 3x3
    wire [31:0] c0, c1, c2, c4, deter, invdeter;
    
    mul mul4(c0, stb[4], s_m[0], determinants[9], clk, rst);
    mul mul5(c1, stb[5], s_m[1], determinants[10], clk, rst);
    mul mul6(c2, stb[6], s_m[2], determinants[11], clk, rst);
    adder adder0(c4, stb[7], c0, c1, 1'b1, clk, rst);
    adder adder1(deter, stb[8], c4, c2, 1'b0, clk, rst);
    div div0(invdeter, stb[9], 32'h3f800000, deter, clk, rst);
    
    // 1/determinant * adjoint
    wire [31:0] inverse [0:8];
    
    mul mul7(inverse[0], stb[6], adjoint[0], invdeter, clk, rst);
    mul mul8(inverse[1], stb[7], adjoint[1], invdeter, clk, rst);
    mul mul9(inverse[2], stb[8], adjoint[2], invdeter, clk, rst);
    mul mul10(inverse[3], stb[9], adjoint[3], invdeter, clk, rst);
    mul mul11(inverse[4], stb[10], adjoint[4], invdeter, clk, rst);
    mul mul12(inverse[5], stb[11], adjoint[5], invdeter, clk, rst);
    mul mul13(inverse[6], stb[12], adjoint[6], invdeter, clk, rst);
    mul mul14(inverse[7], stb[13], adjoint[7], invdeter, clk, rst);
    mul mul15(inverse[8], stb[14], adjoint[8], invdeter, clk, rst);
    
    
    //inverse of square matrix dot original J transposed
    vector_dot_3 vd9(invJ0, inverse[0], inverse[1], inverse[2], J0, J1, J2, clk, rst);
    vector_dot_3 vd10(invJ1, inverse[0], inverse[1], inverse[2], J3, J4, J5, clk, rst);
    vector_dot_3 vd11(invJ2, inverse[0], inverse[1], inverse[2], J6, J7, J8, clk, rst);
    vector_dot_3 vd12(invJ3, inverse[0], inverse[1], inverse[2], J9, J10, J11, clk, rst);
    
    vector_dot_3 vd13(invJ4, inverse[3], inverse[4], inverse[5], J0, J1, J2, clk, rst);
    vector_dot_3 vd14(invJ5, inverse[3], inverse[4], inverse[5], J3, J4, J5, clk, rst);
    vector_dot_3 vd15(invJ6, inverse[3], inverse[4], inverse[5], J6, J7, J8, clk, rst);
    vector_dot_3 vd16(invJ7, inverse[3], inverse[4], inverse[5], J9, J10, J11, clk, rst);
    
    vector_dot_3 vd17(invJ8, inverse[6], inverse[7], inverse[8], J0, J1, J2, clk, rst);
    vector_dot_3 vd18(invJ9, inverse[6], inverse[7], inverse[8], J3, J4, J5, clk, rst);
    vector_dot_3 vd19(invJ10, inverse[6], inverse[7], inverse[8], J6, J7, J8, clk, rst);
    vector_dot_3 vd20(invJ11, inverse[6], inverse[7], inverse[8], J9, J10, J11, clk, rst);
    */
endmodule
