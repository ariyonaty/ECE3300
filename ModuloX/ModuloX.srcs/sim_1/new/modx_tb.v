`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2020 07:23:31 PM
// Design Name: 
// Module Name: modx_tb
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


module modx_tb();

    parameter X = 6;
    parameter WIDTH = 3;

    reg clk, enable;
    reg [WIDTH-1:0] D;
    wire [WIDTH-1:0] Q;

    modx  #(X, WIDTH) uut (clk, enable, D, Q);

    always #1 clk = ~clk;

    initial begin
            clk = 0;    enable = 1;     D = 0; 
        #30             enable = 0;
        #15 $stop;
    end

endmodule
