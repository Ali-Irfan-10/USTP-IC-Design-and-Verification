module tb_dma_engine;
reg clk;
reg rst;
reg start_transfer;
reg [31:0] src_addr_init;
reg [31:0] dst_addr_init;
reg [31:0] length_init;
wire [31:0] mem_addr;
wire mem_read_req;
wire mem_write_req;
reg [31:0] mem_rdata;
wire [31:0] mem_wdata;
reg mem_ready;
wire dma_busy;
wire dma_done;
wire irq;
reg [31:0] memory [0:255];
dma_engine uut (
.clk(clk),
.rst(rst),
.start_transfer(start_transfer),
.src_addr_init(src_addr_init),
.dst_addr_init(dst_addr_init),
.length_init(length_init),
.mem_addr(mem_addr),
.mem_read_req(mem_read_req),
.mem_write_req(mem_write_req),
.mem_rdata(mem_rdata),
.mem_wdata(mem_wdata),
.mem_ready(mem_ready),
.dma_busy(dma_busy),
.dma_done(dma_done),
.irq(irq)
);
always #5 clk = ~clk;
always @(posedge clk or negedge rst) begin
if (!rst) begin
mem_ready <= 0;
mem_rdata <= 0;
end else begin
if (mem_read_req) begin
mem_ready <= 1;
mem_rdata <= memory[mem_addr[7:2]];
end else if (mem_write_req) begin
mem_ready <= 1;
memory[mem_addr[7:2]] <= mem_wdata;
end else begin
mem_ready <= 0;
end
end
end
initial begin
clk = 0;
rst = 0;
start_transfer = 0;
src_addr_init = 32'h00;
dst_addr_init = 32'h40;
length_init = 4;
memory[0] = 32'h11111111;
memory[1] = 32'h22222222;
memory[2] = 32'h33333333;
memory[3] = 32'h44444444;
#20;
rst = 1;
#10;
start_transfer = 1;
#10;
start_transfer = 0;
@(posedge dma_done);
#20;
$finish;
end
endmodule
