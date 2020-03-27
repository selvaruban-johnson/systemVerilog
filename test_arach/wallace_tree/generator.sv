class generator;
packet pkt;
mailbox #(packet)gen_drv;

function new (mailbox #(packet)gen_drv);
this.gen_drv=gen_drv;
endfunction

task run ();
pkt = new();

assert(pkt.randomize)
begin
	$display("randomization success");
	gen_drv.put(pkt);
end
else
	$display("randomization failed");

endtask
endclass 