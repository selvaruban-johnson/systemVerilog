//generator

class generator;
packet pkt = new();
mailbox #(packet)gen_drv;
function new (mailbox #(packet)gen_drv);
	this.gen_drv = gen_drv;
endfunction

task run();
	assert(pkt.randomize())
		gen_drv.put(pkt);
	else
		$display ("randomization failed");
endtask
endclass
