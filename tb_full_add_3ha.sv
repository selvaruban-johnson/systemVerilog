module tb_full_add_3ha();
logic a,b,c,sum,cout;
	full_add_3ha f1 (.*);
initial
begin
	$monitor("a=%b b=%b c=%b sum=%b cout=%b",a,b,c,sum,cout);
	{a,b,c}=0;
	repeat(7)
	#10 {a,b,c}={a,b,c}+1'b1;
end
endmodule 