`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2020 04:04:52 PM
// Design Name: 
// Module Name: MyConverter
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


module MyConverter
    #(parameter n = 4)
    (
        input       [7:0] ascii,
        output reg  [n-1:0] dec
    );

    
    always @(ascii) begin
        case (ascii)
            8'h30   : dec <= 0;
            8'h31   : dec <= 1;
            8'h32   : dec <= 2;
            8'h33   : dec <= 3;
            8'h34   : dec <= 4;
            8'h35   : dec <= 5;
            8'h36   : dec <= 6;
            8'h37   : dec <= 7;
            8'h38   : dec <= 8;
            8'h39   : dec <= 9;
            default : dec <= 4'b1111;
        endcase
	end
				
endmodule
