`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2020 12:43:27 AM
// Design Name: 
// Module Name: seq2
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


module seq2
    (
        input       clk,
        input       w,
        output      zed
    );

    reg [7:0] out = 8'h00;
    
    wire Y2, Y1;
    reg y2, y1;

    assign zed = out[6] | out[7];   
    assign Y2 = out[0] | out[1] | out[4] | out[6];
    assign Y1 = out[1] | out[2] | out[4] | out[7];

    always @(w, y2, y1) begin
        case ({w, y2, y1})
            3'b000  : out <= 8'b00000001;
            3'b001  : out <= 8'b00000010;
            3'b010  : out <= 8'b00000100;
            3'b011  : out <= 8'b00001000;
            3'b100  : out <= 8'b00010000;
            3'b101  : out <= 8'b00100000;
            3'b110  : out <= 8'b01000000;
            3'b111  : out <= 8'b10000000;
        endcase
	end

    always @(posedge clk) begin
        y2 <= Y2;
        y1 <= Y1;
    end

endmodule
