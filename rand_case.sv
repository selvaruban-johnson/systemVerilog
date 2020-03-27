module rand_case();
int a;
int x1,x2,x3;
initial
begin
	for(int i=0;i<100;i++)
	begin
	randcase
	3:a=$urandom_range(50,100);
	1:a=$urandom_range(101,150);
	4:a=$urandom_range(151,200);
	endcase
	if(a>=50&&a<=100)
		x1++;
	else if (a>=101&&a<=150)
		x2++;
	else if (a>=151&&a<=200)
		x3++;	
	$display("%d",a);
	end
	
	$display ("50-100 = %d",x1);
	$display ("101-150 = %d",x2);
	$display("151-200 = %d",x3);
end
endmodule 