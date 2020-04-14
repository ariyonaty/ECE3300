`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2020 05:16:41 PM
// Design Name: 
// Module Name: mealy
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


module mealy
    (
        input       clk,
        input       reset,
        input       w,
        output reg  zed
    );


    parameter [1:0] A = 0,
                    B = 1,
                    C = 2;

    reg [1:0] state, next_state;

    always @(posedge clk, posedge reset) begin
        if (reset)
            state <= A;
        else
            state <= next_state;
    end

    always @(*) begin
        zed = 0;
        case (state)
            A:
                if (w)  next_state = C; 
                else    next_state = B;
            B:
                if (w)  next_state = C;     
                else begin
                        next_state = B;
                        zed = 1;
                end
            C: 
                if (w) begin
                        next_state = C;     
                        zed = 1;
                end
                else    next_state = B;
            default: 
                        next_state = A;
        endcase
    end

endmodule
