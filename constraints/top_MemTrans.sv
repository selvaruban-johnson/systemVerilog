class MemTrans;
rand bit x;
rand bit [1:0]y;
constraint c_xy {y inside {[x:3]};solve x before y;}
endclass

module top_MemTrans();
MemTrans m1 = new();
initial
begin
	repeat(10)
	begin
		m1.randomize();
		$display("x = %d y =%d",m1.x,m1.y);
 	end
end
endmodule 