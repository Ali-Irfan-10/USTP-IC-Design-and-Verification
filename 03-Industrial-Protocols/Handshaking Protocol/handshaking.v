module handshake_protocol(
input clk,
input read_write,
input valid_m,
input ready_s,
input ready_m,
input [1:0] sel,
input [7:0] data_in,
output reg [7:0] data_out,
output valid_s
);

reg [7:0] reg0;
reg [7:0] reg1;
reg [7:0] reg2;
reg [7:0] reg3;

assign valid_s = (~read_write) & ready_m;

always@(posedge clk)
begin
if(read_write & valid_m & ready_s)
begin
if(sel==2'b00) reg0 <= data_in;
if(sel==2'b01) reg1 <= data_in;
if(sel==2'b10) reg2 <= data_in;
if(sel==2'b11) reg3 <= data_in;
end
end

always@(*)
begin
if((~read_write) & ready_m)
begin
case(sel)
2'b00: data_out = reg0;
2'b01: data_out = reg1;
2'b10: data_out = reg2;
2'b11: data_out = reg3;
default: data_out = 8'h00;
endcase
end
else
data_out = 8'h00;
end

endmodule
