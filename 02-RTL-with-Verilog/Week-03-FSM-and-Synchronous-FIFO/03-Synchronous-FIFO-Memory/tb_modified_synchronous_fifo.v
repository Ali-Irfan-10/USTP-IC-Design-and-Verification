module tb_modified_synchronous_fifo;
reg clk;
reg reset;
reg write_enable;
reg read_enable;
reg [1:0] data_in;
wire [1:0] data_out;
wire full;
wire empty;
wire almost_full;
wire almost_empty;

modified_synchronous_fifo uut (
.clk(clk),
.reset(reset),
.write_enable(write_enable),
.read_enable(read_enable),
.data_in(data_in),
.data_out(data_out),
.full(full),
.empty(empty),
.almost_full(almost_full),
.almost_empty(almost_empty)
);

always #5 clk = ~clk;
initial begin
clk = 0;
reset = 1;
write_enable = 0;
read_enable = 0;
data_in = 2'd0;
$monitor("Time=%0t | WE=%b RE=%b DataIn=%d DataOut=%d | Full=%b AF=%b AE=%b Empty=%b",
$time, write_enable, read_enable, data_in, data_out, full, almost_full, almost_empty, empty);
#10;
reset = 0;
write_enable = 1;
data_in = 2'd1; #10;
data_in = 2'd2; #10;
data_in = 2'd3; #10;
data_in = 2'd0; #10;
write_enable = 0;
read_enable = 1; #10;
read_enable = 1; #10;
read_enable = 1; #10;
read_enable = 1; #10;
read_enable = 0; #20;
$finish;
end
endmodule