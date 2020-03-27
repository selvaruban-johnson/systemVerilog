/*6. Define a class with dynamic array a. Randomize class such that each element of dynamic array
a has value greater than 7*/

class packet;

 int a[];
randc int b;
constraint c1 {b>7;b<17;}
endclass 


module top_packet();

initial
begin
	packet p1 = new();
	p1.a=new[10];
	for(int i=0;i<10;i++)
	begin
	if(p1.randomize(b))
	begin
		p1.a[i]=p1.b;
		$display("%d",p1.a[i]);

	end
	else
		$display("failed");
	end
end
endmodule 