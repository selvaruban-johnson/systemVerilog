class monitor;
packet pkt;
mailbox #(packet)mon_sb;
virtual intf i;

function new (mailbox #(packet)mon_sb,virtual intf i);
this.mon_sb = mon_sb;
this.i= i;
endfunction

task run();
pkt = new();
pkt.a=i.a;
pkt.b=i.b;
pkt.pro=i.pro;
mon_sb.put(pkt);
endtask
endclass
