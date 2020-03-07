`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2020 04:21:00 PM
// Design Name: 
// Module Name: modulo16_tb
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


module modulo16_tb();

    reg clk;
    wire [3:0] count;

    modulo16_counter uut (clk, count);

    always #1 clk = ~clk;

    initial begin;
        clk = 0; 
    end 

endmodule
