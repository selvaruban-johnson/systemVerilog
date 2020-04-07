interface Probe_Intf
	(
		input bit clock,reset,
		input logic [15 : 0] pc,npc,taddr,
		input logic enable_updatePC,enable_fetch,br_taken,instrmem_rd
	);

clocking cb_Probe @(posedge clock);
	default input #1 output #0;

	inout taddr;
	inout enable_updatePC,enable_fetch,br_taken;
	inout instrmem_rd;
	inout pc,npc;

endclocking

endinterface