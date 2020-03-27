`include "packet.sv"
`include "generator.sv"
`include "interface.sv"
`include "driver.sv"
`include "env_adder_coverage.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "environment.sv"
`include "test.sv"
`include "alu_nbit.sv"
module top_alu();
intf i();
alu_nbit a1 (.a(i.a),.b(i.b),.s(i.s),.co(i.co),.sum(i.sum));
test t1 (.i(i));
endmodule 