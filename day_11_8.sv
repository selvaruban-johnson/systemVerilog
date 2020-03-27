class Base;
rand integer a;
constraint range_1 { a< 100 ; a > 0 ;}
endclass
class Extended extends Base;
constraint range_2 { a> 50 ;} // Adding new constraints
endclass
module day_11_8;
Extended obj;
initial
begin
obj = new();
for(int i=0 ; i < 20 ; i++)
if(obj.randomize())
$write(": a = %0d :",obj.a);
else
$display("Randomization failed");
end
endmodule