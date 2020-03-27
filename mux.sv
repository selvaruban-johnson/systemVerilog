module mux
(input bit a,b,sel,
output bit y);
always @ (a,b,sel)
begin
	if(sel)
	y=b;
	else
	y=a;
end
endmodule