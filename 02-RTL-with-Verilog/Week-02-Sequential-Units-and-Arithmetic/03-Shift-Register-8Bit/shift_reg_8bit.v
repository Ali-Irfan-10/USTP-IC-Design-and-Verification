module shift_reg_8bit (
input clk,
input reset,
input load,
input enable,
input sin,
input [7:0] d_in,
output reg [7:0] q
);
always @(posedge clk)
begin
if (reset)
q <= 8'b00000000;
else if (load)
q <= d_in;
else if (enable)
q <= {q[6:0], sin};
end
endmodule
