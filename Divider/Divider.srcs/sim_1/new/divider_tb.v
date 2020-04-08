`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2020 05:13:11 PM
// Design Name: 
// Module Name: divider_tb
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


module divider_tb();

    reg clk, reset, command;
    reg [7:0] dataA;
    reg [3:0] dataB;
    wire done;
    wire [7:0] quotient, remainder;
    wire [2:0] i;
    wire [15:0] registerRA;
    wire [1:0] state_reg;

    divider #(8, 4) uut(clk, reset, command, dataA, dataB, quotient, remainder, done, i, registerRA, state_reg);

    always #1 clk = ~clk;

    initial begin
            reset = 1; clk = 0; command = 0;
        #1  reset = 0;
        #2  dataA = 140; dataB = 9; 
        #5  command = 1;
    end

endmodule
