/*3.Analyse the output and understand the significance of typedef and Scope Resolution Operator*/

module top_class_d11_3;
class A;
typedef enum {red,yellow,blue}color;
typedef byte MYBYTE;
endclass
A:: MYBYTE b1= 8'hff; // Declaring b1 of class byte type
A:: color c1;
initial
begin
$display("%h",b1);
$display ("%d", c1.first);
$display("%d", c1.next);
end
endmodule