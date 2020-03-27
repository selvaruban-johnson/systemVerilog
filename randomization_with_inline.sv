module randomization_with_inline();
//integer a;
integer b;
logic [5:0]a;
initial
begin
	b=5;
	for(int i=0;i<10;i++)
		if(randomize(a)with {a<100;a>b;})
			$display("randomization success :%d ",a);
		else
			$display("randomization failed");
	
end
endmodule 