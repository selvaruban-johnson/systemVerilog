class LC3_Scoreboard;

	Probe_Packet probePkt;
	
	mailbox #(Probe_Packet) mb_mon_scb;

	logic [15 : 0] scb_taddr;
	logic scb_enable_updatePC,scb_enable_fetch,scb_br_taken;
	logic scb_instrmem_rd;
	logic [15 : 0] scb_pc,scb_npc;

	function new(mailbox #(Probe_Packet) mb_mon_scb);
		this.mb_mon_scb = mb_mon_scb;
	endfunction

	task run();

		$display("SCOREBOARD OUTPUT");

		probePkt = new();
		mb_mon_scb.get(probePkt);

		scb_taddr = probePkt.taddr;
		scb_enable_updatePC = probePkt.enable_updatePC;
		scb_enable_fetch = probePkt.enable_fetch;
		scb_br_taken = probePkt.br_taken;

		if(scb_enable_fetch == 1'b1)
			scb_instrmem_rd = 1'b1;
		else
			scb_instrmem_rd = 1'bz;	
		

		if(scb_enable_updatePC == 1'b1)
			if(scb_br_taken == 1'b1)
			begin
				scb_pc = scb_taddr;
				scb_npc = scb_pc + 1;
			end
			else
			begin
				scb_pc = scb_npc;
				scb_npc = scb_pc + 1;
			end

		else
		begin
			scb_pc = scb_pc;
			scb_npc = scb_pc + 1;
		end


		assert(probePkt.pc == scb_pc)
			$display("pc match");
		else
			$error("pc mismatch");

		assert(probePkt.npc == scb_npc)
			$display("npc match");
		else
			$error("npc mismatch");

		assert(probePkt.instrmem_rd === scb_instrmem_rd)
			$display("instrmem_rd match");
		else
			$error("instrmem_rd mismatch");


		$display("probePkt : taddr = %h\t enable_updatePC = %h\t enable_fetch = %h\t br_taken = %h\t instrmem_rd = %h\t pc = %h\t npc = %h",probePkt.taddr,probePkt.enable_updatePC,probePkt.enable_fetch,probePkt.br_taken,probePkt.instrmem_rd,probePkt.pc,probePkt.npc);
		$display("Dummy : taddr = %h\t enable_updatePC = %h\t enable_fetch = %h\t br_taken = %h\t instrmem_rd = %h\t pc = %h\t npc = %h\t",scb_taddr,scb_enable_updatePC,scb_enable_fetch,scb_br_taken,scb_instrmem_rd,scb_pc,scb_npc);
		$display("");
		$display("");

	endtask

	task pcInit();
		scb_pc = 16'h3000;
		scb_npc = scb_pc + 1;
	endtask

endclass