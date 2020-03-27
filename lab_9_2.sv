/*Declare an unpacked array which consists of 10 integers. Declare a dynamic array which
can have 10 integers. Copy the contents of the unpacked array to dynamic array. Display the
result. Use delete function to delete the contents .Display the array size*/

module lab_9_2;
int a[10]={12,23,34,45,56,67,78,89,90,68};
int d[];

initial
begin
	//d=new[10](a);
	d=new[10];
	//d=a;
	foreach(a[i])
	begin
		d[i]=a[i];
	end
	$display(" d=%p size=%d",d,d.size());
	d.delete();
	$display(" d=%p size=%d",d,d.size());
	s
end
endmodule 