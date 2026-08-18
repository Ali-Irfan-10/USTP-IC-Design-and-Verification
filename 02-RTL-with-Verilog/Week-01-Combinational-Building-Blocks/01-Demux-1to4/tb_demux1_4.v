module tb_demux1_4;
reg d_in;
reg [1:0] sel;
wire y0;
wire y1;
wire y2;
wire y3;

demux1_4 uut(
.d_in(d_in),
.sel(sel),
.y0(y0),
.y1(y1),
.y2(y2),
.y3(y3)
);

initial begin
d_in=1;
sel=2'b00;
#10;
sel=2'b01;
#10;
sel=2'b10;
#10;
sel=2'b11;
#10;
d_in=0;
sel=2'b00;
#10;
$finish;

end
endmodule
