class c;
rand byte A[4];
constraint C1{ foreach (A[i]) A[i]inside {2,4,8,16};}
constraint C2{foreach (A[j]) A[j]> 2*j;}
endclass

module top_class_c();
c  c1 =new();
initial
begin
c1.randomize();
$display("A=%p",c1.A);
end
endmodule 
		
