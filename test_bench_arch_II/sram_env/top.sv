`include "spram_header.svh"

module top();
 
 reg clk;
 
 always #5 clk = ~clk;
 
 initial
  begin 
   clk = 1'b0;
  end
 
 intf i(.clk(clk));

 single_port_asyn_rd_ram spr1 (.clk(clk),.we(i.we),.data_in(i.data_in),.address(i.address),.data_out(i.data_out)); 

 test t(.i(i)); 

endmodule

