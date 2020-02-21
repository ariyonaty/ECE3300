`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2020 04:15:10 PM
// Design Name: 
// Module Name: MyConverter_Sim
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


module MyConverter_Sim();
    
    parameter n = 4;
    
    reg [7:0] ascii;
    wire [n-1:0] dec;
    
    MyConverter     #(n)    uut (ascii, dec);
    
    initial begin
            ascii = 8'h30;      // case 1: input number between 0 and 9
        #1  ascii = 8'h31;      // case 1: ''                           ''      
        #1  ascii = 8'h32;      // case 1: ''                           ''
        #1  ascii = 8'h33;      // case 1: ''                           ''
        #1  ascii = 8'h34;      // case 1: ''                           ''
        #1  ascii = 8'h35;      // case 1: ''                           ''
        #1  ascii = 8'h36;      // case 1: ''                           ''
        #1  ascii = 8'h37;      // case 1: ''                           ''
        #1  ascii = 8'h38;      // case 1: ''                           ''
        #1  ascii = 8'h39;      // case 1: ''                           ''
        #1  ascii = 8'haa;      // case 2: input not a number
        #1  $stop;
    end

endmodule
