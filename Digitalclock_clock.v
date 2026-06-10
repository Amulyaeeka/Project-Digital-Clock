 // Digital-clock of 24hour format

module Digitalclock_seconds(
    input Digitalclock_clkdiv,
    input reset,
    output reg [5:0] sec,
    output reg [5:0] min,
    output reg [5:0] hour
);

always @(posedge Digitalclock_clkdiv or posedge reset)
begin
    if (reset)
        sec <= 6'd0;
    else if (sec == 6'd59)
        sec <= 6'd0;
    else
        sec <= sec + 1;

    if (reset)
    min <= 0;
    else if (sec == 59)
    begin
    if (min == 59)
        min <= 0;
    else
        min <= min + 1;
    end

    if (reset)
        hour <= 6'd0;
    else if (hour == 6'd23 && min == 6'd59 && sec == 6'd59)
        hour <= 6'd0;
    else if (min == 6'd59 && sec == 6'd59)
        hour <= hour + 1;
end
endmodule
