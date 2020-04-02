module static_type_cast;

int i=70000;

initial
begin
$display("%b",i);
i = shortint'(i);
$display ("%b",i);
end
endmodule 