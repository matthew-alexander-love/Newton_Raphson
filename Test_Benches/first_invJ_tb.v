`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2021 01:34:48 AM
// Design Name: 
// Module Name: first_invJ_tb
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


module first_invJ_tb();
    wire [31:0] invJ0, invJ1, invJ2, invJ3, invJ4, invJ5, 
                invJ6, invJ7, invJ8, invJ9, invJ10, invJ11;
    
    reg [31:0] J0, J1, J2, J3, J4, J5, J6, J7, J8, J9, J10, J11;
    reg clk, rst;
    
    first_invJ UUT(
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
        .J0(J0),
        .J1(J1),
        .J2(J2),
        .J3(J3),
        .J4(J4),
        .J5(J5),
        .J6(J6),
        .J7(J7),
        .J8(J8),
        .J9(J9),
        .J10(J10),
        .J11(J11),
        .clk(clk),
        .rst(rst)
    );
    
    initial begin
        clk = 0;
        rst = 0;
        
        forever 
            #10 clk = ~clk;
    end
    
    initial begin // checked against python
        {J0, J1, J2, J3, J4, J5, J6, J7, J8, J9, J10, J11} = {32'h40400000, 32'h3f800000, 32'hbf800000,
                                                              32'h41000000, 32'hc49c4000, 32'h40000000,
                                                              32'h41100000, 32'h40000000, 32'h41a00000,
                                                              32'hbf800000, 32'h4260cccd, 32'h4260cccd};
    end
endmodule
