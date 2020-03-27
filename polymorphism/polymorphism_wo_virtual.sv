class base;
task disp ();
	$display(" This is base ");
endtask
endclass

class derived extends base ;
task disp ();
	$display(" This is derived");
endtask
endclass

module main ;
derived d1;
base b1;
initial
begin
	b1= new();
	b1.disp();
	d1 = new();
	b1= d1;
	b1.disp;
end
endmodule