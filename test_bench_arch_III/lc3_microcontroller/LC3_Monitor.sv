class LC3_Monitor;

	LC3_Packet dutPkt;
	Probe_Packet probePkt;

	mailbox #(Probe_Packet) mb_mon_scb;

	virtual DUT_Intf dutIntf;
	virtual Probe_Intf probeIntf;

	function new(mailbox #(Probe_Packet) mb_mon_scb, virtual DUT_Intf dutIntf, virtual Probe_Intf probeIntf);

		this.mb_mon_scb = mb_mon_scb;
		this.dutIntf = dutIntf;
		this.probeIntf = probeIntf;

	endfunction

	task run();

		$display("MONITOR OUTPUT");

		probePkt = new();
		dutPkt = new();
		
		@(dutIntf.cb_LC3);
		dutPkt.Data_dout = dutIntf.cb_LC3.Data_dout;
		dutPkt.Instr_dout = dutIntf.cb_LC3.Instr_dout;
		dutPkt.complete_data = dutIntf.cb_LC3.complete_data;
		dutPkt.complete_instr = dutIntf.cb_LC3.complete_instr;

		dutPkt.instrmem_rd = dutIntf.cb_LC3.instrmem_rd;
		dutPkt.I_macc = dutIntf.cb_LC3.I_macc;
		dutPkt.D_macc = dutIntf.cb_LC3.D_macc;
		dutPkt.Data_rd = dutIntf.cb_LC3.Data_rd;
		dutPkt.Data_din = dutIntf.cb_LC3.Data_din;
		dutPkt.Data_addr = dutIntf.cb_LC3.Data_addr;

		@(probeIntf.cb_Probe);
		probePkt.taddr = probeIntf.cb_Probe.taddr;
		probePkt.enable_updatePC = probeIntf.cb_Probe.enable_updatePC;
		probePkt.enable_fetch = probeIntf.cb_Probe.enable_fetch;
		probePkt.br_taken = probeIntf.cb_Probe.br_taken;

		probePkt.instrmem_rd = probeIntf.cb_Probe.instrmem_rd;
		probePkt.pc = probeIntf.cb_Probe.pc;
		probePkt.npc = probeIntf.cb_Probe.npc;

		
		mb_mon_scb.put(probePkt);

		$display("mb_mon_scb : taddr = %h\t enable_updatePC = %h\t enable_fetch = %h\t br_taken = %h\t instrmem_rd = %h\t pc = %h\t npc = %h",probePkt.taddr,probePkt.enable_updatePC,probePkt.enable_fetch,probePkt.br_taken,probePkt.instrmem_rd,probePkt.pc,probePkt.npc);
		$display("probeIntf : taddr = %h\t enable_updatePC = %h\t enable_fetch = %h\t br_taken = %h\t instrmem_rd = %h\t pc = %h\t npc = %h",probeIntf.taddr,probeIntf.enable_updatePC,probeIntf.enable_fetch,probeIntf.br_taken,probeIntf.instrmem_rd,probeIntf.pc,probeIntf.npc);
		$display("dutPkt : Data_dout = %h\t Instr_dout = %h\t complete_data = %h\t complete_instr = %h\t instrmem_rd = %h\t Data_addr = %h\t Data_rd = %h\t Data_din = %h\t D_macc = %h\t I_macc = %h",dutPkt.Data_dout,dutPkt.Instr_dout,dutPkt.complete_data,dutPkt.complete_instr,dutPkt.instrmem_rd,dutPkt.Data_addr,dutPkt.Data_rd,dutPkt.Data_din,dutPkt.D_macc,dutPkt.I_macc);
		$display("");
		$display("");

	endtask

endclass