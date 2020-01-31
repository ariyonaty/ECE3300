`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/30/2020 04:18:32 PM
// Design Name: 
// Module Name: Hadder
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


module Hadder(x, y, Cin, s, Cout);

    input [1:0] x, y;
    input Cin;
    output Cout;
    output [1:0] s;
    
    wire C1;
    
    fulladd stage0 (x[0], y[0], Cin, s[0], C1);
    fulladd stage1 (x[1], y[1], C1, s[1], Cout);

endmodule
