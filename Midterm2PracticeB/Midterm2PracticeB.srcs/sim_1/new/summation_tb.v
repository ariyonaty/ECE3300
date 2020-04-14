`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2020 07:35:10 PM
// Design Name: 
// Module Name: summation_tb
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


module summation_tb();

    reg clk, reset, command;
    reg [3:0] n;
    wire done;
    wire [5:0] s;

    summation uut
    (
        .clk(clk),
        .reset(reset),
        .command(command),
        .n(n),
        .done(done),
        .s(s)
    );

    always #1 clk = ~clk;

    initial begin
            clk = 0;    reset = 1; 
        #2  n = 10;     command = 1;
        #2  reset = 0;  command = 1;
        #60 $stop; 
    end

endmodule
