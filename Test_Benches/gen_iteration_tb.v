`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2021 12:15:37 AM
// Design Name: 
// Module Name: gen_iteration_tb
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


module gen_iteration_tb();
    wire [31:0] next_invJ0, next_invJ1, next_invJ2, next_invJ3, next_invJ4, 
                next_invJ5, next_invJ6, next_invJ7, next_invJ8, next_invJ9, 
                next_invJ10, next_invJ11, out_x0, out_x1, out_x2;
                
    wire output_stb;
    
    reg [31:0] invJ0, invJ1, invJ2, invJ3, invJ4, invJ5, invJ6, invJ7, invJ8, 
               invJ9, invJ10, invJ11,  in_x0, in_x1, in_x2;
               
    reg clk, rst;
   
    gen_iteration UUT(
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
    
    initial begin // output of first iteration for tb
        {invJ0, invJ1, invJ2, 
         invJ3, invJ4, invJ5, 
         invJ6, invJ7, invJ8, 
         invJ9, invJ10, invJ11} = {32'h3d1e12e2, 32'hbabc2a2a, 32'h3dd5485f, 
                                   32'hbd14c7da, 32'h398279eb, 32'hba641a56,
                                   32'h3a2f1e59, 32'hb9542a65, 32'hbaf038b6,
                                   32'h3a59ae93, 32'h3afbc9ba, 32'h3c970279};
        {in_x0, in_x1, in_x2} = {32'hbf627778, 32'h3efaa476, 32'h3ef710c0};
    end
endmodule
