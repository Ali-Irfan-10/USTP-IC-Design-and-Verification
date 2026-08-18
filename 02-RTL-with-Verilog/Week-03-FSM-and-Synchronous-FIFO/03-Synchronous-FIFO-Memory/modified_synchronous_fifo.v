module modified_synchronous_fifo (
input clk,
input reset,
input write_enable,
input read_enable,
input [1:0] data_in,
output reg [1:0] data_out,
output full,
output empty,
output almost_full,
output almost_empty
);
parameter DEPTH = 4;
reg [1:0] memory [0:DEPTH-1];
reg [1:0] write_pointer;
reg [1:0] read_pointer;
reg [2:0] count;

always @(posedge clk) begin
if (reset) begin
write_pointer <= 2'd0;
read_pointer <= 2'd0;
count <= 3'd0;
data_out <= 2'd0;
end
else begin
case ({write_enable && !full, read_enable && !empty})
2'b10: begin
memory[write_pointer] <= data_in;
write_pointer <= write_pointer + 1'b1;
count <= count + 1'b1;
end
2'b01: begin
data_out <= memory[read_pointer];
read_pointer <= read_pointer + 1'b1;
count <= count - 1'b1;
end
2'b11: begin
memory[write_pointer] <= data_in;
data_out <= memory[read_pointer];
write_pointer <= write_pointer + 1'b1;
read_pointer <= read_pointer + 1'b1;
end
default: ;
endcase
end
end

assign full = (count == DEPTH);
assign empty = (count == 0);
assign almost_full = (count == DEPTH - 1);
assign almost_empty = (count == 1);
endmodule
