class env_generator;
env_packet pkt;
mailbox #(env_packet)gen_drv;

function new (mailbox #(env_packet)gen_drv);
this.gen_drv = gen_drv;
endfunction

task run();
pkt = new();
assert(pkt.randomize())
begin
	$display("randomization successful");
	gen_drv.put(pkt);
end
else
	$display("randomization failed");
endtask
endclass
