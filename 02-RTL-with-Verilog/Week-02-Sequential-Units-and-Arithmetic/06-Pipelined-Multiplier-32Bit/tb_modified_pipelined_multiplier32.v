module tb_modified_pipelined_multiplier32;
reg clk;
reg reset;
reg enable;
wire [63:0] product;

modified_pipelined_multiplier32 uut (
.clk(clk),
.reset(reset),
.enable(enable),
.product(product)
);

always #5 clk = ~clk;
initial begin
clk = 0;
reset = 1;
enable = 0;
#10;
reset = 0;
enable = 1;
#40;
enable = 0;
#20;
enable = 1;
#30;
$finish;
end
endmodule
