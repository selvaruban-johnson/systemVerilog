class A;
int i;
endclass

class B;
A a;
endclass

module main;
initial
begin
	B b1, b2;
	b1 = new();
	b1.a = new();
	b1.a.i = 100;
	b2 = new b1;
	$display( b1.a.i );
	$display( b2.a.i );
	b1.a.i = 200;
	$display( b1.a.i );
	$display( b2.a.i );
end
endmodule