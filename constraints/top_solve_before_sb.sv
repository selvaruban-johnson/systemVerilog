class solve_before;
rand bit s;
rand bit [31:0] b;
constraint c_xy {s->(b==0);}
constraint xy {solve s before b;}

endclass

module top_solve_before_sb();
solve_before b1 = new();
initial
begin
repeat(10)
begin
	b1.randomize();
	$display("s=%d b=%d",b1.s,b1.b);
end
end
endmodule 

	