module lab_9_1();
int d[int];
int i=0;
int g;
initial
begin
while(i<50)
begin
	for(int j=0;j<49;j++)
	begin
		if(!d.exists(j))
		begin
			d[$urandom_range(1,100)] = $urandom_range(1,100);
			i++;

		end
	end
end
	$display("d=%p size=%d",d,d.size);

	if(d.exists(2))
		$display("2 exist");
	if(d.exists(45))
		$display("45 exist");

	/*foreach(d[i])
	begin
		if(d.exists(i))
		begin
			$display("%d %p",i,d[i]);
			break;
		end
	end*/
		d.first(i);
		$display ("first = %d %p",i,d[i]);
		d.last(i);
		$display ("last = %d %p",i,d[i]);
/*	for(int i=0;i<=100;i++)
	begin
		if(d[i]==d.first(i))
			$display("%d %d",i,d[i]);
		else if(d[i]==d.last(i))
			$display("%d %d",i,d[i]);
	end
*/
end
endmodule 