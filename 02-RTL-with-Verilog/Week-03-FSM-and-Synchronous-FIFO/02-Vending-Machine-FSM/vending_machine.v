module vending_machine (
input clk,
input reset,
input [1:0] coin,
output reg dispense,
output reg change
);
localparam S0 = 3'b000,
S5 = 3'b001,
S10 = 3'b010,
S15 = 3'b011,
S20 = 3'b100;
reg [2:0] current_state;
reg [2:0] next_state;

always @(posedge clk or posedge reset) begin
if (reset)
current_state <= S0;
else
current_state <= next_state;
end

always @(*) begin
case (current_state)
S0: begin
if (coin == 2'b01)
next_state = S5;
else if (coin == 2'b10)
next_state = S10;
else
next_state = S0;
end
S5: begin
if (coin == 2'b01)
next_state = S10;
else if (coin == 2'b10)
next_state = S15;
else
next_state = S5;
end
S10: begin
if (coin == 2'b01)
next_state = S15;
else if (coin == 2'b10)
next_state = S20;
else
next_state = S10;
end
S15: begin
if (coin == 2'b01)
next_state = S20;
else if (coin == 2'b10)
next_state = S20;
else
next_state = S15;
end
S20: next_state = S0;
default: next_state = S0;
endcase
end

always @(*) begin
dispense = 1'b0;
change = 1'b0;
case (current_state)
S15: begin
if (coin == 2'b10) begin
dispense = 1'b1;
change = 1'b1;
end
end
S20: begin
dispense = 1'b1;
end
endcase
end
endmodule
