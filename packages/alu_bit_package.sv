package alu_bit_package;
bit arith_logic_sel;
logic [1:0] arithlogic_op;
logic [15:0] data_out;

struct packed //arith_logic_info
{
	bit [7:0] ip_data1;
        bit [7:0] ip_data2;
} arith_data,logic_data;

struct //arith_logic_result 
{
	union packed 
	{
		logic [15:0] result_data;
	} result;
} final_result;

endpackage