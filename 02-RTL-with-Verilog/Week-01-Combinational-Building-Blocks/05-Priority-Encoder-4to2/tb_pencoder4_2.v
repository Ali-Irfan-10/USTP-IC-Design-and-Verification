module tb_pencoder4_2;
reg [3:0] in;
wire [1:0] y;
wire v;

pencoder4_2 uut(
.in(in),
.y(y),
.v(v)
);

initial begin
in=4'b0000;
#10;
in=4'b0001;
#10;
in=4'b0011;
#10;
in=4'b0101;
#10;
in=4'b1111;
#10;
in=4'b0010;
#10;
$finish;
end

endmodule
