`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2020 04:54:59 PM
// Design Name: 
// Module Name: moore
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


module moore
    (
        input       clk,
        input       reset,
        input       w,
        output      zed
    );

    parameter [2:0] A = 0,
                    B = 1,
                    C = 2,
                    D = 3,
                    E = 4; 

    reg [2:0] state, next_state;

    always @(posedge clk, posedge reset) begin
        if (reset)
            state <= A;
        else
            state <= next_state;
    end

    always @(*) begin
        case (state)
            A:
                if (w)  next_state = D;     
                else    next_state = B;
            B:  
                if (w)  next_state = D;     
                else    next_state = C;
            C:  
                if (w)  next_state = D;     
                else    next_state = C;
            D:  
                if (w)  next_state = E;         
                else    next_state = B;
            E: 
                if (w)  next_state = E;         
                else    next_state = B;
            default: 
                        next_state = A; 
        endcase
    end

    assign zed = (state == C) || (state == E);

endmodule
