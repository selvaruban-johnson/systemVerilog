interface DUT_Intf
	(
		input bit clock, reset
	);

	logic complete_instr, complete_data;
	logic [15:0] Instr_dout, Data_dout;

	logic [15:0] pc, Data_addr;
	logic instrmem_rd, Data_rd; 
	logic [15:0] Data_din;
	logic D_macc, I_macc;


clocking cb_LC3 @(posedge clock);
	default input #1 output #0;

	output Data_dout;
	output Instr_dout;
	output complete_data;
	output complete_instr;

	input instrmem_rd;
	input Data_addr;
	input Data_din;
	input Data_rd;
	input I_macc;
	input D_macc;

endclocking



endinterface