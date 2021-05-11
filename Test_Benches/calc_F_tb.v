`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2021 09:24:08 PM
// Design Name: 
// Module Name: calc_F_tb
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


module calc_F_tb();
    reg [31:0] x0, x1, x2;
    reg clk, rst;
    
    wire [31:0] f0, f1, f2, f3;
    wire output_stb;
    
    calc_F UUT (
        .f0(f0),
        .f1(f1),
        .f2(f2),
        .f3(f3),
        .x0(x0),
        .x1(x1),
        .x2(x2),
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
        {x0, x1, x2} = {32'h3f800000, 32'h3f800000, 32'h3f800000}; // 1, 1, 1
        #2000 {x0, x1, x2} = {32'h3f800000, 32'h00000000, 32'h3f800000}; // 1, 1, 1
        //f0 wrong
        //f1 correct
        //f2 correct
        //f3 correct
    end
endmodule
