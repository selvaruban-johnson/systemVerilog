module dynamic_typecast(input clk);
real rad,area;

always @(posedge clk)
begin

$cast(area,3.14*rad*rad);
$display (area);
end
endmodule 