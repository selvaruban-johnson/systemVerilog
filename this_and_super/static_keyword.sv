program static_keyword;


class parcel;
int count=2;

function new();
count ++;
endfunction

endclass


initial
begin
	parcel pk1= new;
	parcel pk2=new;
	parcel pk3=new;
	$display ("%d parcel", pk3.count);
	$display("%d parcel ", pk2.count);
	$display("%d parcel ", pk1.count);
end
endprogram