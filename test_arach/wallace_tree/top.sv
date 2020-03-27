`include "packet.sv"
`include "intf.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "coverage.sv"
`include "scoreboard.sv"
`include "environment.sv"
`include "test.sv"
`include "wallace_tree.sv"

module top();
intf i();
wallace_tree dut (.a(i.a),.b(i.b),.pro(i.pro));
test t1 (.i(i));
endmodule 