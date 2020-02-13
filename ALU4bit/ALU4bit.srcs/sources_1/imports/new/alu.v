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

module alu(A, B, OP, Y, zero, neg, Cout, overflow);

    input       [3:0] A, B;                 // operands
    input       [2:0] OP;                   // operation
    output reg  [3:0] Y;                    // resultant
    output      zero, neg, Cout, overflow;  // status flags       
    
    reg flagN, flagC, flagO;
    
    always @ (*) begin
        case (OP)
            3'b000: Y = 0;                                                          // null
            3'b001: begin                                                           // add
                        Y = A + B;
                        flagC = (A[3] & B[3]) | (A[3] & ~Y[3]) | (B[3] & ~Y[3]);                 
                    end               
            3'b010: begin                                                           // subtract
                        Y = A - B;                      
                        flagO = Cout ^ A[3] ^ B[3] ^ Y[3];
                        flagN = (A < B) & (OP == 3'b010); 
                    end         
            3'b011: Y = (A == B) ? 4'b1111 : 4'b0000;                               // compare
            3'b100: Y = A & B;                                                      // and      
            3'b101: Y = A | B;                                                      // or            
            3'b110: Y = A ^ B;                                                      // xor           
            3'b111: Y = A << 1;                                                     // shift left        
        endcase
    end
    
    assign zero = ~(|Y);
    assign Cout = flagC;
    assign overflow = flagO;
    assign neg = flagN;

endmodule






