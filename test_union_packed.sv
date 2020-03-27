module test_union_packed ();

union packed 
{
	/*reg [3:0]a;
	logic [4:0]b;
	bit [5:0]c;*/
	reg [3:0]a;
	logic [3:0]b;
	bit [3:0] c;
}d1;
initial
begin
	d1.a = 4'b1101;
	//$display ("%b",d1.a);
	d1.b =4'b0110;
	//$display ("%b",d1.b);
	d1.c = 4'b1010;
	$display ("%b",d1.a);
	$display ("%b",d1.b);
	//$display ("%p",d1);
end
endmodule 