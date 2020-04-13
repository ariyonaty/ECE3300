`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2020 04:25:19 PM
// Design Name: 
// Module Name: divider
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


module divider
    #(  parameter   dividendWidth = 8,
        parameter   divisorWidth = 4
    )(
        input       clk,
        input       reset,
        input       command, 
        input       [dividendWidth-1:0] dataA,
        input       [divisorWidth-1:0] dataB,
        output reg  [dividendWidth-1:0] quotient,
        output reg  [dividendWidth-1:0] remainder,
        output reg  done,
        output reg  [2:0] i,
        output reg  [2*dividendWidth-1:0] registerRA,
        output reg  [1:0] state_reg
    );

    localparam [1:0]    S0 = 0,
                        S1 = 1,
                        S2 = 2,
                        S3 = 3;

    reg [1:0] state_next;
    reg [dividendWidth-1:0] registerA, registerA_next;
    reg [dividendWidth-1:0] registerB, registerB_next;
    reg [2*dividendWidth-1:0] registerRA_next;
    reg [dividendWidth-1:0] quotient_next;
    reg [dividendWidth-1:0] remainder_next;
    reg [2:0] i_next;
    reg done_next;


    always @(posedge clk) begin
        if (reset) begin
            state_reg       <= S0;
            registerA       <= 0;
            registerB       <= 0;
            registerRA      <= 0;
            quotient        <= 0;
            remainder       <= 0;
            i               <= dividendWidth - 1;
            done            <= 0;
        end else begin
            state_reg       <= state_next;
            registerA       <= registerA_next;
            registerB       <= registerB_next;
            registerRA      <= registerRA_next;
            quotient        <= quotient_next;
            remainder       <= remainder_next;
            i               <= i_next;
            done            <= done_next;
        end
    end

    always @(*) begin
        state_next          = state_reg;
        registerA_next      = registerA;  
        registerB_next      = registerB; 
        registerRA_next     = registerRA;
        quotient_next       = quotient;
        remainder_next      = remainder;  
        i_next              = i;
        done_next           = done;       
    
        case (state_reg)
            S0: begin
                    if (command) begin
                        state_next = S1;
                        done_next = 0;
                    end else begin
                        registerA_next = dataA;
                        registerB_next = {4'b0, dataB};
                        registerRA_next = {remainder, dataA};
                        remainder_next = 0;
                        i_next = dividendWidth - 1;
                        done_next = 0;
                    end
                end
            S1: begin
                    registerRA_next = {registerRA[2*dividendWidth-2:0], 1'b0}; // registerRA << 1;
                    state_next = S2;
                end
            S2: begin
                    if (registerRA[2*dividendWidth-1:dividendWidth] >= registerB) begin
                        quotient_next[i] = 1;
                        registerRA_next[2*dividendWidth-1:dividendWidth] = registerRA[2*dividendWidth-1:dividendWidth] - registerB;
                        remainder_next = registerRA_next[2*dividendWidth-1:dividendWidth];
                    end else begin
                        quotient_next[i] = 0;
                    end
                    if (!i) begin
                        state_next = S3;
                    end else begin
                        i_next = i - 1;
                        state_next = S1;
                    end
                end
            S3: begin
                    done_next = 1;
                    remainder_next = registerRA[2*dividendWidth-1:dividendWidth];
                    if (!command) begin
                        state_next = S0;
                    end
                end
            default: begin
                    state_next = S0;
                    done_next = 0;
                end 
        endcase

    end

endmodule
