class LC3_Generator;

	LC3_Packet dutPkt;
	mailbox #(LC3_Packet) mb_gen_drv;

	function new(mailbox #(LC3_Packet) mb_gen_drv);

		this.mb_gen_drv = mb_gen_drv;

	endfunction

	task run();

		$display("GENERATOR OUTPUT");

		dutPkt = new();

		assert(dutPkt.randomize())
		begin
			$display("Data_dout = %h\t Instr_dout = %h",dutPkt.Data_dout,dutPkt.Instr_dout);
			mb_gen_drv.put(dutPkt);
		end

		else
			$fatal("Randomization failed!");
		
		$display("");
		$display("");

	endtask

endclass