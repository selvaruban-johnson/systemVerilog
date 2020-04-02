class B;
int i;
endclass
module main1;
initial
begin
	B b1,b2;
	b1 = new();
	b1.i = 100;
	b2 = new b1;
	b2.i = 200;
	$display( b1.i );
	$display( b2.i );
end
endmodule