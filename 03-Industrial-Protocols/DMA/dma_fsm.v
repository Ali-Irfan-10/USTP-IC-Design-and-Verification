module dma_fsm (
input wire clk,
input wire rst,
input wire start_transfer,
input wire [31:0] src_addr_init,
input wire [31:0] dst_addr_init,
input wire [31:0] length_init,
input wire bus_op_done,
output reg [31:0] current_src_addr,
output reg [31:0] current_dst_addr,
output reg bus_read_req,
output reg bus_write_req,
output reg transfer_done,
output reg transfer_active,
input wire [31:0] read_data_buffer
);
localparam state_idle = 3'b000;
localparam state_read = 3'b001;
localparam state_wait_read = 3'b010;
localparam state_write = 3'b011;
localparam state_wait_write = 3'b100;
localparam state_inc_addr = 3'b101;
localparam state_done = 3'b110;
reg [2:0] state;
reg [2:0] next_state;
reg [31:0] transfer_count;
always @(posedge clk or negedge rst) begin
if (!rst)
state <= state_idle;
else
state <= next_state;
end
always @(*) begin
next_state = state;
case (state)
state_idle: begin
if (start_transfer && (length_init > 0))
next_state = state_read;
end
state_read: next_state = state_wait_read;
state_wait_read: if (bus_op_done) next_state = state_write;
state_write: next_state = state_wait_write;
state_wait_write: if (bus_op_done) next_state = state_inc_addr;
state_inc_addr: begin
if (transfer_count <= 1)
next_state = state_done;
else
next_state = state_read;
end
state_done: next_state = state_idle;
default: next_state = state_idle;
endcase
end
always @(posedge clk or negedge rst) begin
if (!rst) begin
current_src_addr <= 32'b0;
current_dst_addr <= 32'b0;
transfer_count <= 32'b0;
end else begin
case (state)
state_idle: begin
if (start_transfer) begin
current_src_addr <= src_addr_init;
current_dst_addr <= dst_addr_init;
transfer_count <= length_init;
end
end
state_inc_addr: begin
current_src_addr <= current_src_addr + 4;
current_dst_addr <= current_dst_addr + 4;
transfer_count <= transfer_count - 1;
end
endcase
end
end
always @(posedge clk or negedge rst) begin
if (!rst) begin
bus_read_req <= 1'b0;
bus_write_req <= 1'b0;
transfer_done <= 1'b0;
transfer_active <= 1'b0;
end else begin
bus_read_req <= 1'b0;
bus_write_req <= 1'b0;
transfer_done <= 1'b0;
case (state)
state_idle: begin
transfer_active <= 1'b0;
end
state_read: begin
bus_read_req <= 1'b1;
transfer_active <= 1'b1;
end
state_wait_read: begin
transfer_active <= 1'b1;
end
state_write: begin
bus_write_req <= 1'b1;
transfer_active <= 1'b1;
end
state_wait_write: begin
transfer_active <= 1'b1;
end
state_inc_addr: begin
transfer_active <= 1'b1;
end
state_done: begin
transfer_done <= 1'b1;
transfer_active <= 1'b0;
end
default: begin
transfer_active <= 1'b0;
end
endcase
end
end
endmodule
