module dma_engine (
input wire clk,
input wire rst,
input wire start_transfer,
input wire [31:0] src_addr_init,
input wire [31:0] dst_addr_init,
input wire [31:0] length_init,
output wire [31:0] mem_addr,
output wire mem_read_req,
output wire mem_write_req,
input wire [31:0] mem_rdata,
output wire [31:0] mem_wdata,
input wire mem_ready,
output wire dma_busy,
output wire dma_done,
output wire irq
);
wire [31:0] current_src;
wire [31:0] current_dst;
wire fsm_read_req;
wire fsm_write_req;
wire transfer_done_sig;
wire transfer_active_sig;
wire [31:0] fifo_rdata;
wire fifo_full;
wire fifo_empty;
wire [4:0] fifo_count;
reg is_read_op;
always @(posedge clk or negedge rst) begin
if (!rst)
is_read_op <= 0;
else if (fsm_read_req)
is_read_op <= 1;
else if (fsm_write_req)
is_read_op <= 0;
end
assign mem_addr = (is_read_op || fsm_read_req) ? current_src : current_dst;
assign mem_read_req = fsm_read_req;
assign mem_write_req = fsm_write_req;
assign mem_wdata = fifo_rdata;
assign dma_busy = transfer_active_sig;
assign dma_done = transfer_done_sig;
assign irq = transfer_done_sig;
dma_fsm u_dma_fsm (
.clk(clk),
.rst(rst),
.start_transfer(start_transfer),
.src_addr_init(src_addr_init),
.dst_addr_init(dst_addr_init),
.length_init(length_init),
.bus_op_done(mem_ready),
.current_src_addr(current_src),
.current_dst_addr(current_dst),
.bus_read_req(fsm_read_req),
.bus_write_req(fsm_write_req),
.transfer_done(transfer_done_sig),
.transfer_active(transfer_active_sig),
.read_data_buffer(fifo_rdata)
);
dma_fifo #(
.data_width(32),
.depth(16),
.addr_width(4)
) u_dma_fifo (
.clk(clk),
.rst(rst),
.wr_en(is_read_op && mem_ready),
.rd_en(fsm_write_req),
.wr_data(mem_rdata),
.rd_data(fifo_rdata),
.full(fifo_full),
.empty(fifo_empty),
.count(fifo_count)
);
endmodule
