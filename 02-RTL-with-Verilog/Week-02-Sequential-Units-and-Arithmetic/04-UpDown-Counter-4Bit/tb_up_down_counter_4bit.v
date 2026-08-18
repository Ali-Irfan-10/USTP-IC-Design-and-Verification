module tb_up_down_counter_4bit;
reg clk;
reg reset;
reg enable;
reg up_down;
wire [3:0] count;
up_down_counter_4bit uut (
.clk (clk),
.reset (reset),
.enable (enable),
.up_down (up_down),
.count (count)
);
always #5 clk = ~clk;
initial begin
clk = 0;
reset = 1;
enable = 0;
up_down = 1;
#10;
reset = 0; enable = 1; up_down = 1; #30;
up_down = 0; #30;
enable = 0; #10;
enable = 1; up_down = 1; #10;
reset = 1; #10;
$finish;
end
endmodule
