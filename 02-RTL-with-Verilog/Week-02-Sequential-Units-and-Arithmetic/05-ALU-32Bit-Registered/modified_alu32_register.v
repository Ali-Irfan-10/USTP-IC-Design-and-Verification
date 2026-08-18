module modified_alu32_register (
input clk,
input reset,
input enable,
input [3:0] op,
output reg [31:0] result
);
wire [31:0] a = 32'd12;
wire [31:0] b = 32'd3;
reg [31:0] a_reg;
reg [31:0] b_reg;
always @(posedge clk) begin
if (reset) begin
a_reg <= 32'd0;
b_reg <= 32'd0;
result <= 32'd0;
end
else if (enable) begin
a_reg <= a;
b_reg <= b;
case (op)
4'b0000: result <= a_reg + b_reg;
4'b0001: result <= a_reg - b_reg;
4'b0010: result <= a_reg & b_reg;
4'b0011: result <= a_reg | b_reg;
4'b0100: result <= a_reg ^ b_reg;
4'b0101: result <= ~(a_reg & b_reg);
4'b0110: result <= ~(a_reg | b_reg);
4'b0111: result <= ~(a_reg ^ b_reg);
4'b1000: result <= a_reg << b_reg[4:0];
4'b1001: result <= a_reg >> b_reg[4:0];
4'b1010: result <= a_reg + 1'b1;
4'b1011: result <= a_reg - 1'b1;
4'b1100: result <= ~a_reg;
default: result <= 32'd0;
endcase
end
end
endmodule
