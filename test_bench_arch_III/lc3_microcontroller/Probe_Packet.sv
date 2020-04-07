class Probe_Packet;

	logic [15 : 0] taddr;
	logic enable_updatePC,enable_fetch,br_taken;
	logic instrmem_rd;
	logic [15 : 0] pc,npc;


	function void pre_randomize();
		
	endfunction

	function void post_randomize();
		
	endfunction

endclass