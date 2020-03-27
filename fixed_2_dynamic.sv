module fixed_2_dynamic ();
int f[5];
int d[];
initial
begin
	f='{10,0,5,7,3};
	d=new[100];
	d=f;
	$display("d=%p f=%p",d,f);
	//f.delete();
end
endmodule 
