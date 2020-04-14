`timescale 1ns / 1ps

module moore_tb();

    reg clk, reset, w;
    wire zed;

    moore uut
    (
        .clk(clk),
        .reset(reset),
        .w(w),
        .zed(zed)
    );
    
    always #1 clk = ~clk;

    initial begin
            clk = 0;    reset = 1;
        #2  w = 1;      reset = 0;
        #2  w = 1;
        #2  w = 1;
        #2  w = 0;
        #2  w = 1;
        #2  w = 0;
        #2  w = 0;
        #2  w = 1;
        #2  w = 0;
        #2  w = 1;
        #2  w = 0;
        #2  w = 0;
        #2  w = 1;
        #2  w = 0;
        #2  w = 1;
        #2  w = 1;
        #2  $stop;

    end

endmodule // moore_tb
