class env_coverage;
virtual i_interface i;

covergroup cg @(posedge i.clk);
//sram_we : coverpoint i.we;
sram_addr: coverpoint i.addr;
sram_d_in: coverpoint i.d_in{ignore_bins d_in1 = {16'h32};}
//sram_we_addr_cross : cross i.we,i.addr;
endgroup

function new (virtual i_interface i);
this.i=i;
cg = new();
endfunction

task sample();
cg.sample();
endtask
endclass