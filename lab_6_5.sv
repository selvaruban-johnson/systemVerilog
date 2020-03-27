module lab_6_5();

struct
{
	byte my_byte;
	integer my_integer;
	int my_int;
	bit [15:0] my_bit;
	shortint my_short_int1;
	shortint my_short_int2;
}d1;

initial
begin
	d1.my_integer = 32'b0001111xxxxzzzz;
	d1.my_int = d1.my_integer;
	d1.my_bit =16'h8000;
	d1.my_short_int1 = d1.my_bit;
	d1.my_short_int2 = d1.my_short_int1;

	$display("%b",d1.my_byte);
	$display("%h",d1.my_int);
	$display("%d",d1.my_bit);
	$display("%d",d1.my_short_int1);
	$display("%d",d1.my_short_int2);

end
endmodule