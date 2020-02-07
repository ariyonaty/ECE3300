`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2020 03:32:07 PM
// Design Name: 
// Module Name: alu
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


// OPMODES to implement
// Addition
// Subtraction
// Compare
// And
// Or
// + 3 More

module alu(A, B, Op, Y, zero, neg, Cout, overflow);

    input       [3:0] A, B;                 // operands
    input       [2:0] Op;                   // operation
    output reg  [3:0] Y;                    // resultant
    output      zero, neg, Cout, overflow;  // status flags       
    
    always @ (*) begin
        case (Op)
            3'b000: assign Y = A + B;   // add
            3'b001: assign Y = A - Y;   // subtract
            3'b010: assign Y = A * B;   // multiplication
            3'b011: assign Y = A / B;   // division
            3'b100: assign Y = A | B;   // or
            3'b101: assign Y = A ^ B;   // xor
            3'b110: assign Y = A & B;   // and
            3'b111: assign Y = 0;
        endcase
    end

endmodule
