module modified_traffic_light_controller (
input clk,
input reset,
input button,
input ped_button,
output reg red,
output reg yellow,
output reg green
);
localparam RED_STATE = 2'b00,
GREEN_STATE = 2'b01,
YELLOW_STATE = 2'b10,
PED_STATE = 2'b11;
reg [1:0] current_state;
reg [1:0] next_state;
reg ped_request;
always @(posedge clk) begin
if (reset) begin
current_state <= RED_STATE;
ped_request <= 1'b0;
end
else begin
if (ped_button)
ped_request <= 1'b1;
if (button) begin
current_state <= next_state;
if (current_state == PED_STATE)
ped_request <= 1'b0;
end
end
end
always @(*) begin
case (current_state)
RED_STATE: begin
if (ped_request)
next_state = PED_STATE;
else
next_state = GREEN_STATE;
end
GREEN_STATE:
next_state = YELLOW_STATE;
YELLOW_STATE:
next_state = RED_STATE;
PED_STATE:
next_state = GREEN_STATE;
default:
next_state = RED_STATE;
endcase
end
always @(*) begin
red = 1'b0;
yellow = 1'b0;
green = 1'b0;
case (current_state)
RED_STATE:
red = 1'b1;
GREEN_STATE:
green = 1'b1;
YELLOW_STATE:
yellow = 1'b1;
PED_STATE: begin
red = 1'b1;
green = 1'b1;
end
endcase
end
endmodule
