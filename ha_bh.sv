module ha_bh 
(input a,b,
output logic sum,cout);

always @ (a,b)
begin
	sum = a ^b ;
	cout = a &b;
end
endmodule 