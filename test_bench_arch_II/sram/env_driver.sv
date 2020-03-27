class env_driver;
env_packet pkt;
mailbox #(env_packet)gen_drv;
virtual i_interface i;
virtual ri_interface ri;

function new (mailbox #(env_packet)gen_drv,virtual i_interface i,virtual ri_interface ri);
this.gen_drv = gen_drv;
this.i = i;
this.ri=ri;
endfunction

task run ();
gen_drv.get(pkt);
//i.we = pkt.we;
i.addr = pkt.addr;
i.d_in = pkt.d_in;
ri.addr = pkt.addr;
ri.d_in = pkt.d_in;
endtask

endclass