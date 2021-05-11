`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2021 10:26:08 PM
// Design Name: 
// Module Name: first_iteration_tb
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


module first_iteration_tb();
    wire [31:0] next_invJ0, next_invJ1, next_invJ2, next_invJ3, 
                next_invJ4, next_invJ5, next_invJ6, next_invJ7, 
                next_invJ8, next_invJ9, next_invJ10, next_invJ11,
                out_x0, out_x1, out_x2;
    wire output_stb;
                
    reg [31:0] in_x0, in_x1, in_x2;
    reg clk, rst;
    
    
    first_iteration UUT(
        .next_invJ0(next_invJ0),
        .next_invJ1(next_invJ1),
        .next_invJ2(next_invJ2),
        .next_invJ3(next_invJ3),
        .next_invJ4(next_invJ4),
        .next_invJ5(next_invJ5),
        .next_invJ6(next_invJ6),
        .next_invJ7(next_invJ7),
        .next_invJ8(next_invJ8),
        .next_invJ9(next_invJ9),
        .next_invJ10(next_invJ10),
        .next_invJ11(next_invJ11),
        .out_x0(out_x0),
        .out_x1(out_x1),
        .out_x2(out_x2),
        .in_x0(in_x0),
        .in_x1(in_x1),
        .in_x2(in_x2),
        .clk(clk),
        .rst(rst),
        .output_stb(output_stb)
    );
    
    initial begin
        clk = 0;
        rst = 0;
        
        forever
            #10 clk = ~clk;
    end
    
    initial begin
        {in_x0, in_x1, in_x2} = {32'h3f800000, 32'h3f800000, 32'h3f800000};
    end
    
endmodule
