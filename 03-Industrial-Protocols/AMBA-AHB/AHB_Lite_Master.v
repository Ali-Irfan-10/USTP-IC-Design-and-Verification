module AHB_Master (
input wire HCLK,
input wire HRESETn,
input wire [31:0] PADDR,
input wire [31:0] PWDATA,
input wire PWRITE,
input wire [2:0] PSIZE,
input wire [1:0] PTRANS,
input wire [2:0] PBURST,
input wire HREADY,
input wire HRESP,
input wire [31:0] HRDATA,
output reg [31:0] HADDR,
output reg [31:0] HWDATA,
output reg HWRITE,
output reg [2:0] HSIZE,
output reg [1:0] HTRANS,
output reg [2:0] HBURST,
output reg PDONE
);
localparam IDLE = 2'b00;
localparam BUSY = 2'b01;
localparam NONSEQ = 2'b10;
localparam SEQ = 2'b11;
reg [1:0] cs, ns;
reg [31:0] HWDATA_reg;
always @(posedge HCLK or negedge HRESETn) begin
if (!HRESETn)
cs <= IDLE;
else if (HREADY)
cs <= ns;
end
always @(*) begin
ns = cs;
case (cs)
IDLE: begin
if (PTRANS == 2'b10)
ns = NONSEQ;
else
ns = IDLE;
end
BUSY: begin
if (PTRANS == 2'b11)
ns = SEQ;
else if (PTRANS == 2'b10)
ns = NONSEQ;
else if (PTRANS == 2'b00)
ns = IDLE;
else
ns = BUSY;
end
NONSEQ: begin
if (PTRANS == 2'b11)
ns = SEQ;
else if (PTRANS == 2'b00)
ns = IDLE;
else if (PTRANS == 2'b10 && PBURST == 3'b000)
ns = NONSEQ;
else
ns = SEQ;
end
SEQ: begin
if (PTRANS == 2'b00)
ns = IDLE;
else if (PTRANS == 2'b10)
ns = NONSEQ;
else
ns = SEQ;
end
endcase
end
always @(posedge HCLK or negedge HRESETn) begin
if (!HRESETn) begin
HADDR <= 32'd0;
HWDATA_reg <= 32'd0;
HWRITE <= 1'b0;
HSIZE <= 3'b000;
HTRANS <= 2'b00;
HBURST <= 3'b000;
end else if (HREADY) begin
case (cs)
IDLE: begin
HADDR <= 32'd0;
HWDATA_reg <= 32'd0;
HWRITE <= 1'b0;
HSIZE <= 3'b000;
HTRANS <= 2'b00;
HBURST <= 3'b000;
end
BUSY: begin
HADDR <= PADDR;
HWDATA_reg <= PWDATA;
HWRITE <= PWRITE;
HSIZE <= PSIZE;
HTRANS <= PTRANS;
HBURST <= PBURST;
end
NONSEQ: begin
HADDR <= PADDR;
HWDATA_reg <= PWDATA;
HWRITE <= PWRITE;
HSIZE <= PSIZE;
HTRANS <= PTRANS;
HBURST <= PBURST;
end
SEQ: begin
if ((PBURST == 3'b001 || PBURST == 3'b011) && PSIZE == 3'b000) begin
HADDR <= HADDR + 1;
HWDATA_reg <= {24'h000000, PWDATA[7:0]};
HWRITE <= PWRITE;
HSIZE <= PSIZE;
HTRANS <= PTRANS;
HBURST <= PBURST;
end else if ((PBURST == 3'b001 || PBURST == 3'b011) && PSIZE == 3'b001) begin
HADDR <= HADDR + 2;
HWDATA_reg <= {16'h0000, PWDATA[15:0]};
HWRITE <= PWRITE;
HSIZE <= PSIZE;
HTRANS <= PTRANS;
HBURST <= PBURST;
end else if ((PBURST == 3'b001 || PBURST == 3'b011) && PSIZE == 3'b010) begin
HADDR <= HADDR + 4;
HWDATA_reg <= PWDATA;
HWRITE <= PWRITE;
HSIZE <= PSIZE;
HTRANS <= PTRANS;
HBURST <= PBURST;
end else if (PBURST == 3'b000) begin
HADDR <= PADDR;
HWDATA_reg <= PWDATA;
HWRITE <= PWRITE;
HSIZE <= PSIZE;
HTRANS <= PTRANS;
HBURST <= PBURST;
end
end
endcase
end
end
always @(posedge HCLK or negedge HRESETn) begin
if (!HRESETn)
HWDATA <= 32'd0;
else if (HREADY)
HWDATA <= HWDATA_reg;
end
always @(*) begin
if ((cs == NONSEQ || cs == SEQ) && (ns == IDLE))
PDONE = 1'b1;
else
PDONE = 1'b0;
end
endmodule