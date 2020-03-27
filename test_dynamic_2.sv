module test_dynamic_2();
int  d[];
int d1[];
initial
begin
	d=new[10];
	d[0] = 81;
	d[1] =96;
	d[2] = 10;
	d[3] = 1000;
	d[7] = 8;
	d[9] = 999;
	$display("d=%p d1=%p",d,d1);
	d=new[16](d);
	$display("d=%p d1=%p",d,d1);
	$display("d=%d d1=%d",d.size,d1.size);
	d.delete();
		$display("d=%p d1=%p",d,d1);

end
endmodule 