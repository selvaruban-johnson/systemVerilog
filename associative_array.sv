module associative_array ();

int a[*];

initial
begin

	a[0] = 85;
	a[91] = 1000;
	a[140] = 2;
	a[150] = 79;
	$display ("a= %p size = %d",a,a.num);
	a.delete (140);
	$display ("a= %p size = %d",a,a.size);
	//$display ("sum = %p",a.xor());
end
endmodule 