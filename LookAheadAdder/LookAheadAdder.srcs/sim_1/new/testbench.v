`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/29/2020 08:15:49 PM
// Design Name: 
// Module Name: testbench
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


module testbench();

    parameter WIDTH = 8;
    
    reg [WIDTH-1:0] add1 = 0;
    reg [WIDTH-1:0] add2 = 0;
    wire [WIDTH:0] result;
    
    carrylookahead #(WIDTH) uut (add1, add2, result);
    
    initial begin
        #10;    add1 = 8'b10101010; add2 = 8'b01010101;
        #10;    add1 = 8'b00001001; add2 = 8'b00000101;
        #10;    add1 = 8'b00101001; add2 = 8'b01010101;
        #10;    add1 = 8'b00001001; add2 = 8'b00010101;
        #10;    add1 = 8'b01101001; add2 = 8'b11000101;
        #10;    add1 = 8'b00111001; add2 = 8'b10010101;
        #10;    add1 = 8'b01000101; add2 = 8'b11010101;
        #10;    add1 = 8'b00100111; add2 = 8'b01011101;
        #10;    add1 = 8'b11111111; add2 = 8'b11111111;
    end

endmodule
