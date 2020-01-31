`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/30/2020 04:27:57 PM
// Design Name: 
// Module Name: Cadder
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


module Cadder(x, y, Cin, s, Cout);

    parameter  n = 1;
    input Cin;
    input [n:0] x, y;
    output [n:0] s;
    output Cout;
    
    assign {Cout, s} = x + y + Cin;

endmodule
