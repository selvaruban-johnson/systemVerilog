class scoreboard;
packet pkt1,pkt2;
mailbox #(packet)drv_sb;
mailbox #(packet)mon_sb;
function new(mailbox #(packet)drv_sb,mailbox #(packet)mon_sb);
this.drv_sb=drv_sb;
this.mon_sb=mon_sb;
endfunction

task run();
drv_sb.get(pkt1);
mon_sb.get(pkt2);
	pkt1.pro = pkt1.a*pkt1.b;
	if(pkt1.pro==pkt2.pro)
		$display("HIT");
	else 
		$display("MISS");
endtask
endclass
