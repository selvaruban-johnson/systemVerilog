class base;
local int i;
endclass

module day_11_6;
initial
begin
base b = new();
b.i = 123;
end
endmodule