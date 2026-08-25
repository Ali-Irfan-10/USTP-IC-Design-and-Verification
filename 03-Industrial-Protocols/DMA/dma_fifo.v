module dma_fifo #(
parameter data_width = 32,
parameter depth = 16,
parameter addr_width = 4
)(
input wire clk,
input wire rst,
input wire wr_en,
input wire rd_en,
input wire [data_width-1:0] wr_data,
output reg [data_width-1:0] rd_data,
output wire full,
output wire empty,
output reg [addr_width:0] count
);
reg [data_width-1:0] mem [0:depth-1];
reg [addr_width-1:0] wr_ptr;
reg [addr_width-1:0] rd_ptr;
assign full = (count == depth);
assign empty = (count == 0);
always @(posedge clk or negedge rst) begin
if (!rst) begin
wr_ptr <= 0;
rd_ptr <= 0;
count <= 0;
rd_data <= 0;
end else begin
if (wr_en && !full) begin
mem[wr_ptr] <= wr_data;
wr_ptr <= wr_ptr + 1'b1;
end
if (rd_en && !empty) begin
rd_data <= mem[rd_ptr];
rd_ptr <= rd_ptr + 1'b1;
end
if ((wr_en && !full) && !(rd_en && !empty)) begin
count <= count + 1'b1;
end else if (!(wr_en && !full) && (rd_en && !empty)) begin
count <= count - 1'b1;
end
end
end
endmodule
