module tb_jkff_sync_reset;
reg clk;
reg reset;
reg j;
reg k;
wire q;
jkff_sync_reset uut (
.clk (clk),
.reset (reset),
.j (j),
.k (k),
.q (q)
);
always #5 clk = ~clk;
initial begin
clk = 0;
reset = 1;
j = 0;
k = 0;
$monitor("Time=%0t | clk=%b reset=%b j=%b k=%b q=%b", $time, clk, reset, j, k, q);
#10;
reset = 0; j = 1; k = 0; #10;
j = 0; k = 1; #10;
j = 1; k = 1; #10;
j = 1; k = 1; #10;
j = 0; k = 0; #10;
reset = 1; #10;
reset = 0; j = 1; k = 0; #10;
$finish;
end
endmodule
