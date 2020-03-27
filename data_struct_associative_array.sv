module data_struct_associative_array ();
struct
{
int a[*];
}d;
initial
begin

	d.a[0] = 85;
	d.a[91] = 1000;
	d.a[140] = 2;
	d.a[150] = 79;
	$display ("a= %p size = %d",d.a,d.a.num);
	d.a.delete (140);
	$display ("a= %p size = %d",d.a,d.a.size);
end
endmodule