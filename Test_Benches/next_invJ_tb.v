`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2021 11:42:02 PM
// Design Name: 
// Module Name: next_invJ_tb
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


module next_invJ_tb();
    wire [31:0] next_invJ0, next_invJ1, next_invJ2, next_invJ3, 
                next_invJ4, next_invJ5, next_invJ6, next_invJ7, 
                next_invJ8, next_invJ9, next_invJ10, next_invJ11;
                
    reg [31:0] invJ0, invJ1, invJ2, invJ3, invJ4, invJ5, invJ6, 
               invJ7, invJ8, invJ9, invJ10, invJ11, f0, f1, f2, f3,
               next_f0, next_f1, next_f2, next_f3, x0, x1, x2, 
               next_x0, next_x1, next_x2;
               
    reg clk, rst;
    
    next_invJ UUT(
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
        .invJ0(invJ0),
        .invJ1(invJ1),
        .invJ2(invJ2),
        .invJ3(invJ3),
        .invJ4(invJ4),
        .invJ5(invJ5),
        .invJ6(invJ6),
        .invJ7(invJ7),
        .invJ8(invJ8),
        .invJ9(invJ9),
        .invJ10(invJ10),
        .invJ11(invJ11),
        .f0(f0),
        .f1(f1),
        .f2(f2),
        .f3(f3),
        .next_f0(next_f0),
        .next_f1(next_f1),
        .next_f2(next_f2),
        .next_f3(next_f3),
        .x0(x0),
        .x1(x1),
        .x2(x2),
        .next_x0(next_x0),
        .next_x1(next_x1),
        .next_x2(next_x2),
        .clk(clk),
        .rst(rst)
    );
    
    initial begin
        clk = 0;
        rst = 0;
        forever
            #10 clk = ~clk;
    end
    
    initial begin // checked against python .... works
        #4 {invJ0, invJ1, invJ2, invJ3, invJ4, invJ5, invJ6, 
               invJ7, invJ8, invJ9, invJ10, invJ11, f0, f1, f2, f3,
               next_f0, next_f1, next_f2, next_f3, x0, x1, x2, 
               next_x0, next_x1, next_x2} = {32'h3f800000, 32'h3f800000,
               32'h3f800000, 32'h3f800000, 32'h40000000, 32'h40000000,
               32'h40000000, 32'h40000000, 32'h40400000, 32'h40400000,
               32'h40400000, 32'h40400000, 32'h3f800000, 32'h40000000,
               32'h40400000, 32'h3f800000, 32'h40000000, 32'h40400000,
               32'h40800000, 32'h40000000, 32'h3f800000, 32'h3f800000,
               32'h3f800000, 32'h40000000, 32'h40000000, 32'h40000000};

    end
    
endmodule
