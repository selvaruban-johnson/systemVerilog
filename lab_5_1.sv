module lab_5_1 ();
bit [4:0] a;
bit b[4:0];
initial
begin
	a = 5'h1e;
	b = '{1,1,1,1,0};
	$display ("a=%b b=%p",a,b);
	#10 a [1:0]= 2'h3;
	#10 b [1:0] = '{1,1};
	$display ("a=%b b=%p",a,b); 
end
endmodule 