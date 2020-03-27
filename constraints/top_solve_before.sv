class solve_before;
rand bit x;
rand bit [1:0] y;
constraint c_xy {
(x==0) -> (y==0);}
constraint xy {solve x before y;}

endclass

module top_solve_before();
solve_before b1 = new();
initial
begin
repeat(10)
begin
	b1.randomize();
	$display("x=%d y=%d",b1.x,b1.y);
end
end
endmodule 

	