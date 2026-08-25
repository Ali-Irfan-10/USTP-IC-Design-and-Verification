module tb_handshake_protocol;
reg clk;
reg read_write;
reg valid_m;
reg ready_s;
reg ready_m;
reg [1:0] sel;
reg [7:0] data_in;
wire [7:0] data_out;
wire valid_s;

handshake_protocol uut(
.clk(clk),
.read_write(read_write),
.valid_m(valid_m),
.ready_s(ready_s),
.ready_m(ready_m),
.sel(sel),
.data_in(data_in),
.data_out(data_out),
.valid_s(valid_s)
);

always #5 clk = ~clk;

initial begin
clk = 0;
read_write = 0;
valid_m = 0;
ready_s = 0;
ready_m = 0;
sel = 2'b00;
data_in = 8'h00;
#10;
read_write = 1;
valid_m = 1;
ready_s = 1;
sel = 2'b00;
data_in = 8'hAA;
#10;
sel = 2'b01;
data_in = 8'hBB;
#10;
read_write = 0;
ready_m = 1;
sel = 2'b00;
#10;
sel = 2'b01;
#10;
$finish;
end

endmodule
