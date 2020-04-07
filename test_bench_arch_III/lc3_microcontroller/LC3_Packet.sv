class LC3_Packet;

	rand logic [15:0] Data_dout;
	rand logic [15:0] Instr_dout;
	rand logic complete_data;
	rand logic complete_instr;
	//These are inputs

	logic instrmem_rd;
	logic [15:0] Data_addr;
	logic [15:0] Data_din;
	logic Data_rd;
	bit I_macc;
	bit D_macc;
	//These are outputs



	constraint ADD0
		{
			if({Instr_dout[15:12],Instr_dout[5]} == 5'b00010)	
				Instr_dout[5:3] inside {3'b000};
		}

	constraint AND0
		{
			if({Instr_dout[15:12],Instr_dout[5]} == 5'b01010)	
				Instr_dout[5:3] inside {3'b000};
		}

	constraint NOT
		{
			if(Instr_dout[15:12] == 4'b1001)			
				Instr_dout[5:0] inside {6'b000000};
		}

	constraint JUMP
		{
			if(Instr_dout[15:12] == 4'b1100)			
				Instr_dout[11:9] inside {3'b000};
				Instr_dout[5:0] inside {6'b000000};
		}
	
	constraint VALID_INSTR
		{
			Instr_dout[15:12] inside {4'b0001, 4'b0101, 4'b1001, 4'b0010, 4'b0110, 4'b1010, 4'b1110, 4'b0011, 4'b0111, 4'b1011, 4'b0000, 4'b1100};
			//Valid instructions are - 0, 1, 2, 3, 5, 6, 7, 9, a, b, c, e
		}

	constraint COMP_DATA
		{
			complete_data inside {0,1};
		}

	constraint COMP_INSTR
		{
			complete_instr inside {0,1};
		}

	constraint DATA_DOUT
		{
			Data_dout inside {[16'h0000:16'hffff]};
		}

	function void pre_randomize();
	
	endfunction


	function void post_randomize();

	endfunction
endclass