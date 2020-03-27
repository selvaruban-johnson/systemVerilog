class Base;
rand integer a;
constraint range { a < 100 ; a > 0 ;}
endclass
class Extended extends Base;
constraint range { a < 100 ; a > 50 ;} // Overriding the Base class.
endclass
module day_11_7;
Extended obj;
initial
begin
obj = new();
for (int i=0 ; i < 100 ; i++)
if (obj.randomize())
$display(" Randomization successful : a= %0d ",obj.a);
else
$display("Randomization failed");
end
endmodule