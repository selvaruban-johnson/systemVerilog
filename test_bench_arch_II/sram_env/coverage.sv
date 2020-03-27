class coverage;

virtual intf i;

covergroup cg @(posedge i.clk);
WE: coverpoint i.we{bins w1 = {[1:0]};}
address : coverpoint i.address {bins b1 = {[7:0]};}
data_in :coverpoint i.data_in;
data_out : coverpoint i.data_out;
crosss: cross i.we,i.address;
endgroup 

function new (virtual intf i);
this.i=i;
cg=new();
endfunction

task sample();
cg.sample();
endtask
endclass 