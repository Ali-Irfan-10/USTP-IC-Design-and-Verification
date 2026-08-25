module axi_lite_top (
input wire clk,
input wire rst_n,
input wire start_read,
input wire start_write,
input wire [31:0] addr,
input wire [31:0] wr_data,
output wire [31:0] rd_data
);

wire [31:0] araddr_w;
wire arvalid_w;
wire arready_w;
wire [31:0] rdata_w;
wire [1:0] rresp_w;
wire rvalid_w;
wire rready_w;
wire [31:0] awaddr_w;
wire awvalid_w;
wire awready_w;
wire [31:0] wdata_w;
wire [3:0] wstrb_w;
wire wvalid_w;
wire wready_w;
wire [1:0] bresp_w;
wire bvalid_w;
wire bready_w;

axi_lite_master u_master (
.ACLK(clk),
.ARESETN(rst_n),
.START_READ(start_read),
.START_WRITE(start_write),
.address(addr),
.W_data(wr_data),
.ARADDR(araddr_w),
.ARVALID(arvalid_w),
.ARREADY(arready_w),
.RDATA(rdata_w),
.RRESP(rresp_w),
.RVALID(rvalid_w),
.RREADY(rready_w),
.AWADDR(awaddr_w),
.AWVALID(awvalid_w),
.AWREADY(awready_w),
.WDATA(wdata_w),
.WSTRB(wstrb_w),
.WVALID(wvalid_w),
.WREADY(wready_w),
.BRESP(bresp_w),
.BVALID(bvalid_w),
.BREADY(bready_w)
);

axi_lite_slave u_slave (
.ACLK(clk),
.ARESETN(rst_n),
.ARADDR(araddr_w),
.ARVALID(arvalid_w),
.ARREADY(arready_w),
.RDATA(rdata_w),
.RRESP(rresp_w),
.RVALID(rvalid_w),
.RREADY(rready_w),
.AWADDR(awaddr_w),
.AWVALID(awvalid_w),
.AWREADY(awready_w),
.WDATA(wdata_w),
.WSTRB(wstrb_w),
.WVALID(wvalid_w),
.WREADY(wready_w),
.BRESP(bresp_w),
.BVALID(bvalid_w),
.BREADY(bready_w)
);

assign rd_data = rdata_w;

endmodule
