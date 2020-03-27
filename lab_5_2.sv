module lab_5_2();
bit [7:0]a;
bit b[7:0];
initial
begin
	a= 8'b11001100;
	$monitor("a=%b b=%p",a,b);
	for(int i=0;i<8;i++)
		b[i] = a[i];
end
endmodule 