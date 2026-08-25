module tb_dma_fsm;
reg clk;
reg rst;
reg start_transfer;
reg [31:0] src_addr_init;
reg [31:0] dst_addr_init;
reg [31:0] length_init;
reg bus_op_done;
wire [31:0] current_src_addr;
wire [31:0] current_dst_addr;
wire bus_read_req;
wire bus_write_req;
wire transfer_done;
wire transfer_active;
reg [31:0] read_data_buffer;
dma_fsm uut (
.clk(clk),
.rst(rst),
.start_transfer(start_transfer),
.src_addr_init(src_addr_init),
.dst_addr_init(dst_addr_init),
.length_init(length_init),
.bus_op_done(bus_op_done),
.current_src_addr(current_src_addr),
.current_dst_addr(current_dst_addr),
.bus_read_req(bus_read_req),
.bus_write_req(bus_write_req),
.transfer_done(transfer_done),
.transfer_active(transfer_active),
.read_data_buffer(read_data_buffer)
);
always #5 clk = ~clk;
initial begin
clk = 0;
rst = 0;
start_transfer = 0;
src_addr_init = 32'h1000;
dst_addr_init = 32'h2000;
length_init = 3;
bus_op_done = 0;
read_data_buffer = 0;
#20;
rst = 1;
#10;
start_transfer = 1;
#10;
start_transfer = 0;
#10;
bus_op_done = 1;
#10;
bus_op_done = 0;
#10;
bus_op_done = 1;
#10;
bus_op_done = 0;
#10;
bus_op_done = 1;
#10;
bus_op_done = 0;
#10;
bus_op_done = 1;
#10;
bus_op_done = 0;
#10;
bus_op_done = 1;
#10;
bus_op_done = 0;
#10;
bus_op_done = 1;
#10;
bus_op_done = 0;
#10;
bus_op_done = 1;
#10;
bus_op_done = 0;
#10;
bus_op_done = 1;
#10;
bus_op_done = 0;
#50;
$finish;
end
endmodule
