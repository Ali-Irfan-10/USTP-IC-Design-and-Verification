module AHB_MUX (
input wire HCLK,
input wire HRESETn,
input wire HRESP_Slave_1,
input wire HREADYOUT_1,
input wire [31:0] HRDATA_Slave_1,
input wire HRESP_Slave_2,
input wire HREADYOUT_2,
input wire [31:0] HRDATA_Slave_2,
input wire [1:0] HSELx_Mux,
output reg [31:0] HRDATA,
output reg HREADY,
output reg HRESP
);
reg [1:0] err_state;
always @(posedge HCLK or negedge HRESETn) begin
if (!HRESETn)
err_state <= 2'b00;
else begin
case (err_state)
2'b00: if (HSELx_Mux >= 2'b10) err_state <= 2'b01;
2'b01: err_state <= 2'b10;
2'b10: err_state <= 2'b00;
default: err_state <= 2'b00;
endcase
end
end
always @(*) begin
case (HSELx_Mux)
2'b00: begin
HRDATA = HRDATA_Slave_1;
HREADY = HREADYOUT_1;
HRESP = HRESP_Slave_1;
end
2'b01: begin
HRDATA = HRDATA_Slave_2;
HREADY = HREADYOUT_2;
HRESP = HRESP_Slave_2;
end
default: begin
HRDATA = 32'h00000000;
if (err_state == 2'b01) begin
HREADY = 1'b0;
HRESP = 1'b1;
end else if (err_state == 2'b10) begin
HREADY = 1'b1;
HRESP = 1'b1;
end else begin
HREADY = 1'b1;
HRESP = 1'b0;
end
end
endcase
end
endmodule
