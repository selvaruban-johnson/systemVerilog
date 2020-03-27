module unique_if();

int a=50;
int b = 20;
int c =30;

initial
begin
	unique if (a<b)$display("a is less than b");
	else if (a<c) $display("a is less than c");
	else $display("a is greater than b and c");
end
endmodule 