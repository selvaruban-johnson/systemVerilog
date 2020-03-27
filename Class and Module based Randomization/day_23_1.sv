module day_23_1;

class class_dynamic_array;
rand int a[];
endclass

int i;
initial
begin
	class_dynamic_array t1;
	t1=new();
	t1.a=new[10];
	repeat(10)
	begin
	if(t1.randomize() with {t1.a[i]>7;})
	$display("%d",t1.a[i]);
	else
	$display("failure");
	end
end
endmodule 
	
	
	