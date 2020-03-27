module lab_5_3();
bit a[7:0];
bit [7:0]b;
initial
begin
	a= '{1,1,0,0,1,1,0,0};
	$monitor("a=%p b=%b",a,b);
	for(int i=0;i<8;i++)
		b[i] = a[i];
end
endmodule 