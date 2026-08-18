module tb_tff_async_reset;
reg clk;
reg reset;
reg t;
wire q;
tff_async_reset uut (
.clk (clk),
.reset (reset),
.t (t),
.q (q)
);
always #5 clk = ~clk;
initial begin
clk = 0;
reset = 1;
t = 0;
$monitor("Time=%0t | clk=%b reset=%b t=%b q=%b", $time, clk, reset, t, q);
#10;
reset = 0; t = 1; #10;
t = 1; #10;
t = 0; #10;
#3 reset = 1; #5;
reset = 0; t = 1; #10;
$finish;
end
endmodule
