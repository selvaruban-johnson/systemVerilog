module copy_unpacked_to_packed ;
reg [7:0]a;
reg b[7:0];
initial
begin
	//a = 8'b11010011;
	b = '{1,1,0,1,0,0,1,1};
	for(int i=0;i<8;i++)
	begin
		//b[i]=a[i];
		a[i]=b[i];
	end
	$display("a = %b b =%p",a,b);
end
endmodule