module structure_test ();
struct
{
reg [3:0]sof;
bit [7:0]data;
byte crc;
shortint payload;
logic [3:0]eof;
}[4:0]d1;
initial
begin
	d1[0].sof = 4'b1010;
	d1[0].data = 8'b01010101;
	d1[0].crc = 8'b00001111;
	d1[0].payload = 16'b0000111100001111;
	d1[0].eof = 4'b1111;
	$display ("sof = %b" ,d1[0].sof);
	$display ("data = %b" ,d1[0].data);
	$display ("crc = %b" ,d1[0].crc);
	$display ("payload = %b" ,d1[0].payload);
	$display ("eof = %b" ,d1[0].eof); 

	$display ("%p",d1[0]);
	$display ("d1[0]=%b",d1[0]);
end
endmodule