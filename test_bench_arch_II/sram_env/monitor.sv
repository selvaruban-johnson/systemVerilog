class monitor;

 packet pkt = new();
 
 mailbox #(packet) mon_sb;
 
 virtual intf i;

 function new (mailbox #(packet) mon_sb,virtual intf i);
  
  this.mon_sb = mon_sb;
  this.i = i;

 endfunction

 task run (); 

 @(posedge i.clk);
  
  pkt.we = i.we;
  pkt.data_in = i.data_in;
  pkt.address = i.address;
  pkt.data_out = i.data_out;
  
  mon_sb.put(pkt);

 endtask

endclass 

