module axi_lite_master (
input wire ACLK,
input wire ARESETN,
input wire START_READ,
input wire START_WRITE,
input wire [31:0] address,
input wire [31:0] W_data,
output reg [31:0] ARADDR,
output reg ARVALID,
input wire ARREADY,
input wire [31:0] RDATA,
input wire [1:0] RRESP,
input wire RVALID,
output reg RREADY,
output reg [31:0] AWADDR,
output reg AWVALID,
input wire AWREADY,
output reg [31:0] WDATA,
output reg [3:0] WSTRB,
output reg WVALID,
input wire WREADY,
input wire [1:0] BRESP,
input wire BVALID,
output reg BREADY
);

parameter IDLE = 3'b000;
parameter RADDR_CHANNEL = 3'b001;
parameter RDATA_CHANNEL = 3'b010;
parameter WRITE_CHANNEL = 3'b011;
parameter WRESP_CHANNEL = 3'b100;

reg [2:0] state, next_state;
reg [31:0] read_buf;

always @(posedge ACLK or negedge ARESETN) begin
if (!ARESETN)
state <= IDLE;
else
state <= next_state;
end

always @(*) begin
next_state = state;
case (state)
IDLE: begin
if (START_READ)
next_state = RADDR_CHANNEL;
else if (START_WRITE)
next_state = WRITE_CHANNEL;
else
next_state = IDLE;
end
RADDR_CHANNEL: begin
if (ARVALID && ARREADY)
next_state = RDATA_CHANNEL;
end
RDATA_CHANNEL: begin
if (RVALID && RREADY)
next_state = IDLE;
end
WRITE_CHANNEL: begin
if (AWVALID && AWREADY && WVALID && WREADY)
next_state = WRESP_CHANNEL;
end
WRESP_CHANNEL: begin
if (BVALID && BREADY)
next_state = IDLE;
end
default: next_state = IDLE;
endcase
end

always @(posedge ACLK or negedge ARESETN) begin
if (!ARESETN) begin
ARADDR <= 0;
ARVALID <= 0;
RREADY <= 0;
AWADDR <= 0;
AWVALID <= 0;
WDATA <= 0;
WSTRB <= 0;
WVALID <= 0;
BREADY <= 0;
read_buf <= 0;
end else begin
case (state)
IDLE: begin
ARVALID <= 0;
RREADY <= 0;
AWVALID <= 0;
WVALID <= 0;
BREADY <= 0;
if (START_READ) begin
ARADDR <= address;
ARVALID <= 1;
end else if (START_WRITE) begin
AWADDR <= address;
AWVALID <= 1;
WDATA <= W_data;
WSTRB <= 4'b1111;
WVALID <= 1;
end
end
RADDR_CHANNEL: begin
if (ARVALID && ARREADY) begin
ARVALID <= 0;
RREADY <= 1;
end
end
RDATA_CHANNEL: begin
if (RVALID && RREADY) begin
read_buf <= RDATA;
RREADY <= 0;
end
end
WRITE_CHANNEL: begin
if (AWVALID && AWREADY)
AWVALID <= 0;
if (WVALID && WREADY)
WVALID <= 0;
if (AWVALID && AWREADY && WVALID && WREADY)
BREADY <= 1;
end
WRESP_CHANNEL: begin
if (BVALID && BREADY)
BREADY <= 0;
end
default: begin
ARVALID <= 0;
RREADY <= 0;
AWVALID <= 0;
WVALID <= 0;
BREADY <= 0;
end
endcase
end
end

endmodule
