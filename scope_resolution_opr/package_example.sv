package my_package;
typedef enum {red,green,blue}colors;
typedef struct{
int field_a;
colors c;
}mystruct;
endpackage 

module package_example;
import my_package :: *;

mystruct s;
initial 
begin
	s.field_a = 5;
	s.c=red;
	#1 $display ("s.field_a = %0d,s.c = %s",s.field_a,s.c.name());
end

endmodule 