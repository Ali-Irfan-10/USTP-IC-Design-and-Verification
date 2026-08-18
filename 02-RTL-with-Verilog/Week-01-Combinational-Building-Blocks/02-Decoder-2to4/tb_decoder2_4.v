module tb_decoder2_4;
reg [1:0] in;
reg en;
wire [3:0] y;

decoder2_4 uut(
.in(in),
.en(en),
.y(y)
);

initial begin
en=0;
in=2'b00;
#10;
en=1;
in=2'b00;
#10;
in=2'b01;
#10;
in=2'b10;
#10;
in=2'b11;
#10;
en=0;
#10;
$finish;
end

endmodule
