`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2021 01:24:04 AM
// Design Name: 
// Module Name: NRwBroyden_tb
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


module NRwBroyden_tb();
    wire [31:0] out_x0, out_x1, out_x2, out10, out11, out12;
    wire [31:0] invJout0, invJout1, invJout2, invJout3, invJout4, invJout5, invJout6, invJout7, invJout8, invJout9, invJout10, invJout11;
    wire stbf, stbg;
    reg [31:0] in_x0, in_x1, in_x2;
    reg [5:0] num_cycles;
    reg clk, rst;
    
    
    NRwBroyden UUT(
        .out_x0(out_x0),
        .out_x1(out_x1),
        .out_x2(out_x2),
        .in_x0(in_x0),
        .in_x1(in_x1),
        .in_x2(in_x2),
        .num_cycles(num_cycles),
        .out10(out10),
        .out11(out11),
        .out12(out12),
        .stbf(stbf),
        .stbg(stbg),
        .invJout0(invJout0),
        .invJout1(invJout1),
        .invJout2(invJout2),
        .invJout3(invJout3),
        .invJout4(invJout4),
        .invJout5(invJout5),
        .invJout6(invJout6),
        .invJout7(invJout7),
        .invJout8(invJout8),
        .invJout9(invJout9),
        .invJout10(invJout10),
        .invJout11(invJout11),
        .clk(clk),
        .rst(rst)  
    );
    
    initial begin
        clk = 0;
        rst = 0;
        
        forever
            #10 clk = ~clk;
    end
    
    initial begin
        #4{in_x0, in_x1, in_x2, num_cycles} = {32'h3f800000, 32'h3f800000, 32'h3f800000, 6'd5};
    end
endmodule
