module class_inline;

class test;

rand bit [7:0]x,y;
rand bit [8:0]z;
constraint c1 {z==x+y;};
endclass

//int success;

initial
begin
 	test t1;
	t1=new();
	//success=t1.randomize() with {x<y;};
	if(t1.randomize() with {x<y;})
	$display("%d %d %d",t1.x,t1.y,t1.z);
	else
	$display("failed");
end

endmodule 