class env_monitor;
env_packet pkt1,pkt2;
mailbox #(env_packet)mon_sb1;
mailbox #(env_packet)mon_sb2;
virtual i_interface i;
virtual ri_interface ri;

function new (mailbox #(env_packet)mon_sb1,mailbox #(env_packet)mon_sb2,virtual i_interface i,virtual ri_interface r1);
this.mon_sb1 = mon_sb1;
this.mon_sb2 = mon_sb2;
this.i= i;
this.ri = ri;
endfunction

task run;
pkt1 = new();
pkt2 = new();

//pkt1.we = i.we;
pkt1.addr = i.addr;
pkt1.d_in = i.d_in;
pkt1.d_out = i.d_out;

//pkt2.we = ri.we;
pkt2.addr = ri.addr;
pkt2.d_in = ri.d_in;
pkt2.d_out = ri.d_out;

$display($time," pkt1.addr=%0b pkt1.d_in=%0b pkt1.d_out=%0b",pkt1.addr,pkt1.d_in,pkt1.d_out);
$display($time," pkt2.addr=%0b pkt2.d_in=%0b pkt2.d_out=%0b",pkt2.addr,pkt2.d_in,pkt2.d_out);

mon_sb1.put(pkt1);
mon_sb2.put(pkt2);

endtask
endclass 