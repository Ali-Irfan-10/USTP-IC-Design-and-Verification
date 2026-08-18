module tb_vending_machine;
reg clk;
reg reset;
reg [1:0] coin;
wire dispense;
wire change;

vending_machine uut (
.clk(clk),
.reset(reset),
.coin(coin),
.dispense(dispense),
.change(change)
);

always #5 clk = ~clk;
initial begin
clk = 0;
reset = 1;
coin = 2'b00;
$monitor("Time=%0t | Reset=%b Coin=%b | State=%d Dispense=%b Change=%b",
$time, reset, coin, uut.current_state, dispense, change);
#10;
reset = 0;
coin = 2'b01; #10;
coin = 2'b01; #10;
coin = 2'b01; #10;
coin = 2'b01; #10;
coin = 2'b00; #10;
coin = 2'b10; #10;
coin = 2'b10; #10;
coin = 2'b00; #10;
coin = 2'b01; #10;
coin = 2'b10; #10;
coin = 2'b10; #20;
$finish;
end
endmodule
