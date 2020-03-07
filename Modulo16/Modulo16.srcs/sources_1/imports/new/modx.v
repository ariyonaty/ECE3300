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
    (
        input       clk, enable,
        output reg  [2:0] Q
    );

    initial Q = 0;

    always @(posedge clk) begin
        if (enable)
            Q <= Q + 1'b1;
        else
            Q <= Q;
    end

endmodule
