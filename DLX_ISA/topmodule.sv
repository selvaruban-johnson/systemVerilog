//The top module connecting preprocessor and the ALU
`include"preprocessor.sv"
`include"top_alu.sv"
module topmodule
(input clk,reset,enable_ex,
input [31:0]src1,src2,imm,mem_data_read_in,
input [6:0]control_in,
output reg [31:0]aluout,mem_data_write_out,
output reg carry,mem_data_write_en);

wire w_arith,w_shift;
wire [31:0]aluin1,aluin2;
wire [4:0]sh;
wire [2:0]w1,w2;
assign w1=control_in[6:4];
assign w2=control_in[2:0];

preprocessor p1(.*,.operation_out(w1),.opselect_out(w2),.mem_data_write_out(mem_data_write_out),.aluin1(aluin1),.aluin2(aluin2),.shift_number(sh),.enable_arith(w_arith),.enable_shift(w_shift));

top_alu a1(.*,.aluin1(aluin1),.aluin2(aluin2),.operation(w1),.opselect(w2),.enable_arith(w_arith),.enable_shift(w_shift),.shift_number(sh));

endmodule