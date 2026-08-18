module tb_comparator;
reg [1:0] a;
reg [1:0] b;
wire gt;
wire lt;
wire eq;

comparator uut(
.a(a),
.b(b),
.gt(gt),
.lt(lt),
.eq(eq)
);

initial begin
a=4'b0000;
b=4'b0000;
#10;
a=4'b0101;
b=4'b0011;
#10;
a=4'b0010;
b=4'b0110;
#10;
a=4'b1111;
b=4'b1111;
#10;
a=4'b1000;
b=4'b0001;
#10;
$finish;
end

endmodule
