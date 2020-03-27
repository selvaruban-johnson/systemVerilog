module lab_5_7 ();
int a,b;
initial 
begin
	a = 1;
	b=a;
	while (a!=0)
	begin
		$display("%d",b*2);
		if(a<25)
		begin
			a++;
			b++;
			continue;
			
		end
		else
			break;
		
			
	end
end
endmodule 