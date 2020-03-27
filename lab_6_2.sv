module lab_6_2 ();
struct
{
int a[30];
}d;
int d1[];
initial
begin
	for(int j=0;j<30;j++)
		d.a[j]=$urandom_range(1,100);
	d1=new[30](d.a);
	$display("d1=%p size=%d",d1,d1.size);
	for(int i=0;i<30;i++)
	begin
		$display("%d:%d",i,d1[i]);
	end
	d1.sort();
	$display("d=%p",d1);
	$display("minimum = %p",d1.min());
	$display ("maximum = %p",d1.max());
end
endmodule 