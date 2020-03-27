class generator;
 
 packet pkt;
 mailbox #(packet) gen_drv;
 
 function new(mailbox #(packet) gen_drv);
  this.gen_drv = gen_drv;
 endfunction

 task run();
  
  pkt = new();
   assert(pkt.randomize())
    gen_drv.put(pkt);
   else
    $display("Randomization failed!!");
 endtask

endclass
 