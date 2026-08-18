module tb_modified_traffic_light_controller;
reg clk;
reg reset;
reg button;
reg ped_button;
wire red;
wire yellow;
wire green;
modified_traffic_light_controller uut (
.clk(clk),
.reset(reset),
.button(button),
.ped_button(ped_button),
.red(red),
.yellow(yellow),
.green(green)
);
always #5 clk = ~clk;
initial begin
clk = 0;
reset = 1;
button = 0;
ped_button = 0;
$monitor("Time=%0t | Reset=%b Button=%b Ped_Button=%b | Red=%b Yellow=%b Green=%b",
$time, reset, button, ped_button, red, yellow, green);
#10;
reset = 0;
button = 1; #20;
ped_button = 1; #10;
ped_button = 0; #30;
button = 1; #40;
$finish;
end
endmodule
