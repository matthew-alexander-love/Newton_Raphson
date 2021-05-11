`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2021 08:36:42 PM
// Design Name: 
// Module Name: calc_F
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


module calc_F(
    output [31:0] f0,
    output [31:0] f1,
    output [31:0] f2,
    output [31:0] f3,
    //output output_stb,
    input [33:0] x0,
    input [33:0] x1,
    input [33:0] x2,
    input clk,
    input rst
    );
    
    //f0 = 3(x0) - (x1)(x2) - 1.5
    //f1 = 4(x0)(x0) - 625*(x1)*(x1) + 2(x2) - 1
    //f2 = 20(x2) + (x1)(x1) + 9*(x0)
    //f3 = 56.2(x1)(x2) - (x0)
    wire [17:0] stb;
    
    wire [32:0]  f0_o0, x1x2, x0x0, f1_o0, f1_o1, f1_o2, f2_o0, x1x1, f2_o2, f3_o0;
    wire [32:0] f0_a0, f1_a0, f1_a1, f2_a0;
    
    /*
    reg [3:0] done = 0;
    always @(posedge clk) begin
        if(^f0=== 1'bX || ^f1=== 1'bX || ^f2=== 1'bX || ^f3=== 1'bX)
            done <= 1'b0;
        else
            done <= 1'b1;

    end*/
    
    //assign output_stb = done;
    
    //3*(x0)
    mul mul0(f0_o0, stb[0], 32'h40400000, x0, clk, rst);
    
    // x1 * x2
    mul mul1(x1x2, stb[1], x2, x1, clk, rst);
    
    // x0 * x0
    mul mul2(x0x0, stb[2], x0, x0, clk, rst);   
    
    //4 * x0 * x0
    mul mul3(f1_o0, stb[3], x0x0, 32'h40800000, clk, rst);
    
    // x1 * x1
    mul mul4(x1x1, stb[4], x1, x1, clk, rst);
    
    //625* x1* x1
    mul mul5(f1_o1, stb[5], x1x1, 32'h441c4000, clk, rst);
    
    //2 * x2
    mul mul6(f1_o2, stb[6], 32'h40000000, x2, clk, rst);
    
    //20 * x2
    mul mul7(f2_o0, stb[7], 32'h41a00000, x2, clk, rst);
    
    //9*x0
    mul mul8(f2_o2, stb[8], 32'h41100000, x0, clk, rst);
    
    //56.2 * x1 * x2
    mul mul9(f3_o0, stb[9], 32'h4260cccd, x1x2, clk, rst);
    
    
    // f0
    //x1*x2 - 1.5
    adder adder0(f0_a0, stb[10], x1x2, 32'h3fc00000, 1'b0, clk, rst);
    //3x0 - x1x2 - 1.5
    adder adder1(f0, stb[11], f0_o0, f0_a0, 1'b1, clk, rst);
    
    //f1
    //2(x2) - 1
    adder adder2(f1_a1, stb[12], f1_o2, 32'h3f800000, 1'b1, clk, rst);
    // 4 x0 x0 - 625 x1 x1
    adder adder3(f1_a0, stb[13], f1_o0, f1_o1, 1'b1, clk, rst);
    // all of f1
    adder adder4(f1, stb[14], f1_a0, f1_a1, 1'b1, clk, rst);
    
    //f2
    //x1 x1 + 9x0
    adder adder5(f2_a0, stb[15], x1x1, f2_o2, 1'b0, clk, rst);
    //20x2 + x1x1 + 9x0 = f2
    adder adder6(f2, stb[16], f2_o0, f2_a0, 1'b0, clk, rst);
    
    //f3 = 56.2 x1 x2 - x0
    adder adder7(f3, stb[17], f3_o0, x0, 1'b1, clk, rst);
    
endmodule
