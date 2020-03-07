`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2020 04:04:53 PM
// Design Name: 
// Module Name: modulo16_counter
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


module modulo16_counter
    (
        input       clock,
        output      [3:0] counterOut
    );

    reg c = 1'b1;
    wire [2:0] modXOut;

    assign enable = (counterOut[2:0] == 7);

    modx    m1  (clock, 1'b1, modXOut);
   
    always @(negedge enable) begin
        c = ~c;
    end

    assign counterOut = {c, modXOut};

endmodule
