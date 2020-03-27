`include "env_adder_packet.sv"
`include "env_adder_generator.sv"
`include "env_adder_driver.sv"
`include "env_adder_intf.sv"
`include "env_adder_coverage.sv"
`include "env_adder.sv"
`include "env_adder_monitor.sv"
`include "env_adder_scoreboard.sv"
`include "env_adder_environment.sv"
`include "env_adder_test.sv"
module env_adder_top;
intf i();
env_adder aa(.a(i.a),.b(i.b),.c(i.c),.s(i.s));
env_adder_test t(i);
endmodule