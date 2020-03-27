`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2020 12:15:25 AM
// Design Name: 
// Module Name: seq
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


module seq
    (
        input       clk,
        input       w,
        output      zed
    );

    localparam  S0 = 2'b00,
                S1 = 2'b01,
                S2 = 2'b10,
                S3 = 2'b11;

    reg [1:0] state, next_state;

    always @(posedge clk) begin
        state <= next_state;
    end

    always @(state) begin
        case (state)
            S0: if (w) next_state = S3; else next_state = S2; 
            S1: if (w) next_state = S0; else next_state = S1;
            S2: if (w) next_state = S0; else next_state = S3;
            S3: if (w) next_state = S1; else next_state = S2;
            default:   next_state = S0; 
        endcase
    end

    assign zed = (state == S3);

endmodule
