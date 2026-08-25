module axi_lite_slave (
input wire ACLK,
input wire ARESETN,
input wire [31:0] ARADDR,
input wire ARVALID,
output reg ARREADY,
output reg [31:0] RDATA,
output reg [1:0] RRESP,
output reg RVALID,
input wire RREADY,
input wire [31:0] AWADDR,
input wire AWVALID,
output reg AWREADY,
input wire [31:0] WDATA,
input wire [3:0] WSTRB,
input wire WVALID,
output reg WREADY,
output reg [1:0] BRESP,
output reg BVALID,
input wire BREADY
);

reg [31:0] memory [0:255];

parameter IDLE = 3'b000;
parameter RADDR_CHANNEL = 3'b001;
parameter RDATA_CHANNEL = 3'b010;
parameter WRITE_CHANNEL = 3'b011;
parameter WRESP_CHANNEL = 3'b100;

reg [2:0] state, next_state;
reg [31:0] raddr_reg;
reg [31:0] waddr_reg;

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
if (AWVALID && WVALID)
next_state = WRITE_CHANNEL;
else if (ARVALID)
next_state = RADDR_CHANNEL;
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

integer k;
always @(posedge ACLK or negedge ARESETN) begin
if (!ARESETN) begin
ARREADY <= 0;
RDATA <= 0;
RRESP <= 2'b00;
RVALID <= 0;
AWREADY <= 0;
WREADY <= 0;
BRESP <= 2'b00;
BVALID <= 0;
raddr_reg <= 0;
waddr_reg <= 0;
for (k = 0; k < 256; k = k + 1)
memory[k] <= 0;
end else begin
case (state)
IDLE: begin
RVALID <= 0;
BVALID <= 0;
ARREADY <= 0;
AWREADY <= 0;
WREADY <= 0;
if (AWVALID && WVALID) begin
AWREADY <= 1;
WREADY <= 1;
waddr_reg <= AWADDR;
end else if (ARVALID) begin
ARREADY <= 1;
raddr_reg <= ARADDR;
end
end
RADDR_CHANNEL: begin
if (ARVALID && ARREADY) begin
ARREADY <= 0;
RVALID <= 1;
RRESP <= 2'b00;
RDATA <= memory[raddr_reg[7:0]];
end
end
RDATA_CHANNEL: begin
if (RVALID && RREADY) begin
RVALID <= 0;
end
end
WRITE_CHANNEL: begin
if (AWVALID && AWREADY && WVALID && WREADY) begin
AWREADY <= 0;
WREADY <= 0;
if (WSTRB[0]) memory[waddr_reg[7:0]][7:0] <= WDATA[7:0];
if (WSTRB[1]) memory[waddr_reg[7:0]][15:8] <= WDATA[15:8];
if (WSTRB[2]) memory[waddr_reg[7:0]][23:16] <= WDATA[23:16];
if (WSTRB[3]) memory[waddr_reg[7:0]][31:24] <= WDATA[31:24];
BVALID <= 1;
BRESP <= 2'b00;
end
end
WRESP_CHANNEL: begin
if (BVALID && BREADY) begin
BVALID <= 0;
end
end
default: begin
ARREADY <= 0;
RVALID <= 0;
AWREADY <= 0;
WREADY <= 0;
BVALID <= 0;
end
endcase
end
end

endmodule
