`include "assertion_counter.sv"
`include "count_assert_file.sv"
module assertion_counter_tb();
logic clk,reset,t;
logic [3:0]count;
assertion_counter c1 (clk,reset,count,t);
bind assertion_counter: c1 count_assert_file c_a(clk,reset,count,t);
always #5 clk = ~clk;
initial
begin
clk = 0;
reset = 0;
$monitor("count=%b\tt=%b",count,t);
#25 reset = 1;
end
endmodule