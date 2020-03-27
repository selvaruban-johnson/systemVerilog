module queue();
int q[$] = {10,20,30,50,60};

initial
begin
	$display("q=%p size = %d",q,q.size());
	q.insert(0,0);
	$display("q=%p size = %d",q,q.size());
	q.insert(4,40);
	q.insert(7,70);
	$display("q=%p size = %d",q,q.size());
	q.delete(4);
	$display("q=%p size = %d",q,q.size());
	q.delete(0);
	$display("q=%p size = %d",q,q.size());
	q.delete(5);
	$display("q=%p size = %d",q,q.size());
end
endmodule 