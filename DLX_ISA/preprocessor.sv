//stage 1 - the execute preprocessor
`define CLK_PERIOD 10
`define REGISTER_WIDTH 32
`define INSTR_WIDTH 32
`define IMMEDIATE_WIDTH 16
`define MEM_READ 3'b101
`define MEM_WRITE 3'b100
`define ARITH_LOGIC 3'b001
`define SHIFT_REG 3'b000

module preprocessor
(input clk,reset,enable_ex,
input [31:0] src1,src2,imm,mem_data_read_in,
input [6:0]control_in,
output logic enable_arith,enable_shift,mem_data_write_en,
output logic [2:0] operation_out,opselect_out,
output logic [31:0] mem_data_write_out,aluin1,aluin2,
output logic [4:0] shift_number);

assign mem_data_write_en=(control_in[2:0] == `MEM_WRITE && control_in[3] == 1'b1)?1:0;
assign mem_data_write_out=src2;

always@(posedge clk)
begin
aluin2<=aluin2;
if(!reset)
begin
	aluin1<=0;
	aluin2<=0;
	operation_out<=0;
	opselect_out<=0;
	shift_number<=0;
	enable_arith<=0;
	enable_shift<=0;
end
else
begin
	assert(enable_ex)
	begin
		aluin1<=src1;

		case(control_in[2:0])
		`ARITH_LOGIC:begin if(control_in[3])
					aluin2<=imm;
				  else
					aluin2<=src2; end
		`MEM_READ:begin	if(control_in[3])
					aluin2<=mem_data_read_in;
				else
					aluin2<=aluin2; end
		endcase

		operation_out<=control_in[6:4];
		opselect_out<=control_in[2:0];

		case(control_in[2:0])
		`SHIFT_REG:begin if(imm[2])
					shift_number<=src2[4:0];
				 else
					shift_number<=imm[10:6]; end
		default : shift_number<=0;
		endcase

		case(control_in[2:0])
		`ARITH_LOGIC:enable_arith<=1'b1;
		`MEM_READ:begin	if(control_in[3])
					enable_arith<=1'b1;
				else
					enable_arith<=1'b0; end
		default : enable_arith<=0;
		endcase

		if(control_in[2:0] == `SHIFT_REG)
			enable_shift<=1;
		else
			enable_shift<=0;
	end
	else
	begin
		aluin1<=aluin1;
		aluin2<=aluin2;
		operation_out<=operation_out;
		opselect_out<=opselect_out;
		shift_number<=0;
		enable_arith<=0;
		enable_shift<=0;
	end
end
end
endmodule
