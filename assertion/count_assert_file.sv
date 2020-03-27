`include "assertion_counter.sv"
module count_assert_file (clk,reset,count, t);
input clk,reset,t;
input [3:0]count;
property p1;
@(posedge clk)
disable iff(!reset)
(count < 15 |-> !t);
endproperty
property p2;
@(posedge clk)
disable iff(!reset)
(count == 15 |-> t);
endproperty
assert property (p1)
$display("PASS");
else
$error("FAIL!!!");
assert property (p2)
$display("PASS");
else
$error("FAIL!!!");
endmodule