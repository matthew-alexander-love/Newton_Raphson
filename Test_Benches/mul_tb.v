`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Matthew Love
// 
// Create Date: 02/26/2021 01:01:53 AM
// Design Name: mul
// Module Name: mul_tb
// Project Name: NR
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
// It Works!
//
//////////////////////////////////////////////////////////////////////////////////


module mul_tb();

    reg clk, rst;
    reg [31:0] input_a, input_b;
    wire [31:0] output_z;
    wire output_z_stb;
    
    mul dut(
        .clk(clk),
        .rst(rst),
        .input_a(input_a),
        .input_b(input_b),
        .output_z(output_z),
        .output_z_stb(output_z_stb)
    );
    
    // initializing all variables
    initial begin
        clk = 0;
        rst = 0;
        input_a = 32'b0;
        input_b = 32'b0;
        
        forever
            #5 clk = ~clk;
    end
    
    // clock signal

    
    // monitor signals
    initial begin
        $monitor("Input monitor: \n @t=%3d: rst=%b\n a=%8h, b=%8h\n",
                  $time, rst,  input_a, input_b);
        $monitor("@t=%3d: Sum=%8h \n", $time, output_z);
    end
    
    // stimulus vectors
    initial begin
        #4   {input_a, input_b, rst} = {32'h40800000, 32'h40a00000, 1'b0}; //4*5 works
        #100 {input_a, input_b, rst} = {32'hc0a00000, 32'h40000000, 1'b0}; //-5*2 works
        #100 {input_a, input_b, rst} = {32'h40e00000, 32'hc1100000, 1'b0}; //7*-9 works
        #400 $finish;
    end

endmodule
