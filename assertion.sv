module assertion(input ifcount,a,b,output logic ifout);
always_comb
begin
assert (^ifcount !==1'bx)
else
	$fatal ("ifcount is x");
if(ifcount)
	ifout = a;
else
	ifout = b;
end
endmodule 