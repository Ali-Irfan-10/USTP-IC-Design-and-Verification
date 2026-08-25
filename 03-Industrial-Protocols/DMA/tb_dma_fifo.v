module tb_dma_fifo;
reg clk;
reg rst;
reg wr_en;
reg rd_en;
reg [31:0] wr_data;
wire [31:0] rd_data;
wire full;
wire empty;
wire [4:0] count;
dma_fifo #(
.data_width(32),
.depth(16),
.addr_width(4)
) uut (
.clk(clk),
.rst(rst),
.wr_en(wr_en),
.rd_en(rd_en),
.wr_data(wr_data),
.rd_data(rd_data),
.full(full),
.empty(empty),
.count(count)
);
always #5 clk = ~clk;
initial begin
clk = 0;
rst = 0;
wr_en = 0;
rd_en = 0;
wr_data = 0;
#20;
rst = 1;
#10;
wr_en = 1;
wr_data = 32'haaaa0001;
#10;
wr_data = 32'haaaa0002;
#10;
wr_data = 32'haaaa0003;
#10;
wr_en = 0;
#20;
rd_en = 1;
#10;
#10;
#10;
rd_en = 0;
#30;
$finish;
end
endmodule
