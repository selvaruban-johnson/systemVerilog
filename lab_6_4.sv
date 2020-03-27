module lab_6_4 ();

struct packed
{
logic [27:21]header;
logic [20:14]cmd;
logic [13:7]data;
logic [6:0]crc;
}d;
/*
union packed
{
logic [27:21]header;
logic [20:14]cmd;
logic [13:7]data;
logic [6:0]crc;
}d;
*/
initial
begin
	d=$urandom();
	$display("d=%b",d);
	$display ("d[24:13]=%b",d[24:13]);
end
endmodule 