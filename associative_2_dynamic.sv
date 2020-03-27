module associative_2_dynamic ();

int a[int];
int d[];
int j;
initial
begin
	a[0] = 85;
	a[91] = 1000;
	a[140] = 2;
	a[150] = 79;
	$display ("a=%p size=%d",a,a.num);
	d = new[4];
	/*for (int i=0,j=0;i<=151;i++)
	begin
		if(a.exists(i))
		begin
			d[j++]=a[i];
		end
	end*/
	foreach(a[i])
	begin
		d[j++] = a[i];
	end
	$display ("d=%p size = %d",d,d.size);
end
endmodule 