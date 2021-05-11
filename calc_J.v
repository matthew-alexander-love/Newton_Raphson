`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2021 08:12:26 PM
// Design Name: 
// Module Name: calc_J
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


module calc_J(
    output [31:0] J0,
    output [31:0] J1,
    output [31:0] J2,
    output [31:0] J3,
    output [31:0] J4,
    output [31:0] J5,
    output [31:0] J6,
    output [31:0] J7,
    output [31:0] J8,
    output [31:0] J9,
    output [31:0] J10,
    output [31:0] J11,
    
    input [33:0] x0,
    input [33:0] x1,
    input [33:0] x2,
    input clk,
    input rst
    );
    
    wire [0:3] stb;
    assign J0 = 32'h40400000; // J0= 3
    assign J1 = x2;
    mul mul0(J2, stb[0], 32'hbf800000, x1, clk, rst); //-1*x1
    mul mul1(J3, stb[3], 32'h41000000, x0, clk, rst); //8*x0
    mul mul2(J4, stb[4], 32'hc49c4000, x1, clk, rst); //-1250*x1
    assign J5 = 32'h40000000; //2
    assign J6 = 32'h41100000; //9
    mul mul3(J7, stb[5], 32'h40000000, x1, clk, rst); //2x1
    assign J8 = 32'h41a00000; //20
    assign J9 = 32'hbf800000; //-1
    mul mul4(J10, stb[5], 32'h4260cccd, x2, clk, rst); //56.2*x2
    mul mul5(J11, stb[6], 32'h4260cccd, x1, clk, rst); //56.2*x1
    
endmodule
