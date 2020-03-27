class bi_directional;
rand bit [15:0]a,b,c;
constraint c1 {
0<a;
a<b;
b<c;
c<100;
}
endclass 

module top_bidirectional();

bi_directional b1 = new();

initial
begin
	repeat(10)
	begin
	b1.randomize();
	$display("a=%d,b=%d c=%d",b1.a,b1.b,b1.c);
	end
end
endmodule
