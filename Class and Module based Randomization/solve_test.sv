module solve_before_test;
class B;
rand bit s;
rand bit [31:0]d;
constraint c {s->d==0;}
constraint c1 {solve s before d;}
endclass
B b=new;
initial
begin
repeat(10)
begin
b.randomize();
$display("%p",b);
end      end
endmodule
