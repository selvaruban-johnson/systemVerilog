module day_11_5;
class parcel;
int count=2;
function new();
count ++;
endfunction
endclass
parcel pk3=new();
parcel pk2=new();
parcel pk1=new();
initial
begin
$display("%d parcel", pk3.count);
$display("%d parcel", pk2.count);
$display("%d parcel", pk1.count);
end
endmodule