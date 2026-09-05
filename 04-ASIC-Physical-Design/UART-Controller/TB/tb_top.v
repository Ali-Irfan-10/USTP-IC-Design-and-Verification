`timescale 1ns / 1ps
module tb_top;
reg clk;
reg rst;
reg send_btn;
reg [7:0] sw;
wire [7:0] led;
wire tx_pin;
wire rx_pin;
assign rx_pin = tx_pin;
top_module uut (
.clk(clk),
.rst(rst),
.send_btn(send_btn),
.sw(sw),
.led(led),
.tx_pin(tx_pin),
.rx_pin(rx_pin)
);
always #5 clk = ~clk;
initial begin
clk = 0;
rst = 1;
send_btn = 0;
sw = 8'b0000_0000;
#100;
rst = 0;
#100;
sw = 8'b1010_0101;
send_btn = 1;
#100;
send_btn = 0;
#2000;
sw = 8'b1100_1100;
send_btn = 1;
#100;
send_btn = 0;
#2000;
$finish;
end
endmodule
