module AHB_Slave_1 #(
parameter MEM_WIDTH = 8,
parameter MEM_DEPTH = 1024
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
reg [MEM_WIDTH-1:0] memory [0:MEM_DEPTH-1];
reg [9:0] HADDR_Half;
reg [9:0] HADDR_Full_1;
reg [9:0] HADDR_Full_2;
reg [9:0] HADDR_Full_3;
reg [31:0] HADDR_reg;
reg HWRITE_reg;
reg [2:0] HSIZE_reg;
reg [1:0] HTRANS_reg;
reg [2:0] HBURST_reg;
reg [1:0] HSEL_reg;
always @(posedge HCLK or negedge HRESETn) begin
if (!HRESETn) begin
HREADYOUT <= 1'b1;
HRESP <= 1'b0;
HRDATA <= 32'h00000000;
end else if (HREADY) begin
if (HSEL_reg == 2'b00 && HWRITE_reg && (HTRANS_reg == 2'b10 || HTRANS_reg == 2'b11)) begin
if (HSIZE_reg == 3'b000) begin
memory[HADDR_reg[9:0]] <= HWDATA[7:0];
end else if (HSIZE_reg == 3'b001) begin
memory[HADDR_reg[9:0]] <= HWDATA[7:0];
memory[HADDR_Half] <= HWDATA[15:8];
end else if (HSIZE_reg == 3'b010) begin
memory[HADDR_reg[9:0]] <= HWDATA[7:0];
memory[HADDR_Full_1] <= HWDATA[15:8];
memory[HADDR_Full_2] <= HWDATA[23:16];
memory[HADDR_Full_3] <= HWDATA[31:24];
end
end else if (HSELx_slaves == 2'b00 && !HWRITE && (HTRANS == 2'b10 || HTRANS == 2'b11)) begin
if (HSIZE == 3'b000) begin
HRDATA <= {24'h0, memory[HADDR[9:0]]};
end else if (HSIZE == 3'b001) begin
HRDATA <= {16'h0, memory[HADDR[9:0] + 1], memory[HADDR[9:0]]};
end else if (HSIZE == 3'b010) begin
HRDATA <= {memory[HADDR[9:0] + 3], memory[HADDR[9:0] + 2], memory[HADDR[9:0] + 1], memory[HADDR[9:0]]};
end
end
end
end
always @(posedge HCLK or negedge HRESETn) begin
if (!HRESETn) begin
HADDR_reg <= 32'b0;
HWRITE_reg <= 1'b0;
HSIZE_reg <= 3'b0;
HBURST_reg <= 3'b0;
HTRANS_reg <= 2'b0;
HSEL_reg <= 2'b0;
end else if (HREADY) begin
HADDR_reg <= HADDR;
HWRITE_reg <= HWRITE;
HSIZE_reg <= HSIZE;
HBURST_reg <= HBURST;
HTRANS_reg <= HTRANS;
HSEL_reg <= HSELx_slaves;
end
end
always @(*) begin
if (HREADY) begin
HADDR_Half = HADDR_reg[9:0] + 1;
HADDR_Full_1 = HADDR_reg[9:0] + 1;
HADDR_Full_2 = HADDR_reg[9:0] + 2;
HADDR_Full_3 = HADDR_reg[9:0] + 3;
end else begin
HADDR_Half = 10'b0;
HADDR_Full_1 = 10'b0;
HADDR_Full_2 = 10'b0;
HADDR_Full_3 = 10'b0;
end
end
endmodule
