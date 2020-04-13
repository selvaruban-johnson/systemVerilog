//Arithematic block of ALU
`define CLK_PERIOD 10
`define REGISTER_WIDTH 32
`define INSTR_WIDTH 32
`define IMMEDIATE_WIDTH 16
`define MEM_READ 3'b101
`define MEM_WRITE 3'b100
`define ARITH_LOGIC 3'b001
`define SHIFT_REG 3'b000

`define ADD	3'b000
`define HADD	3'b001
`define SUB	3'b010
`define NOT	3'b011
`define AND	3'b100
`define OR	3'b101
`define XOR	3'b110
`define LHG	3'b111

`define LOADBYTE 3'b000
`define LOADBYTEU 3'b100
`define LOADHALF 3'b001
`define LOADHALFU 3'b101
`define LOADWORD 3'b011
 
module arith_alu
(input clk,reset,enable,
input signed [31:0]aluin1,aluin2,
input [2:0]aluoperation,aluopselect,
output reg [32:0]aluout);
reg [15:0]h_add;
reg h_carry;
reg signed [31:0]r1,r2;
assign r1=aluin1;
assign r2=aluin2;
assign {h_carry,h_add}= aluin1[15:0] + aluin2[15:0];
always@(posedge clk)
begin
aluout <= aluout;
if(!reset)
	aluout<=0;
else
begin
	if(enable)
	begin
		case(aluopselect)
		`ARITH_LOGIC : begin
				case(aluoperation)
				`ADD : aluout <= r1 + r2;
				`HADD: aluout <= {h_carry,{16{h_add[15]}},h_add};
				`SUB : aluout <= r1 - r2;
				`NOT : aluout <= {1'b0,{~aluin2}};
				`AND : aluout <= {1'b0,{aluin1 & aluin2}};
				`OR  : aluout <= {1'b0,{aluin1 | aluin2}};
				`XOR : aluout <= {1'b0,{aluin1 ^ aluin2}};
				`LHG : aluout <= {1'b0,{aluin2[15:0]},16'b0};
				endcase
			      end
		`MEM_READ : begin
				case(aluoperation)
				`LOADBYTE : aluout <= {1'b0,{24{aluin2[7]}},aluin2[7:0]};
				`LOADBYTEU: aluout <= {25'b0,aluin2[7:0]};
				`LOADHALF : aluout <= {1'b0,{16{aluin2[15]}},aluin2[15:0]};
				`LOADHALFU: aluout <= {17'b0,aluin2[15:0]};
				`LOADWORD : aluout <= {1'b0,aluin2}; 
				endcase
			   end
		endcase
	end
end
end
endmodule
