module test_dynamic_array();
integer d[];

initial
begin
	d=new[5];
	$display ("d=%p",d);
	d[0] =50;
	d[1] = 60;
	d[4] = 90;
	d[2]=10
	//d[1:3]='{0,0,90};
	$display ("d=%p",d);
	$display ("size =%d",d.size);
	$display ("sum =%d",d.sum());
//	d.delete();
//	$display ("d=%p size =%d",d,d.size);
//	d=new[5];
//	d[4]=90;
//	$display("d=%p size =%d",d,d.size);
end
endmodule 