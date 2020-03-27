module test_test ();
integer i=3,j=3;
integer z,x;
initial
begin
	x = --j%j--;
	z = --i/i--;
	$display ("i=%d , j-%d x=%d z=%d",i,j,x,z);

end
endmodule 
