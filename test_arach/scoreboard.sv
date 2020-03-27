//scoreboard 
class scoreboard;
packet pkt1,pkt2;
mailbox #(packet)drv_sb;
mailbox #(packet)mon_sb;
function new(mailbox #(packet)drv_sb,mailbox #(packet)mon_sb);
	this.drv_sb = drv_sb;
	this.mon_sb = mon_sb;
endfunction
task run();
	drv_sb.get(pkt1);
	mon_sb.get(pkt2);
	//dummay logic
	case(pkt1.s)
	3'b000:{pkt1.co,pkt1.sum}=pkt1.a+pkt1.b;
	3'b001:{pkt1.co,pkt1.sum}=pkt1.a-pkt1.b;
	3'b010:{pkt1.co,pkt1.sum}=pkt1.a+1'b1;
	3'b011:{pkt1.co,pkt1.sum}=pkt1.b-1'b1;
	3'b100:{pkt1.co,pkt1.sum}={1'b0,pkt1.a&pkt1.b};
	3'b101:{pkt1.co,pkt1.sum}={1'b0,pkt1.a|pkt1.b};
	3'b110:{pkt1.co,pkt1.sum}={1'b0,pkt1.a^pkt1.b};
	default:{pkt1.co,pkt1.sum}={1'b0,~pkt1.a};
	//default :{pkt1.co,pkt1.sum}=5'bx;
	endcase
	assert(pkt1.co==pkt2.co&&pkt1.sum==pkt2.sum)
		$display("hit");
	else
		$display("miss");
endtask
endclass
