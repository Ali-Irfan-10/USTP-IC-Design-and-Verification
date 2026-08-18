module tb_shift_reg_8bit;
reg clk;
reg reset;
reg load;
reg enable;
reg sin;
reg [7:0] d_in;
wire [7:0] q;
shift_reg_8bit uut (
.clk (clk),
.reset (reset),
.load (load),
.enable (enable),
.sin (sin),
.d_in (d_in),
.q (q)
);
always #5 clk = ~clk;
initial begin
clk = 0;
reset = 1;
load = 0;
enable = 0;
sin = 0;
d_in = 8'h00;
#10;
reset = 0; load = 1; d_in = 8'hA5; #10;
load = 0; enable = 1; sin = 1; #10;
sin = 0; #10;
sin = 1; #10;
enable = 0; #10;
reset = 1; #10;
$finish;
end
endmodule
