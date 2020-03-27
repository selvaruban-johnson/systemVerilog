/*4. Declare two variables a and b with logic and bit respectively. Assign b value to a. Print
both a and b.*/

module lab_9_4();

//logic [7:0]a;
//reg [7:0]b;
logic a[7:0];
reg b[7:0];

initial
begin
	a = '{0,0,0,0,1,1,1,1};
	b = a;
	$display("a=%p b=%p",a,b);
end
endmodule 