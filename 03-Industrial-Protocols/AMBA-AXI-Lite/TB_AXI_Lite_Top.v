`timescale 1ns / 1ps

module tb_axi_lite_top;
reg clk;
reg rst_n;
reg start_read;
reg start_write;
reg [31:0] addr;
reg [31:0] wr_data;
wire [31:0] rd_data;

axi_lite_top uut (
.clk(clk),
.rst_n(rst_n),
.start_read(start_read),
.start_write(start_write),
.addr(addr),
.wr_data(wr_data),
.rd_data(rd_data)
);

always #5 clk = ~clk;

initial begin
clk = 0;
rst_n = 0;
start_read = 0;
start_write = 0;
addr = 0;
wr_data = 0;

#20;
rst_n = 1;

#20;
@(posedge clk);
addr = 32'h00000004;
wr_data = 32'h5A5AA5A5;
start_write = 1;
@(posedge clk);
start_write = 0;

#100;
@(posedge clk);
addr = 32'h00000008;
wr_data = 32'hDEADBEEF;
start_write = 1;
@(posedge clk);
start_write = 0;

#100;
@(posedge clk);
addr = 32'h00000004;
start_read = 1;
@(posedge clk);
start_read = 0;

#100;
@(posedge clk);
addr = 32'h00000008;
start_read = 1;
@(posedge clk);
start_read = 0;

#100;
$finish;
end

endmodule
