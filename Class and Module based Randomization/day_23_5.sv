class class_c;
rand static int p,q,r;
endclass 

class class_a;
task disp();
begin
class_c c1;
c1=new();
c1.randomize();
$display("%d %d %d",c1.p,c1.q,c1.r);
end
endtask
endclass 

class class_b extends class_a;
task disp();
begin
class_a a2;
a2=new();
a2.disp();
end
endtask
endclass




module day_23_5;
initial
begin
	class_b a1;
	a1=new();
	a1.disp();
end
endmodule 