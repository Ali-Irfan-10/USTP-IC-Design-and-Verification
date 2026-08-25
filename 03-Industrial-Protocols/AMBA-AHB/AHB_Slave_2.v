module AHB_Slave_2 #(
parameter MEM_WIDTH = 8,
parameter MEM_DEPTH = 64
)(
input wire HCLK,
input wire HRESETn,
input wire [31:0] HADDR,
input wire [31:0] HWDATA,
input wire [1:0] HSELx_slaves,
input wire HWRITE,
input wire [2:0] HSIZE,
input wire [1:0] HTRANS,
input wire [2:0] HBURST,
input wire HREADY,
output reg HREADYOUT,
output reg HRESP,
output reg [31:0] HRDATA
);
reg [MEM_WIDTH-1:0] memory_2 [0:MEM_DEPTH-1];
reg [31:0] HADDR_reg;
reg HWRITE_reg;
reg [2:0] HSIZE_reg;
reg [1:0] HTRANS_reg;
reg [2:0] HBURST_reg;
reg [1:0] HSEL_reg;
integer i;
always @(posedge HCLK or negedge HRESETn) begin
if (!HRESETn) begin
HRDATA <= 32'h0;
HREADYOUT <= 1'b1;
HRESP <= 1'b0;
for (i = 0; i < MEM_DEPTH; i = i + 1) begin
memory_2[i] <= 8'h00;
end
end else if (HREADY) begin
if (HSEL_reg == 2'b01 && HWRITE_reg && (HTRANS_reg == 2'b10 || HTRANS_reg == 2'b11)) begin
if (HSIZE_reg == 3'b000) begin
memory_2[HADDR_reg[5:0]] <= HWDATA[7:0];
end else if (HSIZE_reg == 3'b001) begin
memory_2[HADDR_reg[5:0]] <= HWDATA[7:0];
memory_2[HADDR_reg[5:0] + 1] <= HWDATA[15:8];
end else if (HSIZE_reg == 3'b010) begin
memory_2[HADDR_reg[5:0]] <= HWDATA[7:0];
memory_2[HADDR_reg[5:0] + 1] <= HWDATA[15:8];
memory_2[HADDR_reg[5:0] + 2] <= HWDATA[23:16];
memory_2[HADDR_reg[5:0] + 3] <= HWDATA[31:24];
end
end else if (HSELx_slaves == 2'b01 && !HWRITE && (HTRANS == 2'b10 || HTRANS == 2'b11)) begin
if (HSIZE == 3'b000) begin
HRDATA <= {24'h000000, memory_2[HADDR[5:0]]};
end else if (HSIZE == 3'b001) begin
HRDATA <= {16'h0000, memory_2[HADDR[5:0] + 1], memory_2[HADDR[5:0]]};
end else if (HSIZE == 3'b010) begin
HRDATA <= {memory_2[HADDR[5:0] + 3], memory_2[HADDR[5:0] + 2], memory_2[HADDR[5:0] + 1], memory_2[HADDR[5:0]]};
end
end
end
end
always @(posedge HCLK or negedge HRESETn) begin
if (!HRESETn) begin
HADDR_reg <= 32'b0;
HWRITE_reg <= 1'b0;
HSIZE_reg <= 3'b0;
HTRANS_reg <= 2'b0;
HBURST_reg <= 3'b0;
HSEL_reg <= 2'b0;
end else if (HREADY) begin
HADDR_reg <= HADDR;
HWRITE_reg <= HWRITE;
HSIZE_reg <= HSIZE;
HTRANS_reg <= HTRANS;
HBURST_reg <= HBURST;
HSEL_reg <= HSELx_slaves;
end
end
endmodule
