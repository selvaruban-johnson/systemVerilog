class b;
	extern task print();
endclass
 
task b::print();
	$display("SystemVerilog for verification -HEP");
endtask


module main_case3();
initial
begin
	b B;
	B = new();
	B.print();
end
endmodule 