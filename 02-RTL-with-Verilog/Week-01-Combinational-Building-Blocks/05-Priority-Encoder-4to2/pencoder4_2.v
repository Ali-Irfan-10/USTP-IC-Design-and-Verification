module pencoder4_2(
input [3:0] in,
output reg [1:0] y,
output reg v
);

always@(*) begin
v=1'b1;
if(in[3]==1'b1)
y=2'b11;
else if(in[2]==1'b1)
y=2'b10;
else if(in[1]==1'b1)
y=2'b01;
else if(in[0]==1'b1)
y=2'b00;
else begin
y=2'b00;
v=1'b0;
end
end

endmodule
