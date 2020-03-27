//test
module test (intf i);
environment en;
initial
begin
	en=new(i);
	en.build();
	repeat(100)
		en.run();
end
endmodule 