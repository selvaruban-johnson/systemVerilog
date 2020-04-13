// multiplexer for the output selection of the ALU
module alu_mux
(input [31:0]a,b,
input s,
output [31:0]aluout);
assign aluout = s==1'b1 ? b : a;
endmodule