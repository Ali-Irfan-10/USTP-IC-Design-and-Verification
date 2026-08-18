module modified_pipelined_multiplier32(
input clk,
input reset,
input enable,
output reg [63:0] product
);
wire [31:0] a = 32'd2;
wire [31:0] b = 32'd5;
reg [31:0] a_reg;
reg [31:0] b_reg;
reg [63:0] prod_stage1;

always @(posedge clk) begin
if (reset) begin
a_reg <= 32'd0;
b_reg <= 32'd0;
prod_stage1 <= 64'd0;
product <= 64'd0;
end
else begin
if (enable) begin
a_reg <= a;
b_reg <= b;
end
if (enable) begin
prod_stage1 <= a_reg * b_reg;
end
if (enable) begin
product <= prod_stage1;
end
end
end
endmodule
