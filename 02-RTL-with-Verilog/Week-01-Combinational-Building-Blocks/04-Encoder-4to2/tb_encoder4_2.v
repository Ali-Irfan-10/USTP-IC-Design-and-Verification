module tb_encoder4_2;
reg [3:0] in;
wire [1:0] y;

encoder4_2 uut(
.in(in),
.y(y)
);

initial begin
in=4'b0001;
#10;
in=4'b0010;
#10;
in=4'b0100;
#10;
in=4'b1000;
#10;
in=4'b0000;
#10;
$finish;
end

endmodule
