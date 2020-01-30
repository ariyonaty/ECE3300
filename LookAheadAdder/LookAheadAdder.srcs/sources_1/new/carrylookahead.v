`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/29/2020 07:53:18 PM
// Design Name: 
// Module Name: carrylookahead
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


module carrylookahead
    #(parameter WIDTH=64)
    (
        input   [WIDTH-1:0] add1,
        input   [WIDTH-1:0] add2,
        output  [WIDTH:0] result
    );
    
    wire [WIDTH:0]  C;
    wire [WIDTH-1:0] G, P, SUM;
    
    // Instantiates the number of 1 bit full adder modules depending on parameter width specified above.
    genvar i;
    generate
        for (i = 0; i < WIDTH; i = i + 1) begin
            fulladder   inst    (add1[i], add2[i], C[i], , SUM[i]);
        end
    endgenerate
    
    // Create the Generate (G) Terms:  G[i] = A[i] & B[i]
    // Create the Propagate Terms: P[i] = A[i] | B[i]
    // Create the Carry Terms:
    genvar j;
    generate
        for (j = 0; j < WIDTH; j = j + 1) begin
            assign G[j]     = add1[j] & add2[j];
            assign P[j]     = add1[j] | add2[j];
            assign C[j+1]   = G[j] | (P[j] & C[j]);
        end
    endgenerate
    
    assign C[0] = 1'b0;
    assign result = {C[WIDTH], SUM};
    
    
endmodule
