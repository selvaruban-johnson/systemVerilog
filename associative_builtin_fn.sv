module associative_builtin_fn();

int a[*];
//int a[string];
int i;
//strind i;
initial
begin
	a["binu"] = 63;
	a["biju"] = 81;
	a["byju"] = 101;
	a["ara"] =987;
	a.first(i);
	$display("i=%s a[i]=%d",i,a[i]);
	a.next(i);
	$display("i=%s a[i]=%d",i,a[i]);
	a.last(i);
	$display("i=%s a[i]=%d",i,a[i]);
	a.prev(i);
	$display("i=%s a[i]=%d",i,a[i]);
end
endmodule 