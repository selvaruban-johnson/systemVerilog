module test_3bit;
reg [5:0]a;
initial
begin
	a= 3+4 - 7 * 8/10 %11;
	$display ("a = %d",a);
end
endmodule