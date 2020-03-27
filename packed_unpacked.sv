module packed_unpacked();
int [7:0]a;
int b[7:0];
int c[8];
initial 
begin
	a=8'b10101111;
	b = '{11,30,31,40,51,61,12,10};
	c = '{13,17,31,81,10,81,90,16};
	$display ("a[0] = %d",a[0]);
	$display ("b[0] = %d",b[0]);
	$display ("c[0] = %d",c[0]);
	$display ("a = %b",a);
	$display ("b = %p",b);
	$display ("c = %p",c);
	$display ("a[5:3] = %b",a[5:3]);
	$display ("b[5:3] = %p",b[5:3]);
	$display ("c[3:5] = %p",c[3:5]);
end
endmodule