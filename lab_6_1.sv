module lab_6_1 ();
int d[]={9,1,8,3,4,4};
int d1[];
initial
begin
	d1 = new[6](d);
	$display("d=%p d=%d d1=%p d1=%d",d,d.size,d1,d1.size);
	d1.delete();
	$display("d=%p d=%d d1=%p d1=%d",d,d.size,d1,d1.size);
end
endmodule 