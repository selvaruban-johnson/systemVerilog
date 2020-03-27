module case_equality();

logic [3:0]a,b;

initial 
begin
	a = 4'b11x1;
	b = 4'b1111;
	$display("!= %d ",a!=b);
	$display("!=== %d",a!==b);
end
endmodule 