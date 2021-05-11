`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2021 06:47:26 PM
// Design Name: 
// Module Name: adder_tb
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
// Test bench to verify modified code from https://github.com/dawsonjon/fpu/tree/master/adder
//////////////////////////////////////////////////////////////////////////////////

module div_tb();

    reg clk, rst;
    reg [31:0] input_a, input_b;
    wire [31:0] output_z;
    wire output_z_stb;
    
    div dut(
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
        #4   {input_a, input_b, rst} = {32'h3f800000, 32'h3f800000, 1'b0}; //1/1 = 3f800000

    end

endmodule
