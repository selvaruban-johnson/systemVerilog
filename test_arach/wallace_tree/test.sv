module test(intf i);
environment en;
initial
begin
	en = new(i);
	en.build();
	repeat(200000)
	en.run();
end
endmodule 