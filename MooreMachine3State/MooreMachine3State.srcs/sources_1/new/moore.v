`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
//  Develop the Verilog project using the template ( on slide#21) to implement the Moore machine on slide #11.
//
//  Provide simulation code that shows the timing chart on slide #17.
//  
//  Submit the project folder (zipped) to the block board assignment by next Tue. (March 17) 4PM
//
//////////////////////////////////////////////////////////////////////////////////


module moore
    (
        input       clk,
        input       reset,
        input       w,
        output reg  z   
    );

    initial z = 0;
    localparam  [1:0]   S0 = 2'b00,
                        S1 = 2'b01,
                        S2 = 2'b10;
    
    reg [1:0] state, next_state;

    always @(posedge clk, posedge reset) begin
        if (reset)
            state <= S0;
        else
            state <= next_state;
    end

    always @(*) begin
        case (state)
            S0: if (w) next_state = S1; else next_state = S0;
            S1: if (w) next_state = S2; else next_state = S0;
            S2: if (w) next_state = S2; else next_state = S0; 
            default: next_state = S0;
        endcase
    end

    always @(state) begin
        case (state)
            S0, S1:     z <= 1'b0;
                S2:     z <= 1'b1;
        endcase
    end

endmodule
