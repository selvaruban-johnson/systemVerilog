module test_queue ();
int q[];

initial
begin
	q=new[101];
	q[0] =89;
	q[1] =71;
	q[2] =3;
	q[3] =98;
	q[6] =7;
	q[4] =68;
	q[5] =8;
	q[7] =83;
	q[100] =90;
	$display("q=%p ,size =%d",q,q.size());
end
endmodule 
	