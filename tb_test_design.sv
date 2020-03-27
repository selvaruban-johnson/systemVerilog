module tb_test_design();

logic a,b,c,d,e,f,g,y;

test_design t1 (a,b,c,d,e,f,g,.y);
initial 
begin
	$monitor ("a= %b b=%b c=%b d=%b e=%b f=%b g=%b y=%b",a,b,c,d,e,f,g,y);
	{a,b,c,d,e,f,g} = 0;
	repeat(128)
		#10 {a,b,c,d,e,f,g}={a,b,c,d,e,f,g}+1'b1;
end
endmodule
