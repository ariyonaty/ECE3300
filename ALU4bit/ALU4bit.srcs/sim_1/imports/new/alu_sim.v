`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2020 02:03:03 PM
// Design Name: 
// Module Name: alu_sim
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


module alu_sim();

    reg [3:0] A, B;
    reg [2:0] OP;
    
    wire [3:0] Y;
    wire zero, neg, Cout, overflow;
    
    alu uut (   .A(A),
                .B(B),
                .OP(OP),
                .Y(Y),
                .zero(zero),
                .neg(neg),
                .Cout(Cout),
                .overflow(overflow)
            );

    initial begin
            A = 4'b0000;    B = 4'b0000;    OP=3'b000;      
        #1  A = 4'b0000;    B = 4'b0000;    OP=3'b001;      // testing addition
        #1  A = 4'b1001;    B = 4'b0110;    OP=3'b001;      
        #1  A = 4'b1111;    B = 4'b1111;    OP=3'b001;      
        #1  A = 4'b0011;    B = 4'b0001;    OP=3'b001;      
        #1  A = 4'b0000;    B = 4'b0000;    OP=3'b010;      // testing subtraction
        #1  A = 4'b1111;    B = 4'b0011;    OP=3'b010;      
        #1  A = 4'b1000;    B = 4'b1001;    OP=3'b010;      
        #1  A = 4'b1100;    B = 4'b0000;    OP=3'b010;      
        #1  A = 4'b1000;    B = 4'b1001;    OP=3'b011;      // compare      
        #1  A = 4'b1110;    B = 4'b1011;    OP=3'b011;      
        #1  A = 4'b1100;    B = 4'b1100;    OP=3'b011;      
        #1  A = 4'b0000;    B = 4'b0000;    OP=3'b011;      
        #1  A = 4'b1110;    B = 4'b1001;    OP=3'b100;      // and
        #1  A = 4'b1010;    B = 4'b0101;    OP=3'b100;      
        #1  A = 4'b1110;    B = 4'b1001;    OP=3'b101;      // or       
        #1  A = 4'b1010;    B = 4'b0101;    OP=3'b101;      
        #1  A = 4'b1110;    B = 4'b1001;    OP=3'b110;      // xor       
        #1  A = 4'b1010;    B = 4'b0101;    OP=3'b110;      
        #1  A = 4'b1110;    B = 4'b1001;    OP=3'b111;      // shift left
        #1  A = 4'b1010;    B = 4'b0101;    OP=3'b111;
    end

endmodule
