module lab_6_3 ();

reg [15:0]a[int];

initial
begin

	a[34]= $urandom;
	a[56]= $urandom; 
	a[87]= $urandom;
	a[100]= $urandom;
	a[200]= $urandom;
	a[300]= $urandom;
	a[500]= $urandom;
	$display("a=%p size=%d",a,a.size);
	a.delete(87);
	$display("a=%p",a);
	//$display("a=%d",a.first());
	//$display("a=%d",a.last() );
end
endmodule 