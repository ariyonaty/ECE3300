`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2020 06:57:38 PM
// Design Name: 
// Module Name: summation
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


module summation
    (
        input       clk,
        input       reset,
        input       command,
        input       [3:0] n,
        output reg  done,
        output reg  [5:0] s
    );

    reg [5:0] tempSum;
    reg [3:0] count;

    reg [1:0]   state, next_state;
    parameter   S0 = 0,
                S1 = 1,
                S2 = 2,
                S3 = 3;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state = 0;
            s = 0;
            tempSum = 0;
        end
        else
            state = next_state; 
    end

    always @(*) begin
        case (state)
            S0: begin
                    tempSum = 0;
                    count = 0;
                    s = 0;
                    if (command)
                        next_state = S1;
                    else
                        next_state = S0;
                end
            S1: begin
                    tempSum = tempSum + count;
                    next_state = S2;
                end
            S2: begin
                    if (count == n) begin
                        next_state = S3;
                    end
                    if (count != n) begin
                        count = count + 1;
                        next_state = S1;
                    end
                end
            S3:
                begin
                    s = tempSum;
                    done = 1;
                    state = S3;
                end
            default: 
                    next_state = S0;
        endcase
    end

endmodule
