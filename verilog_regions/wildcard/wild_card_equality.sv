module wild_card_equality();
logic [3:0]a = 4'b11111;
logic [3:0]b = 4'bxxz1;
logic [3:0]c = 4'bxxz0;

initial
begin
	if(a==?b)
	$display ("a %b matches with b %b",a,b);
	if(a!=?c)
	$display("a %b does not match with c %b",a,c);
end
endmodule 