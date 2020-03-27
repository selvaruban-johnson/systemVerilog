class scoreboard;

 packet pkt1,pkt2;
 
 mailbox #(packet) drv_sb;
 mailbox #(packet) mon_sb;

 function new (mailbox #(packet) drv_sb ,mailbox #(packet) mon_sb );

  this.drv_sb = drv_sb;
  this.mon_sb = mon_sb;

 endfunction

 reg [7:0] memory [0:7];
 
 task run();
  
  drv_sb.get(pkt1);
  mon_sb.get(pkt2);

   if (pkt1.we)
    memory[pkt1.address] =  pkt1.data_in;
  
  pkt1.data_out =  memory[pkt1.address]; 

   if (pkt1.we == pkt2.we && pkt1.address == pkt2.address && pkt1.data_in == pkt2.data_in && memory[pkt1.address] == memory[pkt2.address] && pkt2.data_out == pkt2.data_out)
   begin
      $display($time,"pkt1.we=%b,pkt1.adress=%d,pkt1.data_in=%d,memory[pkt1.address=%d]=%d,pkt1.data_out=%d",pkt1.we,pkt1.address,pkt1.data_in,pkt1.address,memory[pkt1.address],pkt1.data_out); 
      $display($time,"pkt2.we=%b,pkt2.adress=%d,pkt2.data_in=%d,memory[pkt2.address=%d]=%d,pkt2.data_out=%d",pkt2.we,pkt2.address,pkt2.data_in,pkt2.address,memory[pkt1.address],pkt2.data_out);
      $display("Hit!!");  
     end
   else
     begin
      $display($time,"pkt1.we=%b,pkt1.adress=%d,pkt1.data_in=%d,pkt1.data_out=%d",pkt1.we,pkt1.address,pkt1.data_in,pkt1.data_out); 
      $display($time,"pkt2.we=%b,pkt2.adress=%d,pkt2.data_in=%d,pkt2.data_out=%d",pkt2.we,pkt2.address,pkt2.data_in,pkt2.data_out);
      $display("Miss!!");  
     end
 
 endtask

endclass
  
