module gcd (input [7:0] a,b,output logic [7:0] g);
logic [7:0] a1,b1,t;
logic [7:0]r=1;
always_comb
begin
	{a1,b1}={a,b};
	if(a<b)
	begin
	t=a1;
	a1=b1;
	b1=t;
	end

	while (r!=0)
	begin
		r=a1%b1;
		a1 = b1;
		if(r==0)
			g=b1;
		b1 = r;
	end
end
endmodule 
