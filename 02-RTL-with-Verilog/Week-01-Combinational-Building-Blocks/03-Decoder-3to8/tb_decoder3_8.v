module tb_decoder3_8;
reg [2:0] in;
reg en;
wire [7:0] y;

decoder3_8 uut(
.in(in),
.en(en),
.y(y)
);

initial begin
en=0;
in=3'b000;
#10;
en=1;
in=3'b000;
#10;
in=3'b001;
#10;
in=3'b010;
#10;
in=3'b011;
#10;
in=3'b100;
#10;
in=3'b101;
#10;
in=3'b110;
#10;
in=3'b111;
#10;
$finish;
end

endmodule
