class LC3_Driver;

	LC3_Packet dutPkt;

	mailbox #(LC3_Packet) mb_gen_drv;

	virtual DUT_Intf dutIntf;

	function new(mailbox #(LC3_Packet) mb_gen_drv, virtual DUT_Intf dutIntf);

		this.mb_gen_drv = mb_gen_drv;
		this.dutIntf = dutIntf;

	endfunction

	task run();

		$display("DRIVER OUTPUT");
		mb_gen_drv.get(dutPkt);

		@(dutIntf.cb_LC3);
		dutIntf.cb_LC3.Data_dout <= dutPkt.Data_dout;
		dutIntf.cb_LC3.Instr_dout <= dutPkt.Instr_dout;
		dutIntf.cb_LC3.complete_data <= dutPkt.complete_data;
		dutIntf.cb_LC3.complete_instr <= dutPkt.complete_instr;

		$display("dutIntf : Data_dout = %h\t Instr_dout = %h",dutIntf.Data_dout,dutIntf.Instr_dout);
		$display("dutPkt : Data_dout = %h\t Instr_dout = %h",dutPkt.Data_dout,dutPkt.Instr_dout);
		$display("");
		$display("");

	endtask

endclass