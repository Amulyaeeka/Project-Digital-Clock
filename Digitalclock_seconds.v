module Counter (
    input clk,
    input reset,
    output reg [5:0] count
);

always @(posedge clk or posedge reset)
begin
    if (reset)
        count <= 6'b111011; //  59 = 6'b111011
    else
        count <= count + 1;
end

endmodule
