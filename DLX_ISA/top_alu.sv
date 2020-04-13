//the compiled module of alu
`include "alu_dff.sv"
`include "alu_mux.sv"
`include "mux_c.sv"
`include "shift_alu.sv"
`include "arith_alu.sv"
module top_alu
(input clk,reset,enable_arith,enable_shift,
input [31:0]aluin1,aluin2,
input [2:0]operation,opselect,
input [4:0]shift_number,
output reg [31:0]aluout,
output reg carry);
wire [31:0]w1,w2;
wire c1,c2,w3;
arith_alu a1(.*,.enable(enable_arith),.aluoperation(operation),.aluopselect(opselect),.aluout({c1,w1}));

shift_alu s1(.*,.enable(enable_shift),.in(aluin1),.shift(shift_number),.shift_operation(opselect),.aluout({c2,w2}));

alu_dff d1(.*,.d(enable_arith),.q(w3));

alu_mux m1(.a(w1),.b(w2),.s(w3),.aluout(aluout));

mux_c k1(.a(c1),.b(c2),.s(w3),.carry(carry));

endmodule