module test_union ();

union
{
	/*reg [3:0]a;
	logic [4:0]b;
	bit [5:0]c;*/
	reg [5:0]a;
	logic [4:0]b;
	shortreal c;
}d1;
initial
begin
	d1.a = 6'b101101;
	//$display ("%b",d1.a);
	d1.b =5'b10110;
	//$display ("%b",d1.b);
	//d1.c = 4'b1010;
	//$display ("%b",d1.a);
	//$display ("%b",d1.b);
	$display ("%p",d1);
end
endmodule 