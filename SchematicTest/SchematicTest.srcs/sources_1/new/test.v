`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/25/2020 10:22:34 PM
// Design Name: 
// Module Name: test
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


module test(x1, x2, x3, f);
    
    input x1, x2, x3;
    output f;
    
    and(g, x1, x2);
    not(k, x2);
    and(h, k, x3);
    or(f, g, h);
    
    
endmodule
