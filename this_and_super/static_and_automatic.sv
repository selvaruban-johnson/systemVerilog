module static_and_automatic();

int i = 3 ;

initial
begin
	while (i--)
	begin
		//static int i = 101;
		automatic int i = 101;
		i--;
		$display ("%d",i);
	end
end
endmodule 