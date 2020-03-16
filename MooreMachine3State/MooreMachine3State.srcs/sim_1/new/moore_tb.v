`timescale 1ns / 1ps

module moore_tb();

    reg clk, reset, w;
    wire z;

    moore uut
        (
            .clk (clk),
            .reset (reset),
            .w (w),
            .z (z)
        );

    always #0.5 clk = ~clk;

    initial begin
                w = 0;  clk = 0; reset = 0;
        #0.5            clk = 1;
        #1.2    w = 1;
        #1      w = 0;
        #1      w = 1;
        #2      w = 0;
        #1      w = 1;
        #3      w = 0;
        #1      w = 1;  
        #1.3    $stop;
    end

endmodule
