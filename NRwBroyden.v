`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2021 08:04:02 PM
// Design Name: 
// Module Name: NRwBroyden
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


module NRwBroyden(
    output [31:0] out_x0,
    output [31:0] out_x1,
    output [31:0] out_x2,
    output [31:0] out10,
    output [31:0] out11,
    output [31:0] out12,
    output stbf,
    output stbg,
    output [31:0] invJout0,
    output [31:0] invJout1,
    output [31:0] invJout2,
    output [31:0] invJout3,
    output [31:0] invJout4,
    output [31:0] invJout5,
    output [31:0] invJout6,
    output [31:0] invJout7,
    output [31:0] invJout8,
    output [31:0] invJout9,
    output [31:0] invJout10,
    output [31:0] invJout11,
    
    input [31:0] in_x0,
    input [31:0] in_x1,
    input [31:0] in_x2,
    input [5:0] num_cycles,
    input clk,
    input rst
    );
    

    reg [31:0] x [0:2];
    reg [31:0] invJ [0:11];
    
    wire [31:0] next_x_first [0:2];
    wire [31:0] next_invJ_first [0:11];
    
    wire [31:0] next_x [0:2];
    wire [31:0] next_invJ [0:11];
    
    wire stb_first, stb_gen;
   
   // Instanciate Module for first iteration:
   // Calculates Jacobian value
   // Calculates Sudo Inverse of overdetermined system
   // Calculates F, and next_F
   // Calculates next_x and next_invJ
    first_iteration fi(next_x_first[0], next_x_first[1], next_x_first[2], 
                    next_invJ_first[0], next_invJ_first[1], next_invJ_first[2],
                    next_invJ_first[3], next_invJ_first[4], next_invJ_first[5],
                    next_invJ_first[6], next_invJ_first[7], next_invJ_first[8],
                    next_invJ_first[9], next_invJ_first[10], next_invJ_first[11],
                    stb_first, in_x0, in_x1, in_x2, clk, rst);
    
   assign out10 = next_x_first[0];
   assign out11 = next_x_first[1];
   assign out12 = next_x_first[2];
   assign stbf = stb_first;
   // Calculates F and nex_F
   // Calculates next_x and next_invJ
   gen_iteration gi(next_x[0], next_x[1], next_x[2],
                 next_invJ[0], next_invJ[1], next_invJ[2],
                 next_invJ[3], next_invJ[4], next_invJ[5],
                 next_invJ[6], next_invJ[7], next_invJ[8],
                 next_invJ[9], next_invJ[10], next_invJ[11],
                 stb_gen, x[0], x[1], x[2],
                 invJ[0], invJ[1], invJ[2], 
                 invJ[3], invJ[4], invJ[5], 
                 invJ[6], invJ[7], invJ[8], 
                 invJ[9], invJ[10], invJ[11], 
                 clk, rst);
                 
    assign invJout0 = invJ[0];
    assign invJout1 = invJ[1];
    assign invJout2 = invJ[2];
    assign invJout3 = invJ[3];
    assign invJout4 = invJ[4];
    assign invJout5 = invJ[5];
    assign invJout6 = invJ[6];
    assign invJout7 = invJ[7];
    assign invJout8 = invJ[8];
    assign invJout9 = invJ[9];
    assign invJout10 = invJ[10];
    assign invJout11 = invJ[11];

    assign stbg = stb_gen;
   reg [5:0] count = 0;
   always @(posedge stb_first or posedge stb_gen) begin
        if (count==0 && stb_first) begin
            x[0] <= next_x_first[0];
            x[1] <= next_x_first[1];
            x[2] <= next_x_first[2];
            
            invJ[0] <= next_invJ_first[0];
            invJ[1] <= next_invJ_first[1];
            invJ[2] <= next_invJ_first[2];
            invJ[3] <= next_invJ_first[3];
            invJ[4] <= next_invJ_first[4];
            invJ[5] <= next_invJ_first[5];
            invJ[6] <= next_invJ_first[6];
            invJ[7] <= next_invJ_first[7];
            invJ[8] <= next_invJ_first[8];
            invJ[9] <= next_invJ_first[9];
            invJ[10] <= next_invJ_first[10];
            invJ[11] <= next_invJ_first[11];
            
            count <= count + 1;
        end
        if(count<num_cycles && count>0 && stb_gen) begin
            x[0] <= next_x[0];
            x[1] <= next_x[1];
            x[2] <= next_x[2];
            
            invJ[0] <= next_invJ[0];
            invJ[1] <= next_invJ[1];
            invJ[2] <= next_invJ[2];
            invJ[3] <= next_invJ[3];
            invJ[4] <= next_invJ[4];
            invJ[5] <= next_invJ[5];
            invJ[6] <= next_invJ[6];
            invJ[7] <= next_invJ[7];
            invJ[8] <= next_invJ[8];
            invJ[9] <= next_invJ[9];
            invJ[10] <= next_invJ[10];
            invJ[11] <= next_invJ[11];
            
            //count <= count + 1;
        end
   end
   
   assign out_x0 = x[0];
   assign out_x1 = x[1];
   assign out_x2 = x[2];
    
endmodule   
