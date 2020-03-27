class dynamic;
int d[]='{9,8,7,6,5};
rand int a[5];
rand int a1[5];
rand int a2[5];
rand int a3[5];
rand int a4[5];
constraint c {foreach(a[i]) a[i] inside {d};}
constraint c1 {unique {a1}; foreach(a1[i]) a1[i] inside {d};}
constraint c2 {unique {a2}; foreach (a2[i]) a2[i] inside {d,[1:100]};}
constraint c3 {foreach (a3[i]) a3[i] inside {a};}
constraint c4 {foreach (a4[i]) !(a4[i] inside {a3});}
endclass
 
module top_dynamic_randomize();
dynamic d1 = new();
initial
begin
	d1.randomize();
	//d1.randomize(a2);
	$display("%p",d1.a);
	$display("%p",d1.a1);
	$display("%p",d1.a2);
	$display("%p",d1.a3);
	$display("%p",d1.a4);
	end
endmodule 

