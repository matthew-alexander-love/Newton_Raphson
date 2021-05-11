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


module adder_tb();

    reg clk, rst, sel;
    reg [31:0] input_a, input_b;
    wire [31:0] output_z;
    wire output_z_stb;
    
    adder dut(
        .sel(sel),
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
        $monitor("Input monitor: \n @t=%3d: sel=%b, rst=%b\n a=%8h, b=%8h\n",
                  $time, sel, rst,  input_a, input_b);
        $monitor("@t=%3d: Sum=%8h \n", $time, output_z);
    end
    
    // stimulus vectors
    initial begin
        #2  {input_a, input_b, rst, sel} = {32'h41a00000, 32'hc1200000, 1'b0, 1'b0}; //20+-10 
        //#100 {input_a, input_b, rst, sel} = {32'h41f00000, 32'hc1200000, 1'b0, 1'b0}; //40+30 = 428c0000
        //#100 {input_a, input_b, rst, sel} = {32'h42200000, 32'h41f00000, 1'b0, 1'b1}; //40-30 = 41200000
        //#100 {input_a, input_b, rst, sel} = {32'hc2200000, 32'hc1f00000, 1'b0, 1'b0}; //-40+(-30) = c28c0000
        #400 $finish;
    end

endmodule
