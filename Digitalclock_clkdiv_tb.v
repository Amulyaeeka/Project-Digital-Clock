`timescale 1ns/1ps

module Digitalclock_clkdiv_tb;

reg clk;
reg reset;

wire clk_1Hz;

wire [5:0] sec;
wire [5:0] min;
wire [5:0] hour;

// Clock Divider
Digitalclock_clkdiv U1 (
    .clk(clk),
    .rst(reset),
    .clk_1Hz(clk_1Hz)
);

// Digital Clock
Digitalclock_seconds U2 (
    .Digitalclock_clkdiv(clk_1Hz),
    .reset(reset),
    .sec(sec),
    .min(min),
    .hour(hour)
);

// FPGA Clock Generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Reset
initial begin
    reset = 1;
    #20;
    reset = 0;
end

// Monitor
initial begin
    $monitor("Time=%0t  clk_1Hz=%b  Hour=%0d  Min=%0d  Sec=%0d",
             $time, clk_1Hz, hour, min, sec);
end

// Run simulation
initial begin
    #5000;
    $finish;
end
initial begin
    $dumpfile("digitalclock.vcd");
    $dumpvars(0, Digitalclock_tb);
end

endmodule
