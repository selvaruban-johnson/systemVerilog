class env_driver1;
env_packet pkt;
mailbox #(env_packet)gen_drv_mod;
virtual ri_interface ri;
//virtual ri_interface ri;

function new (mailbox #(env_packet)gen_drv_mod,virtual ri_interface ri);
this.gen_drv_mod = gen_drv_mod;
this.ri = ri;
endfunction

task run ();
gen_drv_mod.get(pkt);
//ri.we = pkt.we;
ri.addr = pkt.addr;
ri.d_in = pkt.d_in;
endtask

endclass