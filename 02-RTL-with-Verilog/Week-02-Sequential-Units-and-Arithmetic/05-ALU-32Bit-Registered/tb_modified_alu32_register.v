module tb_modified_alu32_register;
reg clk;
reg reset;
reg enable;
reg [3:0] op;
wire [31:0] result;

modified_alu32_register uut(
.clk(clk),
.reset(reset),
.enable(enable),
.op(op),
.result(result)
);

always #5 clk = ~clk;
initial begin
clk = 0;
reset = 1;
enable = 0;
op = 0;
#10;
reset = 0;
enable = 1;
op = 4'b0000; #10;
op = 4'b0001; #10;
op = 4'b0010; #10;
op = 4'b0011; #10;
op = 4'b0100; #10;
op = 4'b0101; #10;
op = 4'b0110; #10;
op = 4'b0111; #10;
op = 4'b1000; #10;
op = 4'b1001; #10;
op = 4'b1010; #10;
op = 4'b1011; #10;
op = 4'b1100; #20;
$finish;
end
endmodule
