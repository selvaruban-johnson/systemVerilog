`define CLK_PERIOD 10
`define REGISTER_WIDTH 32
`define INSTR_WIDTH 32
`define IMMEDIATE_WIDTH 16
`define MEM_READ 3'b101
`define MEM_WRITE 3'b100
`define ARITH_LOGIC 3'b001
`define SHIFT_REG 3'b000 
// SHIFTING
`define SHLEFTLOG 3'b000
`define SHLEFTART 3'b001
`define SHRGHTLOG 3'b010
`define SHRGHTART 3'b011

module shift_alu
(input clk,reset,enable,
input [31:0]in,
input [4:0]shift,
input [2:0]shift_operation,
output reg [32:0]aluout);
reg [31:0]w={32{1'b1}};

always@(posedge clk)
begin
	aluout<=aluout;
if(!reset)
	aluout<=0;
else
begin
	if(enable)
	begin
		case(shift_operation)
		`SHLEFTLOG : aluout <= in<<shift;
		`SHLEFTART : begin assert(in[31]==0) 
					aluout <= {1'b0,{in<<shift}};
					else 
					aluout <= {1'b1,{in<<shift}};
		             end
		`SHRGHTLOG : aluout <= in>>shift;
		`SHRGHTART : begin 
				assert(in[31]==1'b1)
					aluout <= {1'b0,{(in>>shift) | (w<<(32-shift))}};
				else
					aluout <= in>>shift;
			     end
		endcase
	end
end
end
endmodule