module Digitalclock_clkdiv (
    input clk,          // 50 MHz clock
    input rst,
    output reg clk_1Hz
);

reg [24:0] count;

always @(posedge clk or posedge rst)
begin
    if (rst) begin
        count   <= 25'd0;
        clk_1Hz <= 1'b0;
    end
    else if (count == 25_000_000 - 1) begin
        count   <= 25'd0;
        clk_1Hz <= ~clk_1Hz;
    end
    else begin
        count <= count + 1;
    end
end

endmodule
