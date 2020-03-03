`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2020 04:41:39 PM
// Design Name: 
// Module Name: modx
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


module modx
    #(  parameter X = 6,
        parameter WIDTH = 3)
    (
        input       clk, enable,
        input       [WIDTH-1:0] D,
        output reg  [WIDTH-1:0] Q
    );

    assign load = (Q == (X - 1));
    initial Q = 0;

    always @(posedge clk) begin
        if (load)
            Q <= D;
        else if (enable)
            Q <= Q + 1'b1;
        else
            Q <= Q;
    end

endmodule
