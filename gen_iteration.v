`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2021 11:45:31 PM
// Design Name: 
// Module Name: gen_iteration
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


module gen_iteration(
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
    
    input clk,
    input rst
    );
    
    wire [31:0] F [0:3];
    wire [31:0] next_F [0:3];
    wire [5:0] stb;
    
    reg [9:0] count;
    reg done = 1'b0;
    
    always @(in_x0) begin
        count <= 10'd0;
    end
    always @(posedge clk) begin
        if(count < 10'd940) begin // I think this is max path time
            done <= 1'b0;
            count <= count + 10'b1;
        end
        else begin
            done <= 1'b1;
            count <= 10'b0;
        end
    end
    
    assign output_stb = done;
    
    //Calculate F
    calc_F cf0(F[0], F[1], F[2], F[3], in_x0, in_x1, in_x2, clk, rst);
    
    //get new x = x_old = invJ dot F
    wire [31:0] invJdotF [0:2];
    vector_dot_4 vd0(invJdotF[0], invJ0, invJ1, invJ2, invJ3, F[0], F[1], F[2], F[3], clk, rst);
    vector_dot_4 vd1(invJdotF[1], invJ4, invJ5, invJ6, invJ7, F[0], F[1], F[2], F[3], clk, rst);
    vector_dot_4 vd2(invJdotF[2], invJ8, invJ9, invJ10, invJ11, F[0], F[1], F[2], F[3], clk, rst);
    
    adder adder0(out_x0, stb[3], in_x0, invJdotF[0], 1'b1, clk, rst); 
    adder adder1(out_x1, stb[4], in_x1, invJdotF[1], 1'b1, clk, rst);
    adder adder2(out_x2, stb[5], in_x2, invJdotF[2], 1'b1, clk, rst);  
    
    //Calculate next_F
    calc_F cf1(next_F[0], next_F[1], next_F[2], next_F[3], out_x0, out_x1, out_x2, clk, rst);
    
    // calculating next_invJ
       next_invJ niJ(next_invJ0, next_invJ1, next_invJ2, next_invJ3, next_invJ4, next_invJ5, next_invJ6, next_invJ7, next_invJ8, next_invJ9, next_invJ10, next_invJ11,
                  invJ0, invJ1, invJ2, invJ3, invJ4, invJ5, invJ6, invJ7, invJ8, invJ9, invJ10, invJ11,
                  F[0], F[1], F[2], F[3], next_F[0], next_F[1], next_F[2], next_F[3],
                  in_x0, in_x1, in_x2, out_x0, out_x1, out_x2, clk, rst);
endmodule
