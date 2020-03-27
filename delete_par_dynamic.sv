module delete_par_dynamic();
 
int d[] = {41,83,61,1001,8};
int q[$];

initial
begin
	$display("d=%p",d);
	q=d;
	/*for(int i=0;i<5;i++)
	begin
		q[i]=d[i];
	end*/
	$display("q=%p",q);
	q.delete(3);
	q.delete(2);
	$display("q=%p",q);
	q.push_front(40);
	$display("q=%p",q);
	d.delete();
	d=new[4];
	for(int j=0;j<4;j++)
	begin
		d[j]=q[j];
	end
	$display("d=%p",d);
end
endmodule