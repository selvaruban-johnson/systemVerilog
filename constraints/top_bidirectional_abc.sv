class bidirectional;
rand int r,s,t;
constraint c1 {r<t;s==r;t<10;s>5;}
endclass

module top_bidirectional_abc;

bidirectional b1 = new();

initial
begin
	repeat(10)
	begin
	b1.randomize();
	//b1.randomize(s);
	//b1.randomize(t);
	$display ("r=%d s=%d t=%d",b1.r,b1.s,b1.t);
	end
end
endmodule
