module alu_4bit (input clk,rst,[3:0]a,b,select,output logic co,[3:0]s);
logic [3:0]a1,b1,sel;
logic co1;
logic [3:0]s1;
always_ff @(posedge clk)
begin
		a1<=a;
		b1<=b;
		sel <= select;
end

always_ff @(posedge clk)
begin
	if(rst)
		{co1,s1} <= 0;
	else
	begin
		casex (sel)
		4'b1xxx: {co1,s1}<={co,s};
		4'b0000 : {co1,s1}<= a1+b1;
		4'b0001 : {co1,s1}<= a1-b1;
		4'b0010 : {co1,s1}<= a1+1;
		4'b0011 : {co1,s1}<= a1-1;
		4'b0100 : {co1,s1}<= a1^b1;
		4'b0101 : {co1,s1}<= a1&b1;
		4'b0110 : {co1,s1}<= a1|b1;
		4'b0111 : {co1,s1}<= ~a1;
		endcase  
	end
end
assign co = co1;
assign s = s1;
endmodule 


