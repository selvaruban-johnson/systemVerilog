`include "env_packet.sv"
`include "i_interface.sv"
`include "ri_interface.sv"
`include "env_generator.sv"
`include "env_driver.sv"
//`include "env_driver1.sv"
`include "env_monitor.sv";
`include "env_scoreboard.sv"
`include "env_coverage.sv"
`include "env_environment.sv"
`include "env_test.sv"
`include "sp_ram8x16.v"
`include "sp_ram8x16_dummy.v"

module top_sram();
bit clk,we;

//Clock generation
initial
begin 
clk = 1'b0;
forever
#5 clk = ~clk;
end

initial 
begin
we=1'b1;
#10;
we=1'b0;
#50;
we=1'b1;
#10;
we=1'b0;
end


i_interface i(clk,we);
ri_interface ri (clk,we);
env_test t (i,ri);


sp_ram8x16 dut (.clk(clk),.addr(i.addr),.d_in(i.d_in),.d_out(i.d_out),.we(we));

sp_ram8x16_dummy  dummy (.clk(clk),.addr(ri.addr),.d_in(ri.d_in),.d_out(ri.d_out),.we(we));

endmodule 