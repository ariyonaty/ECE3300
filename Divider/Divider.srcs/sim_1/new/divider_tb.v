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

    parameter dividendWidth = 8;
    parameter divisorWidth = 4;

    reg clk, reset, command;
    reg [dividendWidth-1:0] dataA;
    reg [divisorWidth-1:0] dataB;
    wire done;
    wire [dividendWidth-1:0] quotient, remainder;
    wire [2:0] i;
    wire [2*dividendWidth-1:0] registerRA;
    wire [1:0] state_reg;

    divider #(dividendWidth, divisorWidth) uut(clk, reset, command, dataA, dataB, quotient, remainder, done, i, registerRA, state_reg);

    always #1 clk = ~clk;

    initial begin
            reset = 1; clk = 0; command = 0;
        #3  dataA = 140; dataB = 9; 
        #5  reset = 0;
        #2  command = 1;
    end

/* 
    initial begin
        #1  reset = 1;  clk = 0;    command = 0;
        #1  clk = ~clk;
        #1  reset = 1;  dataA = 8'b10001100;    dataB = 8'b1001;    clk = ~clk;
        #1  clk = ~clk;
        #1  clk = ~clk;
        #1  reset = 0;  clk = ~clk;
        #1  clk = ~clk;
        #1  clk = ~clk;
        #1  command = 1;    clk = ~clk;
        repeat(100)
        #1  clk = ~clk;
    end */

endmodule



/*
------------> WORKING

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

    parameter dividendWidth = 8;
    parameter divisorWidth = 4;

    reg clk, reset, command;
    reg [dividendWidth-1:0] dataA;
    reg [divisorWidth-1:0] dataB;
    wire done;
    wire [dividendWidth-1:0] quotient, remainder;
    wire [2:0] i;
    wire [2*dividendWidth-1:0] registerRA;
    wire [1:0] state_reg;

    divider #(dividendWidth, divisorWidth) uut(clk, reset, command, dataA, dataB, quotient, remainder, done, i, registerRA, state_reg);

    initial begin
        #1  reset = 1;  clk = 0;    command = 0;
        #1  clk = ~clk;
        #1  reset = 1;  dataA = 8'b10001100;    dataB = 8'b1001;    clk = ~clk;
        #1  clk = ~clk;
        #1  clk = ~clk;
        #1  reset = 0;  clk = ~clk;
        #1  clk = ~clk;
        #1  clk = ~clk;
        #1  command = 1;    clk = ~clk;
        repeat(100)
        #1  clk = ~clk;
    end

endmodule

---------------> */