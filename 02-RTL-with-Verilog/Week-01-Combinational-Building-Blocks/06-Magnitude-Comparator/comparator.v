module comparator(
input [1:0] a,
input [1:0] b,
output reg gt,
output reg lt,
output reg eq
);

always@(*)
begin
gt=0;
lt=0;
eq=0;
if(a>b)
gt=1;
else if(a<b)
lt=1;
else
eq=1;
end

endmodule
