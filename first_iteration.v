`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2021 09:38:48 PM
// Design Name: 
// Module Name: first_iteration
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


module first_iteration(
    output [31:0] out_x0,
    output [31:0] out_x1,
    output [31:0] out_x2,
    
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
    
    output output_stb, 
    
    input [31:0] in_x0,
    input [31:0] in_x1,
    input [31:0] in_x2,
    
    input clk,
    input rst
    );
    
    // calculate the jacobian
    wire [31:0] J [0:11];
    wire [31:0] invJ [0:11];
    wire [31:0] F [0:3];
    wire [31:0] next_F[0:3];
    wire [2:0] stb;
    
    reg [0:10] count = 11'b0;
    reg done = 1'b0;
    always @(posedge clk) begin
        if(count < 11'd1455) begin // I think this is max path
            done <= 1'b0;
            count <= count + 11'b1;
        end
        else begin
            done <= 1'b1;
            count <= 11'b0;
        end
    end
    
    assign output_stb = done;
    
    // calculate jacobian from x
    calc_J cJ(J[0], J[1], J[2], J[3], J[4], J[5], J[6], J[7], J[8], J[9], J[10], J[11], in_x0, in_x1, in_x2, clk, rst);
    
    // getting the sudo inverse not useing Broydens Method
    first_invJ fiJ(invJ[0], invJ[1], invJ[2], invJ[3], invJ[4], invJ[5], invJ[6], invJ[7], invJ[8], invJ[9], invJ[10], invJ[11],
               J[0], J[1], J[2], J[3], J[4], J[5], J[6], J[7], J[8], J[9], J[10], J[11], clk, rst);
    
   
    // calculating F
    calc_F cf0(F[0], F[1], F[2], F[3], in_x0, in_x1, in_x2, clk, rst);
               
   //get new x
   wire [31:0] invJdotF [0:2];
   vector_dot_4 vd0(invJdotF[0], invJ[0], invJ[1], invJ[2], invJ[3], F[0], F[1], F[2], F[3], clk, rst);
   vector_dot_4 vd1(invJdotF[1], invJ[4], invJ[5], invJ[6], invJ[7], F[0], F[1], F[2], F[3], clk, rst);
   vector_dot_4 vd2(invJdotF[2], invJ[8], invJ[9], invJ[10], invJ[11], F[0], F[1], F[2], F[3], clk, rst);
   
   
   adder adder0(out_x0, stb[0], in_x0, invJdotF[0], 1'b1, clk, rst); 
   adder adder1(out_x1, stb[1], in_x1, invJdotF[1], 1'b1, clk, rst);
   adder adder2(out_x2, stb[2], in_x2, invJdotF[2], 1'b1, clk, rst);  

   // calculating next_F
   calc_F cf1(next_F[0], next_F[1], next_F[2], next_F[3], out_x0, out_x1, out_x2, clk, rst);
   
    //calculating next_invJ
   next_invJ niJ(next_invJ0, next_invJ1, next_invJ2, next_invJ3, next_invJ4, next_invJ5, next_invJ6, next_invJ7, next_invJ8, next_invJ9, next_invJ10, next_invJ11,
                  invJ[0], invJ[1], invJ[2], invJ[3], invJ[4], invJ[5], invJ[6], invJ[7], invJ[8], invJ[9], invJ[10], invJ[11],
                  F[0], F[1], F[2], F[3], next_F[0], next_F[1], next_F[2], next_F[3],
                  in_x0, in_x1, in_x2, out_x0, out_x1, out_x2, clk, rst);
   
endmodule
