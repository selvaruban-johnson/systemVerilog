`include "my_package.sv"
module package_external;
import my_package :: *;

mystruct s;
initial 
begin
	s.field_a = 10;
	s.c=blue;
	#1 $display ("s.field_a = %0d,s.c = %s",s.field_a,s.c.name());
end

endmodule 