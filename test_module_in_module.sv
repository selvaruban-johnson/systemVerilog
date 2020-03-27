module test_module_in_module ;
logic a,b,y;

module andd(input a,b,output logic y);
	and a1 (y,a,b);
endmodule 

initial
begin
	{a,b}=0;
	$monitor ("a=%b b=%b y=%b",a,b,y);
	#100 {a,b} = 100;
end
endmodule 