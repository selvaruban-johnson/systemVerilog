class bi_directional2;
rand bit [15:0]b,c,d;
constraint c1 {
40>d;
d>b;
b==c;
c>=25;
}
endclass 

module top_bi_directional2();

bi_directional2 b1 = new();

initial
begin
	repeat(10)
	begin
	b1.randomize();
	$display("b=%d c=%d d=%d",b1.b,b1.c,b1.d);
	end
end
endmodule